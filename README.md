<div align="center">
    <img src="https://raw.githubusercontent.com/zufall-labs/.github/main/profile/zufall-banner.png" alt="Helica" width="600" />
</div>

<h1 align="center">Nullpunkt</h1>

<div align="center">⏳ Nullpunkt is a language agnostic project template for Zufall Labs repositories</div>

<br />

<div align="center">
    <a href="https://github.com/zufall-labs/nullpunkt/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/license-AGPL--3.0-5ed9c7?style=for-the-badge" alt="AGPL-3.0 License">
    </a>
</div>

## Setting Up a New Project

1. Clone this template repository and give it your project name:
   ```bash
   git clone --recursive <project url>
   cd my-new-project
   ```

2. Set up the Quality Assurance Tooling with the project's **repository** name:
   ```bash
   make setup-hooks REPO_NAME=my-new-project
   ```

3. Verify your configuration:
   ```bash
   make show-config
   ```

4. You're all set! Go build something awesome!

### Troubleshooting

If you need to change the project name later:
```bash
make setup-hooks REPO_NAME=new-project-name
```

If you want to check your current configuration:
```bash
make show-config
```

Note: The `.zflbs` configuration file is git-ignored and local to your machine. If you're working with multiple developers, each developer should run the setup-hooks command on their local machine or fill in the `.zflbs.example` file with the appropriate information.

## Updating the QA Submodule

When new changes are pushed to Quality Assurance, you can update your local project to use the latest QA configurations and hooks:

1. Update the submodule to the latest version:
   ```bash
   git submodule update --remote qa
   ```

2. Re-run the setup to ensure all hooks are properly configured:
   ```bash
   make setup-hooks REPO_NAME=$(basename $(pwd))
   ```
   Note: `$(basename $(pwd))` automatically uses your current directory name as the repo name. 
   You can also explicitly specify the name: `make setup-hooks REPO_NAME=my-project`

3. Commit the submodule update:
   ```bash
   git add qa
   git commit -m "chore: update QA submodule to latest version"
   ```

### For Team Members

If you pull changes and notice that the QA submodule has been updated (you'll see a change in the qa/ directory), you should run:
```bash
git submodule update --init --recursive
make setup-hooks REPO_NAME=$(basename $(pwd))
```
