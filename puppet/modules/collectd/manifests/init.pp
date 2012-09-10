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

  file { 'collectd_swap':
    ensure  => file,
    path    => '/etc/collectd.d/swap.conf',
    content => "LoadPlugin swap\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['collectd'],
    notify  => Service['collectd'],
  }

  service { 'collectd':
    ensure  => running,
    enable  => true,
    require => Package['collectd'],
  }
}

