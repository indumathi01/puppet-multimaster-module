node /puppetdb1.zippyops.com/ {
notify { "this is server $servername" : }
#class { 'puppetdb' : }


#class { 'puppetboard': 
#   manage_virtualenv => true,
# }

#class { 'apache':
#  purge_configs => false,
#  mpm_module    => 'prefork',
#  default_vhost => true,
#  default_mods  => false,
#}

#class { 'apache::mod::wsgi': }

# Configure Puppetboard
#class { 'puppetboard': }

# Access Puppetboard from example.com/puppetboard
#class { 'puppetboard::apache::conf': }
#}

# Configure Apache on this server
class { 'apache': }
class { 'apache::mod::wsgi': }

# Configure Puppetboard
class { 'puppetboard': }

# Access Puppetboard through pboard.example.com
class { 'puppetboard::apache::vhost':
  vhost_name => 'puppetdb1.zippyops.com',
  port       => 8888,
}
}

node /puppetagent.zippyops.com/ {
notify { "this is server $servername" : }
}
