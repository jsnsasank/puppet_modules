node 'cislab.ucmo.edu' {
 hiera_include('classes')
}


node 'cislab2.ucmo.edu' {
  hiera_include('classes')
} 

class linux {

  $admintools = ['git', 'nano', 'screen']

  package { $admintools:
    ensure => 'installed',
  }

  $ntpservice = $osfamily ? {
    'redhat' => 'ntpd',
    'debian' => 'ntp',
     default => 'ntp',
  }

  file { '/info.txt' :
    ensure  => 'present',
    content =>  inline_template("Create by Pasha at <%= Time.now%> \n"),
  }


  package { 'ntp':
    ensure => 'installed',

  }

  service { $ntpservice:
    ensure => 'running',
    enable => true,
  }

}
