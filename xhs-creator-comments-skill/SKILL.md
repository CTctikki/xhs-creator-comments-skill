---
name: xhs-creator-comments-skill
description: Use when Codex needs to export comments from discoverable notes on a Xiaohongshu creator homepage to Excel through a local MediaCrawler workspace, especially when the task starts from a creator profile URL and needs note discovery, comment collection, and output-path reporting.
---

# XHS Creator Comments Skill

## Overview

Use this skill to run one narrow workflow: given a Xiaohongshu creator homepage URL, drive an existing local MediaCrawler workspace to collect comments from discoverable notes and export the result to Excel.

This skill does not implement crawling itself and does not modify MediaCrawler source code during normal use. It assumes a local MediaCrawler checkout is available.

## Required Inputs

- one Xiaohongshu creator homepage URL
- optionally, a local MediaCrawler workspace path

If the workspace path is not provided, first try to discover a nearby MediaCrawler checkout. If you cannot find one, stop and report that the workflow needs a local MediaCrawler workspace.
For this repo layout, first check for a sibling `MediaCrawler` directory next to the skill repo.

## Workflow

1. Validate the MediaCrawler workspace with `scripts/check-mediacrawler-path.ps1`.
2. Read [workflow.md](./references/workflow.md).
3. Run the creator crawl command against the provided homepage URL.
4. If login is needed, allow QR or manual login completion.
5. If the creator listing API fails, rely on the MediaCrawler DOM fallback path already present in the workspace. If the workspace still cannot continue, report the blocker and stop instead of patching MediaCrawler.
6. Use `scripts/find-latest-excel.ps1 -WorkspacePath <MediaCrawlerRoot>` to locate the latest workbook if the output path is not obvious.
7. Report the Excel path and summarize any partial crawl caveats.

## Output Contract

Report:

- the Excel file path
- whether the workbook contains `Contents`, `Comments`, and `Creators`
- whether sub-comments were only partially collected

## References

- For the exact command shape and expected output location, read [workflow.md](./references/workflow.md).
- For login problems, creator API fallback behavior, and output troubleshooting, read [troubleshooting.md](./references/troubleshooting.md).
