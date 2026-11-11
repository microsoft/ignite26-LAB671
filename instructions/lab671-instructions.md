<!--
  Lab 671 participant guide (Skillable Studio Markdown). Guide v2.2, for seeding scripts v1.13. Meeting prompts ask for the first slot in the next three business days, starting tomorrow.
  Cast: Joni Sherman, Nestor Wilke, Lynne Robbins and Allan Deyoung (replacing Adele, Lee, Johanna and Pradeep).
  Before publishing, confirm with the @lab button in the editor:
    - the VM name in the @lab.VirtualMachine(...) tokens
    - the credential name in the @lab.CloudPortalCredential(...) tokens
  Prompts use ++text++ (select to copy, paste with Ctrl+V). Usernames use +++text+++ (typed into the VM). No passwords are written in this guide.
  Dates are relative to the lab day, so no edits are needed per session.
-->
If Windows asks you to sign in, use:

- Username: ++@lab.VirtualMachine(Win11-Pro-Base).Username++

Use this account for Microsoft 365 and Dynamics 365:

- Username: +++@lab.CloudPortalCredential(User1).Username+++

## About this lab

**Time:** about 35 minutes

You are **Megan Bowen**, the **National Sales Manager** at **Zava**, a fictional specialty coffee roaster. Zava sells whole-bean coffee and a new canned Nitro Cold Brew to grocery chains, café groups and hospitality accounts in three regions: West, Central and East. You work from Chicago, on Central Time.

In this lab you use **Microsoft 365 Copilot**, powered by **Work IQ**, to bring together Dynamics 365 Sales, your email and Teams. You find deal risks the CRM doesn't show, then act on them from the chat: update Dynamics, draft email, post in Teams and book meetings.

- **Scenario 1, Save the renewal:** find out why a key renewal is at risk and get the account team moving.
- **Scenario 2, Close the Pre-Book gap:** check whether the problem is bigger than one deal, and assign follow-ups.

### The Spring '27 Pre-Book Program

A few weeks ago, Zava's VP of Sales launched a program for retailers: 10% off spring orders placed by the deadline, plus guaranteed allocation of the new Nitro Cold Brew, which has limited supply in its first year. Account teams are expected to offer it in every renewal conversation.

### Who's who

| Name | Role |
|---|---|
| **Megan Bowen (you)** | National Sales Manager, all regions |
| Patti Fernandez | VP of Sales, launched the Pre-Book Program |
| Diego Siciliani | Regional Sales Manager, West |
| Alex Wilber | Account Manager, West (owns Northwind Traders) |
| Nestor Wilke | Account Manager, West |
| Joni Sherman | Cold Brew Product Specialist, West |
| Lynne Robbins | Account Manager, Central |
| Allan Deyoung | Account Manager, East |
| Isaiah Langer | Customer Care Lead |

Your inbox, the **Zava Sales** team in Teams and the Dynamics 365 Sales records were set up for you before the lab started.

===

# Get started

1. [] If Windows is locked, sign in with the Windows account shown on the first page and the password on the **Resources** tab.
1. [] Open **Microsoft Edge** and go to ++https://m365.cloud.microsoft/chat++ to open **Microsoft 365 Copilot**.
1. [] Sign in with your lab username: +++@lab.CloudPortalCredential(User1).Username+++

    If you're asked for a password or a **Temporary Access Pass**, use the one shown on the **Resources** tab of the lab. If you're asked to stay signed in, select **Yes**. Dismiss any first-run tips.

1. [] Open a new tab and go to ++https://outlook.office.com++. Your inbox should include an email from **Patti Fernandez** about the **Spring '27 Pre-Book Program**.

    > [!Note] If your inbox is empty, ask a proctor before you continue. The lab depends on this content.

### How to use the prompts in this lab

Select a prompt to copy it, paste it into the Copilot chat box with **Ctrl+V**, then press **Enter**.

Answers vary from run to run, so look for the facts rather than the exact wording. If Copilot can't find something, ask again or rephrase. If it still can't, ask a proctor.

===

# Connect Copilot to Dynamics 365

Copilot reaches Dynamics 365 through **Business Applications in Work IQ**. In your own organization an administrator sets this up once for everyone. In this lab you're the administrator, so check three settings first. Each takes about a minute.

### Setting 1: Turn on the Microsoft Dataverse connector

1. [] Open a new tab and go to the **Microsoft 365 admin center** at ++https://admin.microsoft.com++.
1. [] In the left menu, select **Agents** to expand it, then select **Tools**.
1. [] On the **Plugins** tab, search for ++dataverse++.
1. [] Select **Microsoft Dataverse** to open its details, then select **Install**.

    > [!Note] "Available" only means the plugin can be installed. Copilot can't use it until you install it.

1. [] Under **Installed for**, make sure **All users** is selected, then select **Next**.
1. [] On the **Review** page, check the details and finish the install. You should see **Microsoft Dataverse has been installed successfully**, and the **Install** button changes to **Uninstall**.

### Setting 2: Find the Sales environment and turn on Work IQ

1. [] Open a new tab and go to the **Power Platform admin center** at ++https://admin.powerplatform.microsoft.com++.
1. [] Select **Manage**, then **Environments**, then **IgniteLab Sales**.

    > [!Note] IgniteLab Sales is the environment with Dynamics 365 Sales. Ignore the other environments in the list.

1. [] In the **Details** card, find **Environment URL** (it ends in **.crm.dynamics.com**). Select and copy it, then paste it into **Notepad** so you have it ready. You'll need it in Setting 3.

    > [!Note] Every lab has its own Sales environment, so your URL is different from the one in the screenshot.

1. [] At the top of the page, select **Settings**. Under **Product**, select **Features**.
1. [] Scroll down to the **Work IQ** section. Make sure **Turn on Business Applications in Work IQ** is checked. If you change it, select **Save** at the bottom of the page.

### Setting 3: Connect Dataverse in Copilot

The admin settings above make Dataverse available to everyone. Now connect it to your own Copilot.

1. [] Go back to the **Copilot** tab.
1. [] At the bottom left of Copilot, next to your name, select the **gear icon**, then select **Settings**.
1. [] Select **Sources**, then search for ++dataverse++.
1. [] Next to **Microsoft Dataverse**, select **Connect**.
1. [] In **Connect to Microsoft Dataverse**, select **Continue to Microsoft Dataverse**.
1. [] When you're asked for the environment URL, paste the **Environment URL** you copied into Notepad in Setting 2, then continue.

    > [!Note] If the URL is rejected, add **https://** to the start, for example https://ignitelab-xxxx.crm.dynamics.com.

1. [] When you're asked to sign in, select your lab account (the same account you used to sign in to Copilot). If you're asked to accept permissions, select **Accept**.
1. [] Check for the message **Microsoft Dataverse is now connected**. The **Connect** button next to Microsoft Dataverse is gone. Then close **Settings**.

### What you just turned on

The three settings work together, and Copilot needs all of them to reach your Dynamics 365 data:

- **Setting 1** installed the Microsoft Dataverse plugin for everyone in your organization, so Copilot is allowed to use it.
- **Setting 2** turned on Work IQ in the IgniteLab Sales environment, so that environment's Dynamics 365 data can be read by Copilot.
- **Setting 3** connected Dataverse to your own Copilot and pointed it at IgniteLab Sales, signed in as you.

Copilot still uses your own permissions: it sees only the Dynamics records your account can see, just like your email and Teams.

### Check the connection

1. [] Go back to the **Copilot** tab and select **New chat**. Enter:

    ++Which Dynamics 365 opportunities do we have with Northwind Traders?++

    You should see the **Northwind Traders – FY27 Wholesale Supply Agreement Renewal** opportunity.

> [+Hint] Copilot says it can't reach Dynamics 365
>
> Settings can take a few minutes to apply. Wait two or three minutes, start a **New chat** and ask again. If it still can't find the opportunity, ask a proctor.

===

# Scenario 1: Save the renewal

Northwind Traders, a 45-store grocery chain in the West, is up for renewal. Dynamics 365 shows the deal at 60% and on track. Find out where it really stands.

## Step 1: Get the full picture

1. [] In Copilot, enter:

    ++Give me the state of the Northwind Traders renewal, including the Dynamics opportunity, what the account team and Customer Care have discussed in email and Teams I can access over the last 30 days, and whether there is evidence that anyone has offered Northwind the Spring '27 Pre-Book Program.++

1. [] Review the answer. Copilot draws on Dynamics 365, your inbox and the Zava Sales channels in one response.

> [+Hint] Check your answer
>
> A good answer includes:
>
> - **The opportunity:** FY27 Wholesale Supply Agreement Renewal, $483,600, Propose stage, 60% probability, closing in about six weeks. The last completed activity was about three weeks ago.
> - **A shipping problem:** Isaiah Langer emailed that the Holiday Blend order was short-shipped to two of Northwind's three distribution centers. It's still unresolved.
> - **An unanswered customer question:** Joni Sherman asked in the West channel whether Northwind can get guaranteed Nitro Cold Brew allocation for its spring reset. Nobody has replied.
> - **A missed offer:** the Pre-Book Program guarantees that allocation, but there's no sign anyone has offered it to Northwind.

**Why it matters:** Dynamics shows a healthy 60%, but the real risks are in email and Teams: a shipping problem and a buyer question nobody has answered. The Pre-Book Program solves the buyer's problem, if someone offers it in time.

===

# Scenario 1: Close the loop

Now act on what you found, without leaving the chat.

> [!Note] When Copilot is about to create or change something, it shows you the details first. Read them, then approve. Nothing is saved, sent or posted until you approve it.

## Step 2: Record the risk and assign a next step

1. [] Enter:

    ++Add a note to the Northwind renewal summarizing the risks you found, including the shipment issue and that no Pre-Book offer has been made, and create a task for Alex due in one week to offer the program and confirm cold brew allocation.++

1. [] Review the note and the task, then approve them.
1. [] Optional: check the records in Dynamics 365.
    1. Open a new tab and go to ++https://make.powerapps.com++. Power Apps opens in the **Contoso (default)** environment, which has no apps.
    1. At the top right, select **Environment: Contoso (default)**, then select **IgniteLab Sales** from the list.
    1. In the left menu, select **Apps**. Above the list, select **All**. (The default, **My apps**, hides Sales Hub.)
    1. Find **Sales Hub** in the list and select its name to open it.
    1. In Sales Hub, select **Opportunities** in the left menu. At the top of the list, make sure the view is set to **All Opportunities**. If it shows another view, such as My Open Opportunities, select the view name and choose **All Opportunities**.
    1. Open **Northwind Traders – FY27 Wholesale Supply Agreement Renewal**. The note and task you approved are in the **Timeline**.

## Step 3: Draft an email to the account team

1. [] Enter:

    ++Draft an email from me to Alex, cc Joni, Diego and Isaiah, covering the Pre-Book offer, the answer to the buyer's cold brew allocation question, and the status of the Holiday Blend shipment issue. Save it as a draft; don't send it.++

1. [] In **Outlook**, open your **Drafts** folder. The email is there and hasn't been sent.

## Step 4: Bring the account team together

1. [] Enter:

    ++Find the first 30 minutes in the next three business days, starting tomorrow, when Alex, Joni and I are all free, and send an invite called "Northwind renewal – save plan."++

1. [] Review the proposed time. You're on Central Time; Alex and Joni are on Pacific Time.

    > [!Note] The invite is sent as soon as you approve it.

> [+Hint] Check your answer
>
> Copilot should suggest **two business days from today at 12:00 PM Central (10:00 AM Pacific)**. Alex and Joni are busy before then.

===

# Scenario 2: Close the Pre-Book gap

Northwind's missed offer may not be a one-off. Check whether Pre-Book offers are falling behind across your regions.

## Step 5: Check coverage by region

1. [] Enter:

    ++For each region, how many open renewals over $250K closing in the next 90 days have been offered the Spring '27 Pre-Book Program? Count a deal as offered if a completed Dynamics activity or a post in the West, Central or East channel confirms it was offered. Which region has the lowest coverage, and which of its renewals have had no completed customer activity in the last 14 days?++

1. [] If the answer only uses Dynamics 365, follow up with:

    ++Now check the West, Central and East channels for Pre-Book offers that were never logged in Dynamics.++

> [+Hint] Check your answer
>
> | Region | Qualifying renewals | Offered Pre-Book | No activity in 14+ days |
> |---|---|---|---|
> | West | 6 | 2 | 3 |
> | Central | 5 | 4 | 1 |
> | East | 7 | 6 | 0 |
>
> - **West is behind:** only 2 of its 6 renewals have been offered the program.
> - **An offer the CRM missed:** Nestor Wilke posted in the West channel that he offered the program to Tailwind Traders, but it was never logged in Dynamics.
> - **Stalled deals:** Northwind Traders, Wide World Importers and Fourth Coffee have had no completed customer activity in the last 14 days.

**Why it matters:** the West has three separate problems: low program coverage, stalled deals, and offers that aren't logged in the CRM. A CRM-only report would miss Tailwind's offer entirely.

===

# Scenario 2: Check what you can see

## Step 6: Test the data boundary

Alex and Diego have a private team in Teams where they discuss Northwind. You aren't a member.

1. [] Enter:

    ++In the sources I can access, is there any evidence that Northwind Traders is considering a competitor?++

1. [] Review the answer. Copilot should say it found no evidence in the sources you can access.

**Why it matters:** Copilot only uses content you're allowed to see. "No evidence found" doesn't mean there's no competitor activity, only that nothing in your email, chats, channels or Dynamics records mentions it. The same permissions apply to everything Copilot does for you.

===

# Scenario 2: Close the loop

## Step 7: Assign follow-ups in the West

1. [] Enter:

    ++Create a follow-up task on each of the three stalled West renewals, assigned to Diego and due in one week, to re-engage the buyer and offer Spring '27 Pre-Book.++

1. [] Review the three tasks, then approve them.

## Step 8: Remind the West team

1. [] Enter:

    ++Write a short post for the West channel about the Pre-Book deadline and guaranteed cold brew allocation. Show it to me before posting.++

1. [] Review the post. Approve it to post, or ask for changes first.
1. [] Optional: enter:

    ++Draft a reply to Joni's allocation question in the West channel and show it to me before posting.++

> [!Note] Teams has no drafts, so Copilot shows you the text in the chat and posts it only after you approve.

## Step 9: Schedule a pipeline review

1. [] Enter:

    ++Find the first 30 minutes in the next three business days, starting tomorrow, when Diego and I are both free, and send an invite to review the West pipeline.++

1. [] Review the proposed time in Central (yours) and Pacific (Diego's), then approve it.

> [+Hint] Check your answer
>
> Copilot should suggest **the next business day at 1:00 PM Central (11:00 AM Pacific)**. Diego is busy until then.

===

# Summary

In this lab you used Microsoft 365 Copilot and Work IQ to:

- Combine **Dynamics 365 Sales** with **email and Teams** to find a renewal risk the CRM didn't show.
- Spot a **regional pattern**, including an offer that was **never logged** in the CRM.
- **Act from the chat:** add a note and tasks in Dynamics, draft an email, post in Teams and book meetings, approving each step.
- See that Copilot **respects permissions**: it only uses content you can access.

To learn more, ask a proctor about Business Applications in Work IQ.

**Congratulations, you've completed the lab.**
