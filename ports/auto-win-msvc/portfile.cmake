vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/auto-win-msvc
    REF c09db63037fe5dcecd4bb21e7762c13336978a06
    SHA512 a83c7d0f25c5a4ca46589d3e3ac7909953eebf92137e2e4a6ad3b7dbb3a80930329461f62caedeb7fa165293acf6360eefc8e135fe932d116a86af37aafee6a2
    HEAD_REF        master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DBUILD_TESTING=OFF"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright OPTIONAL)
file(INSTALL "${SOURCE_PATH}/LICENSE-MIT"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright OPTIONAL)
file(INSTALL "${SOURCE_PATH}/LICENSE.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright OPTIONAL)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")

