# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/lexical_cast
    REF boost-${VERSION}
    SHA512 71eb6eaaea512d48dbbd69857330c29644c1ca7b4d13ded2379f80ec8bb893c8bc906fb62116b53234f8d4216ead99d516ee5a83156b6ef74e5b125f6184d694
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
