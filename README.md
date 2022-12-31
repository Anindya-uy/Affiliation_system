USE DB FROM INITIAL(MAIN) STEP.


php artisan serve, npm run dev

DB Name = softic_db

Here, used laravel breez package for authentication and manage multiple roles using laratrust.

By using "RegisteredUserController.php" Controller managed all users to registration .User comes without referral code it stores the user 'users' table with the role at 3 (General User) at "role_user" table in DB.

In frontview through "affiliate_dashboard.blade.php" user gets a waiting notice of approve request for affiliation.

If it comes with code throug a link or copy it stores as an affiliation user with user role 2.As well as insert data into 'networks' table with created user's user_id and parent_user_id(referral user id).

Now the registerd user gets a random generated unique affiliate link on dashboard and received a email(valid mail) with link and guidence.

Also in frontview through "affiliate_dashboard.blade.php" user can see his affiliated stuff.

Admin user role is 1.

By using "DashboardController.php" Controller managed all users access permission. In "admin_dashboard.blade.php" shows all earned points(15 for each) for successfull affiliation(parent user). Doing join between two tables 'role_user'and 'users' shows all not approved users. Also shows all active users by 'User' Model who can share their link in different data table.

Update the user role= 2 from role= 3 and is_approved= true by accepting request.
