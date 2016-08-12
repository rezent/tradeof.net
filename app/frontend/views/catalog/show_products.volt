			<section class="equipment">
				<div class="equipment__title">
					<h2> {{ productArray[0]['name'] }} </h2>
                    <div class="section">
                    	<div class="box visible">
                              {{ link_to(
										tool.getPrimaryImg(productArray[0]['img'], productArray[0]['id']),
										image(
											tool.getPrimaryImg(productArray[0]['img'], productArray[0]['id'], 'small', false),
											'alt' : productArray[0]['name']
										)~isNew~'<span class="equipment__item-loup"></span>',
									'class':'equipment__item-img'
                              ) }}
                        </div>
                        {% if tool.getSecondaryImg(productArray[0]['img'], productArray[0]['id']) != false %}
                            {% for img in tool.getSecondaryImg(productArray[0]['img'], productArray[0]['id']) %}
                                <div class="box">
                                   <a href="{{ img }}" class="equipment__item-img">
                                        <img src="{{ img }}" alt="#">
                                        <span class="equipment__item-loup"></span>
                                    </a>
                                </div>
                            {% endfor %}
                        {% endif %}
                        <ul class="tabs">
                            <li class="current">{{ image(tool.getPrimaryImg(productArray[0]['img'], productArray[0]['id'], 'small', false),	'alt' : productArray[0]['name']) }}</li>

                            {% if tool.getSecondaryImg(productArray[0]['img'], productArray[0]['id'], 'small', true) != false %}
                                {% for img in tool.getSecondaryImg(productArray[0]['img'], productArray[0]['id'], 'small', true) %}
                                    <li><img src="{{ img }}" alt="#"></li>
                                {% endfor %}
                            {% endif %}
                        </ul>
                    </div>

                    <div class="production-textblock">
                        {% if productArray[0]['text'] != null %}
                            {{ productArray[0]['text'] }}
                        {% else %}
                            {{ __('No description') }}
                        {% endif %}
                    </div>
				</div>
		</section>
</div>

		<section class="articles">
			<div class="articles__wrapper">
				<div class="articles__title">
					<h2>Рекомендуемые</h2>
				</div>

{% if count(dataWidgetProd2) != 0 %}
                        {% for prod in dataWidgetProd2  %}
                                    <div class="equipment__item">
                    <a href="{{ tool.getPrimaryImg(prod['img'], prod['id']) }}" class="equipment__item-img">
                        {{ image(tool.getPrimaryImg(prod['img'], prod['id'], 'small', false), 'alt' : prod['name']) }}

		                {% if prod['sale'] != 0 %}
		                        <span class="equipment__item-sale"><span>Скидка!</span></span>
		                {% endif %}

                        <span class="equipment__item-loup"></span>
                    </a>
                                        <div class="production__item-title">
                                            <h3>{{ link_to('catalog/'~tool.pathToProduct(prod['id_categories'])~prod['url'], prod['name']) }}</h3>
                                        </div>
                                        <div class="production__item-text">
                                            <p>
                                                {{ prod['description'] }}
                                            </p>
                                        </div>
                                        <div class="production__item-price">
                                            {% if prod['sale'] != 0 %}
                                                <span class="equipment__item-price-old">{{ prod['coast'] }} руб.</span>
                                            {% endif %}
                                            {% if prod['coast'] != 0 %}
                                                <span class="equipment__item-price-main"><b>{{ prod['coast']-(prod['coast']/100*prod['sale']) }}</b> руб.</span>
                                            {% else %}
                                                <span class="equipment__item-price-main"><small>Цена не указана</small></span>
                                            {% endif %}
                                        </div>
                                        {{ link_to('catalog/'~tool.pathToProduct(prod['id_categories'])~prod['url'], '<span class="production__item-button-text">Купить</span>
                                            <span class="production__item-button-icon"><i></i></span>', 'class':'production__item-button') }}
                                    </div>
                        {% endfor %}
                    {% endif %}

			</div>
		</section>