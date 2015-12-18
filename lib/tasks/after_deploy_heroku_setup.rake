namespace :heroku do
  desc "Setup env. variables and create ('user@example.com', 'password') admin on heroku"
  task :after_deploy => :environment do
    require 'heroku-api'
    AdminUser.create!(name: 'Admin', email: 'user@example.com', password: 'password')

    # ap "Input your heroku login/emil"
    # heroku_login = STDIN.gets.chomp
    # ap "Input your heroku pass"
    # heroku_pass = STDIN.gets.chomp

    # if heroku_login && heroku_pass
    #   heroku = Heroku::API.new(:username => heroku_login, :password => heroku_pass)
    #   apps = heroku.get_apps
    #   our_app =
    #   apps.body.max_by do |app|
    #     app['created_at']
    #   end

    #   ap "Is #{our_app['name']} the app, what you want setup [y/n]"
    #   choose = STDIN.gets.chomp
    #   if choose == 'y'
    #     setup_heroku_vars(our_app['name'], heroku)
    #   else
    #     ap "Enter app_name, what you want setup"
    #     app_name = STDIN.gets.chomp
    #     setup_heroku_vars(app_name, heroku)
    #   end

    # else
    #   ap "You don't set login or password"
    # end

  end

  def setup_heroku_vars(app_name, heroku)
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
  end
end
