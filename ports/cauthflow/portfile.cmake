vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            "offscale/${PORT}"
    REF             d5401f21eabbdcbdb37d95168301e353aa76b367
    SHA512          3847ad10ab69c007498ecd43096f7c21436f8f4ea87132bde862b8f7fc2703db4a07b01870400fbbb9bf0cfe32ccc7fdcb43b953ea495344fbf22ff5517d68aa
    HEAD_REF        master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/cmake/LICENSE.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
