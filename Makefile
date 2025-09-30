# Alfred VPN Controller Workflow Makefile
# This Makefile helps package and install the Alfred workflow

# Variables
WORKFLOW_NAME := VPN_Controller
WORKFLOW_FILE := $(WORKFLOW_NAME).alfredworkflow
SRC_DIR := src
IMAGES_DIR := images
BUILD_DIR := build

# Default target
.PHONY: all
all: package

# Create build directory
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

# Copy workflow files to build directory
$(BUILD_DIR)/info.plist: $(SRC_DIR)/info.plist | $(BUILD_DIR)
	@echo "Copying workflow configuration..."
	@cp $(SRC_DIR)/info.plist $(BUILD_DIR)/

$(BUILD_DIR)/icon.png: $(IMAGES_DIR)/icon.png | $(BUILD_DIR)
	@echo "Copying workflow icon..."
	@cp $(IMAGES_DIR)/icon.png $(BUILD_DIR)/

# Package the workflow into a .alfredworkflow file
.PHONY: package
package: $(BUILD_DIR)/info.plist $(BUILD_DIR)/icon.png
	@echo "Packaging Alfred workflow..."
	@cd $(BUILD_DIR) && zip -r "../$(WORKFLOW_FILE)" . -x "*.DS_Store" "*.git*"
	@echo "✅ Workflow packaged as: $(WORKFLOW_FILE)"

# Install the workflow by opening it (Alfred will handle the installation)
.PHONY: install
install: package
	@echo "Installing Alfred workflow..."
	@open $(WORKFLOW_FILE)
	@echo "✅ Workflow installation initiated"

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)
	@rm -f $(WORKFLOW_FILE)
	@echo "✅ Cleaned build artifacts"

# Show help
.PHONY: help
help:
	@echo "Alfred VPN Controller Workflow Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  all       - Default target, same as 'package'"
	@echo "  package   - Create the .alfredworkflow file"
	@echo "  install   - Package and install the workflow (opens the file)"
	@echo "  clean     - Remove build artifacts and packaged workflow"
	@echo "  help      - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make package    # Create VPN Controller.alfredworkflow"
	@echo "  make install    # Package and install the workflow"
	@echo "  make clean      # Clean up build files"

# Development targets
.PHONY: dev-install
dev-install: clean package install
	@echo "✅ Development installation complete"

# Check if required files exist
.PHONY: check
check:
	@echo "Checking required files..."
	@test -f $(SRC_DIR)/info.plist || (echo "❌ Missing: $(SRC_DIR)/info.plist" && exit 1)
	@test -f $(IMAGES_DIR)/icon.png || (echo "❌ Missing: $(IMAGES_DIR)/icon.png" && exit 1)
	@echo "✅ All required files present"
