# recMEV Backend Installer

This repository contains the installation package for recMEV Backend.

## Overview

recMEV Backend installer package provides an automated way to install the recMEV Backend binary on your system. Currently available for:

- macOS
- Linux

The installer places the binary in the system binary directory (`/usr/local/bin`)

## Components

- `recmev-backend-v0.1.10-mac`: macOS binary
- `recmev-backend-v0.1.10-linux`: Linux binary
- `install.sh`: Installation script with platform detection

## What is recMEV Backend?

recMEV Backend is a high-performance Rust implementation of pool discovery and synchronization logic for Solana DEX operations. It provides:

- **Performance**: Significantly faster than Python implementations
- **Memory efficiency**: Lower memory usage for large-scale pool discovery
- **Concurrency**: Superior handling of concurrent API calls
- **Type safety**: Compile-time guarantees for data structures
- **CLI Interface**: Professional command-line interface with subcommands
- **Multi-DEX Support**: Raydium, Orca, Meteora, and more

## Installation

### Option 1: One-Line Installation (Recommended)

Install recMEV Backend with a single command:

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/main/install.sh)"
```

This method will:

- Create necessary configuration directories
- Download and install the appropriate binary for your system
- Create default configuration files
- Set up basic directory structure

### Option 2: Direct Script Execution

If you've cloned the repository or downloaded the install script:

```bash
./install.sh
```

### Option 3: Manual Installation

For users who prefer to perform the installation steps manually:

```bash
# Create config directory if it doesn't exist
mkdir -p ~/.recmev-backend

# Download binary (replace OS with either 'linux' or 'mac' based on your system)
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/main/recmev-backend-v0.1.10-OS -o recmev-backend

# Install binary
chmod +x recmev-backend
sudo mv recmev-backend /usr/local/bin/recmev-backend
```

### Installing Specific Versions

To install a specific version of recMEV Backend, you'll need to modify the version number in the installation URL. For example, to install version v0.1.5:

```bash
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/v0.1.5/install.sh)"
```

Available versions:

- v0.1.10 (latest) - Automated pre-release workflow implementation with enhanced documentation and version management
- v0.1.9 - Comprehensive help documentation improvements with detailed troubleshooting guides and enhanced user experience
- v0.1.6 - Enhanced help system, advanced logging, progress tracking, DEX filtering, and Jupiter token integration
- v0.1.5 - Multi-DEX pool discovery with Raydium, Orca, and Meteora support
- v0.1.4 - Concurrent API fetching and batch upsert functionality
- v0.1.3 - Supabase connectivity and database operations
- v0.1.2 - Basic CLI framework and configuration system
- v0.1.1 - Initial Rust implementation
- v0.1.0 - First alpha release

You can find all available release versions on our [GitHub releases page](https://github.com/RECTOR-LABS/recMEV-backend-installer/releases).

## Post-Installation Setup

After installation, you need to configure your Supabase credentials:

### 1. Edit Configuration File

```bash
# Open the configuration file
nano ~/.recmev-backend/config.toml
```

### 2. Add Your Supabase Credentials

```toml
[supabase]
url = "https://your-project-id.supabase.co"
anon_key = "your-anon-key-here"
# service_key = "your-service-key-here"  # Optional: for higher performance
```

### 3. Test the Installation

```bash
# Test connections
recmev-backend test

# Run a dry-run sync
recmev-backend sync --dry-run

# View help
recmev-backend --help
```

## Usage Examples

### Basic Commands

```bash
# Show help
recmev-backend --help

# Test all connections
recmev-backend test

# Run dry-run sync (recommended first)
recmev-backend sync --dry-run

# Run full sync
recmev-backend sync

# Show database statistics
recmev-backend stats

# Generate configuration file
recmev-backend config
```

### Advanced Usage

```bash
# Run with verbose logging
recmev-backend -v sync --dry-run

# Use custom config file
recmev-backend -c /path/to/config.toml sync

# Run sync with specific batch size
recmev-backend sync --batch-size 50
```

## Configuration

The application creates a configuration directory at `~/.recmev-backend/` with the following structure:

```
~/.recmev-backend/
├── config.toml              # Main configuration file
├── logs/                    # Application logs
├── cache/                   # Cache files for API responses
├── data/                    # Application data files
└── backups/                 # Configuration backups
```

## Uninstallation

recMEV Backend does not currently include an automated uninstall command. To uninstall, follow the manual steps below:

### Manual Uninstallation

If you need to manually uninstall recMEV Backend, follow these steps:

1. Remove the binary:

```bash
sudo rm /usr/local/bin/recmev-backend
```

2. Remove configuration files (optional):

```bash
rm -rf ~/.recmev-backend
```

3. Remove completion directory (if it exists):

```bash
rm -rf ~/.recmev-backend/completion
```

## Post-Installation Verification

After installation, verify that recMEV Backend was installed correctly:

```bash
recmev-backend --help
recmev-backend --version
```

## Features

### Implemented Features

- ✅ **Professional CLI Interface** with subcommands and help system
- ✅ **TOML Configuration System** with multiple config file locations
- ✅ **Supabase connectivity** using REST API
- ✅ **Multi-DEX pool discovery**:
  - Raydium V2 API (official + unofficial pools)
  - Orca Whirlpool API
  - Meteora DLMM API
- ✅ **Concurrent API fetching** using async/await
- ✅ **Batch upsert** to Supabase with configurable batch sizes
- ✅ **Comprehensive error handling**
- ✅ **Structured logging** with detailed progress tracking
- ✅ **Dry-run mode** for testing without database writes
- ✅ **Deduplication** of pools across DEX sources
- ✅ **Connection testing** for Supabase and API endpoints
- ✅ **Database statistics** reporting

### Planned Features

- 🔄 **Additional DEX sources** (pump.fun, Jupiter aggregated pools)
- 🔄 **Performance benchmarking** vs Python implementation
- 🔄 **Memory usage optimization**
- 🔄 **Rate limiting and retry logic**
- 🔄 **Incremental sync strategies**

## Troubleshooting

### Common Issues

1. **Binary not found in PATH**

   - Restart your terminal
   - Ensure `/usr/local/bin` is in your PATH

2. **Permission denied during installation**

   - The installer requires sudo access to install to `/usr/local/bin`
   - Run: `sudo ./install.sh`

3. **Configuration file not found**

   - Run: `recmev-backend config` to generate default configuration
   - Edit `~/.recmev-backend/config.toml` with your credentials

4. **Supabase connection failed**
   - Verify your Supabase URL and API keys in the config file
   - Test connection: `recmev-backend test`

### Getting Help

- **Documentation**: [recMEV Backend Repository](https://github.com/RECTOR-LABS/recMEV-backend)
- **Issues**: [GitHub Issues](https://github.com/RECTOR-LABS/recMEV-backend/issues)
- **Discussions**: [GitHub Discussions](https://github.com/RECTOR-LABS/recMEV-backend/discussions)

## Security

This installer downloads pre-compiled binaries from the official recMEV Backend repository. The binaries are:

- Built from verified source code
- Distributed through GitHub's secure infrastructure
- Verified during installation for integrity

Always download the installer from the official repository to ensure security.

## License

This project is licensed under the same terms as the main recMEV project. See the [LICENSE](LICENSE) file for details.

## Contributing

This is an installer repository. For contributing to the main recMEV Backend project, please visit the [recMEV Backend repository](https://github.com/RECTOR-LABS/recMEV-backend).

---

**Happy syncing with recMEV Backend! 🚀**
