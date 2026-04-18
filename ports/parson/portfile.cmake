vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/parson
    REF             d98a81f5f1083d5c8c1e2a18dc148db74ac76a50 # See commit message for version number
    SHA512          fd27aa5763baf7428eea1e14f3dc266954078d7e52627235ecb6d3486f6dd0fa7cd2b526060f9779904ab963cec3651a44bea86ccf7c48e7235f1282ab5c7939
    HEAD_REF master
    PATCHES
        fix-cmake-files-path.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_copy_pdbs()
