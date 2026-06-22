# Package Oriented Salesforce Repo

This repository is structured for package oriented Salesforce development using 2GP unlocked packages.

## Bounded Contexts

- core
- catalog-management
- reservation-management
- billing-management

## Dependency Order

1. core
2. catalog-management
3. reservation-management
4. billing-management

## Local Folder Layout

- packages/core
- packages/catalog-management
- packages/reservation-management
- packages/billing-management

## Create Package Records In Dev Hub

Run these once in your Dev Hub org:

```bash
sf package create --name core --package-type Unlocked --path packages/core --target-dev-hub <DEV_HUB_ALIAS>
sf package create --name catalog-management --package-type Unlocked --path packages/catalog-management --target-dev-hub <DEV_HUB_ALIAS>
sf package create --name reservation-management --package-type Unlocked --path packages/reservation-management --target-dev-hub <DEV_HUB_ALIAS>
sf package create --name billing-management --package-type Unlocked --path packages/billing-management --target-dev-hub <DEV_HUB_ALIAS>
```

After creation, replace placeholder values in sfdx-project.json packageAliases with real package IDs.

## Create Package Versions

Create versions following dependency order:

```bash
sf package version create --package core --installation-key-bypass --wait 30 --target-dev-hub <DEV_HUB_ALIAS>
sf package version create --package catalog-management --installation-key-bypass --wait 30 --target-dev-hub <DEV_HUB_ALIAS>
sf package version create --package reservation-management --installation-key-bypass --wait 30 --target-dev-hub <DEV_HUB_ALIAS>
sf package version create --package billing-management --installation-key-bypass --wait 30 --target-dev-hub <DEV_HUB_ALIAS>
```

## Suggested Next Step

Move legacy metadata into package folders by bounded context ownership.
