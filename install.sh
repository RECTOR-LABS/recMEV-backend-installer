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
    
    # Detect OS for platform-specific handling
    OS="$(uname -s)"
    IS_MACOS=0
    if [ "$OS" = "Darwin" ]; then
        IS_MACOS=1
    fi
    
    # Detect current shell
    CURRENT_SHELL=$(basename "$SHELL")
    
    echo "📥 Generating shell completions..."
    
    # Only generate completions for the current shell
    case "$CURRENT_SHELL" in
        bash)
            echo "Generating Bash completions..."
            "${INSTALL_DIR}/recmev-backend" completions bash -o "$COMPLETION_DIR" && BASH_OK=1 || \
                echo "⚠️  Bash completion generation failed."
            
            if [ -f "$COMPLETION_DIR/recmev-backend.bash" ]; then
                chmod 644 "$COMPLETION_DIR/recmev-backend.bash"
                echo "✅ Bash completions generated successfully."
                COMPLETIONS_AVAILABLE=1
            else
                echo "⚠️  Failed to generate Bash completions."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
        zsh)
            echo "Generating Zsh completions..."
            "${INSTALL_DIR}/recmev-backend" completions zsh -o "$COMPLETION_DIR" && ZSH_OK=1 || \
                echo "⚠️  Zsh completion generation failed."
            
            if [ -f "$COMPLETION_DIR/_recmev-backend" ]; then
                chmod 644 "$COMPLETION_DIR/_recmev-backend"
                echo "✅ Zsh completions generated successfully."
                COMPLETIONS_AVAILABLE=1
            else
                echo "⚠️  Failed to generate Zsh completions."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
        fish)
            echo "Generating Fish completions..."
            "${INSTALL_DIR}/recmev-backend" completions fish -o "$COMPLETION_DIR" && FISH_OK=1 || \
                echo "⚠️  Fish completion generation failed."
            
            if [ -f "$COMPLETION_DIR/recmev-backend.fish" ]; then
                chmod 644 "$COMPLETION_DIR/recmev-backend.fish"
                echo "✅ Fish completions generated successfully."
                COMPLETIONS_AVAILABLE=1
            else
                echo "⚠️  Failed to generate Fish completions."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
        *)
            # For unknown shells, generate all completion types for user to manually set up
            echo "Generating Bash completions..."
            "${INSTALL_DIR}/recmev-backend" completions bash -o "$COMPLETION_DIR" && BASH_OK=1 || true
            
            echo "Generating Zsh completions..."
            "${INSTALL_DIR}/recmev-backend" completions zsh -o "$COMPLETION_DIR" && ZSH_OK=1 || true
            
            echo "Generating Fish completions..."
            "${INSTALL_DIR}/recmev-backend" completions fish -o "$COMPLETION_DIR" && FISH_OK=1 || true
            
            # Check if any completions were generated successfully
            if [ -f "$COMPLETION_DIR/recmev-backend.bash" ] || [ -f "$COMPLETION_DIR/_recmev-backend" ] || [ -f "$COMPLETION_DIR/recmev-backend.fish" ]; then
                echo "✅ Shell completions generated successfully."
                COMPLETIONS_AVAILABLE=1
                chmod 644 "$COMPLETION_DIR"/* 2>/dev/null || true
            else
                echo "⚠️  No shell completions were generated successfully."
                COMPLETIONS_AVAILABLE=0
            fi
            ;;
    esac
    
    # Special note for macOS users
    if [ "$IS_MACOS" = "1" ]; then
        echo ""
        echo "ℹ️  Note for macOS users:"
        echo "  If tab completions don't work after installation,"
        echo "  run this command to fix it:"
        echo "    recmev-backend completions"
        echo ""
    fi
    
    # Provide guidance if completions weren't successful
    if [ "$COMPLETIONS_AVAILABLE" != "1" ]; then
        echo "Troubleshooting:"
        echo "  - After installation completes, run: recmev-backend completions"
        echo "  - This will automatically set up completions for your current shell"
    fi
}

# Function to setup shell completions in user profile
setup_shell_integration() {
    if [ "$COMPLETIONS_AVAILABLE" != "1" ]; then
        return
    fi
    
    CURRENT_SHELL=$(basename "$SHELL")
    COMPLETION_DIR="$HOME/.recmev-backend/completion"
    SHELL_CONFIGURED=0
    
    # Detect macOS for platform-specific handling
    OS="$(uname -s)"
    IS_MACOS=0
    if [ "$OS" = "Darwin" ]; then
        IS_MACOS=1
    fi
    
    echo "🔧 Setting up shell integration for $CURRENT_SHELL..."
    
    case "$CURRENT_SHELL" in
        bash)
            if [ "$BASH_OK" = "1" ]; then
                # On macOS, check both .bashrc and .bash_profile
                if [ "$IS_MACOS" = "1" ]; then
                    # First try .bash_profile which is more common on macOS
                    if [ -f "$HOME/.bash_profile" ]; then
                        if ! grep -q "recmev-backend completion" "$HOME/.bash_profile"; then
                            echo "" >> "$HOME/.bash_profile"
                            echo "# recmev-backend completion" >> "$HOME/.bash_profile"
                            echo "[ -f $COMPLETION_DIR/recmev-backend.bash ] && source $COMPLETION_DIR/recmev-backend.bash" >> "$HOME/.bash_profile"
                            echo "✅ Added Bash completion to ~/.bash_profile"
                            SHELL_CONFIGURED=1
                        else
                            echo "✅ Bash completion already configured in ~/.bash_profile"
                            SHELL_CONFIGURED=1
                        fi
                        
                        # Check if bash-completion is configured in .bash_profile
                        if ! grep -q "bash[-_]completion" "$HOME/.bash_profile"; then
                            echo "" >> "$HOME/.bash_profile"
                            echo "# Enable bash completion (if available)" >> "$HOME/.bash_profile"
                            echo "if [ -f /opt/homebrew/etc/bash_completion ]; then" >> "$HOME/.bash_profile"
                            echo "    . /opt/homebrew/etc/bash_completion" >> "$HOME/.bash_profile"
                            echo "elif [ -f /usr/local/etc/bash_completion ]; then" >> "$HOME/.bash_profile"
                            echo "    . /usr/local/etc/bash_completion" >> "$HOME/.bash_profile"
                            echo "fi" >> "$HOME/.bash_profile"
                            echo "✅ Added bash-completion setup to ~/.bash_profile"
                        fi
                    else
                        # Create .bash_profile if it doesn't exist
                        echo "# recmev-backend completion" > "$HOME/.bash_profile"
                        echo "[ -f $COMPLETION_DIR/recmev-backend.bash ] && source $COMPLETION_DIR/recmev-backend.bash" >> "$HOME/.bash_profile"
                        echo "✅ Created ~/.bash_profile with Bash completion"
                        SHELL_CONFIGURED=1
                    fi
                    
                    # Also check .bashrc for Linux compatibility
                    if [ -f "$HOME/.bashrc" ]; then
                        if ! grep -q "recmev-backend completion" "$HOME/.bashrc"; then
                            echo "" >> "$HOME/.bashrc"
                            echo "# recmev-backend completion" >> "$HOME/.bashrc"
                            echo "[ -f $COMPLETION_DIR/recmev-backend.bash ] && source $COMPLETION_DIR/recmev-backend.bash" >> "$HOME/.bashrc"
                            echo "✅ Added Bash completion to ~/.bashrc"
                            SHELL_CONFIGURED=1
                        fi
                    fi
                else
                    # Linux - use .bashrc
                    if [ -f "$HOME/.bashrc" ]; then
                        if ! grep -q "recmev-backend completion" "$HOME/.bashrc"; then
                            echo "" >> "$HOME/.bashrc"
                            echo "# recmev-backend completion" >> "$HOME/.bashrc"
                            echo "[ -f $COMPLETION_DIR/recmev-backend.bash ] && source $COMPLETION_DIR/recmev-backend.bash" >> "$HOME/.bashrc"
                            echo "✅ Added Bash completion to ~/.bashrc"
                            SHELL_CONFIGURED=1
                        else
                            echo "✅ Bash completion already configured in ~/.bashrc"
                            SHELL_CONFIGURED=1
                        fi
                    else
                        # Create .bashrc if it doesn't exist
                        echo "# recmev-backend completion" > "$HOME/.bashrc"
                        echo "[ -f $COMPLETION_DIR/recmev-backend.bash ] && source $COMPLETION_DIR/recmev-backend.bash" >> "$HOME/.bashrc"
                        echo "✅ Created ~/.bashrc with Bash completion"
                        SHELL_CONFIGURED=1
                    fi
                fi
            fi
            ;;
        zsh)
            if [ "$ZSH_OK" = "1" ]; then
                if [ -f "$HOME/.zshrc" ]; then
                    if ! grep -q "recmev-backend completion" "$HOME/.zshrc"; then
                        echo "" >> "$HOME/.zshrc"
                        echo "# recmev-backend completion" >> "$HOME/.zshrc"
                        echo "fpath=($COMPLETION_DIR \$fpath)" >> "$HOME/.zshrc"
                        echo "autoload -U compinit && compinit" >> "$HOME/.zshrc"
                        echo "✅ Added Zsh completion to ~/.zshrc"
                        SHELL_CONFIGURED=1
                    else
                        echo "✅ Zsh completion already configured in ~/.zshrc"
                        SHELL_CONFIGURED=1
                    fi
                else
                    # Create .zshrc if it doesn't exist
                    echo "# recmev-backend completion" > "$HOME/.zshrc"
                    echo "fpath=($COMPLETION_DIR \$fpath)" >> "$HOME/.zshrc"
                    echo "autoload -U compinit && compinit" >> "$HOME/.zshrc"
                    echo "✅ Created ~/.zshrc with Zsh completion"
                    SHELL_CONFIGURED=1
                fi
            fi
            ;;
        fish)
            if [ "$FISH_OK" = "1" ]; then
                FISH_CONFIG_DIR="$HOME/.config/fish"
                FISH_COMPLETIONS_DIR="$FISH_CONFIG_DIR/completions"
                
                # Create fish config directories if they don't exist
                mkdir -p "$FISH_COMPLETIONS_DIR"
                
                # Copy completion file to fish completions directory
                if [ -f "$COMPLETION_DIR/recmev-backend.fish" ]; then
                    cp "$COMPLETION_DIR/recmev-backend.fish" "$FISH_COMPLETIONS_DIR/"
                    echo "✅ Added Fish completion to ~/.config/fish/completions/"
                    SHELL_CONFIGURED=1
                fi
            fi
            ;;
    esac
    
    if [ "$SHELL_CONFIGURED" = "1" ]; then
        echo "🎉 Shell integration configured successfully!"
        echo "   Restart your terminal or run 'source ~/.${CURRENT_SHELL}rc' to enable completions."
    else
        echo "⚠️  Shell integration setup failed or was skipped."
        echo "   You can manually set up completions by running: recmev-backend completions"
    fi
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
    if [ "$COMPLETIONS_AVAILABLE" = "1" ]; then
        echo "   ✅ Completions have been set up for your shell"
        echo "   Restart your terminal to enable tab completion"
    else
        echo "   Run: recmev-backend completions"
        echo "   This will set up tab completion for your shell"
    fi
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