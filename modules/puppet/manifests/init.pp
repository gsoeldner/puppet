class puppet {
  file { '/usr/local/bin/papply':
    source => 'puppet:///modules/puppet/papply.sh',
    mode   => '0755',
  }
  file { '/usr/local/bin/pull-updates':
    source => 'puppet:///modules/puppet/pull-updates.sh',
    mode   => '0755',
  }
  file { '/home/gsoeldner/.ssh/id_rsa':
    source => 'puppet:///modules/puppet/centOS.priv',
    owner => 'gsoeldner',
    mode => '0600',
  }
  cron { 'run-puppet':
    ensure  => 'present',
    user => 'gsoeldner',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour => '*',
  }


}
