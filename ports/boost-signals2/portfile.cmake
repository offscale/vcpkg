# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/signals2
    REF boost-${VERSION}
    SHA512 1490e0f58cf3c5c0c1305e9e3c80709ed1e52a99749e36f07c217f7b11a5bd4b963cf5c67c692f1004296c5ebff31468679fd5fb3d34e0019f25d9cd7bd2fcd9
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
