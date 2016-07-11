class pashaapache::service {
  if ! defined(::apache) {
    service { "httpd":
      ensure  => 'running',
      enabled => true,
      require => Class["pashaapache:install"],
    }
  }
}
