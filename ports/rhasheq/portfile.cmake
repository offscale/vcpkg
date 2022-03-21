vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            offscale/rhasheq
    REF             0afac58f67eeb11ea26ab433f395e339fe2f2b72
    SHA512          47c376a2cf2b0a1e9e217e3af04f20de1af8c71af667c5f548d150a816d395fae38fbddd65dacd8af6dae332ccf8f8cdd947ba9c6157d5b7620130f8dc212735
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
