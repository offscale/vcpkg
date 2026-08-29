# header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/greatest
    REF d4a8307ab1bea85de034232bc95170c8267056f3
    SHA512 5d00d85b8c5d6fdcc1042129f0ca3687f9c8a77ba84a577e9e4895d833eab44b4218f92a41d942909934353424d069b645e281aa6a1500fee62dad7903cbf14f
    HEAD_REF master
)

file(COPY "${SOURCE_PATH}/greatest.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
