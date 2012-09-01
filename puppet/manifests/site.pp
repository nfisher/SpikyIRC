# Drugs are baaadd m'kay. Don't do stages at home kids.
stage { 'epel': before => Stage['main'] }

node default {
  class { 'epel': stage => 'epel' }
  include ircd
  include ssh
  # Don't modify sudoers so vagrant provision still works.
  if "localhost.localdomain" != $::fqdn {
  include sudoers
  }
  include users
}
