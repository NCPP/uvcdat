ExternalProject_Get_Property(ZeroMQ "SAVED_CMAKE_ARGS")

ExternalProject_Add(MoleQueue
  GIT_REPOSITORY  git://source.openchemistry.org/molequeue.git
  CMAKE_ARGS
    ${SAVED_CMAKE_ARGS}
    -DUSE_ZERO_MQ:BOOL=ON
    -DENABLE_TESTS:BOOL=OFF
    -DCMAKE_INSTALL_PREFIX:PATH=${cdat_EXTERNALS}
    -DQT_QMAKE_EXECUTABLE:PATH=${QT_QMAKE_EXECUTABLE}
  DEPENDS ${MoleQueue_DEPENDENCIES}
)
