vcpkg_from_sourceforge(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO geographiclib
    REF distrib-C++
    FILENAME "GeographicLib-2.1.tar.gz"
    SHA512 efa3bad6a4f4fb3b2553334f357b5051b82a0c295e9c80ead467a8cdaeb438d81c59bc162444cb7cafa7733d0907a7d303e7f2b5a07640b19dc57a1d0c6c5d95
    )

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        "tools" TOOLS
)

# GeographicLib's CMakeLists.txt allows the installation directories for
# all the components to be set independently.  A "false" value, e.g., an
# empty string or OFF (-DBINDIR=OFF), indicates that the corresponding
# component should not be installed.
if(TOOLS)
    set(TOOL_OPTION "-DBINDIR=tools/${PORT}")
else()
    set(TOOL_OPTION -DBINDIR=OFF)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${TOOL_OPTION}
    "-DCMAKEDIR=share/${PORT}"
    -DDOCDIR=OFF
    -DEXAMPLEDIR=OFF
    -DMANDIR=OFF
    -DSBINDIR=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_copy_pdbs()

vcpkg_fixup_pkgconfig()

if(tools IN_LIST FEATURES)
    vcpkg_copy_tool_dependencies("${CURRENT_PACKAGES_DIR}/tools/${PORT}")
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/tools")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright)

# Install usage
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage"
    "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" @ONLY)
