# Manage NTP
class learn_ntp {
  ensure_packages(['ntp'])

  file { '/etc/ntp.conf':
    source => 'puppet://modules/learn_ntp/files/ntp.conf',
    notify => Service['ntp'],
    require => Package['ntp'],
  }

  service { 'ntp':
    ensure => running,
    enable => true,
  }
}
