<?php

namespace Ashanty\Frontend\Controllers;

use \Ashanty\Library\Tool;
use \Ashanty\Models\CatalogCategories;
use \Ashanty\Models\CatalogProducts;
use \Ashanty\Models\Articles;
use \Phalcon\Mvc\Model\Resultset;
use \Ashanty\Library\Arr;
use \Ashanty\Library\I18n;

/**
 * Catalog Controller
 *
 * @package     Ashanty
 * @category    Controller
 * @version     1.0
 */
class CatalogController extends IndexController
{

	public function initialize()
	{
		$this->view->imgProducts = $this->config->app->imgProducts;
		parent::initialize();
	}

	/**
	 * View catalog products
	 * @return void
	 */
	public function indexAction()
	{
		$this->tag->setTitle(__('Catalog'));
		$this->breadcrumbs->add(__('Catalog'), '/catalog');
	}


	public function showAction()
	{

		$this->breadcrumbs->add(__('Catalog'), '/catalog');

		$map_route = array(
			'cat_id' => null,
			'cat' => $this->dispatcher->getParam("category"),
			'cat_name' => null,

			'section1_id' => null,
			'section1' => $this->dispatcher->getParam("section"),
			'section1_name' => null,

			'section2_id' => null,
			'section2' => $this->dispatcher->getParam("section2"),
			'section2_name' => null,
			);

		$catalogCategories = new CatalogCategories();
		$catalogProducts = new CatalogProducts();
		$test = new Articles();

		$sort = $this->request->getQuery("sort");
		$selectedASC = '';
		$selectedDESC = '';
		if($sort != null){
			if($sort == 'asc'){
				$sort = 'coast ASC';
				$selectedASC = ' selected';
			}elseif($sort == 'desc'){
				$sort = 'coast DESC';
				$selectedDESC = ' selected';
			}else{
				$sort = 'id ASC';
			}
		}else{
			$sort = 'id ASC';
		}
		$this->view->selectedASC = $selectedASC;
		$this->view->selectedDESC = $selectedDESC;

		if($map_route['cat'] != null){

			$cat = null;
			$cat = $catalogCategories::find(array(
				'conditions' => "url = ?1",
				'bind' => array(1 => $map_route['cat'])
			))
			->toArray();

			if(count($cat) != 0) {



				if($map_route['section1'] != null) {

					$checkCategoriesSection1 = null;
					$checkCategoriesSection1 = $catalogCategories::find(array(
							'conditions' => "url = ?1",
							'bind' => array(1 => $map_route['section1'])
						))
						->toArray();

					if(count($checkCategoriesSection1) != 0 And $map_route['section2'] == null) {

						$this->breadcrumbs->remove(null);
						$this->breadcrumbs->add(__('Catalog'), '/catalog');
						$this->breadcrumbs->add($cat[0]['name'], '/catalog/'.$cat[0]['url']);
						$this->breadcrumbs->add($checkCategoriesSection1[0]['name'], $checkCategoriesSection1[0]['url']);

						$this->view->productsArray = $catalogProducts::find(array(
								'conditions' => "id_categories = ?1",
								'bind' => array(1 => $checkCategoriesSection1[0]['id']),
								'order' => $sort
							))
							->toArray();

						$this->view->hTitle = $checkCategoriesSection1[0]['name'];
						$this->tag->setTitle($checkCategoriesSection1[0]['name']);
						$this->view->pick('catalog/list_products');

					} else {
						$productArray = $catalogProducts::find(array(
								'conditions' => "url = ?1",
								'bind' => array(1 => $map_route['section2'])
							))
							->toArray();
						/*
						 * Блок показа представления товара (карточка товара)
						 */
						if(count($productArray) != 0 ) {

							$this->view->productArray = $productArray;

							$this->breadcrumbs->remove(null);
							$this->breadcrumbs->add(__('Catalog'), '/catalog');
							$this->breadcrumbs->add($cat[0]['name'], '/catalog/'.$cat[0]['url']);
							$this->breadcrumbs->add($checkCategoriesSection1[0]['name'], '/catalog/'.$cat[0]['url'].'/'.$checkCategoriesSection1[0]['url']);
							$this->breadcrumbs->add($productArray[0]['name'], $productArray[0]['url']);

							$this->tag->setTitle($productArray[0]['name']);

							$this->view->isProd = true;

							$this->view->isNew = ($this->tool->isNewProduct($productArray[0]['created_at']) ? '<span class="equipment__item-new"><span>Новинка!</span></span>' : '');

							$this->view->pick('catalog/show_products');
						} else {

							$productsArray = null;
							$productArray = $catalogProducts::find(array(
									'conditions' => "url = ?1",
									'bind' => array(1 => $map_route['section1'])
								))
								->toArray();

							if(count($productArray) != 0 ){
								$this->view->productArray = $productArray;

								$this->breadcrumbs->remove(null);
								$this->breadcrumbs->add(__('Catalog'), '/catalog');
								$this->breadcrumbs->add($cat[0]['name'], '/catalog/'.$cat[0]['url']);
								$this->breadcrumbs->add($productArray[0]['name'], $productArray[0]['url']);

								$this->tag->setTitle($productArray[0]['name']);

								$this->view->isProd = true;

								$this->view->isNew = ($this->tool->isNewProduct($productArray[0]['created_at']) ? '<span class="equipment__item-new"><span>Новинка!</span></span>' : '');

								$this->view->pick('catalog/show_products');
							} else parent::notFoundAction(); // 404
						} // Конец блока показа товара
					}

				} else {
					$checkSubcategoriesCat = $catalogCategories::find(array(
							'conditions' => "id_parent = ?1",
							'bind' => array(1 => $cat[0]['id'])
						))
						->toArray();

					if(count($checkSubcategoriesCat) != 0) {

						$this->breadcrumbs->remove(null);
						$this->breadcrumbs->add(__('Catalog'), '/catalog');
						$this->breadcrumbs->add($cat[0]['name'], '/catalog/'.$cat[0]['url']);
						$this->view->subcatArray = $checkSubcategoriesCat;
						$this->view->parentUrl = $cat[0]['url'];
						$this->view->hTitle = $cat[0]['name'];
						$this->tag->setTitle($cat[0]['name']);
						$this->view->pick('catalog/show_subcategories');

					} else {
						$checkProductsCat = $catalogProducts::find(array(
								'conditions' => "id_categories = ?1",
								'bind' => array(1 => $cat[0]['id'])
							))
							->toArray();

						$this->view->productsArray = $checkProductsCat;
						$this->breadcrumbs->add($cat[0]['name'], $cat[0]['url']);
						$this->view->hTitle = $cat[0]['name'];
						$this->view->pick('catalog/list_products');
						#echo Tool::dump($checkProductsCat);
					}

				}

			} else parent::notFoundAction(); // 404

		} else parent::notFoundAction(); // 404
	}

	/**
	 * Построение дерева массива
	 * @param  array $ar массив данных
	 * @return mixed
	 */
	public function _getCat($ar)
	{
		$result = array();
		if(is_array($ar))
		{
			foreach ($ar as $key) {
				$result[] = array('url' => $key['url'], 'id' => $key['id'], 'name' => $key['name']);

				if(isset($key['children'])){
					foreach ($key['children'] as $k) {
						$result[] = array('url' => $k['url'], 'id' => $k['id'], 'name' => $k['name']);

						if (isset($k['children'])) {
							foreach ($k['children'] as $e) {
								$result[] = array('url' => $e['url'], 'id' => $e['id'], 'name' => $e['name']);
							}
						}
					}
				}
			}

			return $result;
		}else{
			return false;
		}

	}

	/**
	 * Поиск ключа в массиве категорий
	 * @param  [type] $array [description]
	 * @param  [type] $key   [description]
	 * @return [type]        [description]
	 */
	public function _getSubcat($array, $key)
	{
		$result = array();

		if(is_array($array)) {
			foreach ($array as $k) {
				if($k['id'] == $key) {
					if(isset($k['children'])) {
						foreach ($k['children'] as $v) {
							$result[] = array('id' => $v['id'], 'id_parent' => $v['id_parent'], 'url' => $v['url'], 'name' => $v['name'], 'img' =>$v['img']);
						}
					}
				}
			}
			return $result;
		} else {
			return false;
		}
	}

}