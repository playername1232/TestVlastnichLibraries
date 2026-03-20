cmake_minimum_required(VERSION 3.20)
project(test_vlastnich_lib)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(test_vlastnich_lib main.cpp
        Model/User/User.cpp)

if (WIN32)
    target_include_directories(test_vlastnich_lib PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/windows_libs/plaja_logger)

    target_link_libraries(test_vlastnich_lib PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/windows_libs/plaja_logger/plaja_logger.lib)

    add_custom_command(TARGET test_vlastnich_lib POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${CMAKE_CURRENT_SOURCE_DIR}/windows_libs/plaja_logger/plaja_logger.dll
            $<TARGET_FILE_DIR:test_vlastnich_lib>)
elseif(UNIX)
    target_include_directories(test_vlastnich_lib PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/linux_libs/plaja_logger)

    target_link_libraries(test_vlastnich_lib PRIVATE
            ${CMAKE_CURRENT_SOURCE_DIR}/linux_libs/plaja_logger/libplaja_logger.so)

    add_custom_command(TARGET test_vlastnich_lib POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${CMAKE_CURRENT_SOURCE_DIR}/linux_libs/plaja_logger/libplaja_logger.so
            $<TARGET_FILE_DIR:test_vlastnich_lib>)
endif()