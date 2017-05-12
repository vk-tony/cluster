class lmod {

file { "/etc/profile.d/z00_modules.sh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/lmod/z00_modules.sh"
}

file { "/etc/profile.d/z00_modules.csh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/lmod/z00_modules.csh"
}

file { "/etc/profile.d/z01_modules.sh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/lmod/z01_modules.sh"
}

file { "/etc/profile.d/z01_modules.csh":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	source => "puppet:///modules/lmod/z01_modules.csh"
}

}
