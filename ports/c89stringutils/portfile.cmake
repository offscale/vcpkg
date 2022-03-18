vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            offscale/c89stringutils
    REF             8beb386ceef486b921cba500cf5489cc5e7f1474
    SHA512          7e9bec9cb10cd86e7e67afd189ea04d0964339036d5a7663e1eeba5ae8c0db0c239590cc8461397f1488a185dbda1b8137a62e07e50405b40986b6366d7521a5
    HEAD_REF        master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DBUILD_TESTS=OFF"
)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/cmake/LICENSE.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/c89stringutils"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
