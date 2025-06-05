#!/usr/bin/env sh
set -e

# Define version for download
VERSION="v0.1.6"

# Check if running on supported platform
check_platform() {
    OS="$(uname -s)"
    
    if [ "$OS" = "Linux" ]; then
        BINARY_NAME="recmev-backend-${VERSION}-linux"
    elif [ "$OS" = "Darwin" ]; then
        BINARY_NAME="recmev-backend-${VERSION}-mac"
    else
        echo "❌ Unsupported operating system. recMEV Backend currently only supports Linux and macOS."
        exit 1
    fi
}

# Function to display installation information and confirm with user
confirm_installation() {
    echo "📋 recMEV Backend Installation Information"
    echo "========================================="
    echo "You are about to install recMEV Backend ${VERSION}, a high-performance Rust-based"
    echo "pool discovery and synchronization engine for Solana DEX operations."
    echo
    echo "This installation will:"
    echo "  • Install recmev-backend binary to ${INSTALL_DIR}/recmev-backend"
    echo "  • Create configuration directory at $HOME/.recmev-backend"
    echo "  • Set up shell completions for your terminal"
    echo
    echo "The installer requires sudo access to install the binary to ${INSTALL_DIR}."
    echo

    # Prompt for confirmation
    printf "Do you want to proceed with the installation? [y/N] "
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY])
            echo "✅ Proceeding with installation..."
            ;;
        *)
            echo "❌ Installation cancelled."
            exit 1
            ;;
    esac
    echo
}

# Function to ensure installation directory exists
ensure_install_dir() {
    # We'll install to /usr/local/bin which should already exist on most systems
    INSTALL_DIR="/usr/local/bin"
    
    # Create config directory
    mkdir -p "$HOME/.recmev-backend"
}

# Function to install shell completions
install_completions() {
    COMPLETION_DIR="$HOME/.recmev-backend/completion"
    mkdir -p "$COMPLETION_DIR"
    
    echo "📥 Setting up shell completion directory..."
    
    # Note: recmev-backend binary does not have a built-in completions command
    # We'll create a basic completion setup that can be enhanced later
    
    echo "✅ Completion directory created at $COMPLETION_DIR"
    echo "   Note: Shell completions will be available in future versions"
    
    # Set completion availability flag for later use
    COMPLETIONS_AVAILABLE=0
}

# Function to setup shell completions in user profile
setup_shell_integration() {
    # Skip shell integration since completions are not available yet
    echo "🔧 Shell integration setup..."
    echo "   Shell completions will be available in future versions of recMEV Backend"
    echo "   For now, use 'recmev-backend --help' to see available commands"
    
    SHELL_CONFIGURED=0
}

# Function to download and install binary
install_binary() {
    echo "📦 Downloading recMEV Backend ${VERSION}..."
    
    # Download URL
    DOWNLOAD_URL="https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/main/${BINARY_NAME}"
    
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    TEMP_BINARY="${TEMP_DIR}/recmev-backend"
    
    # Download binary
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$DOWNLOAD_URL" -o "$TEMP_BINARY"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "$DOWNLOAD_URL" -O "$TEMP_BINARY"
    else
        echo "❌ Error: Neither curl nor wget is available. Please install one of them."
        exit 1
    fi
    
    # Check if download was successful
    if [ ! -f "$TEMP_BINARY" ] || [ ! -s "$TEMP_BINARY" ]; then
        echo "❌ Error: Failed to download binary or downloaded file is empty."
        echo "   Please check your internet connection and try again."
        exit 1
    fi
    
    # Make binary executable
    chmod +x "$TEMP_BINARY"
    
    # Test if binary is valid
    if ! "$TEMP_BINARY" --version >/dev/null 2>&1; then
        echo "❌ Error: Downloaded binary appears to be corrupted or incompatible."
        echo "   Please try downloading again or contact support."
        exit 1
    fi
    
    echo "✅ Binary downloaded and verified successfully."
    
    # Install binary
    echo "🔧 Installing binary to ${INSTALL_DIR}..."
    
    # Try to install without sudo first
    if cp "$TEMP_BINARY" "${INSTALL_DIR}/recmev-backend" 2>/dev/null; then
        echo "✅ Binary installed successfully."
    else
        # Need sudo
        echo "🔐 Administrator privileges required to install to ${INSTALL_DIR}..."
        if sudo cp "$TEMP_BINARY" "${INSTALL_DIR}/recmev-backend"; then
            echo "✅ Binary installed successfully with sudo."
        else
            echo "❌ Error: Failed to install binary. Please check permissions."
            exit 1
        fi
    fi
    
    # Clean up
    rm -rf "$TEMP_DIR"
}

# Function to create default configuration
create_default_config() {
    CONFIG_DIR="$HOME/.recmev-backend"
    CONFIG_FILE="$CONFIG_DIR/config.toml"
    
    echo "📝 Setting up configuration..."
    
    # Create config directory structure
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$CONFIG_DIR/logs"
    mkdir -p "$CONFIG_DIR/cache"
    mkdir -p "$CONFIG_DIR/data"
    mkdir -p "$CONFIG_DIR/backups"
    
    # Create default config if it doesn't exist
    if [ ! -f "$CONFIG_FILE" ]; then
        cat > "$CONFIG_FILE" << 'EOF'
[version_info]
version = "0.1.6"
build_timestamp = "Generated by installer"

[directories]
base_dir = "~/.recmev-backend"
logs_dir = "~/.recmev-backend/logs"
cache_dir = "~/.recmev-backend/cache"
data_dir = "~/.recmev-backend/data"
backup_dir = "~/.recmev-backend/backups"

[supabase]
# Replace with your Supabase project details
url = "https://your-project-id.supabase.co"
anon_key = "your-anon-key-here"
# service_key = "your-service-key-here"  # Optional: for higher performance

[api]
# API configuration
timeout_seconds = 30
max_retries = 3
batch_size = 100

[sync]
# Synchronization settings
dry_run = false
enable_deduplication = true
max_concurrent_requests = 10

[logging]
# Logging configuration
level = "info"
file_logging = true
console_logging = true
EOF
        echo "✅ Created default configuration at $CONFIG_FILE"
        echo "   Please edit this file with your Supabase credentials before first use."
    else
        echo "✅ Configuration file already exists at $CONFIG_FILE"
    fi
}

# Function to verify installation
verify_installation() {
    echo "🔍 Verifying installation..."
    
    # Check if binary is in PATH
    if command -v recmev-backend >/dev/null 2>&1; then
        echo "✅ recmev-backend is available in PATH"
        
        # Test basic functionality
        if recmev-backend --version >/dev/null 2>&1; then
            echo "✅ Binary is working correctly"
            VERSION_OUTPUT=$(recmev-backend --version 2>/dev/null || echo "Version check failed")
            echo "   $VERSION_OUTPUT"
        else
            echo "⚠️  Binary installed but version check failed"
        fi
    else
        echo "⚠️  recmev-backend not found in PATH"
        echo "   You may need to restart your terminal or add ${INSTALL_DIR} to your PATH"
    fi
}

# Function to display post-installation instructions
show_post_install_instructions() {
    echo ""
    echo "🎉 recMEV Backend installation completed successfully!"
    echo ""
    echo "📋 Next Steps:"
    echo "=============="
    echo ""
    echo "1. Configure your Supabase credentials:"
    echo "   Edit: $HOME/.recmev-backend/config.toml"
    echo "   Add your Supabase URL and API keys"
    echo ""
    echo "2. Test the installation:"
    echo "   recmev-backend --help"
    echo "   recmev-backend test"
    echo ""
    echo "3. Run your first sync (dry-run mode):"
    echo "   recmev-backend sync --dry-run"
    echo ""
    echo "4. View available commands:"
    echo "   recmev-backend --help"
    echo ""
    echo "📚 Documentation:"
    echo "   • Configuration: https://github.com/RECTOR-LABS/recMEV-backend"
    echo "   • Troubleshooting: https://github.com/RECTOR-LABS/recMEV-backend/issues"
    echo ""
    echo "🔧 Shell Completions:"
    echo "   Shell completions will be available in future versions"
    echo "   For now, use 'recmev-backend --help' to see available commands"
    echo ""
    echo "Happy syncing! 🚀"
}

# Main installation function
main() {
    echo "🚀 recMEV Backend Installer"
    echo "=========================="
    echo ""
    
    # Check platform
    check_platform
    
    # Confirm installation
    confirm_installation
    
    # Ensure installation directory exists
    ensure_install_dir
    
    # Download and install binary
    install_binary
    
    # Create default configuration
    create_default_config
    
    # Install shell completions
    install_completions
    
    # Setup shell integration
    setup_shell_integration
    
    # Verify installation
    verify_installation
    
    # Show post-installation instructions
    show_post_install_instructions
}

# Run main function
main "$@" 