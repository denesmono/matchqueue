# Handoff: charting the MatchQueue map with /wayfinder

## Where we are

The `/wayfinder` skill (`.agents/skills/wayfinder/SKILL.md`) is running in **chart mode** on the idea in `docs/initial_idea.md`.

- Step 1, naming the destination, is **done**.
- Step 2, breadth-first grilling to surface open decisions, is **in progress**. Two rounds are answered and a third round is waiting for the user's answers (see "Open round" below).
- Steps 3-6 are **not started**. There is no map issue, no tickets and no research branches yet.

Issue tracker: GitHub Issues on `denesmono/matchqueue`, conventions in `docs/agents/issue-tracker.md` (wayfinding operations section). In the cloud session there is no `gh` CLI, so use the `mcp__github__*` tools (load them with ToolSearch).

## How to work with this user

- Talk to them as a **Product Owner**: no technical questions. Frame everything as user-visible behaviour, cost or effort.
- Run grilling in numbered rounds: each question has a recommended answer, worded so "yes" accepts it, and a round contains the whole current frontier.
- The user is Hungarian and the app UI is Hungarian. The specification and tickets are in **English**, with the exact Hungarian UI texts quoted word for word where `docs/initial_idea.md` gives them. For new UI messages, the agent drafts the Hungarian wording and the user reviews it.
- `CLAUDE.md` rules still apply (commit and push only when asked, keep changes focused). The user has now explicitly asked for the commit and push of this handoff and `GLOSSARY.md`.

## Destination (agreed)

A complete specification of the **first release** of MatchQueue, ready to be split into build tickets. Nothing is built in this effort.

**Out of scope (not for this map):**
- Profile deletion by users. The Admin deletes users on request instead.
- A changeable match day (Tuesday is fixed).
- User status messages.
- Hosting and technology decisions. The user wants a **separate session** for these, so do not decide stack, database or hosting here.

## Decisions made so far

Term definitions live in `GLOSSARY.md`. Use its vocabulary. The decisions below are rules that are not in the glossary.

- **Match timing:** the match is played Tuesday 19:00. The sign-up round runs from Monday 08:00 to the match start. Sign-ups after 18:00 are rare.
- **Weekly matches:** a new Match is created automatically each week from the Match defaults (location, time, total price). The Admin edits the defaults for winter and summer seasons and can override a single Match.
- **Price per person:** total divided by current confirmed players, rounded up to a whole number, with a label saying it changes when players join or cancel.
- **Monthly pass:** early access only, no guaranteed place. A paused pass lasts one sign-up round. A paused pass holder also stops reserving a goalkeeper place for the early-window rule.
- **Early-window goalkeeper rule:** a non-pass Goalkeeper may sign up during the pass window only if (goalkeepers already signed up + pass-holding goalkeepers not yet signed up and not paused) is below 2. The three examples in `docs/initial_idea.md` all fit this reading.
- **Goalkeeper limit and waitlist** (the user changed my proposal): a third Goalkeeper is *not* rejected. They join the waitlist and are skipped for promotion while that would exceed 2 Goalkeepers. They can move up if a Goalkeeper cancels or if they change role. This is **proposed in Q1 of the open round and not yet confirmed**.
- **Cancellation and sanctions:**
  - Free until Tuesday 11:59:59.
  - From Tuesday 12:00, a cancellation that leaves fewer than 12 players is a late cancellation and carries a sanction. At 12 or more it is free (the free-cancellation message is shown).
  - Cancelling from the waitlist is always free.
  - The app only warns. It does not track payments.
- **After Tuesday 17:00** (the user changed my proposal): the waitlist **keeps promoting**, but promoted players see "A megjelenés nem kötelező". An inaccurate price per person in that case is acceptable.
- **Re-sign-up:** allowed after cancelling. It gets a new timestamp at the back of the queue, and the struck-through cancelled entry stays visible.
- **Outsiders:**
  - The adder picks the role.
  - Allowed only from Monday 12:00.
  - The adder can cancel them, and the Admin can cancel anyone's entry.
  - The adder does not have to be signed up.
- **Notifications:** none in the first release.
- **Nickname and role:** both editable at any time. A role change does not alter existing sign-ups.
- **Admin:** exactly one, designated at first setup, handles data-removal requests by deleting the user.

## Open round (asked, awaiting the user's answers)

These were posed with recommended answers. If the user replies "yes" or "all yes", accept them. Quote the exact wording from the conversation if it is still available, otherwise re-ask.

1. **Goalkeeper waitlist:** waitlist is strictly in sign-up order but skips a Goalkeeper who would break the limit. A Goalkeeper can sit on the waitlist while places are free, shown below the line with an explanation.
2. **Match states:**
   - Before Monday 08:00, details are visible and sign-up is disabled with a note.
   - At Tuesday 19:00, sign-up and cancellation stop. With fewer than 10 players the match is marked cancelled ("elmarad").
   - At Wednesday 00:00, the app switches to the next Match.
3. **Defaults change:** new defaults apply to every Match whose sign-up round has not started and that was not hand-edited.
4. **Registration:** sign in with Google, fill the form (nickname prefilled, role), then see only a "waiting for approval" screen. The Admin sees pending registrations with Google name and email (email visible to the Admin only). A rejected or blocked person sees a neutral message. The Admin is auto-approved.
5. **Admin history view:** a read-only view of the last five weeks of Matches with all sign-up and cancellation times. Normal users see only the current Match.
6. **20-sign-up cap:** only active sign-ups count (attendee list plus waitlist). The 21st attempt gets a clear "full" message.
7. **Pass changes:** take effect from the next sign-up round. Pausing is possible only before Monday 08:00.
8. **Rules link:** a single link, editable by the Admin next to the Match defaults.
9. **Devices:** phone first, desktop also works.
10. **Hungarian copy:** the agent drafts new texts and the user reviews them.

## Known ambiguities in `docs/initial_idea.md`

- The cancellation paragraph says that when 12 or more players remain, the dialog shows "the same text as in the previous point". I read that as the free-cancellation message (Q6 in round 2 was accepted on that basis).
- The doc counts sanctions for the first 14 and for late cancellers but never says how a no-show is handled. The answer is likely "outside the app", so check.

## Likely fog for the map's "Not yet specified" section

Screen-by-screen layout and flows, what exactly is deleted when the Admin removes a user (including their entries in matches still within the five-week retention), the stored block list for re-registration, the exact Hungarian copy, and the concurrency rule "who gets the last place" (`CLAUDE.md` already states server-side timestamps and atomic transitions). Treat these as candidates, not decisions.

## Next steps

1. Get the user's answers to the open round. Fold any change into `GLOSSARY.md` straight away (for example "Promotion" if the goalkeeper rule changes).
2. Run one more breadth-first round only if real gaps remain, then ask the user to confirm shared understanding, as the grilling skill requires.
3. Create the map issue (label `wayfinder:map`) with Destination, Notes, empty Decisions-so-far, the fog and the out-of-scope list above. Then create child tickets and wire blocking in a second pass. Most remaining tickets will be `grilling`, and probably a `prototype` ticket for the match screen. The hosting and technology question stays out of scope.
4. The skill's rule: no ticket is resolved in the charting session, except research tickets, which go to subagents.

## Suggested skills

- `wayfinder`: drives the whole flow.
- `grilling` and `domain-modeling`: needed for the destination, for each grilling ticket and for any glossary change.
- `prototype`: for a screen or behaviour ticket.
- `research`: for any research ticket.

## Repo state

`GLOSSARY.md` is the only domain artifact so far. Nothing else was changed. Work happens on branch `claude/stoic-mayer-1c11sn`.
