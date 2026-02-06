# V2 Portfolio (Next.js)

This folder contains the v2 rebuild of the portfolio website. It is a static Next.js
export designed to be deployed to GitHub Pages from the repo `/docs` folder.

## Development

From the repo root:

```bash
cd v2
npm install
npm run dev
```

Then open [http://localhost:3000](http://localhost:3000).

## Content

Content lives in:

- `src/data/site.ts` (hero, experience, projects, education, skills, links)

Edit the data objects to update the copy, links, and images.

## Static Export (GitHub Pages)

This repo is deployed as a user-site with Pages served from `/docs`.
To build and deploy the v2 site:

```bash
cd v2
npm run deploy
```

This will:

1. Run `next build` with static export output to `v2/out`
2. Copy the static files into the repo’s `/docs` folder

After that, commit and push the changes to publish.

## Notes

- `next.config.ts` uses `output: "export"` and `trailingSlash: true` for static output.
- Images use remote URLs that point to the repo’s `assets/` folder on GitHub.
