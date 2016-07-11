class pashaapache::install {
  if ! defined(::apache) {
    package { [ "httpd" ]:
      ensure => 'present',
    }
  }
}

