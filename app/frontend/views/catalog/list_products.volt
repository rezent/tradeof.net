<section class="equipment">
	{% if is_array(productsArray) %}
		<div class="equipment__title">
			<h2>{{ hTitle }}</h2>
		</div>
		<form class="equipment__sort" method="GET">
			<label>
				<select name="sort" id="sort_select">
					<option value="asc"{{ selectedASC }}>Возрастание цены</option>
					<option value="desc"{{ selectedDESC }}>Убывание цены</option>
				</select>
			</label>
		</form>

	{% if count(productsArray) != 0 %}
		{% for prod in productsArray  %}
			<div class="equipment__item">

                    <a href="{{ tool.getPrimaryImg(prod['img'], prod['id']) }}" class="equipment__item-img">
                        {{ image(tool.getPrimaryImg(prod['img'], prod['id'], 'small', false), 'alt' : prod['name']) }}

						{% if prod['sale'] != 0 %}
								<span class="equipment__item-sale"><span>Скидка!</span></span>
						{% endif %}

						<span class="equipment__item-loup"></span>
					</a>
				<div class="equipment__item-title">
					<h3>{{ link_to(tool.clearUri(this.request.getUri(), '/'~prod['url']), prod['name']) }}</h3>
				</div>
				<div class="equipment__item-text">
					<p>
						{{ prod['description'] }}
					</p>
				</div>
				<div class="equipment__item-price">
					{% if prod['sale'] != 0 %}
						<span class="equipment__item-price-old">{{ prod['coast'] }} руб.</span>
					{% endif %}
					{% if prod['coast'] != 0 %}
						<span class="equipment__item-price-main"><b>{{ prod['coast']-(prod['coast']/100*prod['sale']) }}</b> руб.</span>
					{% else %}
						<span class="equipment__item-price-main"><small></small></span>
					{% endif %}
				</div>
				<a href="#" class="equipment__item-button">
					<span class="equipment__item-button-text">Купить</span>
					<span class="equipment__item-button-icon"><i></i></span>
				</a>
			</div>
		{% endfor %}
		{% else %}
			<h3>Каталог временно пуст, приносим свои извинения за временные не удобства, мы активно работаем над заполнением.<h3>
		{% endif %}
	{% else %}

		<h3>Ошибка системы<h3>

	{% endif  %}




</section>
</div>

{{ this.partial('partial/main/articles') }}