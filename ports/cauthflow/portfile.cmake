vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            "offscale/${PORT}"
    REF             dd4e9a74dbbf79823acdf48594f02cccd4332be1
    SHA512          61456561f95ac36b3cb49268a46d3bf952384edbcf3d3090561c412b816039bc68a238bbbecabe437bd46ead386edf0d7a3d7cc4a029acc5936cc3fe4d8d7436
    HEAD_REF        master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS     "-DBUILD_TESTING=OFF"
)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/cmake/LICENSE.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
