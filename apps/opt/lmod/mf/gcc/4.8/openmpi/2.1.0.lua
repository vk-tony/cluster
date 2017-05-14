-- Modulefile for OpenMPI 2.1.0

-- Set any package properties (see $LMOD_PREFIX/init/lmodrc.lua)

-- You should also have a look at the $LMOD_PREFIX/libexec/SitePackage.lua
-- To simplify much of this to your site. Modulefiles can be made extremely
-- generic provided you follow some simple rules with installation methods.


local apps = "/apps"
local name = myModuleName()
local vers = myModuleVersion()
local fname = myFileName()
local hier1 = hierarchyA(myModuleFullName(),1)

-- User Help ;)
help([[
OpenMPI is an open source high performance implementation 
of the MPI standard designed in an extremely modular form
supporting many network types. It provides access to the
following commands:

	mpicc,mpicxx,mpic++,mpiCC,
	mpif77,mpif90,mpifort,
	
	oshcc,oshfort,shmemcc,shmemfort

	mpirun,shmemrun
]])

-- Whatis Database
whatis("Name: " .. name)
whatis("Version: " .. vers)
whatis("Category: MPI/SHMEM Implementation")
whatis("Description: Open source high performance MPI/SHMEM implementation")
whatis("URL: https://www.open-mpi.org")
whatis("Keyword: MPI SHMEM Distributed")


-- The statements and if block can be removed. They only provide
-- information for the workshop; they shouldn't be there unless
-- there become more verbose options for loading modules ;)
if "load" == mode() then
LmodMessage("")
LmodMessage("\nModule Name:     " ..name)
LmodMessage("\nModule Version:  " ..vers)
LmodMessage("\nModulefile Name: " ..fname)
LmodMessage("\nFull Name:       " .. myModuleFullName())
LmodMessage("\nHierarchy lvl 1: " .. hier1[1])
LmodMessage("")
end

-- Generate the appropriate paths
local prefix = pathJoin(apps,hier1[1],name,vers)
local bin = pathJoin(prefix,"bin")
local lib = pathJoin(prefix,"lib")
local man = pathJoin(prefix,"share","man")

-- SW config and compile time variables
pushenv("CC",pathJoin(bin,"mpicc"))
pushenv("CXX",pathJoin(bin,"mpicxx"))
pushenv("FC",pathJoin(bin,"mpifort"))
pushenv("F77",pathJoin(bin,"mpifort"))
pushenv("F90",pathJoin(bin,"mpifort"))
append_path("CPPFLAGS",pathJoin("-I",prefix,"include")," ")
append_path("LDFLAGS",pathJoin("-L",lib," -Wl,-rpath,",lib)," ")

-- Runtime environment variables
prepend_path("PATH",bin)
prepend_path("LD_LIBRARY_PATH",lib)
prepend_path("MANPATH",man)

-- Any extra site and/or package specific configuration

