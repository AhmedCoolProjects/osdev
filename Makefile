ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	@echo "[LOG] Creating floppy image from binary..."
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img
	@echo "[LOG] Floppy image created: $(BUILD_DIR)/main_floppy.img (1440k)"

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	@echo "[LOG] Assembling $(SRC_DIR)/main.asm..."
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin
	@echo "[LOG] Binary file created: $(BUILD_DIR)/main.bin"

.PHONY: run
run: $(BUILD_DIR)/main_floppy.img
	@echo "[LOG] Running OS in QEMU..."
	qemu-system-i386 -fda $(BUILD_DIR)/main_floppy.img

.PHONY: clean
clean:
	@echo "[LOG] Cleaning build directory..."
	rm -f $(BUILD_DIR)/*.bin $(BUILD_DIR)/*.img
	@echo "[LOG] Clean complete"

.PHONY: all
all: $(BUILD_DIR)/main_floppy.img
	@echo "[LOG] Build completed successfully"