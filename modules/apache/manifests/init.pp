# -*- mode: ruby -*-
# vi: set ft=ruby :

class apache {
    package { "apache2":
        ensure => latest
    }

    file { "/etc/apache2/sites-available/default":
        ensure => present,
        source => "/vagrant/etc/apache2/sites-available/default",
        owner => root, group => root,
        require => Package["apache2"]
    }

    # starts the apache2 service once the packages installed, and monitors 
    # changes to its configuration files and reloads if necessary
    service { "apache2":
        ensure => running,
        require => Package["apache2"],
        subscribe => [
            File["/etc/apache2/sites-available/default"]
        ]
    }
}
