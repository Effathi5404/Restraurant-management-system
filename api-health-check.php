<?php

//Simple script to ensure that the container has good permissions and rewrites are working.

$base_uri = "http://localhost:8080/";

if(array_key_exists(1, $argv) && isset($argv[1])) {
    $base_uri = $argv[1];
    if($base_uri[strlen($base_uri) - 1] !== "/") {
        $base_uri .= "/";
    }
}

echo PHP_EOL."Testing URI: ".$base_uri.PHP_EOL;

$routes = [
    ["api/lib", 404],
    ["lib", 403],
    ["api/routes", 404],
    ["routes", 403],
    ["api/authentication/register", 200], //for now
    ["api/", 404],
    ["api/order/", 404],
    ["api/order/1", 200],
    ["api/order/1/item/1", 200],
    ["api/checkout/1", 200]

];

$ok = true;

foreach($routes as [$route, $code]) {
    
    $http_response_str = get_headers($base_uri.$route)[0];
    [,$response_code,] = explode(" ", $http_response_str);

    if(intval($response_code) == $code) {
        echo "✔: $route ($response_code === $code)".PHP_EOL;
        $ok &= true;
    } else {
        echo "✗: $route ($response_code !== $code)".PHP_EOL;
        $ok &= false;
    }
}

echo PHP_EOL; 

if($ok) {
    echo "✔: All routes ok.".PHP_EOL;
} else {
    echo "✗: Not all routes ok.".PHP_EOL;
}
