include(vcpkg_common_functions)

set(PROJECT_NAME cppetcd)
set(REPO_URL https://github.com/Maxime2/cppetcd)
#set(REF 8dc38df59f31ceec7b594907664c304dbdb802e9)
#set(REF 7dd851e7c76c2a7281c665f2e11f760f4e08ba92)
#set(REF b34939c8926d58b0110dd8b7c7f6fa779da145d1)
#set(REF f71e82a1b9a064b8975a80eb4f949ad77e77b76f)
#set(REF 3954d1a33f0f904e03134164e1315956ef91bfbe)
#set(REF 8c4dec01f72246ac1eb63cd5b700dee9f3c141a4)
#set(REF a459710d4049abdfa8b113d459db3de135d8be3c)
set(REF b1075a97a4352de96f980de2c4587d7d1f4b4a9a)
set(HEAD_REF master)

find_program(BASH NAMES bash bash.exe)
find_program(GIT NAMES git git.cmd)

#set(BASH ${MSYS_ROOT}/usr/bin/bash.exe)
#set(BASH ${MSYS_ROOT}/bin/bash)
#set(SLASH \\)
set(SLASH /)

if(VCPKG_CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(CMAKE_SHARED_LIBRARY_PREFIX "lib")
  set(CMAKE_SHARED_LIBRARY_SUFFIX ".so")
  set(CMAKE_STATIC_LIBRARY_PREFIX "lib")
  set(CMAKE_STATIC_LIBRARY_SUFFIX ".a")
else()
  set(CMAKE_SHARED_LIBRARY_PREFIX "")
  set(CMAKE_SHARED_LIBRARY_SUFFIX ".dll")
  set(CMAKE_STATIC_LIBRARY_PREFIX "")
  set(CMAKE_STATIC_LIBRARY_SUFFIX ".lib")
endif()


if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
  set(LIBRARY_NAME "${CMAKE_SHARED_LIBRARY_PREFIX}cppetcd${CMAKE_SHARED_LIBRARY_SUFFIX}")
  set(SHARED "-shared")
else()
  set(LIBRARY_NAME "${CMAKE_STATIC_LIBRARY_PREFIX}cppetcd${CMAKE_STATIC_LIBRARY_SUFFIX}")
  set(SHARED "")
endif()
  
set(ENV{CXXFLAGS} "-Ofast")
set(ENV{LDFLAGS} "")
set(ENV{INCLUDES} "-pthread -I${CURRENT_INSTALLED_DIR}/include")
set(ENV{LIBS} "-pthread -L${CURRENT_INSTALLED_DIR}/lib -lprotobuf -lpthread -lgrpc++ -lgrpc")
set(ENV{PROTOC} "${CURRENT_INSTALLED_DIR}${SLASH}tools${SLASH}protobuf${SLASH}protoc")
set(ENV{PROTOC_GRPC_CPP_PLUGIN} "${CURRENT_INSTALLED_DIR}${SLASH}bin${SLASH}grpc_cpp_plugin")
set(ENV{PROTOBUF_PROTOPATH} "${CURRENT_INSTALLED_DIR}${SLASH}include${SLASH}google${SLASH}protobuf")

message(STATUS "Library: ${LIBRARY_NAME}; shared: ${SHARED}")

message(STATUS "Building ${PROJECT_NAME} for Release")
file(MAKE_DIRECTORY ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel)
vcpkg_execute_required_process(
    COMMAND ${BASH} --noprofile --norc "${CMAKE_CURRENT_LIST_DIR}${SLASH}build.sh"
        "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel" # BUILD DIR
        "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel" # SOURCE DIR
        "${CURRENT_PACKAGES_DIR}" # PACKAGE DIR
	"${GIT}" # GIT
	"${REPO_URL}" # REPO_URL
	"${REF}" # REF
	"${HEAD_REF}" # HEAD_REF
        "${LIBRARY_NAME}" # LIBRARY_NAME
	"${SHARED}" # SHARED
    WORKING_DIRECTORY ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel
    LOGNAME build-${TARGET_TRIPLET}-rel
)

set(ENV{CXXFLAGS} "-O0 -g")
set(ENV{LDFLAGS} "-g")
set(ENV{INCLUDES} "-pthread -I${CURRENT_INSTALLED_DIR}/include")
set(ENV{LIBS} "-pthread -L${CURRENT_INSTALLED_DIR}/debug/lib -lprotobuf -lpthread -lgrpc++ -lgrpc")

message(STATUS "Building ${PROJECT_NAME} for Debug")
file(MAKE_DIRECTORY ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg)
vcpkg_execute_required_process(
    COMMAND ${BASH} --noprofile --norc "${CMAKE_CURRENT_LIST_DIR}${SLASH}build.sh"
        "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg" # BUILD DIR
        "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg" # SOURCE DIR
        "${CURRENT_PACKAGES_DIR}/debug" # PACKAGE DIR
	"${GIT}" # GIT
	"${REPO_URL}" # REPO_URL
	"${REF}" # REF
	"${HEAD_REF}" # HEAD_REF
        "${LIBRARY_NAME}" # LIBRARY_NAME
	"${SHARED}" # SHARED
    WORKING_DIRECTORY ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg
    LOGNAME build-${TARGET_TRIPLET}-dbg
)

file(GLOB DEF_FILES ${CURRENT_PACKAGES_DIR}/lib/*.def ${CURRENT_PACKAGES_DIR}/debug/lib/*.def)

if(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm")
    set(LIB_MACHINE_ARG /machine:ARM)
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "x86")
    set(LIB_MACHINE_ARG /machine:x86)
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
    set(LIB_MACHINE_ARG /machine:x64)
else()
    message(FATAL_ERROR "Unsupported target architecture")
endif()

foreach(DEF_FILE ${DEF_FILES})
    get_filename_component(DEF_FILE_DIR "${DEF_FILE}" DIRECTORY)
    get_filename_component(DEF_FILE_NAME "${DEF_FILE}" NAME)
    string(REGEX REPLACE "-[0-9]*\\.def" ".lib" OUT_FILE_NAME "${DEF_FILE_NAME}")
    file(TO_NATIVE_PATH "${DEF_FILE}" DEF_FILE_NATIVE)
    file(TO_NATIVE_PATH "${DEF_FILE_DIR}/${OUT_FILE_NAME}" OUT_FILE_NATIVE)
    message(STATUS "Generating ${OUT_FILE_NATIVE}")
    vcpkg_execute_required_process(
        COMMAND lib.exe /def:${DEF_FILE_NATIVE} /out:${OUT_FILE_NATIVE} ${LIB_MACHINE_ARG}
        WORKING_DIRECTORY ${CURRENT_PACKAGES_DIR}
        LOGNAME libconvert-${TARGET_TRIPLET}
    )
endforeach()

file(GLOB EXP_FILES ${CURRENT_PACKAGES_DIR}/lib/*.exp ${CURRENT_PACKAGES_DIR}/debug/lib/*.exp)
file(GLOB LIB_FILES ${CURRENT_PACKAGES_DIR}/bin/*.lib ${CURRENT_PACKAGES_DIR}/debug/bin/*.lib)
file(GLOB EXE_FILES ${CURRENT_PACKAGES_DIR}/bin/*.exe ${CURRENT_PACKAGES_DIR}/debug/bin/*.exe)
set(FILES_TO_REMOVE ${EXP_FILES} ${LIB_FILES} ${DEF_FILES} ${EXE_FILES})
list(LENGTH FILES_TO_REMOVE FILES_TO_REMOVE_LEN)
if(FILES_TO_REMOVE_LEN GREATER 0)
    file(REMOVE ${FILES_TO_REMOVE})
endif()
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)

vcpkg_copy_pdbs()

# Handle copyright
file(COPY ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/cppetcd)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/cppetcd/LICENSE ${CURRENT_PACKAGES_DIR}/share/cppetcd/copyright)
