vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Blosc/c-blosc2
    REF "v${VERSION}"
    SHA512 f57959e96a48598e00e327fdc7d4c692116870cdd57fb36b65d783ee8a6a451bff9580bb4e43a428bf17b8eed364a269b702ec610c8d0c3569d6c3af466a3ac3
    HEAD_REF main
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" BLOSC2_STATIC)
string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" BLOSC2_SHARED)

file(REMOVE_RECURSE "${SOURCE_PATH}/internal-complibs")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    DISABLE_PARALLEL_CONFIGURE
    OPTIONS
        -DPREFER_EXTERNAL_LZ4=ON
        -DPREFER_EXTERNAL_ZLIB=ON
        -DPREFER_EXTERNAL_ZSTD=ON
        -DBUILD_TESTS=OFF
        -DBUILD_FUZZERS=OFF
        -DBUILD_BENCHMARKS=OFF
        -DBUILD_EXAMPLES=OFF
        -DBUILD_STATIC=${BLOSC2_STATIC}
        -DBUILD_SHARED=${BLOSC2_SHARED}
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
if (VCPKG_TARGET_IS_WINDOWS)
    vcpkg_cmake_config_fixup(CONFIG_PATH "cmake")
else()
    vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/Blosc2")
endif()
vcpkg_fixup_pkgconfig()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/blosc2/Blosc2Targets.cmake"
    [[# Generated by CMake]]
    [[# Generated by CMake 
include(CMakeFindDependencyMacro)
find_dependency(lz4 CONFIG)
find_dependency(zstd CONFIG)
find_dependency(ZLIB)
find_dependency(Threads)]]
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
