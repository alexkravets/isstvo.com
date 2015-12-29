# Venice
[![GitHub version](https://badge.fury.io/gh/alexkravets%2Fvenice.svg)](https://badge.fury.io/gh/alexkravets%2Fvenice)
[![Code Climate](https://codeclimate.com/github/alexkravets/venice/badges/gpa.svg)](https://codeclimate.com/github/alexkravets/venice)

*Where art meets technology.*

`v` `e` `n` `i` `c` `e` — website boilerplate and blog implementation based on
[Character](https://github.com/slate-studio/chr) library. It's used as
foundation for new Rails projects or quick prototypes.

Homepage: https://github.com/alexkravets/venice


## Installation

It assumes you have a machine equipped with Ruby & Mongodb.

1. Install the Venice gem using the [RubyGems](https://rubygems.org) package
manager:

  ```bash
  gem install venice-chr
  ```

2. Then kick off a new project & start local server:

  ```bash
  venice new your-project-name
  cd your-project-name
  venice setup
  rails s
  ```

*Default admin account is `user@example.com`:`password`.*


## Deploy to Heroku

1. Create Heroku account
  - [Heroku | Sign up](https://signup.heroku.com/)

2. Login to Heroku

  ```bash
  heroku login
  ```

3. Generate local ssh keys (if you don't have ones)
  - [Generating SSH keys](https://help.github.com/articles/generating-ssh-keys)

  ```bash
  ssh-keygen -t rsa
  ```

4. Add local ssh keys to Heroku
  - [Heroku | Managing Your SSH Keys](https://devcenter.heroku.com/articles/keys)

  ```bash
  heroku keys:add
  ```

5. Choose available `APPLICATION_NAME` on heroku, check using url
`APPLICATION_NAME`.herokuapp.com

6. Create AWS account
  - [AWS | Sign up](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html)

7. Create access `KEY` and `SECRET` for AWS account
  - [AWS | Getting Your Access Key ID and Secret Access Key](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html)

8. Add AWS S3 service to your AWS account
  - [AWS | Console](http://console.aws.amazon.com/console/home)

9. Pick `REGION` for Heroku application and S3 bucket:
`us-east-1` (default) or `eu-west-1`
  - [Heroku | Regions](https://devcenter.heroku.com/articles/regions#data-center-locations)
  - [AWS | S3 Regions](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region)

10. Deploy application to Heroku

  ```bash
  venice deploy heroku APPLICATION_NAME [REGION]
  bin/heroku/add-s3 KEY SECRET BUCKET [REGION]
  ```

**IMPORTANT:** *Default admin account: is `user@example.com`:`password`. After
deploy is finished, please login and create a new account, then remove default
one.*


## Deploy to Digital Ocean

1. Create Digital Ocean account
  - [Digital Ocean | Sign up](https://cloud.digitalocean.com/registrations/new)

2. Generate local ssh keys (if you don't have ones)
  - [Generating SSH keys](https://help.github.com/articles/generating-ssh-keys)

  ```bash
  ssh-keygen -t rsa
  ```

3. Add local ssh keys to Digital Ocean account
  
  ```bash
  pbcopy < ~/.ssh/id_rsa.pub
  ```
  
  - [Digital Ocean | Security](https://cloud.digitalocean.com/settings/security)

4. Create `Ubuntu 14.04` droplet, use `Add your SSH keys` option
  - [Digital Ocean | Create Droplet](https://cloud.digitalocean.com/droplets/new)

5. Get `DROPLET_IP`
  - [Digital Ocean | Droplets](https://cloud.digitalocean.com/droplets)

6. Deploy application to Digital Ocean

```bash
venice deploy digital-ocean DROPLET_IP
```

**IMPORTANT:** *Default admin account: is `user@example.com`:`password`. After
deploy is finished, please login and create a new account, then remove default
one.*


## Under the Hood

Venice is based on a bunch of open source gems. You might be interested to have
a look into those to get better understanding of how things do work inside:

- [Character](https://github.com/slate-studio/chr): Powerful responsive
javascript CMS for apps
- [Formagic](https://github.com/slate-studio/formagic): Building forms with
CoffeeScript
- [Journal](https://github.com/alexkravets/journal): Posts and pages
implementation with templates and CMS modules
- [Tape](https://github.com/alexkravets/tape): Basic RSS reader that integrates
into CMS
- [Ants](https://github.com/slate-studio/ants): Utility gem with helpers and
concerns that are used on the backend and CMS
- [Loft](https://github.com/slate-studio/loft): Media assets manager for
Character CMS
- [Mongosteen](https://github.com/slate-studio/mongosteen): An easy way to add
CRUD actions for Mongoid models
- [Devise](https://github.com/plataformatec/devise): Flexible authentication
solution for Rails with Warden


## Contributing

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Fork the repository
2. Make your changes
3. Push your branch to your fork
4. Post a [pull request](https://github.com/alexkravets/venice/compare).

Thank you to all
[the contributors](https://github.com/alexkravets/venice/contributors)!
