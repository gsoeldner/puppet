SSH = 'ssh -A -i ~/git/gsoeldner.pem -l gsoeldner'
REPO = "git@github.com:gsoeldner/puppet.git"

desc "Run puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH} #{client} pull-updates"
end


