# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/accumulators
    REF boost-1.81.0
    SHA512 960095a14ea202e938132bfdc0e6cf95fa4849b6f81066174ef957d3ca35637e6e52eeb830a164c5b181c33e6b308ae74eece2b2d5ec49fe7f2309f0ddef144a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
