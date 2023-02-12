# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/align
    REF boost-1.81.0
    SHA512 5d13df60dc85e6a0e8c03e1939044e63169d7a963ccfe74e20d6bbfbd3f52a41b43544ea8a9e730c0412061087a5ad7b7742707c0c0f98990cab78abceaff7d0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
