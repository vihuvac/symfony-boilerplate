class dotdeb {

  class { 'apt': }

  apt::source { 'dotdeb':
    location   => 'http://packages.dotdeb.org',
    release    => 'squeeze',
    repos      => 'all',
    key        => 'dotdeb',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
  }

  apt::source { 'dotdeb-php54':
    location   => 'http://packages.dotdeb.org',
    release    => 'squeeze-php54',
    repos      => 'all',
    key        => 'dotdeb',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
  }
  exec { "apt-update":
      command => "/usr/bin/apt-get update"
  }

  # Ensure apt-get update is run before package instalations
  Exec["apt-update"] -> Package <| |>

  # Ensure sources are installed before running apt-get update
  Apt::Source <| |> -> Exec["apt-update"]
}
