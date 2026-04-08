# Lock Command Key

Toggle macOS Sticky Keys with a keyboard shortcut. No more digging through settings!

## 🔊 Sounds

| Sound | Meaning |
|-------|---------|
| Ping | Shortcut pressed |
| Hero | Sticky Keys ON |
| Basso | Sticky Keys OFF |

---

## 📦 Quick Install

Open **Terminal** and paste:

```
curl -sL https://raw.githubusercontent.com/MuntasirMalek/lock_command_key/main/lock_command_key.sh -o ~/lock_command_key.sh && chmod +x ~/lock_command_key.sh
```

Done! Script is ready at `~/lock_command_key.sh`

### Step 2: Install Karabiner-Elements

1. Download from [karabiner-elements.pqrs.org](https://karabiner-elements.pqrs.org/)
2. Install and open it
3. Follow the setup prompts

### Step 3: Add the keyboard shortcut

1. Open Karabiner-Elements
2. Go to **Complex Modifications** → **Add rule** → **Import more rules from the Internet**
3. Or manually add this rule:
   - Open `~/.config/karabiner/karabiner.json`
   - Find `"rules": []` and add:

```json
{
  "description": "Cmd+S -> Toggle Sticky Keys (Finder Only)",
  "manipulators": [
    {
      "type": "basic",
      "from": {
        "key_code": "s",
        "modifiers": { "mandatory": ["left_command"] }
      },
      "to": [{ "shell_command": "~/lock_command_key.sh" }],
      "conditions": [{
        "type": "frontmost_application_if",
        "bundle_identifiers": ["^com\\.apple\\.finder$"]
      }]
    }
  ]
}
```

### Step 4: Give permissions

1. Open **System Settings**
2. Go to **Privacy & Security**
3. Add Karabiner-Elements to:
   - ✅ Accessibility
   - ✅ Full Disk Access

---

## 🎮 How to Use

1. Open **Finder**
2. Press **Cmd + S**
3. Listen for the sound!

---

## License

MIT
