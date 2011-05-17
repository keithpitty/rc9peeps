namespace :heroku do
  desc "Read config and send vars to heroku"
  task :config do
    CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env] rescue {}
    command = "heroku config:add"
    CONFIG.each {|key, val| command << " #{key}=#{val} " if val }
    system command
  end
end