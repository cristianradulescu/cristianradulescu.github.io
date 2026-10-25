Source code for https://cristianradulescu.github.io, built with [Staccato](https://github.com/cristianradulescu/staccato-bundle).

- `content/articles/` – blog posts (Markdown with `title`, `date`, `excerpt` front matter; `aliases` for old URLs)
- `content/about.md` – the About page
- `assets/` – files published under `/assets/`
- `static/` – files published at the site root (`favicon.ico`)
- `templates/bundles/StaccatoBundle/base.html.twig` – extends the default layout with analytics, the site title and navigation
- `themes/site.css` – style tweaks on top of the default Staccato theme
- `src/EventListener/LegacyUrlsListener.php` – keeps pagination and feed URLs from the previous (Jigsaw) version of the site working

Requires PHP 8.5+ and Composer.

```bash
make setup
make build   # production build into build/ (make build-dev includes drafts)
make serve   # http://localhost:8000
```

Pushes to `master` are built and deployed to GitHub Pages by `.github/workflows/pages.yml`.
