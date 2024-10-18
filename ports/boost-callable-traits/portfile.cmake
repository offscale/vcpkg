# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/callable_traits
    REF boost-${VERSION}
    SHA512 f7badabb3fcce39662d2e362082e3d06873ac41f20cb65934fba4c09bb982f4f5130e091f8d93e08b9eaeb334a7a33f2b1452060dedfb19431c5230b747ef04f
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
