#
# Cookbook Name:: buildout-cache
# Recipe:: default
#
# Copyright 2013, Takeshi KOMIYA
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

username = node['buildout-cache']['user']
groupname = node['buildout-cache']['group']
basedir = "/home/#{username}/.buildout"

subdirs = %w(. eggs downloads downloads/dist)

subdirs.each do |subdir|
  directory File.expand_path(subdir, basedir) do
    mode 0755
    owner username
    group groupname
  end
end

template File.expand_path("default.cfg", basedir) do
  mode 0644
  owner username
  group groupname
end
