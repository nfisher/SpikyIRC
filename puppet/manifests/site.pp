# Drugs are baaadd m'kay. Don't do stages at home kids.
stage { 'epel': before => Stage['main'] }

node default {
  class { 'epel': stage => 'epel' }
  include ircd
  include ssh
  include sudoers
  include users
}
