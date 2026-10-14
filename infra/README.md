# Infrastructure

Skillable-specific files for LAB671.

## Lab dates

Work IQ evaluates phrases such as "the last 30 days" and "no activity in 14+ days" against the real current date. Every date in the lab is therefore an offset from the day the lab launches (**Day 0**, Central Time), not a fixed calendar date. This keeps the scenario consistent for the November 17–20 event, for rehearsals before it, and for on-demand use after it.

[`Set-LabDates.ps1`](Set-LabDates.ps1) computes the dates, checks that the scenario still holds, and publishes them as Skillable lab variables that the [lab guide](../instructions/lab671-instructions.md) displays with `@lab.Variable(...)`.

### Run order

1. Run `Set-LabDates.ps1` as a life cycle action when the lab launches.
2. Seed Dynamics 365 and Microsoft 365 using the same dates. Use the script's `Iso` output, or `-OutFile lab-dates.json`, so the seeded data and the instructions always match.

### Date model

Past dates move back to the previous business day, which only makes items older. Future dates move forward to the next business day. Business days skip weekends, Thanksgiving and the day after, December 24–25, December 31, and January 1.

| Variable | Offset from Day 0 | Used for |
|---|---|---|
| `LabToday` | 0 | Day 0 |
| `NorthwindLastActivity` | −21 | Northwind last completed Dynamics activity (stalled) |
| `WideWorldLastActivity` | −17 | Wide World Importers last completed activity (stalled) |
| `PreBookAnnounced` | −16 | Patti's Pre-Book email and All Hands post |
| `FourthCoffeeLastActivity` | −15 | Fourth Coffee last completed activity (stalled) |
| `ShipmentIssue` | −13 | Isaiah's Customer Care email about the Holiday Blend short shipment |
| `AdeleQuestion` | −9 | Adele's unanswered West-channel allocation question |
| `TailwindLastActivity` | −8 | Tailwind Traders last completed activity |
| `AlpineLastActivity` | −7 | Alpine Ski House last completed activity |
| `ContosoLastActivity` | −6 | Contoso Retail logged Pre-Book call |
| `FollowUpDue` | +8 | Task due dates and "find 30 minutes by" for meetings |
| `PreBookDeadline` | +14 | Spring '27 Pre-Book deadline |
| `HolidayLaunch` | First Monday after the deadline | Holiday Blend launch campaign |
| `NorthwindClose` | +27 | Northwind estimated close |
| `ContosoClose` | +34 | Contoso Retail estimated close |
| `WideWorldClose` | +48 | Wide World Importers estimated close |
| `TailwindClose` | +55 | Tailwind Traders estimated close |
| `FourthCoffeeClose` | +62 | Fourth Coffee estimated close |
| `AlpineClose` | +67 | Alpine Ski House estimated close |
| `CloseBy` | +75 (not adjusted) | "Closing by" filter in the Scenario 2 prompt |

The script also sets `PreBookAnnouncedLong` and `HolidayLaunchLong` (with the weekday) and `NorthwindDaysSince`, `WideWorldDaysSince`, and `FourthCoffeeDaysSince` for the expected-results table.

For example, a lab launched on November 17, 2026 gets a Pre-Book deadline of December 1, a follow-up date of November 25, and a Holiday Blend launch on December 7.

### Seeding notes

- Date the Central and East renewals and any other seeded items with the same rules, so the Scenario 2 counts (for example, one stalled Central renewal) hold on any launch day.
- Calendar busy blocks for Megan, Alex, Adele, and Diego must also be relative to Day 0 so a 30-minute slot exists before `FollowUpDue`.
- Any dates written in seeded message text, such as "order by December 1" in Patti's email, must use these values.
- Seed the Holiday Blend short shipment only as Isaiah's email to the account team (Megan must be a recipient). The lab doesn't use Dynamics 365 Customer Service, so don't create a service case for it.
- The script throws an error if a launch day would break the expected results. It passes for every launch day from October 13, 2026 through November 17, 2027.

### Test locally

```powershell
./Set-LabDates.ps1 -Today 2026-11-17
```

Outside Skillable, `Set-LabVariable` isn't available, so the script only returns the dates.
