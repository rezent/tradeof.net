{{ tag.getDoctype() }}
<html lang="{{ substr(i18n.lang(), 0, 2) }}">
    <head>
        <meta charset="utf-8" />
        {{ getTitle() }}
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <meta name="description" content="{{ siteDesc }}" />
        {{ stylesheetLink('css/bootstrap.min.css') }}
        {{ stylesheetLink('css/bootstrap-theme.css') }}
        {{ this.assets.outputCss() }}
        <link rel="icon" type="image/x-icon" href="{{ this.url.getStatic('favicon.ico') }}" />
    </head>
    <body>

        {% if this.request.getUri() == '/' %}
            {{ this.partial('layouts/header_main') }}
        {% else %}
            {{ this.partial('layouts/header') }}
        {% endif %}
        <div class="clearfix"></div>

        <nav id="navbar" class="navbar navbar-default" role="navigation">
          <div class="container-fluid">
            <div class="container" style="border: 0px #000 solid;">

            <!-- Группируем ссылки, формы, выпадающее меню и прочие элементы -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#">{{ __('About') }}</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ __('Catalog') }} <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Наше производство</a></li>
                    <li><a href="#">Аналоги</a></li>
                    <li><a href="#">Для газа</a></li>
                    <li><a href="#">Для воды</a></li>
                    <li><a href="#">Для пара</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Фильтродержатели</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Фитинги</a></li>
                  </ul>
                </li>
              </ul>
              <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search" style="width:250px;">
                </div>

              </form>

            </div><!-- /.navbar-collapse -->

            </div>
          </div><!-- /.container-fluid -->
        </nav>

        <div class="container">
            <div class="row" style="border: 0px #000 solid;">
                {{ content() }}
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="row"  style="border: 0px #000 solid;">
#footer<br />
{{ link_to('/', __('Home')) }}<br />
{memory} / {time}s.
                </div>
            </div>
        </footer>
        <!--[if lt IE 9]>
            {{ javascriptInclude('js/html5shiv.min.js') }}
            {{ javascriptInclude('js/respond.min.js') }}
        <![endif]-->
        {{ javascriptInclude('js/jquery.min.js') }}
        {{ javascriptInclude('js/tether.min.js') }}
        {{ javascriptInclude('js/bootstrap.min.js') }}
        {{ this.assets.outputJs() }}
        {% if count(scripts) And isset(scripts) %}
            {% for script in scripts %}
            <script type="text/javascript">{{ script }}</script>
            {% endfor %}
        {% endif %}
    </body>
</html>