include_attribute "base::base"

default[:agent][:version]='4.0.0'
default[:agent][:owner]='root'
default[:agent][:group]='root'
default[:agent][:target]="/mnt/#{@node[:base][:server_ip]}"
default[:agent][:type]='default'
default[:agent][:enable_artifact_update]=true
default[:agent][:auto_commit]=false
default[:agent][:auto_checkout]=true