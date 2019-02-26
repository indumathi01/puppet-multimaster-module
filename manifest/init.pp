class multimaster (
  $ca_server    = 'puppetca.zippyops.com',
  $server       = 'puppetca.zippyops.com',

) {
  class { '::multimaster::config': }
}
