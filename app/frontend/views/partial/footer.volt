    <footer class="footer">
        <div class="footer__wrapper">
            <a href="index.html" class="footer__logo">
                {{ image('img/logo.png', 'alt': 'Logo') }}
            </a>
            <div class="footer__box">
                <div class="footer__phone">
                    <span>8 800 700 85 73</span>
                    <span>8 495 797 13 37</span>
                </div>
                <div class="footer__callback">
                    <a href="#callback" class="popup-with-move-anim">Обратная связь</a>
                </div>
                <div class="footer__lang">
                    {% for lang, language in siteLangs %}
                        {{ linkTo('lang/set/' ~ lang, language) }}
                    {% endfor %}
                </div>
            </div>
            <div class="footer__copy">
                <p>
                    © 2015-2016.<br>
                    {{ __('Group of Companies LLC "Trade OF" and "Tech OF"') }}
                </p>
                <p>
                    {{ __('All rights reserved. Any copying information from this site without reference to the source is prohibited by law on copyright protection on the Internet.') }}
                </p>
            </div>

        </div>
        <div class="footer__nav">
            <div class="footer__nav-wrapper">
                <ul class="footer__nav-menu">
                    <li>{{ link_to('o-nas', __('About us')) }}</li>
                    <li>{{ link_to('catalog', __('Catalog')) }}</li>
                    <li>{{ link_to('dostavka-i-oplata', __('Shipping and payment')) }}</li>
                    <li>{{ link_to('certificate', __('Certificate')) }}</li>
                    <li>{{ link_to('contact', __('Contact')) }}</li>
                    <li> {{ link_to('sitemap', __('Sitemap')) }} </li>
                    <li> {{ link_to('articles', __('Articles')) }} </li>
                </ul>
                <br>
                <div class="footer__nav-payment">
                    <a href="#" class="footer__nav-payment-item mastercard"></a>
                    <a href="#" class="footer__nav-payment-item maestro"></a>
                    <a href="#" class="footer__nav-payment-item visaelectron"></a>
                    <a href="#" class="footer__nav-payment-item visa"></a>
                </div>
            {memory} {time}</div>
        </div>
    </footer>