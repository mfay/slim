<?php

require '../vendor/autoload.php';

$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$config['db']['host']   = "db";
$config['db']['user']   = "root";
$config['db']['pass']   = "toor";
$config['db']['dbname'] = "mark";

$app = new Slim\App(["settings" => $config]);

$app->get('/hello/{name}', function ($request, $response, $args) {
    return $response->write("Hello, " . $args['name']);
});

$app->run();
