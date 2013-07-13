<?php

$request = json_decode(http_get_request_body());

$curl = curl_init($request->url);
curl_setopt($curl, CURLOPT_USERPWD, $request->username . ":" . $request->password);
curl_setopt($curl, CURLOPT_TIMEOUT, 30);
curl_exec($curl);
