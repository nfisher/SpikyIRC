class collectd::web {
  # Too lazy to setup another configuration for collectd.
  package { 'collectd-web':
    ensure  => latest,
    require => Class['epel'],
  }
}

