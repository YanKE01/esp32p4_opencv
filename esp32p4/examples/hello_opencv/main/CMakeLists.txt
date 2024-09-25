idf_component_register(SRCS "main.cpp"
                    INCLUDE_DIRS "." "opencv/")


target_compile_options(${COMPONENT_LIB} PRIVATE
    -Wno-deprecated-enum-enum-conversion
)

add_prebuilt_library(opencv_imgcodecs "opencv/libopencv_imgcodecs.a")
add_prebuilt_library(libpng "opencv/3rdparty/liblibpng.a")
add_prebuilt_library(libzlib "opencv/3rdparty/libzlib.a")
add_prebuilt_library(opencv_imgproc "opencv/libopencv_imgproc.a")
add_prebuilt_library(opencv_core "opencv/libopencv_core.a")
add_prebuilt_library(opencv_tracking "opencv/libopencv_tracking.a")
add_prebuilt_library(opencv_video "opencv/libopencv_video.a")

set(IMGCODEC_DEP libpng libzlib)
target_link_libraries(opencv_imgcodecs INTERFACE ${IMGCODEC_DEP})

set(CORE_DEP libzlib)
target_link_libraries(opencv_core INTERFACE ${CORE_DEP})

set(OPENCV_DEP opencv_imgcodecs opencv_imgproc opencv_core opencv_tracking opencv_video)
target_link_libraries(${COMPONENT_LIB} ${OPENCV_DEP})
