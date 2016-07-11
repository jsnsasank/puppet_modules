define pashaapache::vhost( $port, $docroot, $ssl=true, $template='pashaapache/vhost.conf.erb',
$priority, $serveraliases='' ) {

  include pashaapache

  file { "/etc/httpd/conf.d/${priority}-${name}.conf":
    content => template("$template"),
    owner   => 'root',
    group   => 'root',
    mode    =>  '775',
    require => Class["pashaapache::install"],
    notify  => Class["::apache::service"],
  }
  
  file { $docroot:
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 0775,
   }

  file { "$docroot/index.html":
    ensure  => present,
    content => template("pashaapache/index.html.erb"),
    owner   => root,
    group   => root,
    mode    => 0775,
  }

  file { [ "/var/log/httpd/${name}_error.log", "/var/log/httpd/${name}_access_log" ]:
    ensure   => present,
    owner    => root,
    group    => root,
    mode     => 0644,
  }

}
