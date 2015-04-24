#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# stop iptables
service "iptables" do
  action [:stop, :disable]
end

# install apache
%w{httpd httpd-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

# install php
%w{php php-common php-devel php-mbstring php-xml php-pear php-mysql}.each do |pkg|
  package pkg do
    action :install
  end
end

# install mysql
%w{mysql-server mysql-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

# service configuration

service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

service "mysqld" do
  action [:enable, :start]
end
