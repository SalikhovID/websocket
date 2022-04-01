<?php
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//error_reporting(E_ALL);
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="public/style.css">
    <title>Document</title>
</head>
<body id="wrapper">
    <div class="wrapper">
        <h3> <b id="user-ip">Weekly Coding Challenge</b> #<b id="user-id">8</b> <span>Chat Interface</span></h3>
        <section class="chat-interface">
            <!-- Chat transaction item 1 -->
            <figure class="chat-item">
                <img class="chat-item_image" src="https://randomuser.me/api/portraits/men/32.jpg" alt="">
                <figcaption class="chat-item_body">
                    <b>This is chat from Salikhov_ID</b><br>
                    Its first test message
                </figcaption>
            </figure>
        </section>
        <section class="new-message">
            <input type="text" class="message-body" placeholder="Enter your message">
            <input type="submit" class="message-button" value="Send">
        </section>
    </div>
    <div class="unit"></div>
    <script src="public/app.js"></script>
</body>
</html>
