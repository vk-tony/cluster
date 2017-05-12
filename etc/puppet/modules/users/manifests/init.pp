class users {

file { "/etc/passwd":
	ensure => "file",
	owner => "root",
	group => "root",
	mode => "644",
	links => "follow",
	source => "puppet:///modules/users/passwd",
}


}
