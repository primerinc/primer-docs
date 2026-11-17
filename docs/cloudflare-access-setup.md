# Locking down docs.primerinc.com

Goal: internal pages and proposals need a login; client guides under `/guides/` stay open to anyone with the link.

Already done in code (2026-11-16):
- Every page sends `noindex, nofollow` (a `<meta name="robots">` tag plus an `X-Robots-Tag` header in `vercel.json`), so search engines drop them.
- `.vercelignore` stops `CLAUDE.md`, `README.md`, `deploy.sh` and `docs/` being served on the site.
- Client guides live in `guides/`. `/storyblok-resources-guide` redirects to `/guides/storyblok-resources-guide`.

The rest happens in the dashboards. Do the steps in this order.

---

## 1. Make the GitHub repo private (do this first)

While `primerinc/primer-docs` is public, anyone can read every page's source on GitHub, so a login on the site hides nothing.

GitHub → `primerinc/primer-docs` → Settings → General → Danger Zone → **Change visibility** → Private.

**Check the deploy still works afterwards.** Vercel's free Hobby plan can't deploy private repos owned by a GitHub organization. If pushes stop deploying, either:
- move the site to **Cloudflare Pages** (free, deploys private repos, and the domain is already on Cloudflare), or
- deploy from the command line with `vercel --prod` instead of on push.

## 2. Close the back door on Vercel

Cloudflare Access only guards `docs.primerinc.com`. The project's `*.vercel.app` addresses skip Cloudflare and would stay open.

Vercel → the primer-docs project → Settings → **Deployment Protection** → turn on **Vercel Authentication**, set to **Standard Protection**. This puts every `vercel.app` address behind a Vercel login, while the custom domain keeps working through Cloudflare.

(Skip this step if you moved to Cloudflare Pages in step 1; protect the `*.pages.dev` address with Access instead.)

## 3. Turn on Cloudflare Zero Trust

Cloudflare dashboard → **Zero Trust**. The first time, pick a team name and the **Free** plan (up to 50 users; a card may be asked for, but Free isn't charged).

Login method: Settings → Authentication → **One-time PIN** is on by default. People type their email and get a code; there's no password to share.

## 4. Protect the whole site

Zero Trust → Access → Applications → **Add an application** → **Self-hosted**.
- Application name: `Primer docs`
- Domain: `docs.primerinc.com`, path left empty
- Session duration: 1 month (or shorter)
- Policy: name `Primer team`, action **Allow**, Include → **Emails ending in** → `@primerinc.com`. Add Brian, Arnie or anyone else by single email if they use another address.

## 5. Keep client guides public

Add a second application → **Self-hosted**.
- Application name: `Primer docs – client guides`
- Domain: `docs.primerinc.com`, path `guides`
- Policy: name `Public`, action **Bypass**, Include → **Everyone**

The more specific path wins, so `/guides/...` opens for anyone and everything else asks for a login.

To put the guides behind a login instead, use **Allow** here, with Include → Emails ending in each client's domain (for example the Forte team's domain).

## 6. Optional: let a client see their own proposal

For a page meant for one client, add another application for just that path (for example `lock8-rsvp-system`) with an **Allow** policy that includes the Primer team plus **Emails ending in** the client's domain.

## 7. Check it

In a private browser window:
- `https://docs.primerinc.com/` → Cloudflare login page
- `https://docs.primerinc.com/guides/storyblok-resources-guide` → opens with no login
- the `vercel.app` address → Vercel login page
- the GitHub repo while signed out → 404
