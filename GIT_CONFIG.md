# Git Configuration for 30-days-devops-challenge (SSH Authentication)

This guide connects a local Linux project to the GitHub account **`sandeeptecharch-dev`** using a dedicated SSH key. Once configured, `git push` and `git pull` won't ask for your GitHub username or password.

> **Scope:** Git author name/email and the SSH remote are set for **this repository only**. The SSH alias is available on your machine, but other repositories won't use it unless their remote URLs reference that alias.

## 1. Check Git is installed

```bash
git --version
```

If needed on Ubuntu/Debian:

```bash
sudo apt update
sudo apt install -y git openssh-client
```

## 2. Create a repository on GitHub

1. Sign in to https://github.com as **`sandeeptecharch-dev`**.
2. Open https://github.com/new.
3. Enter the repository name **`30-days-devops-challenge`**.
4. Select **Public** or **Private**.
5. Click **Create repository**.
6. If your local directory already contains files, leave **Add a README**, **.gitignore**, and **license** unchecked to avoid an unnecessary initial history conflict.

## 3. Open your local project directory

If the directory already exists:

```bash
cd ~/30Daychallenge/30-days-devops-challenge
```

Otherwise create it:

```bash
mkdir -p ~/30Daychallenge/30-days-devops-challenge
cd ~/30Daychallenge/30-days-devops-challenge
```

Initialize Git **only if this directory is not already a Git repository**:

```bash
git init
```

## 4. Configure Git identity for this project only

Run these commands **inside the project folder**:

```bash
git config --local user.name "sandeeptecharch-dev"
git config --local user.email "YOUR_GITHUB_EMAIL"
```

Replace `YOUR_GITHUB_EMAIL` with your verified GitHub email or GitHub-provided `noreply` email. To check:

```bash
git config --local --get user.name
git config --local --get user.email
```

**Note:** This controls the name and email attached to commits; it **does not authenticate** GitHub pushes.

## 5. Generate a dedicated SSH key

First ensure the SSH directory exists:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```

Check if your intended key already exists before generating another:

```bash
ls -l ~/.ssh/id_ed25519_sandeeptecharch*
```

If no such key exists, generate one:

```bash
ssh-keygen -t ed25519 -C "sandeeptecharch-dev" -f ~/.ssh/id_ed25519_sandeeptecharch
```

Choose a passphrase for extra security (recommended). This creates:

- `~/.ssh/id_ed25519_sandeeptecharch` — **private key**; never share or commit this file.
- `~/.ssh/id_ed25519_sandeeptecharch.pub` — **public key**; safe to add to GitHub.

## 6. Add the public key to GitHub

Display and copy the **entire** public key:

```bash
cat ~/.ssh/id_ed25519_sandeeptecharch.pub
```

1. Sign in as **`sandeeptecharch-dev`**.
2. Open https://github.com/settings/keys.
3. Click **New SSH key**.
4. Title: `DevOps 30 Days - Linux`.
5. Key type: **Authentication Key**.
6. Paste the public key and click **Add SSH key**.

## 7. Configure an SSH alias for this GitHub account

Open the SSH config:

```bash
nano ~/.ssh/config
```

Add the following block **without deleting any existing configuration**:

```sshconfig
Host github-sandeep
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_sandeeptecharch
    IdentitiesOnly yes
```

Save, then set file permissions:

```bash
chmod 600 ~/.ssh/id_ed25519_sandeeptecharch
chmod 600 ~/.ssh/config
```

## 8. Test SSH login

```bash
ssh -T git@github-sandeep
```

On first connection, SSH may show a host-key fingerprint. **Verify it** against GitHub's official published fingerprints before typing `yes`: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints

Expected result:

```text
Hi sandeeptecharch-dev! You've successfully authenticated, but GitHub does not provide shell access.
```

This authentication test may exit with status 1 even when successful, because GitHub does not offer shell access.

### Optional: Remember an SSH key passphrase for the session

If you set a passphrase, use an SSH agent so you don't need to re-enter it repeatedly:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_sandeeptecharch
```

## 9. Set the SSH remote for this project only

From inside the project directory:

```bash
cd ~/30Daychallenge/30-days-devops-challenge
```

If `origin` does not exist yet:

```bash
git remote add origin git@github-sandeep:sandeeptecharch-dev/30-days-devops-challenge.git
```

If `origin` already exists (for example, it uses HTTPS), **change it instead**:

```bash
git remote set-url origin git@github-sandeep:sandeeptecharch-dev/30-days-devops-challenge.git
```

Verify:

```bash
git remote -v
```

Expected:

```text
origin  git@github-sandeep:sandeeptecharch-dev/30-days-devops-challenge.git (fetch)
origin  git@github-sandeep:sandeeptecharch-dev/30-days-devops-challenge.git (push)
```

## Fix: Git still asks for `Username for 'https://github.com'`

If `git push` prompts for a GitHub username, Git is still using an HTTPS remote. Your SSH key does not authenticate an HTTPS URL.

**1. Cancel the prompt:** Press `Ctrl+C`.

**2. Go to the real project folder:**

```bash
cd ~/30Daychallenge/30-days-devops-challenge
```

**3. Check the remote:**

```bash
git remote -v
```

If you see `https://github.com/...`, change the existing `origin` to the dedicated SSH alias:

```bash
git remote set-url origin git@github-sandeep:sandeeptecharch-dev/30-days-devops-challenge.git
```

**4. Test your SSH key:**

```bash
ssh -T git@github-sandeep
```

Success looks like:

```text
Hi sandeeptecharch-dev! You've successfully authenticated, but GitHub does not provide shell access.
```

If you see `Could not resolve hostname github-sandeep`, check that `~/.ssh/config` contains the `Host github-sandeep` block in step 7. If you see `Permission denied (publickey)`, check that you added the matching `.pub` key to the correct GitHub account.

**5. Verify the remote is now SSH:**

```bash
git remote -v
```

Expected:

```text
origin  git@github-sandeep:sandeeptecharch-dev/30-days-devops-challenge.git (fetch)
origin  git@github-sandeep:sandeeptecharch-dev/30-days-devops-challenge.git (push)
```

**6. Push your existing commit (no need to commit again):**

```bash
git push -u origin main
```

This changes the remote only for **this repository**. Other repositories remain unchanged.

---

## 10. Commit and push the project

For a new repository with files that haven't been committed:

```bash
git add .
git commit -m "Initial commit - Day 1"
git branch -M main
git push -u origin main
```

If your initial commit already succeeded, **do not repeat it**. Simply run:

```bash
git push -u origin main
```

## 11. Everyday workflow

```bash
git status
git add .
git commit -m "Day 2 - Docker practice"
git push
```

After SSH is configured, pushing and pulling use your key instead of requesting a GitHub username and password. A key passphrase may still be requested unless your SSH agent has loaded the key.

## 12. Quick verification and troubleshooting

| Issue | What to check |
|---|---|
| `Username for 'https://github.com'` still appears | Run `git remote -v`. The remote must use `git@github-sandeep:...`, **not** `https://...`. |
| `Permission denied (publickey)` | Check the public key in GitHub Settings, the SSH config, and `ssh -T git@github-sandeep`. |
| `Repository not found` | Confirm the repository exists under `sandeeptecharch-dev` and your account has access. |
| `remote origin already exists` | Use `git remote set-url origin ...` instead of `git remote add origin ...`. |
| SSH asks for a passphrase | Run `ssh-add ~/.ssh/id_ed25519_sandeeptecharch` with a running SSH agent. |
| Push is rejected as non-fast-forward | Check whether the GitHub repo was initialized with files. Fetch and reconcile histories; don't force-push blindly. |

### Local vs global configuration

```bash
# Changes ONLY this Git repository
git config --local user.name "sandeeptecharch-dev"

# Avoid for this use case: changes your default identity across repositories
git config --global user.name "sandeeptecharch-dev"
```

**Security reminders:** Never upload your private SSH key or tokens to GitHub. Keep key files outside your repository, under `~/.ssh/`.
