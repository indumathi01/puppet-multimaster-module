class multimaster::config (
  $ca_server	  = $::multimaster::ca_server,
  $server	  = $::multimaster::server,
) {
package { 'puppetserver':
    name   => puppetserver,
    ensure => present,
  }

package { 'puppetdb-termini':
    name   => puppetdb-termini,
    ensure => present,
  }

file { '/etc/puppetlabs/puppet':
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
    source  => 'puppet:///modules/multimaster/puppetserver',
  }
file { '/etc/puppetlabs/puppet/puppet.conf':
   ensure  => file,
   mode    => '0644',
   owner   => 'puppet',
   group   => 'puppet',
   content => template('multimaster/puppet.conf.erb')
  }
 file { '/etc/puppetlabs/puppetserver/services.d/ca.cfg':
    ensure => file,
    mode   => '0644',
    owner  => 'puppet',
    group  => 'puppet',
    source => 'puppet:///modules/multimaster/ca.cfg',
  }
file { '/opt/puppetlabs/server/apps/puppetserver/config/services.d/bootstrap.cfg':
    ensure => file,
    mode   => '0644',
    owner  => 'puppet',
    group  => 'puppet',
    source => 'puppet:///modules/multimaster/bootstrap.cfg',
  }
file { '/etc/puppetlabs/puppet/ssl/ca':
    ensure => directory,
    mode   => '0644',
    owner  => 'puppet',
    group  => 'puppet',
  }

file { '/etc/puppetlabs/puppet/ssl/ca/ca_crl.pem':
    ensure => file,
    mode   => '0644',
    owner  => 'puppet',
    group  => 'puppet',
    source => 'puppet:///modules/multimaster/ca_crl.pem',
  }
file { '/etc/puppetlabs/puppet/ssl/ca/ca_crt.pem':
    ensure => file,
    mode   => '0644',
    owner  => 'puppet',
    group  => 'puppet',
    source => 'puppet:///modules/multimaster/ca_crt.pem',
  }
file { '/etc/puppetlabs/puppet/puppetdb.conf':
    ensure => file,
    mode   => '0644',
    owner  => 'puppet',
    group  => 'puppet',
    source => 'puppet:///modules/multimaster/puppetdb.conf',
  }
file { '/etc/puppetlabs/puppet/routes.yaml':
    ensure => file,
    mode   => '0644',
    owner  => 'puppet',
    group  => 'puppet',
    source => 'puppet:///modules/multimaster/routes.yaml',
  }
file { '/home/zippyops/script.sh':
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/multimaster/script.sh',
  }

exec { '/home/zippyops/script.sh': }

}
