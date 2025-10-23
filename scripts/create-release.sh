#!/bin/bash

# Echo ATS BT Release Script
# This script creates a GitHub release with the signed executable

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}→${NC} $1"
}

# Function to increment version
increment_version() {
    local version=$1
    local part=${2:-patch}  # Default to patch

    # Remove 'v' prefix if present
    version=${version#v}

    IFS='.' read -r major minor patch <<< "$version"

    case $part in
        major)
            major=$((major + 1))
            minor=0
            patch=0
            ;;
        minor)
            minor=$((minor + 1))
            patch=0
            ;;
        patch)
            patch=$((patch + 1))
            ;;
        *)
            print_error "Invalid version part: $part (use major, minor, or patch)"
            exit 1
            ;;
    esac

    echo "$major.$minor.$patch"
}

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    print_error "GitHub CLI (gh) is not installed. Please install it first."
    echo "Visit: https://cli.github.com/manual/installation"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    print_error "Not authenticated with GitHub. Run 'gh auth login' first."
    exit 1
fi

print_status "GitHub CLI is installed and authenticated"

# Get current version from latest tag
CURRENT_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
print_info "Current version: $CURRENT_TAG"

# Parse arguments
VERSION=""
EXE_PATH=""
VERSION_PART="patch"
RELEASE_NOTES=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --version|-v)
            VERSION="$2"
            shift 2
            ;;
        --exe|-e)
            EXE_PATH="$2"
            shift 2
            ;;
        --major)
            VERSION_PART="major"
            shift
            ;;
        --minor)
            VERSION_PART="minor"
            shift
            ;;
        --patch)
            VERSION_PART="patch"
            shift
            ;;
        --notes|-n)
            RELEASE_NOTES="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --version, -v VERSION    Specify version (e.g., 1.0.5)"
            echo "  --exe, -e PATH          Path to the signed .exe file"
            echo "  --major                 Increment major version"
            echo "  --minor                 Increment minor version"
            echo "  --patch                 Increment patch version (default)"
            echo "  --notes, -n TEXT        Additional release notes"
            echo "  --help, -h              Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0 --exe /path/to/SetupEchoATS_BT_1.0.5.exe --minor"
            echo "  $0 -v 1.0.5 -e /path/to/SetupEchoATS_BT_1.0.5.exe"
            echo "  $0 --exe ./SetupEchoATS_BT_1.0.5.exe --notes 'Bug fixes and improvements'"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Determine version
if [ -z "$VERSION" ]; then
    # Auto-increment version
    CURRENT_VERSION=${CURRENT_TAG#v}
    VERSION=$(increment_version "$CURRENT_VERSION" "$VERSION_PART")
    print_info "Auto-incrementing version to: $VERSION"
else
    # Remove 'v' prefix if provided
    VERSION=${VERSION#v}
fi

VERSION_TAG="v$VERSION"

# Set default exe path if not provided
if [ -z "$EXE_PATH" ]; then
    # Try common locations
    DEFAULT_EXE="/mnt/c/Dev/bt_copro/DFUManager/publish/SetupEchoATS_BT_${VERSION}.exe"
    if [ -f "$DEFAULT_EXE" ]; then
        EXE_PATH="$DEFAULT_EXE"
        print_info "Using default exe path: $EXE_PATH"
    else
        print_error "No exe file specified and default not found: $DEFAULT_EXE"
        echo "Please specify the exe file with --exe option"
        exit 1
    fi
fi

# Verify exe file exists
if [ ! -f "$EXE_PATH" ]; then
    print_error "Exe file not found: $EXE_PATH"
    exit 1
fi

# Get file size
EXE_SIZE=$(du -h "$EXE_PATH" | cut -f1)
EXE_NAME=$(basename "$EXE_PATH")

print_status "Found exe file: $EXE_NAME ($EXE_SIZE)"

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    print_error "Not in a git repository"
    exit 1
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    print_info "Warning: You have uncommitted changes"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create releases directory if it doesn't exist
mkdir -p releases

# Copy exe to releases directory (temporary, for upload)
print_info "Copying executable to releases directory..."
cp "$EXE_PATH" "releases/$EXE_NAME"

# Create and push tag
print_info "Creating git tag $VERSION_TAG..."
git tag -a "$VERSION_TAG" -m "Release version $VERSION - Echo ATS BT Installer"

print_info "Pushing tag to GitHub..."
git push origin "$VERSION_TAG"

# Prepare release notes
if [ -z "$RELEASE_NOTES" ]; then
    RELEASE_NOTES="Bug fixes and performance improvements"
fi

FULL_NOTES="## Echo ATS BT Installer v$VERSION

Echo ATS BT is a Bluetooth configuration and firmware update utility for Echo ATS devices.

### What's New
$RELEASE_NOTES

### Installation
Download and run the signed Windows installer below.

### What's Included
- Echo ATS BT configuration utility
- Bluetooth firmware update capability
- Device management tools

### System Requirements
- Windows 10/11 (64-bit)
- Bluetooth 4.0 or later
- Administrator privileges for installation

### Download
The installer is digitally signed for security.

**File:** $EXE_NAME
**Size:** $EXE_SIZE"

# Create GitHub release
print_info "Creating GitHub release..."
gh release create "$VERSION_TAG" \
    "releases/$EXE_NAME" \
    --title "Echo ATS BT v$VERSION" \
    --notes "$FULL_NOTES"

print_status "Release created successfully!"

# Get the download URL
DOWNLOAD_URL=$(gh release view "$VERSION_TAG" --json assets --jq '.assets[0].url')
print_status "Download URL: $DOWNLOAD_URL"

# Clean up temporary file
rm "releases/$EXE_NAME"

# Save release info to a file
RELEASE_INFO_FILE="releases/latest-release.txt"
cat > "$RELEASE_INFO_FILE" << EOF
Version: $VERSION_TAG
Date: $(date)
Download URL: $DOWNLOAD_URL
File: $EXE_NAME
Size: $EXE_SIZE
EOF

print_status "Release information saved to $RELEASE_INFO_FILE"

echo ""
print_status "Release process complete!"
echo ""
echo "To use this in Mintlify documentation, add this MDX:"
echo ""
echo "<Card title=\"Download Echo ATS BT v$VERSION\" icon=\"download\" href=\"$DOWNLOAD_URL\">"
echo "  Download the latest installer ($EXE_SIZE)"
echo "</Card>"
echo ""
echo "Or use a simple button:"
echo ""
echo "[Download Echo ATS BT v$VERSION]($DOWNLOAD_URL)"