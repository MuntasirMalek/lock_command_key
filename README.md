# Lock Command Key (Sticky Keys Toggle for macOS)

A simple script to toggle macOS Sticky Keys on/off with a keyboard shortcut. Perfect for users who need quick access to Sticky Keys without navigating through System Settings.

## What it does

- Toggles Sticky Keys ON/OFF
- Plays audio feedback:
  - 🔔 **Ping** - Script triggered
  - 🎵 **Hero** - Sticky Keys ON
  - 🔇 **Basso** - Sticky Keys OFF

## Setup

### 1. Copy the script

```bash
cp toggle_sticky.sh ~/toggle_sticky.sh
chmod +x ~/toggle_sticky.sh
```

### 2. Install Karabiner-Elements

```bash
brew install --cask karabiner-elements
```

### 3. Add Karabiner rule

Add this to your `~/.config/karabiner/karabiner.json` inside the `"rules": [...]` array:

```json
{
  "description": "Cmd+S -> Toggle Sticky Keys (Finder Only)",
  "manipulators": [
    {
      "type": "basic",
      "from": {
        "key_code": "s",
        "modifiers": {
          "mandatory": ["left_command"]
        }
      },
      "to": [
        {
          "shell_command": "~/toggle_sticky.sh"
        }
      ],
      "conditions": [
        {
          "type": "frontmost_application_if",
          "bundle_identifiers": ["^com\\.apple\\.finder$"]
        }
      ]
    }
  ]
}
```

### 4. Grant Permissions

In **System Settings → Privacy & Security**:
- **Accessibility**: Add Karabiner-Elements
- **Full Disk Access**: Add Karabiner-Elements

## Usage

Press `Cmd+S` in Finder to toggle Sticky Keys. Listen for the sound to confirm the state change.

## Customization

- Edit the script to change the username path if needed
- Modify the Karabiner rule to use a different shortcut or work in other apps
- Change the sound files to your preference

## License

MIT
