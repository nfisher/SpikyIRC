define users::irc($key, $fullname, $ensure = 'present', $username = $title, $type = 'rsa') {
  if 'present' == $ensure {
    $dir_ensure  = 'directory'
    $file_ensure = 'file'
  } else {
    $dir_ensure  = 'absent'
    $file_ensure = 'absent'
  }

  user { "$username":
    ensure     => $ensure,
    comment    => $fullname,
    managehome => true,
    shell      => '/usr/bin/irssi',
    require    => Class['irssi'],
  }

  file { "${username}_irssi_dir":
    ensure  => $dir_ensure,
    path    => "/home/${username}/.irssi",
    mode    => '0755',
    owner   => $username,
    group   => $username,
    require => User[$username],
  }
  
  file { "${username}_irssi_config":
    ensure  => $file_ensure,
    path    => "/home/${username}/.irssi/config",
    content => template('users/irssi_config'),
    require => File["${username}_irssi_dir"],
  }

  ssh_authorized_key { "${username}_key":
    ensure  => $ensure,
    key     => $key,
    type    => $type,
    user    => $username,
    require => User[$username],
  }
}
