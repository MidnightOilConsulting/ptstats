<?php

$request = json_decode(http_get_request_body());

$curl = curl_init($request->url);

if(!empty($request->username) && !empty($request->password))
{
    curl_setopt($curl, CURLOPT_USERPWD, $request->username . ":" . $request->password);
}
else if(!empty($request->token))
{
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
        "X-TrackerToken: $request->token",
    ));
}

curl_setopt($curl, CURLOPT_TIMEOUT, 30);
curl_exec($curl);
