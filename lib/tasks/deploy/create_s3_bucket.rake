namespace :deploy do
  desc "Create new AWS S3 bucket"
  task :create_s3_bucket => :environment do
    require 'aws-sdk'

    @access_key_id = ENV["key"]
    @secret_access_key = ENV["secret"]
    @bucket_name = ENV["bucket"]
    @region = ENV["region"].presence || "us-east-1"
    @user_name = @bucket_name

    connect_aws
    create_bucket
    add_cors_to_bucket
    create_aws_user
    create_user_access_key
    add_user_policy

    ## Results
    puts @new_access_key_id
    puts @new_secret_access_key
  end

  def connect_aws
    credentials = Aws::Credentials.new(@access_key_id, @secret_access_key)
    Aws.config.update(region: @region, credentials: credentials)
    @iam = Aws::IAM::Client.new
    @s3 = Aws::S3::Client.new
  end

  def create_bucket
    @s3.create_bucket(
      bucket: @bucket_name,
      create_bucket_configuration: { location_constraint: @region }
    )
  end

  def add_cors_to_bucket
    @s3.put_bucket_cors(
      bucket: @bucket_name,
      cors_configuration: {
        cors_rules: [
          {
            allowed_headers: ["Authorization", "content"],
            allowed_methods: ["GET"],
            allowed_origins: ["*"],
            max_age_seconds: 3000
          }
        ]
      }
    )
  end

  def create_aws_user
    @iam.create_user(user_name: @user_name)
  end

  def create_user_access_key
    resp = @iam.create_access_key(user_name: @user_name)
    @new_access_key_id = resp.access_key.access_key_id
    @new_secret_access_key = resp.access_key.secret_access_key
  end

  def add_user_policy
    policy = {
      "Statement": [
        {
          "Action": [
            "s3:ListAllMyBuckets"
          ],
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::*"
        },
        {
          "Action": "s3:*",
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::#{@bucket_name}"
        },
        {
          "Action": "s3:*",
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::#{@bucket_name}/*"
        }
      ]
    }

    @iam.put_user_policy(
      user_name: @user_name,
      policy_name: "#{@bucket_name}_heroku",
      policy_document: policy.to_json
    )
  end
end
