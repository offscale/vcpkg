vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/c-str-span
    REF             99c3edd879f034ed140d7ad2a2fe597895e06c6f
    SHA512          8d2dd6f2b38ffadc1fab2cf4baf0b38bf39ab2ddf3d488bfa825f43e26c7e67b6fb6a7f7f4775dff1c3a04233ad835c3ced3af165e5a347566b39c7df032a782
    HEAD_REF        master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DBUILD_TESTING=OFF"
)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE-MIT"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")
