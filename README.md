# uv-devcontainer-template

A minimal dev container template for running GitHub Copilot and GitHub Copilot Chat safely inside a container. This lets you try Copilot features without installing them directly on your host machine.

---

## ✅ Quick start

1. Prerequisites
   - Docker (Docker Desktop) running on macOS
   - Visual Studio Code with the **Dev Containers** (or **Remote - Containers**) extension installed
   - A GitHub account (Copilot / Copilot Chat requires signing in and may require a Copilot subscription)

2. Clone the repo

```bash
git clone https://github.com/epthewizard/uv-devcontainer-template.git
cd uv-devcontainer-template
```

3. Open in VS Code and reopen in container
   - Open the folder in VS Code
   - Click the green "Reopen in Container" button (bottom-left) or run **Command Palette → Dev Containers: Reopen in Container**

4. Build & initialization
   - The container image builds from `.devcontainer/Dockerfile` and the `postCreateCommand` runs `bootstrap.sh` automatically.
   - `bootstrap.sh` initializes a small `uv` project and installs dev tooling (`uv add ruff --dev`) and runs `uv sync`.

5. Use Copilot and Copilot Chat
   - The devcontainer enables the following extensions by default: `GitHub.copilot` and `GitHub.copilot-chat`.
   - When prompted, sign in to GitHub from VS Code (look for the account notification or run **Command Palette → GitHub: Sign in**).
   - If Copilot Chat needs special permissions or a subscription, follow the sign-in flow and accept the prompts.

---

## 🔧 Common commands

- Rebuild container (after changing Dockerfile or extensions): **Command Palette → Dev Containers: Rebuild Container**
- Re-run the bootstrap script (inside the container):

```bash
bash bootstrap.sh
```

- Run `uv` commands inside container (example):

```bash
uv init       # (if needed)
uv add <pkg>  # add tooling
uv sync       # sync environment
```

---

## ⚠️ Troubleshooting

- Container build hangs or fails:
  - Ensure Docker Desktop is running and has sufficient resources (CPU / RAM).
  - Check the build logs in the **Dev Containers** output panel.

- Copilot / Copilot Chat isn't working:
  - Confirm you're signed in to GitHub in the *container* instance of VS Code (account prompts may show in the remote window).
  - Open **Output → GitHub Copilot** or **Help → Toggle Developer Tools** for error messages.
  - Copilot may require an active subscription or trial for advanced features.

- Network issues during `curl` or installs:
  - Some CI networks or VPNs block outbound traffic. Try disabling VPN or verify network connectivity.

---

## 🔐 Security & privacy

- The Copilot extensions send data to GitHub's service for completions and chat. Do not open or send secrets you don't want shared.
- This devcontainer helps isolate the tooling from your host, but you still mount your project files into the container by design.

---

## 📚 Further reading

- VS Code Dev Containers docs: Search for "Dev Containers" in the VS Code docs
- GitHub Copilot docs: Sign-in and subscription details appear in the GitHub Copilot docs and the VS Code extension description

---

## Contributing

PRs welcome. Keep changes focused on useful DX improvements.

---

## 💬 Copilot Chat walkthrough

1. Open the **Copilot Chat** panel: press F1 (Command Palette) and run **Copilot: Open Chat**, or click the Copilot Chat icon in the Activity Bar.
2. If prompted to sign in, sign in to your GitHub account from the *remote* VS Code window (look for the account notification in the bottom-left or run **Command Palette → GitHub: Sign in**).
3. Try a sample prompt, for example:

```text
Help me write a unit test for a Python function that reverses a string.
```

4. Review the response in the chat pane and copy the suggested code into a new file to run and iterate.
5. If you don't see responses, check **Output → GitHub Copilot** and **Help → Toggle Developer Tools** for errors. Ensure the Copilot extension is enabled in the remote window.

---

If you'd like, I can also add an automated troubleshooting script to collect Copilot logs and environment info (helpful if sign-in or extension issues appear). Say 'yes' and I'll add it. ✨
