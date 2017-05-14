class scheduler::install inherits scheduler {
	
	include repos

	# A list of dependencies for our compute nodes to run PBS Pro (...and Lmod)
	$pkgs = [ 
		'bash-completion',
		'vim-enhanced',
          	'readline', 'readline-devel',
          	'libgenders', 'libgenders-devel',
          	'lua','lua-devel', 'lua-lpeg', 'lua-filesystem', 'lua-posix', 'lua-json', 'lua-term',
          	'nfs-utils',
          	'tcl', 'tcl-devel',
          	'tk', 'tk-devel',
          	'libical', 'libical-devel',
          	'rpm-build',
          	'hwloc', 'hwloc-devel',
          	'libedit-devel',
          	'python','python-devel',
          	'wget','curl','libcurl',
          	'gcc','gcc-gfortran','gcc-c++','make','autoconf','automake',
          	'libX11-devel','libXext','libXt-devel','libXft-devel',
          	'ncurses-devel',
          	'perl',
          	'postgresql-server','postgresql-devel',
          	'expat','expat-devel',
          	'openssl','openssl-devel',
          	'fontconfig',
        ]
	
	# Make sure above packages are installed.
	package { $pkgs: ensure => 'installed' }

	## Install the PBS Pro execution RPM
        #package {"pbspro-execution":
        #        ensure => "present",
        #}

}
