class dotdeb {

  class { 'apt': }
  include repos

  apt::source { 'dotdeb':
    location   => 'http://packages.dotdeb.org',
    release    => 'squeeze',
    repos      => 'all',
    key        => '89DF5277',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
  }

  apt::source { 'dotdeb-php54':
    location   => 'http://packages.dotdeb.org',
    release    => 'squeeze-php54',
    repos      => 'all',
    key        => '89DF5277',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
  }

  # Ensure apt-get update is run before package instalations
  Exec["apt-update"] -> Package <| |>

  # Ensure sources are installed before running apt-get update
  Apt::Source <| |> -> Exec["apt-update"]
}
