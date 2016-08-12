{% if ! auth.logged_in() %}
<div class="main-header__authorization">
					<div class="main-header__authorization-icon"></div>
					<div class="main-header__authorization-log">
						<a href="#">Вход</a>
					</div>
					<div class="main-header__authorization-reg">
						<a href="#">Регистрация</a>
					</div>
				</div>
{% else %}



{% endif %}