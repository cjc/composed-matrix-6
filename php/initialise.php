<?php

ini_set('memory_limit', -1);
error_reporting(E_ALL);

$SYSTEM_ROOT = '/app';

require_once $SYSTEM_ROOT.'/core/include/init.inc';
require_once SQ_INCLUDE_PATH.'/system_config.inc';

$URL = $_SERVER['argv'][1];

$GLOBALS['SQ_SYSTEM']->getKernel()->setInstalling(true);
$GLOBALS['SQ_SYSTEM']->setRunLevel(SQ_RUN_LEVEL_FORCED);

$cfg = new System_Config();
$cfg->save(Array(), FALSE);

$vars['SQ_CONF_SYSTEM_ROOT_URLS'] = $URL;
$vars['SQ_CONF_ALLOW_IP_CHANGE'] = '1';
$cfg->save($vars);

echo "Matrix config initialised.\n";

?>
