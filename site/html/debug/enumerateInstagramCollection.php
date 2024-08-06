<?php
    require '../vendor/autoload.php';
    use Phpfastcache\Helper\Psr16Adapter;

    // If account is public you can query Instagram without auth
    $instagram = new \InstagramScraper\Instagram();

    $instagram->getMediaById("Cvz-PnPtLUt")
?>

<html>
    <head>

    </head>
    <body>
        <form action="post">
            <label for="username">instagram username</label>
            <input name="username" type="text"><br>
            <label for="password">instagram password</label>
            <input name="password" type="password"><br>
            <label for="url">collection url</label>
            <input name="url" type="url"><br>
            <input name="submit" type="submit" value="enumerate">
        </form>
    </body>
</html>