node 'lamp' {
  class { 'apache':
    mpm_module  => 'prefork'
  }

  class { '::apache::mod::php': }

  apache::vhost { 'lamp':
  port    => '8081',
  docroot => '/vagrant/pc',
  }

  class { '::mysql::server':
    root_password => 'mystrongpassword',
    }
}
