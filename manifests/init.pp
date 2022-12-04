# Manage NTP
class learn_ntp (
  Boolean $start_at_boot,
  String[1] $version                           = 'installed',
  Enum['running', 'stopped'] $service_state = 'running',
) {
  ensure_packages(['ntp'],
    {
      'ensure' => $version,
    })

  file { '/etc/ntp.conf':
    source => 'puppet://modules/learn_ntp/files/ntp.conf',
    notify => Service['ntp'],
    require => Package['ntp'],
  }

  service { 'ntp':
    ensure => $service_state,
    enable => $start_at_boot,
  }
}
