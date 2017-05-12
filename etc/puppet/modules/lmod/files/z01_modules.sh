#!/bin/bash
if [ `id -u` -ge 1000 ]; then
	export LMOD_SYSTEM_DEFAULT_MODULES="lci:gcc/4.8"
	module --initial_load restore
fi
