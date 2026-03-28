cmake_minimum_required(VERSION 3.20)
project(test_vlastnich_lib)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(test_vlastnich_lib
        main.cpp
        Model/User/User.cpp
)

if (WIN32)
    set(PLAJA_LOGGER_DIR "${CMAKE_CURRENT_SOURCE_DIR}/windows_libs/plaja_logger")
    set(PLAJA_LOGGER_LINK "${PLAJA_LOGGER_DIR}/plaja_logger.lib")
    set(PLAJA_LOGGER_RUNTIME "${PLAJA_LOGGER_DIR}/plaja_logger.dll")
elseif(UNIX)
    set(PLAJA_LOGGER_DIR "${CMAKE_CURRENT_SOURCE_DIR}/linux_libs/plaja_logger")
    set(PLAJA_LOGGER_LINK "${PLAJA_LOGGER_DIR}/libplaja_logger.so")
    set(PLAJA_LOGGER_RUNTIME "${PLAJA_LOGGER_DIR}/libplaja_logger.so")
else()
    message(FATAL_ERROR "Unsupported platform")
endif()

add_library(PlajaLogger INTERFACE)

target_include_directories(PlajaLogger INTERFACE
        "${PLAJA_LOGGER_DIR}"
)

target_link_libraries(PlajaLogger INTERFACE
        "${PLAJA_LOGGER_LINK}"
)

target_link_libraries(test_vlastnich_lib PRIVATE PlajaLogger)

add_custom_command(TARGET test_vlastnich_lib POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${PLAJA_LOGGER_RUNTIME}"
        "$<TARGET_FILE_DIR:test_vlastnich_lib>"
)