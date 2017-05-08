#!/bin/bash
if [ 0 -ne $EUID ]; then
	export LMOD_SYSTEM_DEFAULT_MODULES="lci:gcc/4.8"
	module --initial_load restore
fi
