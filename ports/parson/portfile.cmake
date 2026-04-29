vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/parson
    REF             4a107c8396325848d26e94ca859bbd1ca3afe103 # See commit message for version number
    SHA512          75b3a91b7cf34d0e48b20c9d7481b0745e1fb6d726aaf70d6308a7d8543d2264587e19e4eeb780d579e5934d7f13a482a83dbb0c5b29ee10a21f81ba59260d9f
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
