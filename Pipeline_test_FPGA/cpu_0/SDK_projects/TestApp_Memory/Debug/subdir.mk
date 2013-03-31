################################################################################
# Automatically-generated file. Do not edit!
################################################################################

S_UPPER_SRCS += \

CC_UPPER_SRCS += \

C++_UPPER_SRCS += \

CXX_UPPER_SRCS += \

CPP_SRCS += \

CC_SRCS += \

C_SRCS += \
../TestApp_Memory.c \

C_UPPER_SRCS += \

CPP_UPPER_SRCS += \

CXX_SRCS += \

S_SRCS += \

C++_SRCS += \

# Object files
OBJS += \
TestApp_Memory.o \

# Dependency files
DEPS += \
TestApp_Memory.d \

# Each subdirectory must supply rules for building sources it contributes
TestApp_Memory.o: ../TestApp_Memory.c $(INCDEP)
	@echo mb-gcc -c -mno-xl-soft-mul -mhard-float -mxl-pattern-compare -mcpu=v7.10.d  -I../../microblaze_0_sw_platform/microblaze_0/include -xl-mode-executable -g -O2 -o$@ $<
	@mb-gcc -c -mno-xl-soft-mul -mhard-float -mxl-pattern-compare -mcpu=v7.10.d  -I../../microblaze_0_sw_platform/microblaze_0/include -xl-mode-executable -g -O2 -o$@ $< && \
	echo -n $(@:%.o=%.d) $(dir $@) > $(@:%.o=%.d) && \
	mb-gcc -I../../microblaze_0_sw_platform/microblaze_0/include -MM -MG -P -w -xl-mode-executable -g -O2  $< >> $(@:%.o=%.d)
	@echo ' '


