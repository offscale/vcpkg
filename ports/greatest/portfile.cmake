# header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO            SamuelMarks/greatest
    REF 79ea5d2db135a19e00516d0f578bf32646a02a8b
    SHA512 b37f22ae3c6711a696c3708506cda9c35b49013c3c0c3461f888a19bfd756ac64f1a826a029d993751f683ad6c4f070ce9cd0ae29165e67c0a8402f839b64fb3
    HEAD_REF master
)

file(COPY "${SOURCE_PATH}/greatest.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
