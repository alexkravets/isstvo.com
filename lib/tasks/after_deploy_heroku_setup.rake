namespace :heroku do
  desc "Setup env. variables and create ('user@example.com', 'password') admin on heroku"
  task :after_deploy => :environment do
    require 'heroku-api'
    require 'aws-sdk'

    ap "Input your heroku login/emil"
    heroku_login = STDIN.gets.chomp
    ap "Input your heroku pass"
    heroku_pass = STDIN.gets.chomp
    ap "Do you want setup s3? [y/n]"
    s3_setup = STDIN.gets.chomp
    if s3_setup == "y"
      ap "Input your amazon access_key_id"
      access_key_id = STDIN.gets.chomp
      ap "Input your amazon secret_access_key"
      secret_access_key = STDIN.gets.chomp
    end

    if heroku_login && heroku_pass
      heroku = Heroku::API.new(:username => heroku_login, :password => heroku_pass)
      apps = heroku.get_apps
      our_app =
      apps.body.max_by do |app|
        app['created_at']
      end

      ap "Is #{our_app['name']} the app, what you want setup [y/n]"
      choose = STDIN.gets.chomp
      if choose == 'y'
        setup_heroku_vars(our_app['name'], heroku, access_key_id, secret_access_key)
      else
        ap "Enter app_name, what you want setup"
        app_name = STDIN.gets.chomp
        setup_heroku_vars(app_name, heroku, s3_setup, access_key_id, secret_access_key)
      end

    else
      ap "You don't set login or password"
    end

  end


  def setup_heroku_vars(app_name, heroku, access_key_id, secret_access_key)
    our_app = heroku.get_app(app_name).body
    vars = heroku.get_config_vars(app_name).body
    sendgrid_username = vars['SENDGRID_USERNAME']
    sendgrid_password = vars['SENDGRID_PASSWORD']
    mongolab_uri      = vars['MONGOLAB_URI']
    domain            = our_app['domain_name']['domain']

    heroku.put_config_vars(app_name, 'SMTP_USERNAME' => sendgrid_username)
    heroku.put_config_vars(app_name, 'SMTP_PASSWORD' => sendgrid_password)
    heroku.put_config_vars(app_name, 'MONGODB_URI' => mongolab_uri)
    heroku.put_config_vars(app_name, 'HOST' => domain)
    AdminUser.create!(name: 'Admin', email: 'user@example.com', password: 'password')
    if access_key_id && secret_access_key
      setup_s3(app_name, heroku, access_key_id, secret_access_key)
    end
  end

  def setup_s3(app_name, heroku, access_key_id, secret_access_key)
    @new_access_key_id = ''
    @new_secret_access_key = ''
    Aws.config.update({
      region: 'us-west-2',
      credentials: Aws::Credentials.new(access_key_id, secret_access_key)
    })

    iam = Aws::IAM::Client.new
    s3  = Aws::S3::Client.new

    create_bucket(app_name, s3)
    add_cors_to_bucket(app_name, s3)
    create_amazon_user(app_name, iam)
    create_user_access_key(app_name, iam)
    add_user_policy(app_name, iam)

    heroku.put_config_vars(app_name, 'AWS_ACCESS_KEY_ID' => @new_access_key_id)
    heroku.put_config_vars(app_name, 'AWS_SECRET_ACCESS_KEY' => @new_secret_access_key)
    heroku.put_config_vars(app_name, 'FOG_DIRECTORY' => app_name)
  end

  def create_bucket(bucket_name, s3)
    resp = s3.create_bucket({
      bucket: bucket_name,
      create_bucket_configuration: {
        location_constraint: "us-west-2",
      },
    })
  end

  def add_cors_to_bucket(bucket_name, s3)
    resp = s3.put_bucket_cors({
      bucket: bucket_name,
      cors_configuration: {
        cors_rules: [
          {
            allowed_headers: ["Authorization", "content"],
            allowed_methods: ["GET"],
            allowed_origins: ["*"],
            max_age_seconds: 3000,
          },
        ],
      },
    })
  end

  def create_amazon_user(user_name, iam)
    resp = iam.create_user({
      user_name: user_name,
    })
  end

  def create_user_access_key(user_name, iam)
    resp = iam.create_access_key({
      user_name: user_name,
    })
    @new_access_key_id     = resp.access_key.access_key_id
    @new_secret_access_key = resp.access_key.secret_access_key
  end

  def add_user_policy(app_name, iam)
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
                    "Resource": "arn:aws:s3:::#{app_name}"
                  },
                  {
                    "Action": "s3:*",
                    "Effect": "Allow",
                    "Resource": "arn:aws:s3:::#{app_name}/*"
                  }
                ]
              }

    resp = iam.put_user_policy({
      user_name: app_name,
      policy_name: "#{app_name}_heroku",
      policy_document: policy.to_json,
    })
  end

end
