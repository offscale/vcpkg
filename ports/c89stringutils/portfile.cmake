vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            offscale/c89stringutils
    REF             aa7f8ac83a324f520425cfe9a52847b4ecfa9e48
    SHA512          3f03df44fa8a3ca974ed513ec0d5a4b41323d813e07a2c99b69336779c6cee6be4b1ba66174deaa13addf2eec8e7cfae19d6a92f7b177aa459e21c664d97d0a8
    HEAD_REF        master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DBUILD_TESTING=OFF"
)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/cmake/LICENSE.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/c89stringutils"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
