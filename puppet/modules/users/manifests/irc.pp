define users::irc($key, $ensure = 'present', $user = $title, $type = 'rsa') {
  user { "$user":
    ensure     => $ensure,
    managehome => true,
    shell      => '/usr/bin/irssi',
    require    => Class['irssi'],
  }

  file { "${user}_irssi_dir":
    ensure  => directory,
    path    => "/home/${user}/.irssi",
    mode    => '0755',
    owner   => $user,
    group   => $user,
    require => User[$user],
  }
  
  file { "${user}_irssi_config":
    ensure  => file,
    path    => "/home/${user}/.irssi/config",
    content => template('users/irssi_config'),
    require => File["${user}_irssi_dir"],
  }

  ssh_authorized_key { "${user}_key":
    ensure  => $ensure,
    key     => $key,
    type    => $type,
    user    => $user,
    require => User[$user],
  }
}
