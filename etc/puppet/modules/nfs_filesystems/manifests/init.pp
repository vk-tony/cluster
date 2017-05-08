class filesystems {

	file { "/apps":
		ensure => "directory",
		owner => "root",
		group => "root",
		mode => "755",
	}

	mount { "/apps":
		device => "master:/exports/apps",
		fstype => "nfs",
		ensure => "mounted",
		options => "defaults,vers=3",
		atboot => true,
	}

	file { "/dhome":
		ensure => "directory",
		owner => "root",
		group => "root",
		mode => "755",
	}

	mount { "/dhome":
		device => "master:/exports/home",
		fstype => "nfs",
		ensure => "mounted",
		options => "defaults",
		atboot => true,
	}
}
