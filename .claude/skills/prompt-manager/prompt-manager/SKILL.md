---
name: prompt-manager
description: Use this skill when the user wants to add a prompt, list prompts, run their prompt queue, or schedule the queue to run at a specific time. Manages a SQLite-backed list of prompts with lifecycle tracking.
---

# Prompt Manager

Manages a SQLite-backed list of prompts with created/completed timestamps.

## Database
The database (`prompts.db`) lives in this skill's directory and is created automatically on first use.

## CLI
```
python ~/.claude/skills/prompt-manager/prompts.py add "text"    # add a new prompt
python ~/.claude/skills/prompt-manager/prompts.py list          # list all prompts (table)
python ~/.claude/skills/prompt-manager/prompts.py get <id>      # get a single prompt by id
python ~/.claude/skills/prompt-manager/prompts.py complete <id> # mark a prompt complete
```

## When Invoked

### Mode A — Add a prompt
**Trigger**: user asks to add, create, or save a prompt (e.g. "Add prompt Fix the login bug")

Extract the prompt text from the user's message and run:
```
python ~/.claude/skills/prompt-manager/prompts.py add "<extracted text>"
```
Report the new prompt ID to the user.

### Mode B — List prompts
**Trigger**: user asks to list, show, or view prompts

Run:
```
python ~/.claude/skills/prompt-manager/prompts.py list
```
Display the output table to the user.

### Mode C — Run the queue
**Trigger**: user asks to "run my queue", "work through the queue", "run the prompts", or similar

1. Run `python ~/.claude/skills/prompt-manager/prompts.py list` to retrieve all prompts.
2. From the table output, collect all rows where the `Done` column value is `no`, preserving their order.
3. If none are found, report "Queue is empty." and stop.
4. For each incomplete prompt, in order:
   a. Announce which prompt is being executed (ID + prompt text).
   b. Interpret the prompt text as a user instruction and carry it out fully using available tools.
      - **Retry policy**: If the attempt fails due to a transient, external cause outside your control (server unreachable, network timeout, rate-limit, temporary API error), do NOT mark the prompt failed. Instead, wait up to 5 minutes (`sleep 300`) and retry. Keep retrying until the task succeeds. Only give up and move on if the failure is clearly caused by the prompt itself (bad input, non-existent file, logical impossibility) — in that case, note the error and mark the prompt complete anyway so the queue can continue.
   c. Once the task is complete, run `python ~/.claude/skills/prompt-manager/prompts.py complete <id>`.
   d. Confirm it was marked complete, then proceed to the next prompt.
5. After all prompts are processed, run `list` again and display the final state.

### Mode D — Schedule the queue
**Trigger**: user asks to run the queue at a specific time (e.g. "Run my queue at 8pm tonight", "Start my queue at 9am tomorrow")

1. Parse the target time from the user's message. Convert relative expressions ("tonight", "tomorrow", "in 2 hours") to an absolute date/time using today's date (available in your context as `currentDate`).
2. Invoke the `schedule` skill with a clear, self-contained instruction such as:
   > "Run my prompt queue using the prompt-manager skill. Execute each incomplete prompt in order, mark each complete when done, then show the final queue state."
   and set the scheduled time to the parsed datetime (one-time run, not recurring).
3. Report the scheduled time back to the user and confirm the job was created.
