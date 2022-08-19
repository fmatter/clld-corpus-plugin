"""Top-level package for clld-corpus-plugin."""
from clld_corpus_plugin import interfaces
from clld_corpus_plugin import models
from clld_corpus_plugin import datatables
from pyramid.response import Response, FileResponse
import logging

log = logging.getLogger(__name__)

__author__ = "Florian Matter"
__email__ = "florianmatter@gmail.com"
__version__ = "0.0.5"

audio_suffixes = [".mp3", ".wav"]


def audio_view(request):
    audio_id = request.matchdict["audio_id"]
    log.debug("Audio %s requested" % audio_id)
    audio_path = f"audio/{audio_id}.wav"
    if audio_path:
        response = FileResponse(audio_path, request=request, cache_max_age=86400)
        return response
    else:
        error = "Audio %s requested but not found" % audio_id
        log.error(error)
        return Response("<body>%s</body>" % error)


def includeme(config):
    config.registry.settings["mako.directories"].insert(
        1, "clld_corpus_plugin:templates"
    )
    config.add_static_view("clld-corpus-plugin-static", "clld_corpus_plugin:static")
    config.register_resource("text", models.Text, interfaces.IText, with_index=True)
    config.register_resource("speaker", models.Speaker, interfaces.ISpeaker, with_index=True)
    config.register_resource("tag", models.Tag, interfaces.ITag, with_index=True)

    config.add_route("audio_route", "/audio/{audio_id}")
    config.add_view(audio_view, route_name="audio_route")
    config.register_datatable("texts", datatables.Texts)
    config.register_datatable("sentences", datatables.SentencesWithAudio)
