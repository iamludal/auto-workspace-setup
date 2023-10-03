# Automated Workspace Setup 👨🏻‍💻

## 📜 Requirements

- [Python](https://www.python.org/downloads/)
- [Homebrew](https://brew.sh/) (macOS only)

## ⚙️ Installing Ansible

```bash
pip3 install ansible
export PATH=~/.local/bin:$PATH
```

## ℹ️ Usage

```bash
ansible-playbook playbook.yaml
```

## ✅ Post-setup

- [Add SSH key to GitHub](https://github.com/settings/keys)
- [Create GPG key](https://www.redhat.com/sysadmin/creating-gpg-keypairs)

## 🍎 MacOS

```bash
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4; killall Dock
```
