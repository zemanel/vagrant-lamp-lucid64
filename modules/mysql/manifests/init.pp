class mysql {

    $mysql_password = "root"

    package { "mysql-server":
        ensure => latest
    }

    service { "mysql":
        ensure => running,
        require => Package["mysql-server"],
    }

    exec { "set-mysql-password":
        unless => "mysqladmin -uroot -p$mysql_password status",
        command => "mysqladmin -uroot password $mysql_password",
        require => Service["mysql"],
    }
}
