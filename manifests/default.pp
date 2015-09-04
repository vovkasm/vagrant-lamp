exec { "apt-get update":
  path => "/usr/bin",
}

package { 'vim':
  ensure => 'installed',
}

class { "apache":
  mpm_module => "prefork",
  docroot    => "/var/www/docs",
}
class { "::apache::mod::php":
}
apache::mod { "rewrite": }
Apache::Vhost {
  docroot_group => "vagrant",
  docroot_owner => "www-data",
}

class { '::mysql::server':
  root_password => 'root',
}
class { '::mysql::client': }
class { '::mysql::bindings':
  php_enable => true,
}

mysql::db { "${dbname}":
  user     => "${dbuser}",
  password => "${dbpassword}",
  host     => 'localhost',
}

class { 'phpmyadmin':
  enabled => true,
  ip_access_ranges => [ 'All' ],
}
