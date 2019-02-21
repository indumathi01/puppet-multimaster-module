# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include puppetca
class puppetca (
  $version        = 'present',
  $enable         = true,
  $start          = true,
  $package        = 'puppetserver',
  $service        = 'puppetserver',
  $manage_service = true,
  $config         = {},

  $value          = '"-Xms512m -Xmx512m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"',
  $ca_server      = 'puppetmulti.zippyops.com',
  $server         = 'puppetmulti.zippyops.com',

) {
 
 
  class { '::puppetca::config': }

}

