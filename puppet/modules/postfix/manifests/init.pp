class postfix {
  service { 'postfix':
    ensure => 'stopped',
    enable => false,
  }
}
