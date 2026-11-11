# Attendee instructions

The step-by-step lab guide is in [`lab671-instructions.md`](lab671-instructions.md).

The guide uses [Skillable Markdown syntax](https://docs.skillable.com/docs/creating-instructions-with-markdown-syntax), so it's meant to be pasted into the Skillable instructions editor. A few elements render differently on GitHub:

| Syntax | Meaning in Skillable |
|---|---|
| `===` | Page break |
| `1. []` | Step with a progress checkbox |
| `++text++` | Text attendees can copy, such as a prompt |
| `+++text+++` | Text Skillable can type for attendees, such as credentials |
| `@lab.CloudPortalCredential(User1).Username` | Replaced with the attendee's lab username |
| `@lab.VirtualMachine(Win11-Pro-Base).Username` | Replaced with the lab computer's Windows username |
| `> [!Note]` | Callout block |
| `> [+Hint]` | Expandable hint |

## Screenshots

The screenshots and animations used in the guide are in [`images/`](images). They're numbered in the order they appear. In Skillable, add each one with the image button in the instructions editor.

| File | Where it goes |
|---|---|
| `lab671-00-intro-brew.gif` | About this lab (optional) |
| `lab671-01` to `lab671-02d` | Setting 1: Turn on the Microsoft Dataverse connector |
| `lab671-03` to `lab671-05` | Setting 2: Find the Sales environment and turn on Work IQ |
| `lab671-08` to `lab671-12` | Setting 3: Connect Dataverse in Copilot |
| `lab671-06`, `lab671-07` | Step 2: optional check in Sales Hub |
| `lab671-99-outro-refill.gif` | Summary (optional) |

## Dates

The guide uses no fixed dates. The seeding scripts build every email, post, activity and calendar block relative to the day the lab is set up, and the prompts use relative wording such as "in the next three business days, starting tomorrow".
