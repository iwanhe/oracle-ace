# f192092 — APEX Social Media (Full SQL Export)

> Part of the [`apex-social-media`](../) project
> Oracle ACE Apprentice Program — Product Usage Milestone

---

## About This Export

This folder contains the **full SQL export** of the APEX Social Media application (Application ID: 192092), generated from Oracle APEX 26.1 in legacy SQL format. This format is compatible with earlier versions of Oracle APEX and can be imported directly via the App Builder import wizard.

---

## Export Details

| Property | Value |
|---|---|
| **Application ID** | 192092 |
| **Export Format** | Legacy SQL (wwv_flow_imp) |
| **APEX Version** | 26.1 |
| **Workspace** | WKSP_KCSI |
| **Export Date** | 2026-06-11 |

---

## Contents

```
f192092/
├── f192092.zip          ← Full application export (import this into APEX)
└── README.md            ← This file
```

### What's Inside the ZIP

The export package contains all application components:

```
f192092/
├── install.sql                               ← Master install script
├── application/
│   ├── create_application.sql                ← Application definition
│   ├── set_environment.sql / end_environment.sql
│   ├── pages/
│   │   ├── page_00000.sql                    ← Global page (header/footer)
│   │   ├── page_00001.sql                    ← Home / Timeline page (main UI)
│   │   └── page_09999.sql                    ← Login page
│   ├── shared_components/
│   │   ├── navigation/                       ← Navigation bar, navigation menu, breadcrumbs
│   │   ├── security/
│   │   │   └── authentications/oracle_apex_accounts.sql
│   │   ├── user_interface/
│   │   │   ├── lovs/boolean.sql
│   │   │   └── themes.sql                    ← Universal Theme configuration
│   │   └── files/icons/                      ← App icons (32px to 512px for PWA)
│   └── deployment/
│       └── install/install_data_model.sql    ← CREATE TABLE + triggers
└── plugin_settings.sql                       ← Plugin configuration
```

---

## How to Import

### Via APEX App Builder (Recommended)

1. Log in to your Oracle APEX workspace
2. Go to **App Builder → Import**
3. Upload `f192092.zip`
4. Click **Next**
5. Click **Install Application**
6. Click **Install Supporting Objects** — this creates the `SM_POSTS` and `SM_REACTIONS` tables and their triggers automatically
7. Click the **Run** button to launch the application

### Verify Installation

After import, confirm the following objects exist in your schema via **SQL Workshop → Object Browser**:

- Table: `SM_POSTS`
- Table: `SM_REACTIONS`
- Trigger: `SM_POSTS_BIU`
- Trigger: `SM_REACTIONS_BIU`

---

## Database Objects Created

This export includes the following Oracle Database objects via Supporting Objects:

**Tables:**
- `SM_POSTS` — Stores posts with photo (BLOB), caption, and GPS coordinates
- `SM_REACTIONS` — Stores like reactions; `UNIQUE (POST_ID, CREATED_BY)` enforces one like per user per post

**Triggers:**
- `SM_POSTS_BIU` — Auto-populates `CREATED`, `CREATED_BY`, `UPDATED`, `UPDATED_BY` on insert/update
- `SM_REACTIONS_BIU` — Same audit pattern for reactions table

---

## Notes

- This format uses `wwv_flow_imp` PL/SQL API calls — it is the traditional Oracle APEX export format
- For the newer APX/APEXLang format, see the [`apex-social-media-apexlang/`](../apex-social-media-apexlang/) folder
- The export was created from workspace `WKSP_KCSI`; the import wizard will adapt it to your workspace automatically

---

## License

[Universal Permissive License (UPL) v1.0](https://opensource.org/licenses/UPL)
