# Workflow

## Required Workspace Shape

A valid MediaCrawler workspace should contain at least:

- `main.py`
- `media_platform/xhs/core.py`
- `media_platform/xhs/login.py`
- `store/xhs/__init__.py`

## Primary Command

Run:

```bash
uv run main.py --platform xhs --lt qrcode --type creator --creator_id "<CREATOR_URL>" --get_comment true --get_sub_comment true --save_data_option excel
```

Replace `<CREATOR_URL>` with the Xiaohongshu creator homepage URL.

## Expected Runtime Behavior

- MediaCrawler may first attempt CDP mode and then fall back to standard Playwright mode.
- Login may complete through QR code or through the manual-login fallback path.
- The creator note-list API may fail; in that case the workspace may fall back to scraping note links from the creator page DOM.

## Expected Output

The workbook is typically written under:

- `data/xhs/`

The file name pattern is typically:

- `xhs_creator_YYYYMMDD_HHMMSS.xlsx`

Expected sheets:

- `Contents`
- `Comments`
- `Creators`
