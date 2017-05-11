# Main Puppet File

if versioncmp($::puppetversion,'3.6.1') >= 0 {

  $allow_virtual_packages = hiera('allow_virtual_packages',false)

  Package {
    allow_virtual => $allow_virtual_packages,
  }
}

node 'node02', 'node03', 'node04', 'node05' {

	include test
}
