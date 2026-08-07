# primer-docs

Client-facing and internal Primer documents hosted at docs.primerinc.com.
Deployed via Cloudflare Pages from the primer-inc/primer-docs GitHub repo.
Pushing to main auto-deploys. No build step — pure static HTML.

## Files
- index.html          — document hub (docs.primerinc.com)
- platform-proposal.html — client proposal: WordPress → Astro + Storyblok
- why-switch.html     — pitch comparison slide
- build-system.html   - overview of the new build process with Astro + Storyblok
- aeo-upgrade.html    - service offering: AEO & GEO upgrade for Lock8 portfolio sites
- figma-workflow-guide.html - token system, reuse-vs-build-new rules, and reskinning steps for Figma — written for Brian ahead of the Forte build

## Brand
- Fonts: IBM Plex Sans + IBM Plex Serif (Google Fonts)
- Brand tokens: defined in :root in each file, prefixed --primer-
- Dark background: #1E1F2C, Cream: #F0EDD8, Gold accent: #C8A020
- Logo: IBM Plex Sans, 600 weight, letter-spacing 0.22em, uppercase

## When adding a new document
1. Create the HTML file in this directory
2. Add a card to the index.html doc-list following the existing pattern
3. Commit and push — Cloudflare handles the rest

## Deploy command
git add . && git commit -m "message" && git push origin main