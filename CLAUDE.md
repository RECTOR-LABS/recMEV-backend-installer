# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with the recMEV backend installer repository.

## Repository Purpose

The recMEV backend installer repository serves as the distribution point for the recMEV backend services. It contains installation scripts, pre-compiled binaries, and deployment automation tools for VPS and server environments.

### Key Components
- **Installation Scripts**: Server deployment automation
- **Binary Distribution**: Pre-compiled Linux and macOS binaries
- **Version Management**: Version tracking and changelog management
- **Service Management**: Systemd service configuration

### Core Features
- **VPS Deployment**: Automated server deployment with monitoring
- **Service Management**: Systemd integration for service management
- **Version Tracking**: Semantic versioning with changelog
- **Resource Monitoring**: System resource tracking and statistics

## Repository Structure

### Essential Files
- `install.sh` - Main installation script for VPS deployment
- `recmev-backend-v{version}-linux` - Linux binary (x86_64)
- `recmev-backend-v{version}-mac` - macOS binary (ARM64)
- `recmev-backend-version.txt` - Current version information
- `recmev-backend-CHANGELOG.md` - Version history and changes
- `README.md` - Installation and deployment instructions
- `LICENSE` - MIT license

### Binary Naming Convention
```
recmev-backend-v{MAJOR}.{MINOR}.{PATCH}-{PLATFORM}
```
Examples:
- `recmev-backend-v0.4.2-linux`
- `recmev-backend-v0.4.2-mac`

## Development Guidelines

### Binary Updates
When new binaries are built from the backend application:
1. Binaries are automatically copied from `recMEV-backend/target/` during build
2. Version numbers are extracted from `recMEV-backend/Cargo.toml`
3. File naming follows the established convention

### VPS Deployment
- Support Ubuntu, CentOS, and Debian distributions
- Implement proper service management with systemd
- Include monitoring and health checks
- Support automatic restarts and recovery

### Service Configuration
- Create systemd service files
- Implement proper logging and log rotation
- Set up environment variable management
- Configure resource limits and monitoring

## Installation Process

### VPS Installation
```bash
# Automated VPS installation
curl -sSL https://raw.githubusercontent.com/[repo]/recMEV-backend-installer/main/install.sh | bash

# Manual installation
wget https://raw.githubusercontent.com/[repo]/recMEV-backend-installer/main/install.sh
chmod +x install.sh
./install.sh
```

### Installation Script Logic
1. Detect operating system and architecture
2. Install system dependencies
3. Download and install backend binary
4. Configure systemd service
5. Set up logging and monitoring
6. Start and enable service

## Development Patterns

### Service Management
- Use systemd for service lifecycle management
- Implement proper service dependencies
- Configure automatic restarts on failure
- Set up service monitoring

### Configuration Management
- Use environment variables for configuration
- Support configuration file templates
- Implement configuration validation
- Support configuration updates

### Monitoring Integration
- Implement health check endpoints
- Set up log aggregation
- Monitor system resources
- Track service performance

## Deployment Architecture

### VPS Setup
- Install backend service as systemd service
- Configure automatic startup
- Set up log rotation
- Implement monitoring and alerting

### Service Configuration
```ini
[Unit]
Description=recMEV Backend Service
After=network.target

[Service]
Type=simple
User=recmev
ExecStart=/usr/local/bin/recmev-backend sync
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

### Environment Configuration
- Database connection strings
- API keys and credentials
- Resource limits and timeouts
- Logging configuration

## Testing Requirements

### Deployment Testing
```bash
# Test installation script
./install.sh

# Verify service installation
systemctl status recmev-backend
systemctl is-enabled recmev-backend
```

### Service Testing
```bash
# Test service commands
sudo systemctl start recmev-backend
sudo systemctl stop recmev-backend
sudo systemctl restart recmev-backend
sudo systemctl status recmev-backend
```

### Monitoring Testing
```bash
# Test monitoring endpoints
curl http://localhost:8080/health
curl http://localhost:8080/metrics
```

## Operational Guidelines

### Service Management
```bash
# Start service
sudo systemctl start recmev-backend

# Stop service
sudo systemctl stop recmev-backend

# Restart service
sudo systemctl restart recmev-backend

# Check service status
sudo systemctl status recmev-backend

# View logs
sudo journalctl -u recmev-backend -f
```

### Configuration Updates
1. Update configuration files
2. Validate configuration
3. Restart service
4. Monitor for issues

### Binary Updates
1. Download new binary
2. Stop service
3. Replace binary
4. Start service
5. Verify functionality

## Monitoring and Maintenance

### System Monitoring
- Monitor CPU and memory usage
- Track network bandwidth
- Monitor disk usage
- Track service uptime

### Log Management
- Implement log rotation
- Set up log aggregation
- Monitor for errors
- Track performance metrics

### Health Checks
- Implement health check endpoints
- Monitor service responsiveness
- Track database connectivity
- Monitor API integrations

## Security Considerations

### Service Security
- Run service with limited privileges
- Implement proper firewall rules
- Use secure communication protocols
- Regularly update dependencies

### Configuration Security
- Secure API key storage
- Use environment variables for secrets
- Implement proper file permissions
- Regular security audits

## Troubleshooting

### Common Issues
- Service startup failures
- Configuration errors
- Database connectivity issues
- Resource exhaustion

### Debugging
```bash
# Check service logs
sudo journalctl -u recmev-backend --since "1 hour ago"

# Check system resources
top -p $(pgrep recmev-backend)
systemctl show recmev-backend

# Test connectivity
recmev-backend test supabase
recmev-backend test api
```

## Backup and Recovery

### Data Backup
- Configuration files
- Service logs
- Performance metrics
- Error logs

### Recovery Procedures
- Service restart procedures
- Configuration rollback
- Binary rollback
- Data recovery

## Cross-References

For backend application details, see:
- Backend application: [../recMEV-backend/CLAUDE.md](../recMEV-backend/CLAUDE.md)
- Repository coordination: [../CLAUDE.md](../CLAUDE.md)