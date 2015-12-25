namespace :settings do
  desc "Clear settings objects"
  task :clear => :environment do
    SettingsObject.delete_all
  end
end
