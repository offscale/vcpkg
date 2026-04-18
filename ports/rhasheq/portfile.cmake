vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO offscale/rhasheq
    REF             474c46bf8bef0632082de4b06345a5c52fc8e481
    SHA512          48f4d32375843d53e49478d0ef7c0a448cc7d4967a551c007ba145a237b52fd443c3dba1af0204a3aee72ce1e425ba6938f54fa10f9e07fc906c504af69c390a
    HEAD_REF master
)

vcpkg_replace_string("${SOURCE_PATH}/cmake/Config.cmake.in"
    "include ( \"\${CMAKE_CURRENT_LIST_DIR}/rhasheqTargets.cmake\" )"
    "include(CMakeFindDependencyMacro)\nfind_dependency(unofficial-rhash)\ninclude ( \"\${CMAKE_CURRENT_LIST_DIR}/rhasheqTargets.cmake\" )"
)

file(READ "${SOURCE_PATH}/rhasheq/CMakeLists.txt" CMAKE_LISTS_CONTENT)
string(REGEX REPLACE "set\\(CMAKE_MODULE_PATH.*LibRHash::LibRHash\"\\)" "target_link_libraries(\"\${LIBRARY_NAME}\" INTERFACE unofficial::rhash::rhash)" CMAKE_LISTS_CONTENT "${CMAKE_LISTS_CONTENT}")
file(WRITE "${SOURCE_PATH}/rhasheq/CMakeLists.txt" "${CMAKE_LISTS_CONTENT}")

file(REMOVE "${SOURCE_PATH}/cmake/modules/FindLibRHash.cmake")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
