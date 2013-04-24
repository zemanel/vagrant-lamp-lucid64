# default path
# 

Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

stage { pre: before => Stage[main] }

class apt {
    # Refreshes the list of packages
    exec { 'apt-get-update':
        command => 'apt-get update',
        path    => ['/bin', '/usr/bin']
  }
}

class { 'apt':
  # Forces the repository to be configured before executing any other task
  stage => pre
}

include other
include apache
include php
include mysql
