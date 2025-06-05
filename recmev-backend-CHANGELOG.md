# Changelog

All notable changes to the recMEV Backend installer will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.6] - 2025-01-27

### Added

- Enhanced help system with colorized command-specific help
- Comprehensive logging improvements with file-only logging in non-verbose mode
- Progress bars for pool and token synchronization operations
- DEX-specific filtering for pool synchronization (--dex flag)
- Improved token cache management with Jupiter API integration
- Enhanced error handling and command validation
- Detailed performance metrics for sync operations

### Enhanced

- **Logging System**: Complete overhaul with thread-safe file logging and console control
  - File logging now works independently of console output
  - Verbose mode controls console output while maintaining file logs
  - Improved log formatting with UTC timestamps
  - Command execution logging for debugging and analytics
- **Help System**: Added colorized help for individual commands
  - Command-specific help with detailed descriptions and examples
  - Improved help formatting with colored output
  - Better error messages for invalid commands
- **Pool Synchronization**: Major improvements to sync performance and user experience
  - Progress bars with ETA calculations for batch operations
  - DEX-specific filtering (raydium, orca, meteora)
  - Enhanced batch processing with detailed progress reporting
  - Improved error handling for failed batches
- **Token Management**: Enhanced Jupiter token integration
  - Better token data parsing and validation
  - Improved cache management and persistence
  - Progress tracking for token synchronization
- **API Integration**: Updated data models for latest API responses
  - Fixed Raydium API response parsing for new format
  - Enhanced Meteora pool data handling
  - Improved error handling for API failures

### Fixed

- Raydium API response parsing updated for new direct array format
- Token data deserialization with proper field mapping
- Meteora pool data parsing with string-to-number conversion
- Logging initialization race conditions with thread-safe implementation
- Command line argument validation and error reporting

### Performance

- Concurrent pool fetching from multiple DEX sources
- Optimized batch processing with configurable batch sizes
- Progress tracking reduces perceived wait times
- Efficient memory usage for large dataset processing
- Database operations with proper connection pooling

### Technical

- Thread-safe logging implementation with Arc<Mutex<>> patterns
- Improved error propagation and context preservation
- Enhanced command line parsing with better error messages
- Modular help system architecture
- Robust API client with retry logic and timeout handling

### Features

- **One-line installation**: `sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/main/install.sh)"`
- **Platform detection**: Automatically detects Linux vs macOS
- **Shell integration**: Sets up tab completions for current shell
- **Configuration management**: Creates default TOML configuration
- **Binary verification**: Validates downloaded binary integrity
- **Sudo handling**: Graceful handling of administrator privileges
- **Error handling**: Comprehensive error checking and user feedback

### Installation Components

- `recmev-backend-v0.1.6-linux`: Linux x86_64 binary
- `recmev-backend-v0.1.6-mac`: macOS binary (Intel/Apple Silicon universal)
- `install.sh`: Cross-platform installation script
- `README.md`: Comprehensive installation and usage documentation
- `version.txt`: Version tracking file
- `LICENSE`: Non-commercial license
- `CHANGELOG.md`: Version history documentation

### Configuration

- Creates `~/.recmev-backend/` directory structure
- Generates default `config.toml` with all sections
- Sets up logging, cache, data, and backup directories
- Includes Supabase configuration template
- Provides API and sync configuration options

### Documentation

- Complete installation guide with multiple installation methods
- Post-installation setup instructions
- Configuration examples and explanations
- Troubleshooting guide for common issues
- Usage examples for all major commands
- Uninstallation instructions

### Security

- Binary integrity verification during installation
- Secure download from official GitHub repository
- Proper file permissions setup
- Safe temporary file handling

---

## Version History

### Planned Releases

#### [0.1.7] - Planned

- Enhanced error messages and troubleshooting
- Support for additional shell environments
- Improved binary verification with checksums
- Automatic update checking functionality

#### [0.2.0] - Planned

- Support for Windows installation
- GUI installer option
- Configuration wizard for first-time setup
- Integration with package managers (Homebrew, apt, etc.)

---

## Installation Methods

### Current (v0.1.6)

```bash
# One-line installation
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/main/install.sh)"

# Direct script execution
./install.sh

# Manual installation
curl -fsSL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/main/recmev-backend-v0.1.6-linux -o recmev-backend
chmod +x recmev-backend
sudo mv recmev-backend /usr/local/bin/recmev-backend
```

### Version-specific Installation

```bash
# Install specific version
sh -c "$(curl -sSfL https://raw.githubusercontent.com/RECTOR-LABS/recMEV-backend-installer/v0.1.6/install.sh)"
```

---

## Support

For issues, questions, or feature requests:

- **Repository**: [recMEV Backend Installer](https://github.com/RECTOR-LABS/recMEV-backend-installer)
- **Main Project**: [recMEV Backend](https://github.com/RECTOR-LABS/recMEV-backend)
- **Issues**: [GitHub Issues](https://github.com/RECTOR-LABS/recMEV-backend-installer/issues)
- **Contact**: labs@rectorspace.com
