
add_executable(signal_tree_test
    ./main.cpp
)


target_link_libraries(signal_tree_test 
    work_contract
)
if (NOT WIN32)
    target_link_libraries(blocking_work_contract_test 
        pthread
    )
endif()


target_include_directories(signal_tree_test
PUBLIC
    ${_work_contract_dir}/src
    ${_include_dir}/src
)

if (MSVC)
    target_compile_options(blocking_work_contract_test PRIVATE /EHsc)
endif()
