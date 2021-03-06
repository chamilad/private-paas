deployment_code='cartridge_agent'
carbon_version=node[:agent][:version]
service_code='cartridge-agent'
carbon_home="#{node[:agent][:target]}/apache-stratos-#{service_code}-#{carbon_version}"

service_templates=%w(bin/stratos.sh
				    conf/jndi.properties
				    conf/log4j.properties
				    extensions/clean.sh
				    extensions/instance-activated.sh
				    extensions/instance-started.sh
				    extensions/start-servers.sh
				    extensions/artifacts-copy.sh
				    extensions/artifacts-updated.sh
				    extensions/complete-tenant.sh
				    extensions/complete-topology.sh
				    extensions/member-activated.sh
				    extensions/member-suspended.sh
				    extensions/member-terminated.sh
				    extensions/mount-volumes.sh
				   	extensions/subscription-domain-added.sh
				    extensions/subscription-domain-removed.sh)

agent_initialize "#{deployment_code}" do
	repo 		node[:base][:package_repo]
	version 	carbon_version
	service 	service_code
	local_dir 	node[:base][:local_package_dir]
	target 		node[:agent][:target]
	owner 		node[:agent][:owner]
end

execute "Copy launch-params to carbon_home : #{carbon_home}" do
	path ['/bin/']
	command "mkdir -p #{carbon_home}/payload; cp /tmp/payload/launch-params #{carbon_home}/payload/launch-params"
end

agent_push_templates service_templates do
	target carbon_home
	owner node[:agent][:owner]
	group 	node[:agent][:group]
end

agent_start deployment_code do
	owner node[:agent][:owner]
	target carbon_home
end


