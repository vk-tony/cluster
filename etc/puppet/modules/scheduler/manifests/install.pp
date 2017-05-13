class scheduler::install inherits scheduler {

	# Make sure we have all the necessary YUM repos
	yumrepo { "RHoptional":
		name => "rhui-REGION-rhel-server-optional",
		enabled => "yes"
	}

	#yumrepo { "RHextras":
	#	  name => "rhui-REGION-rhel-server-extras",
	#	  ensure => "present",
	#	  enabled => "yes",
	#}

	#yumrepo { "EPEL":
	#	name => "epel",
	#	ensure => "present",
	#	enabled => "yes"
	#}

	## A list of dependencies for our compute nodes to run PBS Pro (...and Lmod)
	#$pkgs = [ 
	#	'bash-completion','vim',
        #  	'readline', 'readline-devel',
        #  	'libgenders', 'libgenders-devel',
        #  	'lua','lua-devel', 'lua-lpeg', 'lua-filesystem', 'lua-posix', 'lua-json', 'lua-term',
        #  	'nfs-utils',
        #  	'tcl', 'tcl-devel',
        #  	'tk', 'tk-devel',
        #  	'libical', 'libical-devel',
        #  	'rpm-build',
        #  	'hwloc', 'hwloc-devel',
        #  	'libXt-devel',
        #  	'libedit-devel',
        #  	'python','python-devel',
        #  	'wget','curl','libcurl',
        #  	'gcc','gcc-gfortran','gcc-c++','make','autoconf','automake'
        #  	'libX11-devel','libXext','libXt-devel','libXft-devel',
        #  	'libedit-devel','ncurses-devel',
        #  	'perl',
        #  	'postgresql-server','postgresql-devel',
        #  	'expat','expat-devel',
        #  	'openssl','openssl-devel',
        #  	'fontconfig',
        #]
	#
	## Make sure above packages are installed.
	#package { $pkgs: ensure => 'installed' }

	## Install the PBS Pro execution RPM
        #package {"pbspro-execution":
        #        ensure => "present",
        #}

}
