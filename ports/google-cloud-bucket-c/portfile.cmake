vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            "offscale/${PORT}"
    REF             39fd6b0a40524244b20644ab7e1b8d1da0f0e2d6
    SHA512          a1af4cd318d9cf040f8e71faf5288151f173ea3a5f72f7dfa87434c603fb35c350217c0df8e891a8cb3ab3c022fd8fd86a0230c01b474f8d4eea44c63ff76bf9
    HEAD_REF        master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/cmake/License.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")
