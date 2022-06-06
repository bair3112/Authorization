<?php

declare(strict_types=1);

return [
    'mode'              => getenv('APP_MODE') ?: 'development',

    # Database
    'postgres_host'     => getenv('POSTGRES_HOST') ?: 'auth',
    'postgres_name'     => getenv('POSTGRES_DB') ?: 'auth',
    'postgres_password' => getenv('POSTGRES_PASSWORD') ?: 'auth',
    'postgres_port'     => getenv('POSTGRES_PORT') ?: 5432,
    'postgres_user'     => getenv('POSTGRES_USER') ?: 'auth',
];
