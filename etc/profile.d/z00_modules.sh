#!/bin/sh
# -*- shell-script -*-
########################################################################
#  This is the system wide source file for setting up
#  modules:
#
########################################################################

if [ `id -u` -ge 1000 ]; then

  if [ -z "${MODULEPATH_ROOT:-}" ]; then
    export USER=${USER-${LOGNAME}}  # make sure $USER is set
    export LMOD_sys=`uname`

    export MODULEPATH_ROOT="/apps/opt/lmod/mf"
    export MODULEPATH=$(/apps/opt/lmod/lmod/libexec/addto --append MODULEPATH $MODULEPATH_ROOT/$LMOD_sys $MODULEPATH_ROOT/Core)
    export MODULEPATH=$(/apps/opt/lmod/lmod/libexec/addto --append MODULEPATH /apps/opt/lmod/lmod/modulefiles/Core)
    export BASH_ENV=$MODULESHOME/init/bash

    #
    # If MANPATH is empty, Lmod is adding a trailing ":" so that
    # the system MANPATH will be found
    if [ -z "${MANPATH:-}" ]; then
      export MANPATH=:
    fi
    export MANPATH=$(/apps/opt/lmod/lmod/libexec/addto MANPATH /apps/opt/lmod/lmod/share/man)
  fi

  PS_CMD=/usr/bin/ps
  if [ ! -x $PS_CMD ]; then
      if   [ -x /bin/ps ]; then
          PS_CMD=/bin/ps
      elif [ -x /usr/bin/ps ]; then
          PS_CMD=/usr/bin/ps
      fi
  fi
  EXPR_CMD=/usr/bin/expr
  if [ ! -x $EXPR_CMD ]; then
      if   [ -x /usr/bin/expr ]; then
          EXPR_CMD=/usr/bin/expr
      elif [ -x /bin/expr ]; then
          EXPR_CMD=/bin/expr
      fi
  fi
  BASENAME_CMD=/usr/bin/basename
  if [ ! -x $BASENAME_CMD ]; then
      if   [ -x /bin/basename ]; then
          BASENAME_CMD=/bin/basename
      elif [ -x /usr/bin/basename ]; then
          BASENAME_CMD=/usr/bin/basename
      fi
  fi


  my_shell=$($PS_CMD -p $$ -ocomm=)
  my_shell=$($EXPR_CMD    "$my_shell" : '-*\(.*\)')
  my_shell=$($BASENAME_CMD $my_shell)
  if [ -f /apps/opt/lmod/lmod/init/$my_shell ]; then
     .    /apps/opt/lmod/lmod/init/$my_shell >/dev/null # Module Support
  else
     .    /apps/opt/lmod/lmod/init/sh        >/dev/null # Module Support
  fi
  unset my_shell PS_CMD EXPR_CMD BASENAME_CMD
fi

# Local Variables:
# mode: shell-script
# indent-tabs-mode: nil
# End:

