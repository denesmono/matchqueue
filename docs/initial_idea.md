I would like to develop a web application to manage the sign-ups for weekly matches with my friends. It's name would be MatchQueue.

General expectations
* Free or cheap to maintain (less than 10.000 HUF / year)
* Backend in Java
* Expected load: on Monday and Tuesday 20-25 people logs in and indicate their interest
* All users are expected to be Hungarian, thus the language of the UI should be Hungarian

Types of users
* Admin (the maintainer of the site)
* Normal

Registration
* Users must indicate their role, i.e., whether they are goalkeepers or not. There are three options: 1) "Kapus", 2) "Kapus vagy akár mezőnyjátékos", and 3) "Mezőnyjátékos"
* Users must set a nickname ("Becenév"). The nickname is by default their name as provided by Google, but this value can be modified. The nickname must be unique within the app
* The admin also has to register
* User registrations must be approved by the admin to become active

Profile management
* Users can set and unset a status message (max length is 100 characters). This is primarily for indicating if they are unavailable for a longer period, e.g., because of an injury or vacation.
* Users can delete their profile and all their data stored by this application after a confirmation.

Features available for admin
* All features normal users can access
* Deleting the registration of any normal user, optionally blocking their re-registration with the same Google account.
* Disabling the monthly pass of any users for the next round of sign-up
* Marking users as holders of a monthly pass

Features available for normal users
* Checking the details of the next match: who signed up, where and when is it going to take place, the price of the match overall and per person
* Accessing the rules (via a link to a specific Google Site)
* Signing up
* Canceling their own sign-up

Signing up
* From Monday 8:00 to 11:59:59 in the morning: only users with a monthly pass are allowed to sign up, except for goalkeepers if there are less than two goalkeepers who hold a monthly pass. Examples: 
** 1 goalkeeper has signed up but there is another one with a monthly pass who haven't indicated their interested yet --> no goalkeeper without a monthly pass can sign up.
** 1 goalkeeper has signed up but there is no other goalkeeper who holds a monthly pass --> one goalkeeper can sign up
** No goalkeeper has signed up but there is 1 goalkeeper with a monthly pass who havent't indicated their interest yet --> one goalkeeper without a monthly pass can sign up
* From Monday 12:00 to Tuesday 19:00: any registered user can sign up
* Any sign-up attempts outside these two windows are rejected
* At most two goalkeepers can sign up for a match. Those who are not just goalkeepers are not taken into account in this limit.
* The maximum number of players is 14, the minimum is 10. When the minimum is not reached until Tuesday 19:00, the match is canceled. When the maximum is reached, players signing up are put on an unlimited wait list and a warning dialog is displayed to them saying "Várólistára kerültél. A várólistáról szankciók nélkül le lehet jelentkezni. Ha viszont kedd 17:00-ig lemondja valaki a részvételt és ezáltal az első 14 főbe kerülsz, köteles vagy eljönni, különben ugyanazok a szankciók vonatkoznak rád, mint az első 14 jelentkezőre. Kedd 17:00 után viszont nem várható el, hogy készenlétben állj, ezért utána már nem téged érintenek a szankciók, hanem azt, aki olyan későn mondta le a focit."
* Users can sign up someone who has no account by providing their name. For such sign-ups, the name of the user who signed up this outsider is shown. There is no limit on how many outsiders can be signed up by a single user
* Users get a clear feedback about the result of their sign-up attempt (success/failure)
* A user can sign up only once to a single match
* At most 20 players can sign up to a single match, including the wait list. More players signing up is so unrealistic that it would most certainly be a malfunction or a malicious attempt to render the app unusable.

Cancellation
* From Monday 8:00 to Tuesday 11:59:59: cancellation is free, therefore an info modal is shown on a successful cancellation with the following text: "A lemondás sikeres, pénzbeli szankcióval NEM jár"
* From Tuesday 12:00: when a user cancels their participation and the player count drops below 12, a confirmation dialog should be displayed with the following text: "Elmúlt dél, ezért a lemondás szankcióval jár: ki kell fizetni a részvétel árát, kivéve, ha tudsz szerezni magad helyett embert és ezáltal nem marad el a foci". If the number of players stays at least 12, the dialog shows the same text as in the previous point.
* The exact time of the cancellation (yyyy.MM.dd. hh:mm) is stored
* Players who canceled their participation are kept in the list of players, but with their name striked through and the time of cancellation printed next to their name (e.g., "John Doe lemondta 2026.12.12. 11:23-kor")

Listing sign-ups for an event
* The listing starts with the time and location of the match. 
* Below that there is an ordered list of sign-ups. Ordering is based on the timestamp of the sign-up and is ascending.
* After 14 items, a horizontal line separates the wait list from the attendee list
* Each item looks like this: <timestamp> - <name> (<role>) 
** <timestamp> is the time of the sign-up in MM.dd. hh:mm:ss format
** <name> is the user name for users and a nickname for those who were signed up by a user
** <role> is the user's role filled in during registration
** In case a non-user is signed up by a user, the following is appended to the item: " - beírta: <user name>", where <user name> is the name of the user who signed up the player
* Example:
  `
  19:00--20:30 @ Bikás park

  01. 07.13. 08:18:12 - John Doe (mezőnyjátékos)
  02. 07.13. 08:19:42 - Go Lee (kapus) - beírta: John Doe
  03. 07.13. 09:12:00 - Thomas (mezőnyjátékos)
  ...
  14. 07.14. 04:00:00 - Joe (kapus vagy akár mezőnyjátékos)
  ----------------------------------------------
  15. 07.14. 07:42:13 - George (mezőnyjátékos) - beírta: Thomas
  `
* For sign-ups created by a user there is also a cancel button with the text "Lemondás"
* Below the last item, there is a sign-up button
 
Storage
* Match-related data like sign-ups and cancellations are stored for five weeks and then deleted automatically

Customization
* The match day by default is Tuesday. In rare cases, it might be moved to another day. It would by nice if the default day could be changed, which would mean moving the day when sign-ups can be made.

