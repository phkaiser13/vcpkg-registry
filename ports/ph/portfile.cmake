# Copyright (C) 2025 Pedro Henrique / phkaiser13
# SPDX-License-Identifier: Apache-2.0

include(vcpkg_common_functions)

# Download the source from GitHub
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO phkaiser13/Peitch
    REF "v3.2.3-beta-test"
    SHA512 "677f09dcdf8a12072002d25aa3b69babe224e1148dc302745889a2b521805de48e557160e06634545f8258da61705f2eda18f757bb0f8a2e6673bfbe9c621ef9"
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
    "${CURRENT_PACKAGES_DIR}/bin/ph${VCPKG_HOST_EXECUTABLE_SUFFIX}"
    DESTINATION "${CURRENT_PACKAGES_DIR}/tools/ph"
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug")

# Install license/copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)