{# Contact View | Ashanty | 2.0 #}
<p>
    {{ __('Welcome') }},<br />
    {{ fullName ~ ' ' ~ __('wrote') }}:
</p>
<p>{{ content|nl2br }}</p>
<p>{{ __('Sender') ~ ': ' ~ email }}</p>