class repo_test{

	# Make sure we have all the necessary YUM repos
	yumrepo { "RHoptional":
		name => "rhui-REGION-rhel-server-optional",
		enabled => "yes"
	}
}
