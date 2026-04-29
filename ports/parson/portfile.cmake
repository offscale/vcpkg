vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/parson
    REF 62e9264e0e3acef37099067291cf03209823a443 # See commit message for version number
    SHA512 625eb2da39da892621c6830e954730fd22239e9c06f90f2aa11cfd00d7483c1cbd6d0a192b58cec25c2cc9a3dda596a6a73f71af2d57f9e91d04e1158f3cfb34
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
