{% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
    <div class="main-header__authorization">
{% else %}
    <div class="main-header__authorization page-header__authorization">
{% endif %}
		<div class="main-header__authorization-icon"></div>
{% if ! auth.logged_in() %}
			<div class="main-header__authorization-log">
				{{ link_to('user/signin', __('Sign in')) }}
			</div>
			<div class="main-header__authorization-reg">
				{{ link_to('user/signup', __('Sign up')) }}
			</div>
{% else %}

	{{ auth.get_user().email }}

{% endif %}
</div>