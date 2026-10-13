## Before you're done

This repo has been created for your Microsoft Ignite 2026 session. Here's how to get it ready.

**Easiest path — use the agent (recommended):**

- Open GitHub Copilot Chat and say `help me initialize repo`. The agent will walk you through getting the README populated.
- When you're ready to publish, say `help me finalize repo`. The agent will clean up unused folders, validate everything, and remove this "Before you're done" section and other extra stuff that attendees don't need to see.
- Curious how it works? Read the [agent workflow](.github/AGENT-WORKFLOW.md).

**Doing it manually?**

Fill in the sections below yourself, then:

- Delete any placeholder folders you don't need (`data/`, `infra/`, etc.)
- Delete this "Before you're done" section
- Delete `.github/agents/`, `.github/tests/`, `.github/copilot-instructions.md`, and `.github/AGENT-WORKFLOW.md` — these are template tooling, not part of your published repo

**Folder conventions:**

- Attendee step-by-step guidance goes in `instructions/`. If you use MkDocs or a docs site instead, put it in `docs/` and link to it from this README.
- Reference material and background reading go in `docs/`.
- You can add a `.devcontainer/` folder if needed.

---

<a name="start-building"></a>

<p align="center">
<img src="img/banner-ignite-26.png" alt="Microsoft Ignite 2026" width="100%"/>
</p>

# [Microsoft Ignite 2026](https://ignite.microsoft.com)

## 🔥LAB671: Build a proactive intelligence agent using Work IQ
### Session description

Step into the role of a sales leader at Zava, a fictional specialty coffee roaster, and use Work IQ to find the deal risk your CRM can't see. You'll combine Dynamics 365 opportunities and service cases with your team's email, Teams conversations, and seasonal program announcements to spot stalled renewals and missed pre-book offers. Then you'll act on what you find, without leaving the chat.

### 🚀 Getting started

#### In a guided session

If you're following along during a live session:

1. Sign in to the lab environment with the credentials on the **Instructions** tab.
2. Open Microsoft 365 Copilot at `https://m365.cloud.microsoft/chat`.
3. Follow the steps in [`instructions/`](instructions/README.md), starting with Scenario 1.

#### On your own

If you're learning at your own pace:

1. Read the scenario, people, and data in the [lab guide](instructions/lab671-instructions.md).
2. Work through Scenario 1 and Scenario 2, comparing the prompts with the expected results.
3. Try similar prompts against your own Dynamics 365 and Microsoft 365 data.

> [!NOTE]
> The lab runs against a pre-seeded Zava environment. The expected results in the guide match that data only.

### 🎯 Learning outcomes

By the end of this session, you will be able to:

- Use Work IQ to combine Dynamics 365 sales and service data with Microsoft 365 email and Teams conversations to find deal risk that isn't visible in CRM alone.
- Explain how Work IQ respects user permissions, answering only from the data the signed-in user can access.
- Turn findings into action from the chat by creating CRM notes and tasks, drafting email, posting to Teams, and scheduling meetings, with approval before each change.

### 💻 Technologies used

1. Work IQ
2. [Microsoft 365 Copilot](https://learn.microsoft.com/copilot/microsoft-365/microsoft-365-copilot-overview)
3. [Dynamics 365 Sales](https://learn.microsoft.com/dynamics365/sales/)
4. [Dynamics 365 Customer Service](https://learn.microsoft.com/dynamics365/customer-service/)
5. [Microsoft Teams](https://learn.microsoft.com/microsoftteams/)

### 📚 Continue your learning

Pick your next step based on your learning style:

| Resource | What you'll get |
|----------|-----------------|
| **[Ignite 2026 Next Steps](https://aka.ms/ignite26-next-steps)** | Additional session repos and materials from Microsoft Ignite 2026 |
| **[Microsoft AI Skills Navigator](https://aka.ms/ignite26-asn)** | Discover AI skills, learning paths, and resources for your next step |
| **[Microsoft Learn](https://aka.ms/ignite26-learn)** | Official documentation and guided learning paths on these topics |
| **[Microsoft Foundry Community](https://aka.ms/MicrosoftFoundryDiscord-Ignite26)** | Connect with other learners and experts in our Discord community |

### 🌟 Microsoft Learn MCP Server

<!-- Remove this section if the Microsoft Learn MCP Server is not relevant to the session. -->

The Microsoft Learn MCP Server gives your AI agent direct access to Microsoft's official documentation — grounded, up-to-date answers about the topics in this session.

**GitHub Copilot CLI** — Install with:

```shell
copilot plugin install microsoftdocs/mcp
```

**VS Code** — One-click install:  
[![Install in VS Code](https://img.shields.io/badge/VS_Code-Install_Microsoft_Learn_MCP-0098FF?style=flat-square&logo=visualstudiocode&logoColor=white)](https://vscode.dev/redirect/mcp/install?name=microsoft-learn&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Flearn.microsoft.com%2Fapi%2Fmcp%22%7D)

For more information, visit the [Learn MCP Server repo](https://aka.ms/learnmcp).

### 👥 Content owners

<!-- TODO: Add yourself as a content owner
1. Change the src in the image tag to {your github url}.png
2. Change INSERT NAME HERE to your name
3. Change the github url in the final href to your url. -->

<table>
<tr>
    <td align="center"><a href="http://github.com/yourGitHubHandle">
        <img src="https://github.com/yourGitHubHandle.png" width="100px;" alt="INSERT NAME HERE"/><br />
        <sub><b>INSERT NAME HERE</b></sub></a><br />
            <a href="https://github.com/yourGitHubHandle" title="talk">📢</a>
    </td>
</tr></table>

### ⚖️ Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow [Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks/usage/general). Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.

Any use of third-party trademarks or logos are subject to those third-party's policies.
