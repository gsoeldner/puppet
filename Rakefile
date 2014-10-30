SSH = 'ssh -A -i ~/git/gsoeldner.pem -l gsoeldner'
REPO = "git@github.com:gsoeldner/puppet.git"

desc "Run puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH} #{client} pull-updates"
end

desc "Bootstrap Puppet on ENV['CLIENT'] with hostname ENV['HOSTNAME']"
task :bootstrap do
  client = ENV['CLIENT']
  hostname = ENV['HOSTNAME'] || client
  commands = <<BOOTSTRAP
sudo hostname #{hostname} && \
sudo echo #{hostname} >/etc/hostname && \
sudo rpm -ivh https://yum.puppetlabs.com/el/6.5/products/x86_64/puppetlabs-release-6-10.noarch.rpm && \
sudo yum install puppet && \
sudo chkconfig puppet on && \
echo -e \"Host github.com\n\tStrictHostKeyChecking no\n\" >> ~/.ssh/config && \
git clone #{REPO} puppet && \
sudo puppet apply --modulepath=/home/gsoedner/puppet/modules /home/gsoeldner/puppet/manifests/site.pp
BOOTSTRAP
  sh "#{SSH} #{client} '#{commands}'"
end

desc "Add syntax check hook to your git repo"
task :add_check do
  here = File.dirname(__FILE__)
  sh "ln -s #{here}/hooks/check_syntax.sh #{here}/.git/hooks/pre-commit"
  puts "Puppet syntax check hook added"
end

