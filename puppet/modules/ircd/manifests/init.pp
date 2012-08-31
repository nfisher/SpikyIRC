class ircd {
  package {'ircd-hybrid':
    ensure => latest,
  }

  file {'etc_ircd_conf':
    ensure  => present,
    path    => '/etc/ircd/ircd.conf',
    owner   => 'ircd',
    group   => 'ircd',
    mode    => '0640',
    content => "puppet:///$module/ircd.conf",
  }

  service {'ircd':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['ircd-hybrid'],
  }

}
