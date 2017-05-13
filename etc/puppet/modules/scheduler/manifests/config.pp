class scheduler::config inherits scheduler {
        
	#file {	"/etc/pbs.conf":
        #        ensure => "file",
        #        owner => "root",
        #        group => "root",
        #        mode => "0644",
        #        source => "puppet:///modules/scheduler/pbs_client.conf",
        #}

}
