define users::irc($key, $ensure = 'present', $user = $title, $type = 'rsa') {
  user { "$user":
    ensure     => $ensure,
    managehome => true,
    shell      => '/bin/false',
  }

  ssh_authorized_key { "${user}_key":
    ensure  => $ensure,
    key     => $key,
    type    => $type,
    user    => $user,
    require => User[$user],
  }
}
