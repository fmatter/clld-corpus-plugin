<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "speakers" %>


<h2>${_('Speakers')}</h2>
<div>
    ${ctx.render()}
</div>
