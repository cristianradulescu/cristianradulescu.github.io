#!/usr/bin/env bash
# Keeps URLs from the Jigsaw version of the site working after site:build.
# Staccato lowercases slugs, paginates under /page/N/ and publishes the feed at /rss.xml.
set -euo pipefail

build_dir="${1:-build}"
base_url="https://cristianradulescu.github.io"

redirect() {
    local from="$1" to="$2"
    mkdir -p "$build_dir/$from"
    cat > "$build_dir/$from/index.html" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Redirecting…</title>
    <link rel="canonical" href="$base_url$to">
    <meta name="robots" content="noindex">
    <meta http-equiv="refresh" content="0; url=$to">
</head>
<body>
    <p>This page has moved to <a href="$to">$base_url$to</a>.</p>
</body>
</html>
EOF
}

redirect 2022-08-20-Github-pages-with-Jigsaw /2022-08-20-github-pages-with-jigsaw/
redirect 2021-08-27-Print-the-ESSID-of-the-wifi-network /2021-08-27-print-the-essid-of-the-wifi-network/
redirect 2 /page/2/
redirect 3 /page/3/

# Feed readers do not follow HTML redirects, so serve the feed itself at the old path.
mkdir -p "$build_dir/blog"
cp "$build_dir/rss.xml" "$build_dir/blog/feed.atom"
