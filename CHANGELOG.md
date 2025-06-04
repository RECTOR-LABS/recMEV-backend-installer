# Changelog

All notable changes to the recMEV Backend installer will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.6] - 2025-01-27

### Added

- Initial release of recMEV Backend installer
- Cross-platform installation script for Linux and macOS
- Automatic shell completion setup for Bash, Zsh, and Fish
- Default configuration file generation
- Comprehensive installation verification
- Post-installation setup instructions
- Support for custom configuration file paths
- Automatic directory structure creation (~/.recmev-backend/)

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
