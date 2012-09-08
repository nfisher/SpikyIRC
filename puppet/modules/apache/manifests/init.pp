class apache {
  package { 'httpd':
    ensure => latest,
  }

  service { 'httpd':
    ensure  => running,
    enable  => true,
    require => Package['httpd'],
  }

  file { 'httpd_conf':
    ensure  => file,
    path    => '/etc/httpd/conf/httpd.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/apache/httpd.conf',
    notify  => Service['httpd'],
    require => Package['httpd'],
  }
}
