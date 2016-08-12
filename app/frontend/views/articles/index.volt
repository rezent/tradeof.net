<section class="about">
    <div class="about__wrapper">
        <div class="about__title">
            <h1>{{ __('Articles') }}</h1>
        </div>
    </div>
    {% for article in articlesArray %}
        <div class="article">
            <div class="article__title">
                <h2>{{ link_to('articles/'~article['url'], article['hTitle']) }}</h2>
            </div>
            <div class="articles__item-date" style="margin-left: 20px;"><span>{{ this.tool.dateFixed(article['create_at'], this.config.articles.timePattern) }}</span></div>
                <div class="aticle__text">
                    {{ article['description'] }}
            </div>
        </div>
    {% endfor %}
</section>