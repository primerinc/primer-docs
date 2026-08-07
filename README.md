# primer-docs

Internal document hub for Primer — client proposals, pitch materials, and internal reference docs.

**Live URL:** [docs.primerinc.com](https://docs.primerinc.com)  
**Repo:** `primer-inc/primer-docs` on GitHub  
**Hosting:** Cloudflare Pages — push to `main` and it's live in ~30 seconds. No build step, no CI, no config.

---

## Pages

| File | URL | Audience | Description |
|---|---|---|---|
| `index.html` | `/` | Internal | Document hub — links to all pages below |
| `platform-proposal.html` | `/platform-proposal` | Client | Full proposal for the WordPress → Astro + Storyblok transition |
| `why-switch.html` | `/why-switch` | Pitch | Condensed comparison slide: WordPress + Bricks vs Storyblok + Astro |
| `build-system.html` | `/build-system` | Internal | Overview of the new build process — stack, workflow, component library, roles, and POC plan |
| `figma-workflow-guide.html` | `/figma-workflow-guide` | Internal | Token system, reuse-vs-build-new rules, and client reskinning steps for Figma — written for Brian ahead of the Forte build |

---

## Tech & Brand

- **Stack:** Pure static HTML — no framework, no build step
- **Fonts:** IBM Plex Sans + IBM Plex Serif via Google Fonts
- **Brand tokens:** CSS custom properties in `:root` of each file, prefixed `--primer-`
  - Dark background: `#1F2023`
  - Cream text: `#F0EDD8`
  - Gold accent: `#C8A020`
  - Teal: `#1A9090`
- **Wordmark:** IBM Plex Sans, weight 600, letter-spacing 0.22em, uppercase

---

## Adding a new document

1. Create the `.html` file in the root of this repo, styled to match the existing pages
2. Add a card to the `index.html` doc-list following the existing pattern (icon, name, description, tag)
3. Deploy (see below) — Cloudflare handles the rest

---

## Deploy

```bash
./deploy.sh "Brief description of change"
```

Or manually:

```bash
git add .
git commit -m "your message"
git push origin main
```

Changes are live at [docs.primerinc.com](https://docs.primerinc.com) within ~30 seconds of push.
