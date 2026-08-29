vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/parson
    REF 7af04a402f8a700c6275d8f3a711f6b9410bad01 # See commit message for version number
    SHA512 aa6bf990aaf615a9cba568fadf3da67a0a27e990be9cc1161cb655f2d9fd08a6d3c588e2b5693d3d29d6b3571fbbb38863a64d94950745c004ea8191ee74186c
    HEAD_REF master
    PATCHES
        fix-cmake-files-path.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DPARSON_SINGLE_HEADER=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_copy_pdbs()
