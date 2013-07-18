<?php
/**
 * Configuration for:
 *   - auto-loading of PHP-ActiveRecord model classes
 *   - db connections
 */
namespace config;

require_once __DIR__ . '/../../php-activerecord/ActiveRecord.php';


\ActiveRecord\Config::initialize(function($cfg)
{
    $cfgData = parse_ini_file("config.ini", true);
    $dbData = $cfgData['database'];

    $cfg->set_model_directory(__DIR__ . '/../app/models');
    $cfg->set_connections(array(
        'development' => "{$dbData['adapter']}://{$dbData['user']}:{$dbData['pass']}@{$dbData['host']}/{$dbData['dbName']}",
    ));

    // TODO Set this based on environment variable eventually, but default is 'development' key
    // $cfg->set_default_connection('development');
});
