class autodeploy {
  file { 'root_bin':
    ensure => directory,
    path   => '/root/bin',
    mode   => '0700',
    owner  => 'root',
    group  => 'root',
  }

  file { 'autodeploy.sh':
    ensure  => file,
    path    => '/root/bin/autodeploy.sh',
    mode    => '0700',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/autodeploy/autodeploy.sh',
    require => File['root_bin'],
  }
}
