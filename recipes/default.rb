#
# Cookbook:: oracle-interview
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.


cookbook_file '/tmp/app.py' do
  source 'app.py'
end

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

bash "app-install-packages" do
  code <<-EOH
  sudo apt-get update
  sudo apt-get install python3 -y
  sudo apt-get install python3-pip -y
  sudo pip3 install flask
  EOH
end

bash 'run-app' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    python3 app.py
  EOH
end
