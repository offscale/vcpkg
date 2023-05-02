# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/tuple
    REF boost-1.82.0
    SHA512 c44b29c6513ed0f128d7738626eb2c91a8c4762ce82bccb54de6086a47dd4a38479ba134b72e002db315667fd9d95facc5c870c1827334fdaae9c7ee55a80529
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
