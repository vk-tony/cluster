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

yumrepo { "RHoptional":
	name => "rhui-REGION-rhel-server-optional",
	ensure => "present",
	enabled => "yes"
}

yumrepo { "RHextras":
	name => "rhui-REGION-rhel-server-extras",
	ensure => "present",
	enabled => "yes",
}


Package { ensure => 'installed' }

$pkgs = [ 'bash-completion','vim',
          'readline', 'readline-devel', 
          'libgenders', 'libgenders-devel',
          'lua','lua-devel', 'lua-lpeg', 'lua-filesystem', 'lua-posix', 'lua-json', 'lua-term', 
          'nfs-utils',
	  'tcl', 'tcl-devel', 
          'tk', 'tk-devel', 
          'libical', 'libical-devel', 
          'rpm-build', 
          'hwloc', 'hwloc-devel',
          'libXt-devel',
          'libedit-devel',
          'python','python-devel',
          'wget','curl','libcurl',
          'gcc','gcc-gfortran','gcc-c++','make','autoconf','automake'
          'libX11-devel','libXext','libXt-devel','libXft-devel',
          'libedit-devel','ncurses-devel',
          'perl',
	  'postgresql-server','postgresql-devel',
          'expat','expat-devel',
          'openssl','openssl-devel',
          'fontconfig',
        ]

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
