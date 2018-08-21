#
# Cookbook:: sudo_databag
# Recipe:: config
#
# Copyright:: 2018,  Robert Ressl
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

def hash_merge(*hashes)
  hashes.inject :merge
end

databag = node['sudo_databag']['databag']['name'] || 'sudo'
items = node['sudo_databag']['databag']['items']
basic = data_bag_item(databag, 'basic')

items.each do |i|
  item = data_bag_item(databag, i)
  instance_variable_set("@dbi_#{i}", item)
  @mgitems = "hash_merge(basic['groups'], #{items.map { |s| s.sub(/$/, "['groups']") }.map { |s| s.sub(/\A(?!@dbi_)/, '@dbi_') }.join(', ')})"
  @muitems = "hash_merge(basic['users'], #{items.map { |s| s.sub(/$/, "['users']") }.map { |s| s.sub(/\A(?!@dbi_)/, '@dbi_') }.join(', ')})"
end

mgroups = eval(@mgitems)
musers = eval(@muitems)

template '/etc/sudoers' do
  owner 'root'
  group 'root'
  source 'sudoers.erb'
  mode '0440'
  variables(
    include_sudoers_d: basic['include_sudoers_d'],
    defaults: basic['defaults'],
    aliases: basic['aliases'],
    groups: mgroups,
    users: musers
  )
end
