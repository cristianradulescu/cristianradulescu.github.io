Source code for https://cristianradulescu.github.io, built with [Staccato](https://github.com/cristianradulescu/staccato-bundle).

- `content/articles/` – blog posts (Markdown with `title`, `date`, `excerpt` front matter)
- `content/about.md` – the About page
- `assets/` – static files, published under `/assets/`
- `templates/bundles/StaccatoBundle/base.html.twig` – layout override (analytics, social metadata, navigation)
- `themes/site.css` – style tweaks on top of the default Staccato theme
- `bin/write-redirects.sh` – keeps URLs from the previous (Jigsaw) version of the site working

Requires PHP 8.5+ and Composer.

```bash
make setup
make build   # production build into build/ (make build-dev includes drafts)
make serve   # http://localhost:8000
```

Pushes to `master` are built and deployed to GitHub Pages by `.github/workflows/pages.yml`.
