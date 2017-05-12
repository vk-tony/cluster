#!/bin/csh
# -*- shell-script -*-
########################################################################
#  This is the system wide source file for setting up
#  modules:
#
########################################################################

set MY_NAME="/apps/opt/lmod/lmod/init/cshrc"

if ( `id -u` >= 1000 ) then

if ( ! $?MODULEPATH_ROOT ) then
    if ( $?USER) then
        setenv USER $LOGNAME
    endif

    set UNAME = `uname`
    setenv LMOD_sys             $UNAME
    setenv MODULEPATH_ROOT      "/apps/opt/lmod/mf"
    setenv MODULEPATH           `/apps/opt/lmod/lmod/libexec/addto --append MODULEPATH $MODULEPATH_ROOT/$LMOD_sys $MODULEPATH_ROOT/Core`
    setenv MODULEPATH           `/apps/opt/lmod/lmod/libexec/addto --append MODULEPATH /apps/opt/lmod/lmod/modulefiles/Core`
    setenv BASH_ENV             "/apps/opt/lmod/lmod/init/bash"

    #
    # If MANPATH is empty, Lmod is adding a trailing ":" so that
    # the system MANPATH will be found
    if ( ! $?MANPATH ) then
      setenv MANPATH :
    endif
    setenv MANPATH `/apps/opt/lmod/lmod/libexec/addto MANPATH /apps/opt/lmod/lmod/share/man`

endif

if ( -f  /apps/opt/lmod/lmod/init/csh  ) then
  source /apps/opt/lmod/lmod/init/csh
endif

endif

# Local Variables:
# mode: shell-script
# indent-tabs-mode: nil
# End:

