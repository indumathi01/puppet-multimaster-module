# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppetca::config
class puppetca::config (
  $value          = $::puppetca::value,
  $ca_server	  = $::puppetca::ca_server,
  $server	  = $::puppetca::server,
) {
  
        package { 'puppetserver':
                 name   => 'puppetserver',
                 ensure => true,
                }
       
       file { '/etc/puppetlabs/puppet/':
                ensure  => directory,
                mode    => '0644',
                owner   => 'puppet',
                group   => 'puppet',
                }
       file { '/etc/sysconfig/puppetserver':
                ensure  => file,
                mode    => '0644',
                owner   => 'puppet',
                group   => 'puppet',
                content => template('puppetca/puppetserver.erb')
                }
	file { '/etc/puppetlabs/puppet/puppet.conf':
		ensure 	=> file,
		mode	=> '0644',
		owner	=> 'puppet',
		group	=> 'puppet',
		content	=> template('puppetca/puppet.conf.erb')
		}
        file { '/etc/puppetlabs/puppet/autosign.conf':
                ensure  => file,
                mode    => '0644',
                owner   => 'puppet',
                group   => 'puppet',
                }
        service { 'puppetserver':
                 name   => 'puppetserver',
                 ensure => 'true',
                 enable => 'true',
                }
}
