<?php

namespace Ashanty\Library\Sitemap;

interface SitemapInterface
{

    public function create();

    public function root(\DOMElement & $root);
}
