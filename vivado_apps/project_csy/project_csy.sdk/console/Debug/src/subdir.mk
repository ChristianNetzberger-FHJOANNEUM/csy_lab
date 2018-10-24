################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/SDcard.c \
../src/apps.c \
../src/audio.c \
../src/cmd.c \
../src/config_rtc.c \
../src/console_main.c \
../src/helloworld.c \
../src/platform.c \
../src/rtc_hal.c \
../src/temp.c \
../src/uart.c \
../src/vga.c 

OBJS += \
./src/SDcard.o \
./src/apps.o \
./src/audio.o \
./src/cmd.o \
./src/config_rtc.o \
./src/console_main.o \
./src/helloworld.o \
./src/platform.o \
./src/rtc_hal.o \
./src/temp.o \
./src/uart.o \
./src/vga.o 

C_DEPS += \
./src/SDcard.d \
./src/apps.d \
./src/audio.d \
./src/cmd.d \
./src/config_rtc.d \
./src/console_main.d \
./src/helloworld.d \
./src/platform.d \
./src/rtc_hal.d \
./src/temp.d \
./src/uart.d \
./src/vga.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../console_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


