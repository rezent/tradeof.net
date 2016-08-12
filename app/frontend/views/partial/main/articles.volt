{% if count(dataWidgetArticles) != 0 %}
        <section class="articles">
            <div class="articles__wrapper">
                <div class="articles__title">
                    <h2>статьи</h2>{{ link_to('/articles', 'ВСЕ СТАТЬИ') }}
                </div>
                {% for articles in dataWidgetArticles %}
                    {{ link_to(
                        'articles/'~articles['url'],
                        '<div class="articles__item-img">'~image(this.config.articles.imgArticles~'/'~articles['id']~'/'~articles['img'], 'alt':'#')~'</div><div class="articles__item-title"><h3>'~articles['hTitle']~'</h3></div><div class="articles__item-text"><p>'~articles['description']~'</p></div><div class="articles__item-date"><span>'~this.tool.dateFixed(articles['create_at'], this.config.articles.timePattern)~'</span></div>',
                        'class': 'articles__item'
                    ) }}
                {% endfor %}
            </div>
        </section>
{% endif %}