# header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/greatest
    REF v1.5.0
    SHA512          c1522747af63e83b9454dd7d2960fe2503769faf704fea482dfed7532980799217c7606e23d7464edfc2cf5d0d53e92d67a2b053275f24e23a33b0c27a2e3ca9
    HEAD_REF master
)

file(COPY "${SOURCE_PATH}/greatest.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
