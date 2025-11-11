# Deployment Guide

This book is automatically deployed to GitHub Pages using GitHub Actions.

## Automatic Deployment

Every push to `main` triggers:
1. Install dependencies
2. Build with `mkdocs build --strict`
3. Deploy to GitHub Pages

**Live site:** `https://yourusername.github.io/maintainable-vibe-coding`

## Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Run local server
mkdocs serve

# Build static site
mkdocs build
```

## Manual Deployment

If needed, deploy manually:

```bash
mkdocs gh-deploy
```

## Custom Domain

To use a custom domain:

1. Add CNAME record pointing to `yourusername.github.io`
2. Create `docs/CNAME` file with your domain
3. Push to trigger deployment

## Troubleshooting

### Build fails
- Check `mkdocs.yml` syntax
- Verify all pages in `nav` exist
- Run `mkdocs build --strict` locally

### Pages not updating
- Check GitHub Actions logs
- Clear browser cache
- Wait 2-3 minutes for CDN refresh
