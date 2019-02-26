#  puppetdb configuration using puppet 
notify { "this is server $servername" : }
#class { 'puppetdb': }
class { 'apache': }
class { 'apache::mod::wsgi': }

# Configure Puppetboard
class { 'puppetboard':
  manage_git        => true,
  manage_virtualenv => true,
}


# Access Puppetboard through pboard.example.com
class { 'puppetboard::apache::vhost':
  vhost_name => 'puppetdb.zippyops.com',
  port       => 8888,
}
