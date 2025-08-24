# Copyright (C) 2025 Pedro Henrique / phkaiser13
# SPDX-License-Identifier: Apache-2.0

include(vcpkg_common_functions)

# Download the source from GitHub
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO phkaiser13/peitchgit
    REF "vk8s-prerls-0.0.3-beta"
    SHA512 "a65bcc8995e8fe66e8e105d527e360339d6548c98a4205b5415a5da6e32e21c2002cc15737a4148fd6d93531ab6c57c9dbf7358db9b64d9d5b492e9cd0ab98ac"
    HEAD_REF main
)

# Configure the project using CMake
vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
)

# Build the project
vcpkg_cmake_build()

# Install the built artifacts
vcpkg_cmake_install()

# Move the executable into the tools folder
file(INSTALL
    "${CURRENT_PACKAGES_DIR}/bin/phgit${VCPKG_HOST_EXECUTABLE_SUFFIX}"
    DESTINATION "${CURRENT_PACKAGES_DIR}/tools/phgit"
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug")

# Install license/copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)