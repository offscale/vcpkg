vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            offscale/rhasheq
    REF             56cb5a51d60feb5f17b7a0c8639e67eab8933d89
    SHA512          c9a03c7ee118ae94c1f2efcb05b4a4c9f2ce6e563d12dbd4a4bd74996273f8b17016f428b08974914752ea732e0603b649dfa01b2256fed416336899c9c0350e
    HEAD_REF        master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DBUILD_TESTING=OFF"
)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/COPYING"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/rhasheq"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
