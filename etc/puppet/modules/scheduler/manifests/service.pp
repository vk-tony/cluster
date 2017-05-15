class scheduler::service inherits scheduler {
	#service { 'pbs':
	#	name	=>	'pbs',
	#	ensure	=>	'running',
	#	enable  =>	'true',
	#}
}
