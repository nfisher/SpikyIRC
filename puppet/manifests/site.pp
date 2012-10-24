# Drugs are baaadd m'kay. Don't do stages at home kids.
stage { 'epel': before => Stage['main'] }

node default {
  include apache
  include collectd
  include collectd::web
  class { 'epel': stage => 'epel' }
  include ircd
  include irssi
  include ssh
  include users
  include sudoers

  # TODO: This is a pants way to manage what's run against Vagrant.
  if "localhost.localdomain" != $::fqdn {
  include postfix
  include sudoers
  }
}
