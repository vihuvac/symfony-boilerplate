class repos (
    $proxy = false,
  ) {

  exec { "apt-update":
      command => "/usr/bin/apt-get update"
  }

  if $proxy {
    file {'/etc/apt/apt.conf.d/90proxy':
      ensure => present,
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => template('repos/90proxy.erb'),
    }
    # Ensure proxy before update
    File['/etc/apt/apt.conf.d/90proxy'] -> Exec['apt-update']
  }

  # Ensure apt-get update is run before package instalations
  Exec['apt-update'] -> Package <| |>
}

