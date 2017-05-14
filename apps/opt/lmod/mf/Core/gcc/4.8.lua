-- Modulefile for RHEL 7 GCC 4.8
--
--
local mroot = os.environ['MODULEPATH_ROOT']
local name = myModuleName()
local vers = myModuleVersion()

append_path("MODULEPATH",pathJoin(mroot,name,vers))

