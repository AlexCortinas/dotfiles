#! /usr/bin/python3
# -*- coding: utf-8 -*-
"""
Display the current "artist - title" playing in Clementine.

@author Francois LASSERRE <choiz@me.com>
@license GNU GPL http://www.gnu.org/licenses/gpl.html
"""

from time import time
from subprocess import check_output

def _getMetadatas():
    """
    Get the current song metadatas (artist - title)
    """
    track_id = check_output('qdbus org.mpris.clementine /TrackList org.freedesktop.MediaPlayer.GetCurrentTrack', shell=True)
    metadatas = check_output('qdbus org.mpris.clementine /TrackList org.freedesktop.MediaPlayer.GetMetadata {}'.format(track_id.decode()), shell=True)
    lines = metadatas.decode('utf-8').split('\n')
    lines = filter(None, lines)

    now_playing = ''

    if lines:
        artist = ''
        title = ''
        internet_radio = False

        for item in lines:
            if item.find('artist:') != -1:
                artist = item[8:]
            if item.find('title:') != -1:
                title = item[7:]

        if title.find('.wav') != -1 or title.find('.mp3') != -1:
            title = title[:-4]

        if title.find('http') != -1:
            title = ''
            internet_radio = True

        if artist and title:
            now_playing = '♫ {} - {}'.format(artist, title)
        elif artist:
            now_playing = '♫ {}'.format(artist)
        elif title:
            now_playing = '♫ {}'.format(title)
        elif internet_radio:
            now_playing = '♫ Internet Radio'

    return now_playing

try:
    print(_getMetadatas())
except:
    print("")
