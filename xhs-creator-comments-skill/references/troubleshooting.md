# Troubleshooting

## QR Code Does Not Appear

- Wait for the workspace to try the manual-login fallback.
- If the browser page is already logged in and the left sidebar shows the profile entry, MediaCrawler may continue without a visible QR code.
- If login still fails, re-run the command and complete login manually in the opened browser.

## Creator Listing API Fails

- The workspace may log a failure around the Xiaohongshu creator listing API.
- If the workspace includes the DOM fallback path, it should continue by scraping note links from the creator profile page itself.
- If it stops instead of falling back, report the blocker and stop. The local MediaCrawler checkout is likely missing the required creator fallback fixes.

## Site Blocks Access

- If Xiaohongshu shows a security, IP-risk, or unstable login page, report the blocker and stop.
- Do not patch MediaCrawler as part of normal skill use unless the user explicitly asks for crawler debugging.

## Excel File Is Hard To Find

- Run `scripts/find-latest-excel.ps1 -WorkspacePath "<MediaCrawlerRoot>"` from the skill repo.
- If that still fails, inspect the MediaCrawler `data/xhs/` directory directly.

## Partial Sub-Comment Failures

- Xiaohongshu may return intermittent errors for some second-level comment pages.
- Treat the workbook as usable but potentially partial when logs mention sub-comment fetch retries or failures.
