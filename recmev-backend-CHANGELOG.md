# Changelog

## [0.4.2]

### Major Features

- **Enhanced Hot-Sync Architecture**: Comprehensive improvements to real-time pool monitoring system

  - Added unified block data processing with optimized transaction filtering
  - Implemented advanced block analysis for all enabled DEXs with transaction pre-filtering
  - Enhanced HotSyncManager with improved block scanning and activity detection
  - Added comprehensive validation system for hot pools before database storage

- **Hot Pool Validation System**: New robust validation framework for hot pool data integrity

  - Added PoolValidator with comprehensive on-chain validation
  - Implemented validation caching to improve performance and reduce RPC calls
  - Added pattern-based validation to filter out invalid or problematic pools
  - Enhanced validation with format checking, timestamp validation, and activity reasonableness checks

- **Optimized Transaction Processing**: Advanced transaction filtering and analysis

  - Added target program identification for efficient transaction filtering
  - Implemented DEX-specific transaction filtering to reduce processing overhead
  - Enhanced block analysis with pre-filtered transactions for improved performance
  - Added transaction deduplication and aggregation for better data quality

### Enhanced

- **Hot Pool Data Models**: Improved data structures for hot pool tracking

  - Updated HotPool model from single token/quote structure to dual token_a_mint/token_b_mint design
  - Added BlockInfo structure for better block tracking in hot-sync results
  - Enhanced HotSyncResult with detailed block scanning information
  - Improved data consistency with standardized token pair representation

- **Database Schema Updates**: Comprehensive database improvements for hot pools

  - Added complete hot_pools table schema with indexes and triggers
  - Implemented hot pool CRUD operations with batch upsert capabilities
  - Added hot pool statistics tracking and aggregation functions
  - Enhanced database performance with optimized indexes for hot pool queries

- **Meteora Pool Type Improvements**: Fixed pool type classification for Meteora

  - Corrected Meteora DAMM v1 pool type from "damm_v1" to "dynamic_amm" in API responses
  - Updated pool type filtering to use correct "dynamic_amm" identifier
  - Enhanced pool type conversion logic for accurate Meteora pool classification
  - Improved pool type consistency across all Meteora API integrations

### Added

- **Advanced Pool Validation**: Comprehensive validation framework

  - Added validation for known invalid pool patterns and system accounts
  - Implemented on-chain existence verification for pool addresses
  - Added token mint validation with format and content checking
  - Enhanced validation with activity reasonableness checks and suspicious pattern detection

- **Hot Pool Management**: New database operations for hot pool lifecycle

  - Added get_hot_pools_by_address for targeted pool retrieval
  - Implemented get_all_hot_pools for comprehensive pool management
  - Added delete_hot_pool functionality for pool cleanup operations
  - Enhanced hot pool statistics with count tracking and DEX-based aggregation

- **Performance Optimization**: Enhanced system performance and efficiency

  - Added pool deduplication and aggregation to prevent duplicate entries
  - Implemented rate-limited RPC requests with intelligent retry logic
  - Enhanced block scanning with optimized transaction filtering
  - Added validation caching to reduce redundant validation operations

### Improved

- **Hot-Sync Manager**: Enhanced coordination and processing capabilities

  - Improved block data fetching with unified transaction processing
  - Enhanced DEX-specific analysis with optimized transaction filtering
  - Added comprehensive error handling and logging throughout hot-sync operations
  - Better resource management with rate limiting and retry mechanisms

- **Database Operations**: Enhanced database interaction and performance

  - Added comprehensive statistics functions for hot pools and token mints
  - Improved count operations with proper header parsing and fallback mechanisms
  - Enhanced database schema with automatic timestamp updates and triggers
  - Better error handling for database operations with detailed error messages

- **Pool Data Consistency**: Improved data quality and standardization

  - Standardized token pair representation across all hot pool operations
  - Enhanced pool address validation to prevent system account misclassification
  - Improved token mint validation with comprehensive format checking
  - Better data integrity with validation before database storage

### Technical

- **Validation Architecture**: New comprehensive validation system

  - Added validation.rs module with PoolValidator and ValidationResult structures
  - Implemented caching system for validation results to improve performance
  - Enhanced validation with multiple check layers (format, patterns, on-chain, activity)
  - Added configurable validation parameters and known invalid pattern management

- **Database Schema Evolution**: Enhanced database structure for hot pools

  - Added hot_pools table with comprehensive indexing strategy
  - Implemented automatic timestamp management with triggers
  - Enhanced schema with performance-optimized indexes for common queries
  - Added support for hot pool statistics and aggregation operations

- **Code Architecture**: Improved modularity and maintainability

  - Enhanced hot_sync module structure with validation integration
  - Improved data model consistency with standardized token pair handling
  - Better error handling and logging throughout the hot-sync system
  - Enhanced code organization with clear separation of concerns

### Fixed

- **Meteora Pool Type Classification**: Corrected pool type identification

  - Fixed DAMM v1 pool type from "damm_v1" to "dynamic_amm" for accurate API responses
  - Corrected pool type filtering to use proper "dynamic_amm" identifier
  - Enhanced pool type conversion logic for consistent Meteora pool handling
  - Improved pool type validation and error handling

- **Hot Pool Data Integrity**: Enhanced data quality and validation

  - Fixed pool address validation to prevent system accounts from being classified as pools
  - Improved token mint validation with comprehensive format and content checking
  - Enhanced pool deduplication to prevent duplicate entries in database
  - Better handling of invalid or corrupted pool data with comprehensive validation

## [0.3.6]

### Enhanced

- **Meteora Pool Fetching Optimization**: Streamlined Meteora pool fetching with Universal Search API focus

  - Simplified DAMM v1 and DAMM v2 pool fetching to use Universal Search API exclusively for high-liquidity pools
  - Removed deprecated multi-token stable pool and memecoin pool fetching endpoints
  - Improved API call efficiency by focusing on Universal Search for better pool discovery
  - Enhanced logging messages to clearly indicate Universal Search usage for DAMM pools

- **Database Schema Simplification**: Further database schema cleanup for improved performance

  - Removed additional unused token symbol and name columns from pool operations
  - Simplified pool data models by removing unnecessary token metadata fields
  - Streamlined database operations with reduced column overhead
  - Enhanced database efficiency by focusing on essential pool data only

- **Pool Type System Optimization**: Simplified pool type classification and filtering
  - Removed deprecated pool subtypes (memecoin, multi-token stable, launch pools)
  - Streamlined pool type filtering to focus on core pool types (DLMM, DAMM v1, DAMM v2, Stake2Earn)
  - Enhanced pool type validation with cleaner error messages
  - Improved pool categorization logic for better performance

### Added

- **Enhanced Database Operations**: New database management capabilities

  - Added comprehensive table truncation functionality with SQL-based operations
  - Implemented table count operations for pools, tokens, and hot pools
  - Added fallback mechanisms for database operations with multiple endpoint support
  - Enhanced database statistics tracking with improved count methods

- **Improved Error Handling**: Better database operation error handling
  - Added multiple RPC endpoint fallback for SQL operations
  - Enhanced error messages with actionable guidance for permission issues
  - Improved database operation reliability with retry mechanisms
  - Better handling of database connection and permission errors

### Improved

- **Pool Statistics**: Enhanced pool statistics and tracking

  - Simplified pool statistics to focus on active pool types
  - Removed deprecated pool type counters for better clarity
  - Enhanced statistics aggregation with streamlined pool type support
  - Improved pool counting accuracy with simplified categorization

- **API Configuration**: Optimized API configuration and delay management
  - Standardized API delay configuration across all fetchers
  - Simplified API call timing with consistent delay mechanisms
  - Enhanced API rate limiting with unified configuration approach
  - Improved API reliability with standardized timing controls

### Technical

- **Code Cleanup**: Comprehensive code simplification and optimization

  - Removed unused pool subtype references throughout the codebase
  - Simplified pool conversion logic by removing deprecated fields
  - Enhanced code maintainability with cleaner data structures
  - Improved performance through reduced complexity in pool operations

- **Database Schema**: Continued database schema optimization
  - Removed token symbol and name columns from pool schema
  - Simplified pool data structures for better performance
  - Enhanced database operations with reduced column overhead
  - Improved data consistency with streamlined schema design

### Fixed

- **Pool Filtering**: Improved pool filtering logic and validation
  - Fixed pool type filtering to use enum-based matching exclusively
  - Removed deprecated subtype-based filtering logic
  - Enhanced filter validation with cleaner pool type support
  - Improved filtering accuracy with simplified type matching

## [0.3.0]

### Database Schema Changes

- **Removed Unused Pool Columns**: Cleaned up database schema by removing unnecessary columns
  - Removed `tick_spacing` column from pools table (not needed for simplified pool tracking)
  - Removed `protocol_fee_rate` column from pools table (not used in current implementation)
  - Removed `fund_fee_rate` column from pools table (not used in current implementation)
  - Removed `token_a_name` column from pools table (token names not consistently used)
  - Removed `token_b_name` column from pools table (token names not consistently used)
  - Updated all pool data models and conversion logic to reflect schema changes
  - Applied database migration to remove columns while preserving existing pool data
  - Enhanced database efficiency and reduced storage overhead

### Technical

- **Code Cleanup**: Comprehensive code cleanup following database schema changes
  - Updated PoolInfo struct in core.rs to remove unused fields
  - Modified all pool conversion functions to remove references to removed fields
  - Updated database operations to exclude removed columns from insert/update operations
  - Cleaned up pool fetcher logic to remove unused field assignments
  - Removed token name field references from all DEX conversion implementations
  - Updated database schema definitions to reflect removed columns
  - Maintained backward compatibility with existing pool data while removing unused fields

## [0.2.0]

### Major Features

- **Hot-Sync System**: New real-time pool activity monitoring and hot pool detection system

  - Added comprehensive hot-sync module with real-time block scanning and activity analysis
  - Implemented HotPoolFetcher trait for standardized hot pool detection across DEXs
  - Added PumpfunHotFetcher for Pump.fun hot pool monitoring via on-chain analysis
  - Introduced HotSyncManager for coordinating multiple hot pool fetchers
  - Real-time block transaction analysis with activity-based pool scoring

- **Pump.fun Integration**: Complete Pump.fun ecosystem support via hot-sync

  - Added Pump.fun hot pool fetcher with RPC-based block scanning
  - Implemented pump.fun activity analysis with transaction filtering
  - Added pump.fun pool types (PumpfunBondingCurve, PumpfunAmm) to core data models
  - Enhanced pool type system to support pump.fun pool classification
  - Rate-limited RPC requests with retry logic for reliable pump.fun data fetching

- **Hot Pool Data Models**: New data structures for hot pool tracking

  - Added HotPool model with activity metrics (tx_count, volume, unique_traders, hotness_score)
  - Implemented HotSyncResult for aggregating hot pool scan results
  - Added hotness scoring algorithm based on activity, volume, and recency
  - Enhanced pool activity tracking with block-level granularity

### Enhanced

- **Pool Sync Validation**: Improved sync configuration validation and error handling

  - Added comprehensive DEX name validation with helpful error messages
  - Enhanced pool type validation with detailed available options
  - Special handling for pump.fun with guidance to use hot-sync instead of regular sync
  - Better error messages with actionable suggestions for invalid configurations

- **Database Operations**: New hot pool database operations

  - Added HotPoolOperations for hot pool CRUD operations with Supabase
  - Implemented batch upsert operations for efficient hot pool storage
  - Enhanced database schema support for hot pool data structures
  - Added hot pool timestamp tracking and update management

### Added

- **Hot-Sync Command Infrastructure**: New command structure for hot pool operations

  - Added hot_sync module with fetchers, manager, and command integration
  - Implemented hot pool fetcher factory for creating DEX-specific fetchers
  - Added hot pool scanning with configurable block ranges and activity thresholds
  - Enhanced logging and progress tracking for hot pool operations

- **Pump.fun RPC Integration**: Direct Solana RPC integration for pump.fun analysis

  - Added rate-limited RPC client with retry logic and timeout handling
  - Implemented block transaction fetching with full transaction details
  - Added pump.fun program detection and activity analysis
  - Enhanced RPC error handling with rate limiting and retry mechanisms

- **Hot Pool Scoring System**: Advanced activity-based pool scoring

  - Implemented hotness score calculation based on multiple activity metrics
  - Added recency bonus for recent pool activity
  - Enhanced pool ranking and sorting by hotness score
  - Activity aggregation and deduplication across multiple blocks

### Improved

- **Pool Type System**: Enhanced pool type classification and support

  - Extended PoolType enum with pump.fun pool types
  - Enhanced pool type to DEX mapping with pump.fun support
  - Improved pool type string conversion and serialization
  - Better pool type validation and error handling

- **Sync Configuration**: Enhanced sync configuration with better validation

  - Added pre-sync configuration validation to catch errors early
  - Improved DEX filter validation with comprehensive error messages
  - Enhanced pool type filter validation with detailed help text
  - Better separation between sync (HTTP API) and hot-sync (RPC) operations

- **Statistics Tracking**: Updated statistics for hot pool integration

  - Modified sync statistics to exclude pump.fun (handled via hot-sync)
  - Enhanced pool counting and tracking for supported DEX types
  - Better separation between regular sync and hot-sync statistics
  - Improved pool type statistics aggregation

### Technical

- **Architecture**: New hot-sync architecture with modular design

  - Added hot_sync module with fetchers, manager, and models
  - Implemented async trait-based hot pool fetcher system
  - Enhanced modular design with separation of concerns between sync types
  - Added comprehensive error handling and logging throughout hot-sync system

- **RPC Integration**: Direct Solana RPC integration for on-chain analysis

  - Added RPC client with rate limiting and retry mechanisms
  - Implemented block scanning and transaction analysis
  - Enhanced RPC request handling with proper error recovery
  - Added configurable RPC endpoints and timeout management

- **Data Models**: Enhanced data models for hot pool support

  - Added hot_pools.rs with HotPool and HotSyncResult structures
  - Enhanced core.rs with pump.fun pool type support
  - Improved model serialization and database compatibility
  - Better data validation and type safety for hot pool operations

### Fixed

- **Pool Sync Manager**: Improved sync manager with better validation

  - Fixed DEX validation to provide clear error messages for unsupported DEXs
  - Enhanced pool type validation with comprehensive available options
  - Better error handling for invalid sync configurations
  - Improved user experience with actionable error messages and suggestions

## [0.1.29]

### Enhanced

- **Configuration Migration System**: Improved configuration migration with enhanced user feedback

  - Enhanced migration messages to differentiate between upgrades and downgrades
  - Added contextual error handling with detailed failure messages
  - Improved user experience with clear success messages for both upgrade and downgrade scenarios
  - Better preservation of user settings during configuration transitions

- **Pool Type Filtering**: Advanced pool type filtering system for targeted synchronization

  - Added `--pool-type` parameter for filtering specific pool types during sync
  - Comprehensive pool type support for all DEX implementations (Meteora, Raydium, Orca)
  - Enhanced filtering logic with type-specific matching and validation
  - Improved sync efficiency by allowing focused pool type synchronization

- **Pagination Control**: New pagination limits for testing and resource management

  - Added `--max-pages` parameter to limit API pagination for testing scenarios
  - Implemented pagination controls across all DEX fetchers (Meteora, Raydium, Orca)
  - Enhanced testing capabilities with controlled data fetching
  - Better resource management for development and testing environments

- **Meteora Multi-Token Stable Pools**: New support for Meteora multi-token stable pools

  - Added complete API integration for multi-token stable pools via Universal Search API
  - Enhanced pool type system with MeteoraMultiTokenStable type support
  - Comprehensive data model with stable pool specific fields (amp_factor, virtual_price)
  - Improved pool discovery with dedicated fetching and conversion logic

### Added

- **Pool Type Filter System**: Comprehensive pool type filtering capabilities

  - Support for all Meteora pool types: dlmm, damm-v1, damm-v2, stake2earn
  - Support for all Raydium pool types: amm-v4, clmm, cpmm
  - Support for Orca pool types: whirlpool, orca
  - Enhanced help documentation with detailed pool type explanations and examples

- **Multi-Token Stable Pool Support**: Complete implementation for Meteora stable pools

  - New data structures: MeteoraMultiTokenStableResponse, MeteoraMultiTokenStableHit, MeteoraMultiTokenStablePool
  - Dedicated API fetching with pagination support
  - Stable pool specific conversion logic with multi-token handling
  - Enhanced pool statistics and tracking for stable pool types

- **Pagination Management**: Advanced API pagination control system

  - Configurable page limits for all DEX API calls
  - Testing-focused pagination with controlled data fetching
  - Resource-aware pagination management
  - Enhanced logging for pagination status and limits

### Improved

- **Configuration Help Documentation**: Enhanced configuration command documentation

  - Updated help text to reflect automatic configuration generation (deprecated manual --generate)
  - Added new Meteora API endpoint documentation (DAMM v1, DAMM v2, Multi-Token Stable)
  - Improved configuration process description with automatic migration details
  - Better explanation of configuration validation and version compatibility

- **Sync Help Documentation**: Comprehensive sync command documentation updates

  - Added detailed pool type filtering examples and use cases
  - Enhanced pagination control documentation with practical examples
  - Improved DEX-specific pool type listings and descriptions
  - Better sync workflow explanation with filtering and pagination options

- **Memecoin Pool Processing**: Enhanced memecoin pool validation and processing

  - Improved validation logic for memecoin pools with better error handling
  - Enhanced token mint validation with detailed logging
  - Better pool type classification for memecoin pools
  - Improved pool data extraction and conversion reliability

### Technical

- **Data Models**: Enhanced pool type and filtering architecture

  - Extended SyncConfig with pool_type_filter and max_pages parameters
  - Enhanced FilterCriteria with pool type filtering capabilities
  - Improved pool type matching logic with comprehensive type support
  - Better data validation and error handling across all pool types

- **API Integration**: Enhanced DEX API integration with advanced controls

  - Implemented pagination limits across all DEX fetchers
  - Enhanced API response handling with better error recovery
  - Improved rate limiting and resource management
  - Better API endpoint management with configuration flexibility

- **Pool Conversion**: Improved pool data conversion and validation

  - Enhanced conversion logic for multi-token stable pools
  - Better validation and error handling for all pool types
  - Improved pool data extraction with comprehensive field mapping
  - Enhanced pool type identification and classification

### Fixed

- **Configuration Migration**: Resolved configuration migration edge cases

  - Fixed error context handling during configuration save operations
  - Improved migration success/failure messaging
  - Better handling of downgrade scenarios with appropriate user feedback
  - Enhanced error recovery during configuration transitions

## [0.1.25]

### Enhanced

- **Pool Filtering System**: Major enhancement to pool filtering with per-type/subtype support

  - Enhanced Meteora pool filtering to treat each subtype independently (DLMM, DAMM v1, DAMM v2, Launch, Memecoin v1, Memecoin v2, Stake2Earn, Multi-Token Stable)
  - Enhanced Raydium pool filtering to treat each pool type independently (AMM V4, CLMM, CPMM)
  - Changed `--max-pools-per-dex` to `--max-pools-per-type` for more granular control
  - Each pool type/subtype now gets the full allocation instead of sharing limits

- **Raydium CPMM Integration**: Improved CPMM pool discovery with pagination

  - Fixed CPMM pool fetching to properly handle paginated API responses
  - Enhanced CPMM pool data extraction with program ID filtering
  - Added comprehensive logging for CPMM discovery across multiple pages
  - Implemented safety checks to prevent infinite API loops (100 page limit)

- **Resource Monitoring**: New comprehensive resource monitoring system

  - Added ResourceMonitor for tracking CPU, memory, and network usage during sync operations
  - Detailed performance analysis with peak and average resource usage tracking
  - Memory trend analysis and CPU spike detection
  - Resource efficiency scoring and detailed performance reporting

### Added

- **Resource Monitor Module**: New system resource tracking capabilities

  - `utils/resource_monitor.rs` with comprehensive system metrics collection
  - ResourceSnapshot and ResourceStats structures for detailed monitoring
  - Real-time resource usage tracking during pool synchronization
  - Performance efficiency analysis and trend detection

- **Pool Type Statistics**: Enhanced statistics tracking for all pool types

  - Added separate counters for all Meteora subtypes (Memecoin v1/v2, Stake2Earn, Multi-Token Stable, Launch)
  - Enhanced pool statistics aggregation with comprehensive type breakdown
  - Improved statistics reporting with detailed per-type filtering results
  - Better pool type identification and categorization

### Improved

- **Pool Discovery Performance**: Enhanced discovery process with better resource management

  - Added automatic resource monitoring during sync operations
  - Enhanced progress tracking with detailed performance metrics
  - Better API call management with improved pagination handling
  - Enhanced error handling and recovery for large pool datasets

- **Filtering Logic**: More intelligent and flexible pool filtering

  - Independent allocation for each pool type/subtype instead of shared limits
  - Priority-based sorting by liquidity and volume for each type
  - Enhanced filtering reports with detailed per-type statistics
  - Better pool selection algorithm for optimal coverage

- **System Integration**: Enhanced system monitoring and reporting

  - Integrated resource monitoring into pool sync workflow
  - Comprehensive performance reporting with efficiency scoring
  - Better system resource utilization tracking
  - Enhanced logging with resource usage summaries

### Technical

- **Architecture**: Enhanced pool filtering and monitoring architecture

  - Refactored FilterCriteria to use max_pools_per_type instead of max_pools_per_dex
  - Enhanced PoolFilter with type-specific filtering methods
  - Added ResourceMonitor integration to PoolSyncManager
  - Improved pool type handling with comprehensive subtype support

- **Performance**: Optimized resource usage and monitoring

  - Added background resource monitoring with configurable sampling intervals
  - Enhanced memory and CPU usage tracking for performance optimization
  - Better API pagination handling to prevent resource exhaustion
  - Improved pool processing efficiency with type-aware operations

- **Data Models**: Enhanced pool type and statistics tracking

  - Extended PoolType enum with comprehensive Meteora subtype support
  - Enhanced SyncStats with detailed per-type counters
  - Improved pool statistics aggregation and reporting
  - Better pool type identification and validation

### Fixed

- **Raydium CPMM**: Resolved pagination issues in CPMM pool discovery

  - Fixed infinite loop potential in CPMM API pagination
  - Corrected pool data extraction to properly handle paginated responses
  - Enhanced error handling for CPMM API calls
  - Improved CPMM pool counting and statistics tracking

## [0.1.21]

### Enhanced

- **Supabase Client Architecture**: Major refactoring into modular structure for improved maintainability

  - Split monolithic `supabase_client.rs` into separate client and token modules
  - Created dedicated `client/` directory with specialized modules
  - Introduced `client/mod.rs` for module organization and exports
  - Added `client/token.rs` for token-specific operations and batch processing

- **Token Operations**: Enhanced token management with dedicated module

  - Comprehensive token batch upsert functionality with progress tracking
  - Enhanced error handling and validation for token operations
  - Improved progress bars with ETA calculations for token processing
  - Better batch processing with configurable batch sizes and delays

- **Code Organization**: Improved codebase structure and maintainability
  - Modular architecture for better separation of concerns
  - Enhanced documentation with detailed module descriptions
  - Improved code reusability and testability
  - Better dependency management and imports

### Added

- **Token Module**: New dedicated token operations module

  - `client/token.rs` with comprehensive token CRUD operations
  - Batch upsert functionality with progress tracking and ETA calculations
  - Dry-run mode support for token operations testing
  - Enhanced error handling and logging for token processing

- **Client Module Structure**: Organized client architecture

  - `client/mod.rs` for module exports and organization
  - Separated token operations from main client functionality
  - Improved module documentation and flow descriptions
  - Better dependency management between modules

### Improved

- **Code Maintainability**: Enhanced codebase organization

  - Reduced file size and complexity of main client module
  - Better separation of concerns between different operations
  - Improved code readability and navigation
  - Enhanced module documentation and inline comments

- **Token Processing**: Enhanced token synchronization capabilities
  - Better progress tracking with detailed batch information
  - Improved error handling for failed token operations
  - Enhanced logging with comprehensive operation details
  - Better performance metrics and timing information

### Technical

- **Architecture**: Modular client structure implementation

  - Separated token operations into dedicated module
  - Maintained backward compatibility with existing API
  - Improved code organization and dependency management
  - Enhanced module exports and public interface

- **Performance**: Optimized token processing operations
  - Efficient batch processing with progress tracking
  - Better memory management for large token datasets
  - Enhanced error recovery and continuation logic
  - Improved API call efficiency and timing

## [0.1.15]

### Enhanced

- **Raydium Pool Support**: Comprehensive Raydium pool type integration

  - Added support for Raydium CLMM (Concentrated Liquidity Market Maker) pools
  - Enhanced pool type tracking with separate AMM V4 and CLMM statistics
  - Improved pool discovery with dual API endpoint integration
  - Added CLMM-specific fields: tick_spacing, protocol_fee_rate, fund_fee_rate

- **Pool Type Architecture**: Advanced pool type management system

  - Introduced PoolType enum for distinguishing pool implementations
  - Enhanced statistics tracking with type-specific counters
  - Improved pool filtering and categorization
  - Better pool type identification and validation

- **Token Management**: Streamlined token operations
  - Simplified token command with direct Jupiter API integration
  - Removed dependency on PoolSyncManager for token operations
  - Enhanced token fetching with dedicated HTTP client
  - Improved error handling and timeout management

### Added

- **CLMM Pool Support**: New Raydium CLMM API integration

  - ClmmResponse, ClmmPool, and related data structures
  - CLMM-specific configuration fields in ApiConfig
  - Tick spacing and fee rate tracking for CLMM pools
  - Comprehensive CLMM pool data parsing and validation

- **Pool Type System**: Enhanced pool categorization

  - PoolType enum with RaydiumAmmV4, RaydiumClmm, RaydiumCpmm, Orca, Meteora
  - Type-specific pool creation methods
  - DEX name and type identifier methods
  - Pool type-aware statistics aggregation

- **Discovery Summary**: Enhanced pool discovery reporting
  - DiscoverySummary structure for original vs filtered statistics
  - Filter percentage calculations and reporting
  - Comprehensive discovery metrics with type breakdown
  - Improved pool discovery logging and analytics

### Improved

- **Statistics Reporting**: Enhanced pool statistics with type breakdown

  - Separate tracking for Raydium AMM V4 and CLMM pools
  - Total Raydium pools calculation across all types
  - Type-specific pool counting and aggregation
  - Improved statistics display with detailed breakdowns

- **API Integration**: Enhanced Raydium API handling

  - Dual API endpoint support (V2 AMM and CLMM)
  - Improved error handling for multiple API calls
  - Better API response parsing and validation
  - Enhanced timeout and retry logic

- **Pool Synchronization**: Streamlined sync process
  - Removed token cache dependency from pool sync
  - Simplified pool enrichment workflow
  - Enhanced pool filtering and deduplication
  - Improved sync performance and reliability

### Technical

- **Data Models**: Enhanced pool data structures

  - Added optional CLMM-specific fields to PoolInfo
  - Improved pool type tracking and validation
  - Enhanced pool creation methods with type support
  - Better data model flexibility and extensibility

- **Configuration**: Enhanced API configuration

  - Added raydium_clmm endpoint configuration
  - Prepared raydium_cpmm endpoint for future use
  - Improved API endpoint management
  - Better configuration validation and defaults

- **Performance**: Optimized pool discovery and processing
  - Reduced memory usage by removing token cache from sync
  - Improved API call efficiency with proper delays
  - Enhanced pool processing with type-aware operations
  - Better resource management and cleanup

### Removed

- **Cache Dependencies**: Simplified architecture
  - Removed CacheManager dependency from PoolSyncManager
  - Eliminated token cache loading from pool sync process
  - Removed token enrichment from pool synchronization
  - Simplified pool sync workflow and dependencies

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
