# apex-social-media-apexlang — APEX Application Export (APX Format)

> Part of the [`apex-social-media`](../) project
> Oracle ACE Apprentice Program — Product Usage Milestone

---

## About This Export

This folder contains the **APEXLang (APX) format export** of the APEX Social Media application. APEXLang is Oracle APEX's modern, human-readable export format introduced in recent APEX versions. Unlike the legacy SQL export, APX files are stored as structured plain-text component files — making them Git-friendly and easy to review as source code.

---

## Export Details

| Property | Value |
|---|---|
| **Application Name** | APEX Social Media |
| **Application ID** | 192092 |
| **Export Format** | APEXLang (APX) |
| **APEX Version** | 26.1 |
| **Workspace** | WKSP_KCSI |
| **Export Date** | 2026-06-11 |

---

## Contents

```
apex-social-media-apexlang/
├── apex-social-media.zip    ← Full APX export (import this into APEX)
└── README.md                ← This file
```

### What's Inside the ZIP

The APX export package uses a folder-based structure where each component is a separate readable file:

```
apex-social-media/
├── application.apx                         ← App-level settings (name, auth, PWA config)
├── page-groups.apx
├── pages/
│   ├── p00000-global-page.apx              ← Global page (shared header/footer elements)
│   ├── p00001-home.apx                     ← Main Timeline page (Cards, Map, Form, Dynamic Actions)
│   └── p09999-login.apx                    ← Login page
├── shared-components/
│   ├── themes/universal-theme/theme.apx    ← Universal Theme configuration
│   ├── authentications.apx                 ← Oracle APEX Accounts auth scheme
│   ├── authorizations.apx                  ← Authorization schemes
│   ├── breadcrumbs.apx
│   ├── build-options.apx
│   ├── component-settings.apx
│   ├── lists.apx                           ← Navigation menu + navigation bar
│   ├── lovs.apx                            ← List of Values
│   └── static-files/icons/                 ← PWA app icons (32px, 144px, 192px, 256px, 512px)
├── supporting-objects/
│   ├── install-scripts/
│   │   └── data-model.sql                  ← CREATE TABLE SM_POSTS, SM_REACTIONS + triggers
│   ├── substitutions.apx
│   ├── supporting-objects.apx
│   └── deinstall-script.sql
└── deployments/
    └── default.json
```

---

## Why APEXLang Format?

The APX format has several advantages over the legacy SQL export:

| | APX Format (this folder) | Legacy SQL (f192092/) |
|---|---|---|
| **Readability** | Human-readable plain text | PL/SQL API calls (`wwv_flow_imp`) |
| **Git diff** | Line-by-line component changes visible | Large binary-like SQL changes |
| **File structure** | One file per component | Single monolithic SQL file |
| **APEX version** | APEX 23.1+ | All versions |
| **Review** | Easy to review in GitHub | Difficult to parse visually |

---

## Key Application Settings (from `application.apx`)

```
app APEX-SOCIAL-MEDIA (
    name: APEX Social Media
    navigation {
        homeUrl: { page: 1 }
        loginUrl: { page: LOGIN }
    }
    authentication { scheme: @oracle-apex-accounts }
    sessionStateProtection { checksumSalt: ... }
    progressiveWebApp { installable: true }   ← PWA enabled
    runtime { allowFeedback: true }
)
```

---

## Key Page Structure (from `p00001-home.apx`)

The main Timeline page contains:

- **Region: Post** (Inline Dialog) — Form region backed by `SM_POSTS` table, appears as modal for new posts
- **Region: Post and Like Locations** (Inline Dialog → Map) — Geographic visualization using UNION query
- **Region: Timeline** (Cards) — Main feed with SQL aggregation for like counts and CSS class mapping
- **Page JavaScript** — APEX Actions registration for `like`, `delete`, and `open-map` actions
- **Page CSS** — `.user-has-liked { color: red; }` plus responsive positioning for the new post button

---

## How to Import

### Via APEX App Builder

1. Log in to your Oracle APEX workspace
2. Go to **App Builder → Import**
3. Upload `apex-social-media.zip`
4. Click **Next**
5. Click **Install Application**
6. Click **Install Supporting Objects** — automatically creates `SM_POSTS`, `SM_REACTIONS` tables and triggers
7. Run the application

### Verify Installation

Check via **SQL Workshop → Object Browser** that these objects exist:

- Table `SM_POSTS`
- Table `SM_REACTIONS`
- Trigger `SM_POSTS_BIU`
- Trigger `SM_REACTIONS_BIU`

---

## Difference from f192092/

Both exports represent the **same application** — APEX Social Media (App ID 192092). The difference is only the export format:

- **`f192092/`** → Legacy SQL export, compatible with older APEX versions, uses `wwv_flow_imp` API
- **`apex-social-media-apexlang/`** (this folder) → Modern APX export, human-readable, Git-friendly, requires APEX 23.1+

Use whichever format matches your Oracle APEX version.

---

## License

[Universal Permissive License (UPL) v1.0](https://opensource.org/licenses/UPL)
