set(CDAT_deps ${wget_pkg} ${cmor_pkg} ${python_pkg} ${pyqt_pkg} ${numpy_pkg}
              ${pmw_pkg} ${jasper_pkg} ${g2clib_pkg} ${ffmpeg_pkg} ${qt_pkg}
              ${pixman_pkg} ${tiff_pkg} ${libcf_pkg} ${netcdf_pkg}
              ${myproxyclient_pkg} ${wget_pkg})
if (CDAT_BUILD_ESMF)
    list(APPEND CDAT_deps ${esmf_pkg})
endif()

