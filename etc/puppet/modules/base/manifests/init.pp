class base {

file { "/etc/hosts":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/base/hosts",
}

file { "/etc/profile.d/z00_modules.sh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/base/z00_modules.sh",
}

file { "/etc/profile.d/z00_modules.csh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/base/z00_modules.csh",
}

file { "/etc/profile.d/z01_modules.sh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/base/z01_modules.sh",
}

file { "/etc/profile.d/z01_modules.csh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/base/z01_modules.csh",
}


Package { ensure => 'installed' }

$pkgs = [ 'bash-completion', 'readline', 'readline-devel', 'libgenders', 'libgenders-devel', 'lua',
          'lua-devel', 'lua-lpeg', 'lua-filesystem', 'lua-posix', 'lua-json', 'lua-term', 'nfs-utils',
	  'tcl', 'tcl-devel', 'tk', 'tk-devel', 'libical-devel', 'rpm-build', 'hwloc-devel', 'libXt-devel',
          'libedit-devel', 'postgresql-devel', 'python-devel', 'openssl-devel', 'libXext', 'wget' ]

package { $pkgs: }

user { 'jbaker2':
  ensure           => 'present',
  groups           => ['wheel'],
  home             => '/home/jbaker2',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '5000',
}


}
