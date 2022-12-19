# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/dll
    REF boost-1.80.0
    SHA512 5d13d9b2efdad1f99a7db9dc90b0faa4845b850182915c32c195b73eadfaea77a0d15f5163a8a402561af1f5d66ca1f6273abace42a8340b7587e8cdce5d9d0a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
