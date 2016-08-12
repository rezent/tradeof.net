        <section class="production">
            <div class="production__wrapper">
                <div class="production__title">
                    <h2>Продукция</h2>
                </div>


                <div class="production__slider owl-carousel">

                    {% if count(dataWidgetProd) != 0 %}
                        {% for prod in dataWidgetProd  %}
                                    <div class="production__item">

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
            </div>
        </section>