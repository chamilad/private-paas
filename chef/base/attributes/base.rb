# require stratos_base

default[:agent][:log_level]                       		= "INFO"
default[:agent][:enable_log_publisher]                  = 'false'
default[:agent][:extension_artifacts_copy]              = 'artifacts-copy.sh'
default[:agent][:extension_artifacts_updated]           = 'artifacts-updated.sh'
default[:agent][:extension_clean]                       = 'clean.sh'
default[:agent][:extension_complete_tenant]             = 'complete-tenant.sh'
default[:agent][:extension_complete_topology]           = 'complete-topology.sh'
default[:agent][:extension_instance_activated]          = 'instance-activated.sh'
default[:agent][:extension_instance_started]            = 'instance-started.sh'
default[:agent][:extension_member_activated]            = 'member-activated.sh'
default[:agent][:extension_member_started]              = 'member-started.sh'
default[:agent][:extension_member_suspended]            = 'member-suspended.sh'
default[:agent][:extension_member_terminated]           = 'member-terminated.sh'
default[:agent][:extension_mount_volumes]               = 'mount-volumes.sh'
default[:agent][:extension_start_servers]               = 'start-servers.sh'
default[:agent][:extension_subscription_domain_added]   = 'subscription-domain-added.sh'
default[:agent][:extension_subscription_domain_removed] = 'subscription-domain-removed.sh'
default[:agent][:extensions_dir]                        = '${script_path}/../extensions'
default[:agent][:super_tenant_repository_path]          = '/repository/deployment/server/'
default[:agent][:tenant_repository_path]                = '/repository/tenants/'
default[:agent][:using_dns]                             = 'USING_DNS'

default[:apim][:disable_sso]                            = 'true'
default[:apim][:idp_hostname]                           = 'identity.stratos.com'
default[:apim][:idp_port]                               = '443'

default[:bam][:ip]                                      = '127.0.0.1'
default[:bam][:password]                                = 'admin'
default[:bam][:port]                                    = '7611'
default[:bam][:secure_port]                             = '7711'
default[:bam][:username]                                = 'admin'

default[:base][:greg_url]                               = 'https://localhost/registry'
default[:base][:local_package_dir]                      = '/mnt/packs'
default[:base][:mysql_max_active]                       = '150'
default[:base][:mysql_max_connections]                  = '100000'
default[:base][:mysql_max_wait]                         = '360000'
default[:base][:mysql_port]                             = 'DB_PORT'
default[:base][:mysql_server]                           = 'DB_HOST'
default[:base][:package_repo]                           = 'http://10.4.128.7'
default[:base][:server_ip]                              = node[:ipaddress]
default[:base][:ssl_certificate_file]                   = 'CERT_FILE_PATH'
default[:base][:ssl_key_file]                           =  'KEY_FILE_PATH'

default[:cep][:ip]                                      = '127.0.0.1'
default[:cep][:password]                                = 'admin'
default[:cep][:port]                                    = '7611'
default[:cep][:username]                                = 'admin'

#default[:java][:distribution]                          = 'jdk-7u51-linux-x64.tar.gz'
#default[:java][:name]                                  = 'jdk1.7.0_51'
default[:java][:distribution]                           = 'jdk-7u7-linux-x64.tar.gz'
default[:java][:home]                                   = '/opt/java'
default[:java][:name]                                   = 'jdk1.7.0_7'

default[:lb][:http_port]                                = '80'
default[:lb][:https_port]                               = '443'
default[:lb][:member_type_ip]                           ='private'
default[:lb][:private_ip]                               = ''
default[:lb][:public_ip]                                = ''

default[:mb][:ip]                                       = '127.0.0.1'
default[:mb][:port]                                     = '61616'
default[:mb][:type]                                     = 'activemq' #in wso2 mb case, value should be 'wso2mb'

default[:tomcat][:version]                              = '7.0.54'
default[:truststore][:password]                         = 'wso2carbon'



