#!/bin/bash
apt-get update -y
apt-get install -y apache2
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server 2</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #fff3cd;
            color: #856404;
        }
        h1 {
            color: #fd7e14;
        }
        p {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <h1>Welcome to Server 2</h1>
    <p>This is a static website hosted on Server 2.</p>
</body>
</html>
EOF
systemctl start apache2
systemctl enable apache2
