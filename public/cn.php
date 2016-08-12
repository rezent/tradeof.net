<?php
if (!defined('ROOT_PATH')) define('ROOT_PATH', dirname(__DIR__));


function clearUri($uri, $query)
{
	$uri = explode('?', $uri);
	return $uri[0].$query;
}
var_dump(clearUri('http://tradeof.net/catalog/filtroelementy/sobstvennoye-proizvodstvo?sort=desc', '/filter-serii-fc-mbp'));
?>