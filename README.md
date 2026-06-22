# Package Oriented Salesforce Repo

This repository is structured for package oriented Salesforce development using 2GP unlocked packages.

## Bounded Contexts

| Package | Type | Dependencies |
|---------|------|-------------|
| core | Unlocked | — |
| catalog-management | Unlocked | core |
| reservation-management | Unlocked | core, catalog-management |
| billing-management | Unlocked | core, reservation-management |
| notification-management | Unlocked (org-dependent) | — |

## Folder Layout

```
packages/
  core/classes/
  catalog-management/classes/
  reservation-management/classes/
  billing-management/classes/
  notification-management/classes/
scripts/
  deploy-all-packages.sh
```

## Deploy All Packages

Creates, installs, and promotes all package versions in dependency order:

```bash
./scripts/deploy-all-packages.sh <dev-hub> <target-org>
```

## Create Package Records (one-time setup)

```bash
sf package create --name core --package-type Unlocked --path packages/core --target-dev-hub <DEV_HUB>
sf package create --name catalog-management --package-type Unlocked --path packages/catalog-management --target-dev-hub <DEV_HUB>
sf package create --name reservation-management --package-type Unlocked --path packages/reservation-management --target-dev-hub <DEV_HUB>
sf package create --name billing-management --package-type Unlocked --path packages/billing-management --target-dev-hub <DEV_HUB>
sf package create --name notification-management --package-type Unlocked --path packages/notification-management --target-dev-hub <DEV_HUB>
```
