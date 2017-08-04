VULKAN_SDK_PATH = /home/nic/Development/Vulkan/VulkanSDK/1.0.54.0/x86_64
STB_INCLUDE_PATH = /home/nic/Development/Vulkan/VulkanSDK/1.0.54.0

CFLAGS = -std=c++11 -I$(VULKAN_SDK_PATH)/include -I$(STB_INCLUDE_PATH)
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS) 

.PHONY: test clean

test: VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d valgrind ./VulkanTest

clean:
	rm -f VulkanTest
