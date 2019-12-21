<?php
$db_conf = array (
'db' => array (
'DSN'      => 'pgsql:dbname=squiz_matrix host=db',
'user'     => 'matrix',
'password' => 'qqq',
'type'     => 'pgsql',
),
'db2' => array (
'DSN'      => 'pgsql:dbname=squiz_matrix host=db',
'user'     => 'matrix',
'password' => 'qqq',
'type'     => 'pgsql',
),
'db3' => array (
'DSN'      => 'pgsql:dbname=squiz_matrix host=db',
'user'     => 'matrix_secondary',
'password' => 'qqq',
'type'     => 'pgsql',
),
'dbcache' => NULL,
'dbsearch' => NULL,
);

return $db_conf;
?>
