# Release Scripts

This directory contains automation scripts for managing Echo ATS BT releases.

## create-release.sh

This script automates the process of creating GitHub releases with signed Windows executables.

### Prerequisites

- GitHub CLI (`gh`) installed and authenticated
- Git repository with push access
- Signed `.exe` file ready for release

### Usage

```bash
# Basic usage with auto-increment (patch version)
./scripts/create-release.sh --exe /path/to/SetupEchoATS_BT_1.0.5.exe

# Increment minor version
./scripts/create-release.sh --exe /path/to/SetupEchoATS_BT_1.1.0.exe --minor

# Increment major version
./scripts/create-release.sh --exe /path/to/SetupEchoATS_BT_2.0.0.exe --major

# Specify exact version
./scripts/create-release.sh --version 1.0.5 --exe /path/to/SetupEchoATS_BT_1.0.5.exe

# Add custom release notes
./scripts/create-release.sh --exe /path/to/installer.exe --notes "Fixed Bluetooth connectivity issues"
```

### Options

- `--version, -v VERSION` - Specify exact version (e.g., 1.0.5)
- `--exe, -e PATH` - Path to the signed .exe file (required)
- `--major` - Increment major version (X.0.0)
- `--minor` - Increment minor version (x.X.0)
- `--patch` - Increment patch version (x.x.X) - default
- `--notes, -n TEXT` - Additional release notes
- `--help, -h` - Show help message

### What the Script Does

1. **Validates Prerequisites**: Checks for GitHub CLI and authentication
2. **Determines Version**: Auto-increments or uses specified version
3. **Creates Git Tag**: Tags the current commit with the version
4. **Pushes to GitHub**: Pushes the tag to the remote repository
5. **Creates Release**: Creates a GitHub release with:
   - The signed executable as a downloadable asset
   - Formatted release notes
   - Version information
6. **Provides Download URL**: Returns the permanent download URL
7. **Generates Mintlify Code**: Shows MDX code for documentation

### Example Output

```
✓ GitHub CLI is installed and authenticated
→ Current version: v1.0.4
→ Auto-incrementing version to: 1.0.5
✓ Found exe file: SetupEchoATS_BT_1.0.5.exe (66M)
→ Creating git tag v1.0.5...
→ Pushing tag to GitHub...
→ Creating GitHub release...
✓ Release created successfully!
✓ Download URL: https://github.com/parkermbrandon/mintlify-docs/releases/download/v1.0.5/SetupEchoATS_BT_1.0.5.exe
✓ Release information saved to releases/latest-release.txt

✓ Release process complete!

To use this in Mintlify documentation, add this MDX:

<Card title="Download Echo ATS BT v1.0.5" icon="download" href="https://github.com/parkermbrandon/mintlify-docs/releases/download/v1.0.5/SetupEchoATS_BT_1.0.5.exe">
  Download the latest installer (66M)
</Card>
```

### Updating Mintlify Documentation

After creating a release, update the download link in your Mintlify docs:

1. Open `ats-bt/firmware.mdx`
2. Update the version number and URL in the download cards
3. Commit and push the changes

### Default Executable Path

The script looks for executables in this default location:
```
/mnt/c/Dev/bt_copro/DFUManager/publish/SetupEchoATS_BT_{VERSION}.exe
```

If your executable is in this location with the correct naming convention, you don't need to specify the `--exe` parameter.

### Troubleshooting

**Error: "GitHub CLI (gh) is not installed"**
- Install GitHub CLI: https://cli.github.com/manual/installation

**Error: "Not authenticated with GitHub"**
- Run `gh auth login` and follow the prompts

**Error: "Exe file not found"**
- Verify the path to your signed executable
- Ensure the file exists and is accessible

**Error: "Not in a git repository"**
- Run the script from within your git repository

### Security Notes

- The executable files are NOT committed to the git repository
- They are uploaded directly to GitHub Releases
- The `.gitignore` file excludes the `releases/` directory
- Download URLs are permanent and preserve digital signatures
- No GitHub login is required to download the releases