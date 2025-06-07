# Changelog

## [0.1.10]

### Enhanced

- **Pre-release Process**: Automated pre-release workflow implementation
- **Documentation**: Updated pre-release instructions and automation
- **Version Management**: Improved version tracking and release coordination

### Improved

- **Release Process**: Streamlined pre-release automation across repositories
- **Documentation Quality**: Enhanced pre-release documentation and procedures

## [0.1.9]

### Enhanced

- **Help System**: Comprehensive help documentation improvements across all commands
  - **Export Help**: Added detailed troubleshooting section with common issues and solutions
    - Export failure diagnostics and permission checks
    - Disk space and data availability validation
    - File creation and directory permission guidance
  - **Logs Help**: Complete overhaul with comprehensive logging documentation
    - Added log sources section covering application events, database operations, API interactions
    - Detailed log viewing process with filtering and real-time monitoring
    - Log levels explanation with color coding (ERROR, WARN, INFO, DEBUG, TRACE)
    - Real-time monitoring features and graceful exit instructions
    - Log locations for different operating systems
    - Expanded examples with use cases and troubleshooting
  - **Stats Help**: Enhanced pool statistics documentation
    - Added statistics types section with DEX-specific metrics
    - Data sources explanation covering database tables
    - Display format and information provided sections
    - Sample output examples and use cases
    - Comprehensive troubleshooting for database connectivity issues
  - **Sync Help**: Major documentation expansion for pool synchronization
    - Added data sources section covering all supported DEX protocols
    - Detailed synchronization process with 7-step workflow
    - Safety features including dry-run mode and batch processing
    - Performance considerations with optimization guidelines
    - Expanded examples and troubleshooting section
  - **System Stats Help**: Complete system monitoring documentation
    - Added system components monitoring (database, cache, data store, directories)
    - Monitoring areas with performance metrics and operational insights
    - Information categories with detailed breakdowns
    - Sample output sections and use cases
    - Comprehensive troubleshooting for system health issues
  - **Test Help**: Enhanced connection testing documentation
    - Added connection types section covering all API endpoints
    - Detailed testing process with validation checks
    - Test modes explanation (full test, Supabase only, APIs only)
    - Expected results and troubleshooting guidance
  - **Tokens Help**: Comprehensive token metadata documentation
    - Added token sync process with 7-step workflow
    - Data sources explanation covering Jupiter API integration
    - Cache management with TTL and persistence features
    - Database integration with bulk operations
    - Performance features and token statistics reporting
    - Cache locations and comprehensive troubleshooting

### Improved

- **Documentation Quality**: All help commands now provide comprehensive, user-friendly documentation
- **User Experience**: Enhanced help formatting with consistent structure and color coding
- **Troubleshooting**: Added detailed troubleshooting sections for all major commands
- **Examples**: Expanded examples with real-world use cases and scenarios

## [0.1.6]

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
