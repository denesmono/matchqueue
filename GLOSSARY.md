# MatchQueue

A private web application for a group of friends who play one football match a week. It manages who signs up for the match, who waits for a place, and who cancels.

## Language

### The match and its sign-up period

**Match**:
The weekly football game, played on Tuesday at 19:00, that users sign up for. One Match is created automatically each week.
_Avoid_: Event, game, round

**Match defaults**:
The location, time and total price copied into every automatically created Match. The Admin changes them when the season changes (winter is more expensive than summer).
_Avoid_: Settings, template

**Match price**:
The total cost of the pitch for one Match.
_Avoid_: Fee, rent

**Price per person**:
The Match price divided by the number of players currently on the Attendee list, rounded up to a whole forint. It changes whenever players join or cancel, and the screen says so.
_Avoid_: Share, fee

**Sign-up round**:
The period in which one Match accepts sign-ups, from Monday 08:00 until the Match starts on Tuesday 19:00.
_Avoid_: Round (alone), registration period

**Pass window**:
The first part of the Sign-up round, Monday 08:00 to 11:59:59, in which only Pass holders may sign up (with a goalkeeper exception).
_Avoid_: Early window, priority window

**Open window**:
The rest of the Sign-up round, from Monday 12:00 until the Match starts, in which any Active user may sign up.
_Avoid_: Public window, general window

### People

**User**:
A person with a MatchQueue account, created by signing in with Google and registering.
_Avoid_: Member, account

**Active user**:
A User whose registration the Admin has approved.
_Avoid_: Approved member, verified user

**Admin**:
The single maintainer of the site, who approves registrations, manages passes and can remove users.
_Avoid_: Administrator, owner, moderator

**Nickname**:
The unique display name a User chooses (Hungarian: "Becenév"). It starts as the Google name and can be changed.
_Avoid_: Username, display name

**Outsider**:
A person without an account who is signed up by a User, by name only.
_Avoid_: Guest, external player, non-user

### Roles

**Role**:
What a person plays: Goalkeeper, Flexible goalkeeper or Field player.
_Avoid_: Position, type

**Goalkeeper**:
A person who only plays in goal (Hungarian: "Kapus").
_Avoid_: Keeper

**Flexible goalkeeper**:
A person who plays in goal or in the field (Hungarian: "Kapus vagy akár mezőnyjátékos"). Does not count toward the Goalkeeper limit.
_Avoid_: Hybrid, substitute keeper

**Field player**:
A person who plays outside the goal (Hungarian: "Mezőnyjátékos").
_Avoid_: Outfield player

**Goalkeeper limit**:
At most two Goalkeepers may be on the Attendee list of one Match.

### Passes

**Monthly pass**:
An entitlement that gives a User access during the Pass window. It does not guarantee a place.
_Avoid_: Subscription, membership

**Pass holder**:
A User who currently holds a Monthly pass.
_Avoid_: Member, subscriber

**Paused pass**:
A Monthly pass the Admin has disabled for one Sign-up round. The holder has no Pass window access that week and the pass resumes by itself afterwards.
_Avoid_: Suspended pass, cancelled pass

### Sign-ups and the lists

**Sign-up**:
One entry for one person on one Match, stamped with the time it was made. A person has at most one active Sign-up per Match.
_Avoid_: Registration (that is for accounts), booking, entry

**Attendee list**:
The Sign-ups that hold one of the 14 places, in order of sign-up time.
_Avoid_: Player list, roster, confirmed list

**Waitlist**:
Active Sign-ups that do not hold a place, in order of sign-up time. The list is unlimited in principle but a Match accepts at most 20 Sign-ups in total.
_Avoid_: Queue, reserve list

**Promotion**:
A waitlisted Sign-up moving onto the Attendee list when a place becomes free. A Goalkeeper is not promoted while that would exceed the Goalkeeper limit.
_Avoid_: Move-up, upgrade

**Cancelled sign-up**:
A Sign-up that was withdrawn. It stays visible, struck through, with the time of cancellation.
_Avoid_: Deleted sign-up, removed entry

**Standby cut-off**:
Tuesday 17:00. Before it, a promoted player must attend. After it, a promoted player is told attendance is not mandatory ("A megjelenés nem kötelező").
_Avoid_: Deadline

### Cancelling and consequences

**Free cancellation**:
A cancellation that carries no Sanction: any cancellation before Tuesday 12:00, a cancellation from the Waitlist at any time, or one after Tuesday 12:00 that leaves at least 12 players.
_Avoid_: Penalty-free cancel

**Late cancellation**:
A cancellation from Tuesday 12:00 that leaves fewer than 12 players, which carries a Sanction.
_Avoid_: No-show

**Sanction**:
The obligation to pay one's share of the Match price after a Late cancellation, unless the person finds a replacement. It is settled outside the app, and the app only warns about it.
_Avoid_: Fine, penalty
