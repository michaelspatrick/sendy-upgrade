# Sendy Auto-Upgrade Script

This is a shell script to automate the upgrade process for [Sendy](https://sendy.co), a self-hosted email newsletter application. The script:

- Backs up your current Sendy installation
- Downloads the latest version of Sendy using your license key
- Restores your `.htaccess` and `config.php`
- Replaces your current files with the new version
- Fixes permissions and cleans up temporary files

> ⚠️ **This script must be run as root and is intended for Linux-based servers.**

---

## 📁 File Structure

```
/path/to/sendy/
├── html/                # Your existing Sendy web directory
├── html.old/            # Backup (created by this script)
├── sendy.zip            # Temporary downloaded zip (removed after install)
├── sendy/               # Temporary extracted files (removed after install)
└── upgrade-sendy.sh     # This script
```

---

## 🛠️ Requirements

- Root access (for permission changes and file operations)
- `wget`, `unzip`, and standard Linux utilities (`cp`, `chown`, `chmod`)

---

## 🔧 Configuration

Before running the script, set the following variables at the top:

```sh
LICENSE="YOUR_SENDY_LICENSE_HERE"
SENDY_DIR="/path/to/sendy/installation/directory"
HTML_DIR="html"
OWNERSHIP="apache:apache"
```

- `LICENSE`: Your Sendy license key
- `SENDY_DIR`: Full path to your Sendy installation
- `HTML_DIR`: Subdirectory containing your actual Sendy web files
- `OWNERSHIP`: Linux file ownership (e.g., `www-data:www-data` or `apache:apache`)

---

## ▶️ Usage

1. Place the script in your server (e.g., `/usr/local/bin/upgrade-sendy.sh`)
2. Make it executable:  
   ```bash
   chmod +x upgrade-sendy.sh
   ```
3. Run as root or with `sudo`:  
   ```bash
   sudo ./upgrade-sendy.sh
   ```

---

## 📌 Notes

- Your current Sendy installation will be backed up as `html.old`
- The script attempts to preserve your configuration and custom `.htaccess`
- Always review the upgrade notes on [sendy.co](https://sendy.co) for changes before running

---

## 📄 License

This script is provided as-is with no warranty. Use at your own risk.
