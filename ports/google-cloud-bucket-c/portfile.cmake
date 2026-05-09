vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            "offscale/${PORT}"
    REF             a456061176fd47d7ec34eb9e1c1c72adfdbb75dd
    SHA512          bd13e650ab61665ef3f65e9cbff7ab045de64a8fbebc1cc4eb0a06fd6990a3e1f6cf88af7d85475626e4ddd3b3e5ab98f335d4618ee5544b135f8c3b4f5c882a
    HEAD_REF        master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/cmake/License.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")
