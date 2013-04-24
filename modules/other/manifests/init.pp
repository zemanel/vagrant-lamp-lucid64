class other {
      $packages = [
          "curl", 
          "git-core",
          "lynx",
          "vim"
    ]
    package { $packages:
        ensure => latest
    }
}
