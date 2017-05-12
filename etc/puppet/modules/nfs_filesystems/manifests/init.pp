class nfs_filesystems {

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
		options => "defaults,noauto",
		atboot => true,
	}

	file { "/dhome":
		ensure => "directory",
		owner => "root",
		group => "root",
		mode => "755",
	}

	mount { "/dhome":
		device => "master:/exports/dhome",
		fstype => "nfs",
		ensure => "mounted",
		options => "defaults,noauto",
		atboot => true,
	}
}
