<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Register Mail</title>
</head>
<body>
	<p>Hi {{ $data['name'] }}, Welcome to Stuff affiliation System.</p>
	<br>
	<p><b> Username: {{ $data['email'] }}</b></p>
	<p><b> Password: {{ $data['password'] }}</b></p>
	<p> This is your shareable <a href="{{ $data['url'] }}">Refarral Link</a> which is also avilable on your dashboard</p>
	<p>Login First, Share your link to engage more stuff and achive some points.</p>

	<br>
	<p><b> Thank You! </b></p>
	<p><b> SofticMe </b></p>

</body>
</html>