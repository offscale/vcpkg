# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/chrono
    REF boost-${VERSION}
    SHA512 c339a9a5e15d16494db768cd827062bac2beef0fc98c2d9cb821f2984d547dc5c27b06a0774b0115c27201ddde3b83e38c482b98949b53d28588eb76611ecd18
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
