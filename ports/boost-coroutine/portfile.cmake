# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/coroutine
    REF boost-${VERSION}
    SHA512 e41b0c22bdbc621cc6d1081a1c5050541894648c5ab8de760fc35e203933e4c13eee57c16060b0b2f28f94bef966e6b71eb26206fe495180e1a9905de5abf7ef
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
