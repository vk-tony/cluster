class repos {

	# Make sure we have all the necessary YUM repos
	yumrepo { "RHoptional":
		name => "rhui-REGION-rhel-server-optional",
		enabled => "yes"
	}

	yumrepo { "RHextras":
		  name => "rhui-REGION-rhel-server-extras",
		  enabled => "yes",
	}

	package {"epel-release":
		ensure => "present",
		source => "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
		provider => "rpm",
	}

	#yumrepo { "EPEL":
	#	name => "epel",
	#	enabled => "yes"
	#}

	yumrepo { "LCI-BAC":
		name => "hpc",
		descr => "LCI Build-A-Cluster",
		baseurl => "http://master/hpc-repo",
		enabled => "yes",
		gpgcheck => "no",
	}

}
