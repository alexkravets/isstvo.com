require "venice/version"
require "thor"

module Venice
  class Kit < Thor
    include Thor::Actions

    desc "new", "runs the command to clone venice into new project"
    def new(repo_name = "new-venice-project")
      url = "https://github.com/alexkravets/venice.git"

      system "git ls-remote #{url} > /dev/null 2>&1"
      puts "Starting a new venice project in #{repo_name}"
      system %{
        git clone "#{url}" "#{repo_name}" &&
        cd "#{repo_name}" &&
        git remote rename origin venice &&
        cd -
      }
    end

    desc "setup", "Sets up the project"
    def setup
      puts "Setting up your project"
      system "bin/setup"
    end

    desc "deploy", "Deploys the project to heroku or digital-ocean"
    def deploy(platform = "heroku", target = "")
      puts "Deploying the project"
      if platform == "heroku"
        target = {
          "" => "us",
          "us-east-1" => "us",
          "eu-west-1" => "eu"
        }[target]

        if target.nil?
          puts "Please provide correct target parameter."
          puts "Available options are:"
          puts "  us-east-1"
          puts "  eu-west-1"
          exit
        end
      end
      system "bin/#{platform}/deploy #{target}".strip
    end

    desc "version", "Show Venice version"
    def version
      say "Venice #{Venice::VERSION}"
    end
  end
end
