import re
import os
from datetime import datetime,time
from fabric.api import *

# 9WkdyDB6Bgcc
PUPPET_PACKAGE='puppet-2.7.19-1.el6.noarch'
PUPPET_RELEASE_RPM='http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-5.noarch.rpm'
RUBYGEM_PKG='rubygems'

env.shell = '/bin/sh -c'

#
# Helpers
#
def _pkg_asset(asset_name, asset_path, latest_revision):
  """
  Tar a given asset and append the revision number to the tarball.
  """
  local('mkdir -p target')
  local('date > {0}/release_{1}.txt'.format(asset_path, latest_revision))
  local('tar czf target/{0}_{1}.tgz {2}'.format(asset_name, latest_revision, asset_path))

def _revision():
  revision = os.environ.get('GO_PIPELINE_LABEL', "dev")
  return revision


#
# Methods
#
def apply():
  """
  Upload and apply the puppet manifests.
  """
  upload()
  sudo("puppet apply --verbose --evaltrace --summarize --color=false --show_diff --modulepath=/etc/puppet/modules /etc/puppet/manifests/site.pp")

def bootstrap():
  """
  Install puppet release repo and puppet.
  """
  sudo('rpm -ivh --force --quiet {0}'.format(PUPPET_RELEASE_RPM))
  sudo('yum install -q -y {0} {1}'.format(PUPPET_PACKAGE, RUBYGEM_PKG))


def clean():
  """
  Clean the locally generated assets.
  """
  local('rm -rf target')


def pkg_puppet(latest_revision = _revision()):
  """
  Package the puppet folder.
  """
  _pkg_asset('puppet', 'puppet', latest_revision)


def upload():
  """
  Upload the assets, unpack puppet to /etc.
  """
  # Cleanup the tmp folder
  sudo('rm -f /tmp/puppet_*.tgz')
  # Upload the files
  put('target/*_{0}.tgz'.format(_revision()), '/tmp')
  sudo('mkdir -p /root/deployments/')
  # Move the files into the deployments folder
  sudo('mv /tmp/puppet_*.tgz /root/deployments')
  sudo('rm -rf /etc/puppet')
  sudo('tar xzf /root/deployments/puppet_{0}.tgz -C /etc'.format(_revision()))

