# azd-bicep-upgrade-repro

**Environment**
1. Windows WSL
1. VS Code

**Repro Steps**
1. Open as devcontainer
1. `azd auth login`
1. `azd provision`
    1. tested with `eastus2`
1. Upgrade AZD `curl -fsSL https://aka.ms/install-azd.sh | bash`
1. `azd provision`
