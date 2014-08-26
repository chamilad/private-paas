
# attribute :deployment_code, :name_attribute => true, :kind_of => String
# attribute :repo, :kind_of => String
# attribute :version, :kind_of => String
# attribute :service, :kind_of => String
# attribute :local_dir, :kind_of => String
# attribute :target, :kind_of => String
# attribute :mode, :kind_of => String
# attribute :owner, :kind_of => String


aciton :init do
	#cookbook_file "/#{new_resource.local_dir}/apache-stratos-#{new_resource.service}-#{new_resource.version}.zip"

	execute "Creating target for #{new_resource.deployment_code}" do
		path ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
		command "mkdir -p #{new_resource.target}"
	end

	execute "Creating local package repo for #{new_resource.deployment_code}" do
		path ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin', '/opt/java/bin/']
		command "mkdir -p #{new_resource.local_dir}"
		not_if { ::File.exists?(new_resource.local_dir)}
	end

	cookbook_file "#{new_resource.local_dir}/wso2#{new_resource.service}-#{new_resource.version}.zip" do
		not_if { ::File.exists?("#{new_resource.local_dir}/wso2#{new_resource.service}-#{new_resource.version}.zip")}
	end

	# execute "Downloading Stratos#{new_resource.service}-#{new_resource.version}.zip for #{new_resource.deployment_code}" do
	# 	path ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
	# 	cwd new_resource.local_dir
	# 	not_if { ::File.exists?("#{new_resource.local_dir}/apache-stratos-#{new_resource.service}-#{new_resource.version}.zip")}
	# 	command
	# end


	execute "Extracting wso2#{new_resource.service}-#{new_resource.version}.zip for #{new_resource.deployment_code}" do
		path ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin', '/opt/java/bin/']
		cwd new_resource.target
		not_if { ::File.exists?("#{new_resource.target}/wso2#{new_resource.service}-#{new_resource.version}/repository")}
		command "unzip #{new_resource.local_dir}/wso2#{new_resource.service}-#{new_resource.version}.zip"
		creates "#{new_resource.target}/wso2#{new_resource.service}-#{new_resource.version}/repository"
	end

	execute "Setting permissions for #{new_resource.deployment_code}" do
		path ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin', '/opt/java/bin/']
		cwd new_resource.target
		command "chown -R #{new_resource.owner}:#{new_resource.owner} #{new_resource.target}/wso2#{new_resource.service}-#{new_resource.version} ;
                chmod -R 755 #{new_resource.target}/wso2#{new_resource.service}-#{new_resource.version}"
	end
end