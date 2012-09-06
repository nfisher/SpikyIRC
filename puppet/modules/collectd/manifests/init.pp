class collectd {
  package { 'collectd':
    ensure  => latest,
    require => Class['epel'],
  }

  package { 'collectd-rrdtool':
    ensure  => latest,
    require => Package['collectd'],
    notify  => Service['collectd'],
  }

  service { 'collectd':
    ensure  => running,
    require => Package['collectd'],
  }
}

