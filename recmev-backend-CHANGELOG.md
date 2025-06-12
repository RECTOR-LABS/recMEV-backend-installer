# Changelog

## [0.1.13]

### Enhanced

- **Help System**: Modernized help interface with improved formatting and user experience

  - Streamlined help output with cleaner, more readable format
  - Improved command descriptions and option formatting
  - Better visual hierarchy with consistent color coding
  - Enhanced usage examples and command structure display

- **Database Schema Management**: Added automatic database schema creation and validation

  - Automatic detection and creation of required database tables
  - Enhanced connection testing with schema validation
  - Comprehensive error handling for missing database structures
  - Manual setup instructions for self-hosted Supabase instances
  - Added database indexes and triggers for optimal performance

- **Token Management**: Generalized token metadata handling
  - Removed Jupiter-specific branding from token operations
  - Unified token metadata fetching and caching system
  - Improved token synchronization process documentation
  - Enhanced token cache management with better error handling

### Added

- **Automatic Schema Creation**: New database schema management system
  - Creates pools and token_mints tables automatically
  - Adds performance indexes for optimal query performance
  - Implements automatic timestamp update triggers
  - Provides fallback manual setup instructions
  - Supports both hosted and self-hosted Supabase instances

### Improved

- **User Experience**: Enhanced help system with modern formatting

  - Cleaner command structure display
  - Better option descriptions and formatting
  - Improved visual hierarchy and readability
  - More intuitive help navigation

- **Database Operations**: Robust database initialization and management

  - Automatic table creation on first run
  - Enhanced connection testing with schema validation
  - Better error messages for database setup issues
  - Comprehensive fallback procedures for manual setup

- **Documentation**: Updated all help text and command descriptions
  - Removed platform-specific references where appropriate
  - Improved clarity and consistency across all commands
  - Enhanced troubleshooting information

### Technical

- **Schema Management**: Comprehensive database schema creation system

  - SQL schema definition with proper table structures
  - Index creation for optimal query performance
  - Trigger implementation for automatic timestamp updates
  - Error handling for various database setup scenarios

- **API Integration**: Improved token metadata handling
  - Generalized token API integration (removed Jupiter-specific references)
  - Enhanced error handling for token synchronization
  - Better cache management and persistence

## [0.1.12]

### Enhanced

- **Build System**: Improved cross-compilation and development workflow
  - Added Cross.toml configuration for cross-platform builds
  - Enhanced Makefile with platform detection and native/cross-compilation support
  - Added development build targets (`dev` and `dev-run`) for faster iteration
  - Improved Linux binary building using cross-compilation tools
  - Enhanced macOS binary building with native compilation on Darwin systems

### Added

- **Cross-compilation Configuration**: New Cross.toml file for consistent cross-platform builds
  - Linux target configuration with proper Docker image
  - macOS target configuration for cross-compilation from Linux
  - Environment variable passthrough for debugging (RUST_LOG, RUST_BACKTRACE)

### Improved

- **Development Experience**: Enhanced Makefile with development-focused targets
  - Platform detection for optimal build strategy selection
  - Separate development and production build workflows
  - Argument passing support for development runs
  - Better build output and status reporting

## [0.1.11]

### Fixed

- **Bash Completion**: Fixed bash completion issue for hyphenated command names
  - Added post-processing function to fix clap-generated completion
  - Replaced problematic double underscores with single underscores
  - Ensured function naming consistency for proper bash completion
  - Resolved tab completion issues on Linux systems

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
