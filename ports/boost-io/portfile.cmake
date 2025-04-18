# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/io
    REF boost-${VERSION}
    SHA512 2549ca2c378ac8e4391fcf8c05fd2a85e47b8ffb5aea1a856a01824e1bcdd615ba85a464de28500d0613dea329994bf65ce4e1e925b4a7f53eb564947d4d9e3a
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
