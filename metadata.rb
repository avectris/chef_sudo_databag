name 'sudo_databag'
maintainer 'Robert Ressl'
maintainer_email 'robert.ressl@avectris.ch'
license 'AGPL-3.0'
description 'Installs/Configures sudo_databag'
long_description 'Installs/Configures sudo_databag'
version '1.1.1'
chef_version '>= 12.14' if respond_to?(:chef_version)

%w(redhat centos).each do |os|
  supports os
end

issues_url 'https://git.zmssrv.com/avectris/chef/chef_sudo_databag/issues'
source_url 'https://git.zmssrv.com/avectris/chef/chef_sudo_databag'
