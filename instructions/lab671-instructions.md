# Work IQ + Dynamics 365: Find the deal risk your CRM can't see

Step into the role of a sales leader at Zava, a specialty coffee roaster. You'll combine Dynamics 365 opportunities with your team's email, Teams chats, and seasonal program announcements. You'll use them to spot stalled grocery renewals and missed pre-book offers, then act on them without leaving the chat.

**Time:** About 30 minutes, hands-on.

## What you'll do

- **Scenario 1: Save the renewal.** Find out where the Northwind Traders renewal really stands, then record the risk, draft an email to the account team, and schedule a save-plan meeting.
- **Scenario 2: Close the Pre-Book gap.** Check Pre-Book coverage across all three regions, find offers that never made it into CRM, confirm that Work IQ respects your data boundaries, and assign regional follow-ups.

## About Zava

Zava is a fictional specialty coffee roaster. It sells whole-bean coffee and a new canned cold brew wholesale to grocery chains, café groups, and hospitality accounts in three sales regions: West, Central, and East. Its sales and service teams use Dynamics 365 Sales and Microsoft 365.

| Item | Details |
|---|---|
| Seasonal program | **Spring '27 Pre-Book Program**: 10% off spring orders placed by **@lab.Variable(PreBookDeadline)**, plus guaranteed allocation of Zava Nitro Cold Brew. The new canned line launches in spring with limited supply in its first year. Patti Fernandez (VP of Sales) announced the program by email to all account teams on @lab.Variable(PreBookAnnouncedLong), and followed up in the **Zava Sales › All Hands** channel. |
| Sales strategy | The Q4 priority is to win spring shelf space early, because grocers set their spring coffee and cold brew shelf plans in the fall. The Holiday Blend launch campaign starts @lab.Variable(HolidayLaunchLong), and retailers who pre-book get co-op marketing funds for in-store displays. |
| Hero customer | **Northwind Traders** (West), a regional grocery chain with 45 stores. Alex Wilber manages the account, which is in Diego Siciliani's region. Its yearly wholesale supply agreement is up for renewal. |

## Who's who

| Person | Role | Time zone |
|---|---|---|
| Megan Bowen (**you**) | National Sales Manager | Central (Chicago) |
| Diego Siciliani | Regional Sales Manager, West | Pacific |
| Alex Wilber | Account Manager, Northwind Traders | Pacific |
| Adele Vance | Cold Brew Product Specialist | Pacific |
| Lee Gu | Account Manager, West | |
| Patti Fernandez | VP of Sales | |
| Isaiah Langer | Customer Care | |

> [!Knowledge]
> In Dynamics 365 you can see every region. In Microsoft 365 you see only the email, chats, and channels you have access to. This difference is intentional, and you'll test it in Scenario 2.

> [!Note]
> The lab data is dated relative to the day your lab started, **@lab.Variable(LabToday)**, so the dates in your environment match the dates in these instructions. Phrases such as "the last 30 days" and "no activity in 14+ days" are relative to that day.

===

# Sign in to Microsoft 365 Copilot

You use one account for the whole lab. It plays the role of Megan Bowen, National Sales Manager.

1. [] Open a browser and go to +++https://m365.cloud.microsoft/chat+++.
1. [] Sign in with the following credentials:

    | | |
    |---|---|
    | Username | +++@lab.CloudPortalCredential(User1).Username+++ |
    | Password | +++@lab.CloudPortalCredential(User1).Password+++ |

1. [] If you're prompted to stay signed in, select **Yes**.
1. [] Confirm that the Microsoft 365 Copilot chat opens.

> [!Hint]
> Start each scenario in a **new chat** so earlier answers don't influence the results.

> [!Note]
> Wording and layout will differ from run to run. Check for the facts listed in each step, not the exact wording.

===

# Scenario 1: Save the renewal

You are the National Sales Manager at Zava. You lead the West, Central, and East regions from Chicago, on Central Time.

Northwind Traders, a 45-store grocery chain in the West, is up for renewal. Your job is to find out where the deal stands and get the account team moving.

## Investigate the renewal

1. [] In Microsoft 365 Copilot, start a new chat.
1. [] Enter the following prompt:

    ++Give me the state of the Northwind Traders renewal, including the Dynamics opportunity, what the account team and Customer Care have discussed in email and Teams I can access over the last 30 days, and whether there is evidence that anyone has offered Northwind the Spring '27 Pre-Book Program.++

1. [] Review the response. A good answer includes:

    | Finding | What to look for |
    |---|---|
    | Opportunity | **Northwind Traders – FY27 Wholesale Supply Agreement Renewal**: $483,600, Propose stage, 60% probability, closing @lab.Variable(NorthwindClose). The last completed activity was on @lab.Variable(NorthwindLastActivity). |
    | Shipment issue | On @lab.Variable(ShipmentIssue), Isaiah Langer in Customer Care emailed that Holiday Blend was short-shipped to two of Northwind's three distribution centers. It's still unresolved. |
    | Unanswered customer need | On @lab.Variable(AdeleQuestion), Adele asked in the West channel whether Northwind can get guaranteed Nitro Cold Brew allocation for its spring reset. Nobody has answered. |
    | Missed program connection | The @lab.Variable(PreBookAnnounced) Pre-Book announcement offers guaranteed allocation, but there's no sign anyone has offered it to Northwind. The deadline is @lab.Variable(PreBookDeadline). |

> [!Knowledge]
> **Takeaway:** Dynamics shows 60%, but the renewal is at risk. The deal record doesn't show the shipment problem or the buyer's open question; both are only in email and Teams. The Pre-Book Program answers the buyer's question, if someone offers it in time.

## Close the loop

Now act on what you found without leaving the chat.

### Record the risk and assign a next step

1. [] Enter the following prompt:

    ++Add a note to the Northwind renewal summarizing the risks you found, including the shipment issue and that no Pre-Book offer has been made, and create a task for Alex due @lab.Variable(FollowUpDue) to offer the program and confirm cold brew allocation.++

1. [] Review the note and the task. Confirm that the task is assigned to Alex Wilber and is due **@lab.Variable(FollowUpDue)**.
1. [] Approve the note and the task.

> [!Note]
> Work IQ shows you the note and task first. Nothing is saved until you approve.

### Draft an email to the account team

1. [] Enter the following prompt:

    ++Draft an email from me to Alex, cc Adele, Diego and Isaiah, covering the Pre-Book offer, the answer to the buyer's cold brew allocation question, and the status of the Holiday Blend shipment issue. Save it as a draft; don't send it.++

1. [] Review the draft. Confirm that it's addressed to Alex, with Adele, Diego, and Isaiah on cc.

> [!Note]
> The email is saved to your **Drafts** folder and isn't sent.

### Bring the account team together

1. [] Enter the following prompt:

    ++Find 30 minutes for me, Alex and Adele by @lab.Variable(FollowUpDue) and send an invite called 'Northwind renewal – save plan.'++

1. [] Review the proposed time before you confirm. You're on Central Time; Alex and Adele are on Pacific Time. Check that the invite shows the right time for each person.

> [!Alert]
> The invite is sent as soon as the meeting is created. Check the time zones before you confirm.

===

# Scenario 2: Close the Pre-Book gap

You're still signed in to the same account.

Northwind's missed offer may not be a one-off. Now you check whether Pre-Book offers are falling behind across your regions.

## Check Pre-Book coverage by region

1. [] Start a new chat.
1. [] Enter the following prompt:

    ++For each region, how many open renewals over $250K closing by @lab.Variable(CloseBy) have been offered the Spring '27 Pre-Book Program? Count a deal as offered if a completed Dynamics activity or a post in the West, Central or East channel confirms it was offered. Which region has the lowest coverage, and which of its renewals have had no completed customer activity in the last 14 days?++

    > [+Hint] The answer only uses Dynamics data
    >
    > If the response doesn't include offers from Teams, enter this follow-up prompt:
    >
    > ++Now check the West, Central and East channels for Pre-Book offers that were never logged in Dynamics.++

1. [] Compare the response with the expected regional results:

    | Region | Qualifying renewals | Pre-Book offered | Coverage | No completed activity in 14+ days |
    |---|---|---|---|---|
    | West | 6 | 2 (1 in Dynamics, 1 in Teams only) | 33% | 3 |
    | Central | 5 | 4 | 80% | 1 |
    | East | 7 | 6 | 86% | 0 |
    | **Total** | **18** | **12** | **67%** | **4** |

1. [] Compare the West renewals with the expected detail:

    | Renewal | Value | Close | Stage | Last completed activity | Pre-Book offered | Stalled |
    |---|---|---|---|---|---|---|
    | Northwind Traders | $483,600 | @lab.Variable(NorthwindClose) | Propose | @lab.Variable(NorthwindLastActivity) (@lab.Variable(NorthwindDaysSince) days) | No | Yes |
    | Wide World Importers | $307,250 | @lab.Variable(WideWorldClose) | Develop | @lab.Variable(WideWorldLastActivity) (@lab.Variable(WideWorldDaysSince) days) | No | Yes |
    | Fourth Coffee | $262,900 | @lab.Variable(FourthCoffeeClose) | Propose | @lab.Variable(FourthCoffeeLastActivity) (@lab.Variable(FourthCoffeeDaysSince) days) | No | Yes |
    | Contoso Retail | $296,400 | @lab.Variable(ContosoClose) | Propose | @lab.Variable(ContosoLastActivity) | Yes, logged call | No |
    | Tailwind Traders | $341,750 | @lab.Variable(TailwindClose) | Develop | @lab.Variable(TailwindLastActivity) | Yes, West channel only | No |
    | Alpine Ski House | $253,800 | @lab.Variable(AlpineClose) | Develop | @lab.Variable(AlpineLastActivity) | No | No |

    A good answer includes:

    - **Regional coverage:** West has offered Pre-Book on 2 of 6 qualifying renewals, compared with 4 of 5 in Central and 6 of 7 in East.
    - **Evidence outside CRM:** Lee Gu's West-channel post says he offered the program to Tailwind Traders, but it was never logged in Dynamics.
    - **Stalled renewals:** Northwind Traders, Wide World Importers, and Fourth Coffee have had no completed customer activity in the last 14 days.
    - **Connection to Scenario 1:** Northwind is part of a wider West gap. Retailers that miss the @lab.Variable(PreBookDeadline) deadline also lose co-op marketing funds for the Holiday Blend launch.

> [!Knowledge]
> **Takeaway:** West has three separate problems: low program coverage, stalled deals, and offers that aren't logged in CRM. Each needs a different follow-up.

## Check the data boundary

Alex and Diego have a private chat about Northwind. You aren't part of it.

1. [] Enter the following prompt:

    ++In the sources I can access, is there any evidence that Northwind Traders is considering a competitor?++

1. [] Confirm that Work IQ says it found no evidence in the sources you can access.

> [!Knowledge]
> "No evidence found" doesn't mean there's no competitor activity. It means Work IQ shows only what you're allowed to see. The private chat between Alex and Diego stays private.

## Close the loop

### Assign regional follow-ups

1. [] Enter the following prompt:

    ++Create a follow-up task on each of the three stalled West renewals, assigned to Diego and due @lab.Variable(FollowUpDue), to re-engage the buyer and offer Spring '27 Pre-Book.++

1. [] Review the tasks. Confirm there's one task each for Northwind Traders, Wide World Importers, and Fourth Coffee, assigned to Diego and due **@lab.Variable(FollowUpDue)**.
1. [] Approve the tasks.

> [!Note]
> Work IQ shows you the tasks first. Nothing is created until you approve.

### Prepare a West-channel reminder

1. [] Enter the following prompt:

    ++Write a short post for the West channel about the @lab.Variable(PreBookDeadline) Pre-Book deadline and guaranteed cold brew allocation. Show it to me before posting.++

1. [] Review the post, then approve it.
1. [] **Optional:** Enter the following prompt to answer Adele's open question:

    ++Draft a reply to Adele's @lab.Variable(AdeleQuestion) allocation question and show it to me before posting.++

> [!Note]
> Teams has no drafts. Work IQ shows you the text in the chat and posts only after you approve.

### Schedule a regional pipeline review

1. [] Enter the following prompt:

    ++Find 30 minutes for me and Diego by @lab.Variable(FollowUpDue) to review the West pipeline and send the invite.++

1. [] Check that the time is right in both Central Time (yours) and Pacific Time (Diego's) before you confirm.

> [!Alert]
> The invite is sent as soon as the meeting is created. Check the time zones before you confirm.

===

# Summary

Congratulations! You used Work IQ in Microsoft 365 Copilot to find deal risk that Dynamics 365 alone couldn't show.

In this lab, you:

- [] Combined a Dynamics 365 opportunity with email and Teams conversations to show that a 60% renewal was really at risk.
- [] Found a Pre-Book offer that existed only in a Teams channel post and was never logged in CRM.
- [] Confirmed that Work IQ answers only from the sources you're allowed to access.
- [] Recorded notes and tasks, drafted an email, posted to Teams, and scheduled meetings from the same chat, approving each action first.

> [!Knowledge]
> Structured CRM data tells you what's been logged. Work IQ adds what your team is actually saying in email and Teams, so you can catch gaps before they cost you the deal.
