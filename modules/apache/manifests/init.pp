# -*- mode: ruby -*-
# vi: set ft=ruby :

class apache {
    package { "apache2":
        ensure => latest
    }

    # starts the apache2 service once the packages installed, and monitors 
    # changes to its configuration files and reloads if necessary
    service { "apache2":
        ensure => running,
        require => Package["apache2"]
    }
}
