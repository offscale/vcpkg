vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/parson
    REF d140a2660b6c8ff2acbf8bb990eda18838ce84e0 # See commit message for version number
    SHA512 1df2962703f1df08d144a3de590f937386f3337198c78aed07c288820fb2b60fb86a8b61e47089cb5436223a427a7a56a4ebe0c5c18d2900e14e3b2e08e8bc61
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
