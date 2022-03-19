vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            offscale/rhasheq
    REF             9b97278442a5f1b99e3fcb08cd4c0aa0606243fd
    SHA512          45be94f950d1f377496d87e9bc43f41452404234cca2a832b705f9f3b277fcafe068a3b389f383abb5e4303057f5438b26f84f1c088262094057377d2afbf9f6
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
