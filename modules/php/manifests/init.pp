class php {
    $packages = [
        "php5",
        "php5-cli",
        "php5-common",
        "php5-curl",
        "php5-gd",
        "php5-mcrypt",
        "php5-mysql",
        "php5-xdebug",
        "libapache2-mod-php5"
    ]
    package { $packages:
        ensure => latest
    }
}
