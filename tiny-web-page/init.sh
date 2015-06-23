#!/bin/sh

systemd-machine-id-setup

cat <<END > /srv/http/index.html
<!DOCTYPE html>
<html>
<head>
<title>Tiny page</title>
<style type="text/css">
body {
	background-color: rgb($((RANDOM/128)), $((RANDOM/128)), $((RANDOM/128)))
}
h1 {
	color: rgb($((RANDOM/128)), $((RANDOM/128)), $((RANDOM/128)))
}
</style>
</head>
<body>
<h1>
My name is <span id="machine-id">$(cat /etc/machine-id)</span>
</h1>
</body>
</html>
END

lighttpd -D -f /etc/lighttpd/lighttpd.conf
