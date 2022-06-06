<?php

declare(strict_types=1);

use DI\Bridge\Slim\Bridge;
use DI\ContainerBuilder;
use Psr\Container\ContainerInterface;

require_once dirname(__DIR__) . '/vendor/autoload.php';

$container = (static function (): ContainerInterface {
    $builder = new ContainerBuilder;

    $builder
        ->useAnnotations(false)
        ->useAutowiring(true)
        ->addDefinitions(
            require_once dirname(__DIR__ . '/config/web.php'),
        );

    if (getenv('APP_MODE') === 'development') {
        $builder->enableCompilation('/tmp/.php-di-web');
    }

    return $builder->build();
}) ();

return Bridge::create($container);
