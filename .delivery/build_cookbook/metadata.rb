name 'build_cookbook'
maintainer 'Robert Ressl'
maintainer_email 'robert.ressl@avectris.ch'
license 'gplv3'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'delivery-truck'
