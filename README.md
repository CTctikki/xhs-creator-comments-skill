# XHS Creator Comments Skill

An open-source Codex skill for one narrow workflow:

- take a Xiaohongshu creator homepage URL
- use a local MediaCrawler workspace
- collect all discoverable note links for that creator
- fetch note comments
- export the result to Excel

## What This Repo Includes

- a reusable `SKILL.md`
- workflow and troubleshooting references
- small helper scripts for workspace validation and Excel discovery

## What This Repo Does Not Include

- the MediaCrawler codebase
- a standalone crawler implementation
- general Xiaohongshu scraping support outside the creator-homepage comment export workflow

## Requirements

- a local MediaCrawler workspace
- a working Python environment for MediaCrawler
- a login-capable browser environment for Xiaohongshu

## Skill Folder

The skill lives at:

`xhs-creator-comments-skill/`

## License

MIT
