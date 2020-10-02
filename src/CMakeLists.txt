set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS};
  -std=c++17
  --expt-extended-lambda
  #-Xcompiler -pthread
  -gencode arch=compute_60,code=sm_60
)

IF(CUDA_VERSION_MAJOR GREATER 8)
    set(CUDA_NVCC_FLAGS ${CUDA_NVCC_FLAGS};-gencode arch=compute_70,code=sm_70)
    message(STATUS "nvcc version = ${CUDA_VERSION_MAJOR}")
ENDIF(CUDA_VERSION_MAJOR GREATER 8)

file(GLOB CUDA_SOURCES *.cu)
file(GLOB CPP_SOURCES *.cpp)

cuda_add_library(nvcomp SHARED ${CUDA_SOURCES} ${CPP_SOURCES})
target_link_libraries(nvcomp)
if(WIN32)
  target_compile_definitions(nvcomp PRIVATE BUILD_LIB=1)
endif()

add_subdirectory("test")
