# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/chrono
    REF boost-${VERSION}
    SHA512 22f757ebe6ca4a61e14dd148ec495cd457817b27eef66c4fbea2cfa0cd062956997c45b082dc47dea20691ec34452f5a123de3c5436cd366f99d0e01d3774c39
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
