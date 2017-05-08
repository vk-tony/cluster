class scheduler {

        package {"pbspro-execution":
                ensure => "present",
        }

        file { "/etc/pbs.conf":
                ensure => "file",
                owner => "root",
                group => "root",
                mode => "0644",
                source => "puppet:///modules/clients/pbs.conf",
        }

        service {"pbs":
                ensure => "running",
                enable => "true",
        }
}
