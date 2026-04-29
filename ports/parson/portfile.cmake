vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/parson
    REF de49ada50a9feab197df0b717477252ef6a17738 # See commit message for version number
    SHA512 8afdbc1051ccf0e4f75ed9a4eb2cec7763ff6f34b04a6f814ff14bae4fbea02d0371b3a9250cf537732c9a7dbe961053f2ade9db6a8f57c40bc5b4e92da030a0
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
