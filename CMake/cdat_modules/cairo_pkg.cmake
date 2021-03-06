set(CAIRO_MAJOR 1)
set(CAIRO_MINOR 10)
set(CAIRO_PATCH 2)
set(CAIRO_MAJOR_SRC 1)
set(CAIRO_MINOR_SRC 12)
set(CAIRO_PATCH_SRC 14)
set(CAIRO_URL ${LLNL_URL})
set(CAIRO_GZ cairo-${CAIRO_MAJOR_SRC}.${CAIRO_MINOR_SRC}.${CAIRO_PATCH_SRC}.tar.gz)
set(CAIRO_MD5 4a55de6dbbd2d22eee9eea78e6bdbbfd )
set(CAIRO_SOURCE ${CAIRO_URL}/${CAIRO_GZ})
set(CAIRO_VERSION ${CAIRO_MAJOR_SRC}.${CAIRO_MINOR_SRC}.${CAIRO_PATCH_SRC})

add_cdat_package_dependent(Cairo "" "" ON "CDAT_BUILD_GRAPHICS" OFF)

