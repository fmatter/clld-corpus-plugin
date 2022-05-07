<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%import clld_corpus_plugin.util as cutil%>
<link rel="stylesheet" href="${req.static_url('clld_corpus_plugin:static/clld-corpus.css')}"/>
<%! active_menu_item = "units" %>


<%doc><h2>${_('Form')} ${ctx.name} (${h.link(request, ctx.language)})</h2>
</%doc>

<h3>${_('Form')} <i>${ctx.name}</i></h3>

<table class="table table-nonfluid">
    <tbody>
<%doc>        <tr>
            <td>Form:</td>
            <td>${ctx.name}</td>
        </tr></%doc>
        <tr>
            <td> Meaning:</td>
            <td>
                ‘${ctx.meaning}’
            </td>
        </tr>
        <tr>
            <td>Language:</td>
            <td>${h.link(request, ctx.language)}</td>
        </tr>
    </tbody>
</table>

% if ctx.sentences:
<h3>${_('Sentences')}</h3>
<ol>
% for a in ctx.sentences:
    ${cutil.rendered_sentence(request, a.sentence, sentence_link=True)}
% endfor
</ol>
% endif

<script>
var highlight_targets = document.getElementsByName("${ctx.id}");
for (index = 0; index < highlight_targets.length; index++) {
    highlight_targets[index].children[0].classList.add("corpus-highlight");
}
</script>