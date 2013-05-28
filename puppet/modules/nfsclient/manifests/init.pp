class nfsclient() {

  package { 'nfs-common' :
    ensure  => present,
  }

  package { 'portmap' :
    ensure  => present,
  }
}
