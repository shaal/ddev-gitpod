<?php

// #ddev-generated: Automatically generated Drupal settings file.
if (file_exists($app_root . '/' . $site_path . '/settings.ddev.php') && getenv('IS_DDEV_PROJECT') == 'true') {
  include $app_root . '/' . $site_path . '/settings.ddev.php';
}
$settings['container_yamls'][] = DRUPAL_ROOT . '/sites/default/services.yml';
$config['system.logging']['error_level'] = 'verbose';
