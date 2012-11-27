set(install_location "${cdat_EXTERNALS}")
#we have multiple problems with how zeroMQ builds
#and tries to install itself on unix. All it comes
#down too is poor support with directories with spaces in the name

#to work around the configure issue with a path to the configure script
#with a space, we build in the source directory  which has no problems
#with a space in the path.

if("${CMAKE_CURRENT_BINARY_DIR}" MATCHES " ")
  #to work around libtool having issues with where the install directory
  #has a space in the name we have to do something farm more complex.
  #1. we create a temporary folder in the temp directory use mktemp
  #2. we create a simlink in that folder to the real install dir
  #3. we set zeroMQ install dir to the symlink
  execute_process(COMMAND mktemp -d /tmp/zeroMQ.XXXX OUTPUT_VARIABLE tempDir)
  string(STRIP ${tempDir} tempDir) #remove all whitespace and newline
  set(zero_install_dir "${tempDir}/zero_install_dir")
  execute_process(COMMAND ln -s ${install_location} ${zero_install_dir} )
else()
  #no spaces so we don't have to create the temp folder
  set(zero_install_dir ${install_location})
endif()


ExternalProject_Add(ZeroMQ
  URL ${ZEROMQ_URL}/${ZEROMQ_GZ}
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
    --prefix=${zero_install_dir}
  BUILD_IN_SOURCE 1
)

get_property(properties TARGET ZeroMQ PROPERTY SAVED_CMAKE_ARGS)
set(property "-DZeroMQ_ROOT_DIR=${install_location}")
list(APPEND properties ${property})
set_property(TARGET ZeroMQ PROPERTY _EP_SAVED_CMAKE_ARGS ${properties})
