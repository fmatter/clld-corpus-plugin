<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%import clld_corpus_plugin.util as cutil%>
<link rel="stylesheet" href="${req.static_url('clld_corpus_plugin:static/clld-corpus.css')}"/>
<%! active_menu_item = "texts" %>


<h3>${_('Text')} “${ctx.name}”</h3>

% if ctx.text_metadata:
    <ul>
        % for key, value in ctx.text_metadata.items():
            <li>${key.capitalize()}: ${value}</li>
        % endfor
    </ul>
% endif

% if ctx.description:
Summary: ${h.text2html(h.Markup(ctx.description))}
% endif

<ol>
% for s in ctx.sentences:
${cutil.rendered_sentence(request, s.sentence, text_link=False, sentence_link=True)}
% endfor
</ol>

<script src="${req.static_url('clld_corpus_plugin:static/clld-corpus.js')}">
</script>

<script>
number_examples()
</script>