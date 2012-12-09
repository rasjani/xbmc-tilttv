'''
   MoonTV.fi xbmc plugin
   ---------------------

   Watch finnish gaming tv Tilt.TV with XBMC

   :copyright: (c) 2012 by Jani Mikkonen
   :license: GPLv3, see LICENSE.txt for more details.

'''

## Required imports
from xbmcswift2 import Plugin
from xbmcswift2 import download_page
from BeautifulSoup import BeautifulSoup as BS
from urlparse import urlparse
from urlparse import parse_qs

PLUGIN_NAME = 'Tilt.TV'
PLUGIN_ID = 'plugin.video.tilt.tv'
plugin = Plugin(PLUGIN_NAME, PLUGIN_ID, __file__)

TILT_URL='http://www.tilt.tv/webteevee/webtv.php'
DIV_CLASS='clips low'

def _htmlify(url):
  return BS(download_page(url), convertEntities=BS.HTML_ENTITIES)

@plugin.route('/')
def index():
  items = []
  htmldata = _htmlify(TILT_URL)
  latest = htmldata.find('div',{ 'class' : DIV_CLASS} )
  episodes = latest.findAll('a')
  for episode in episodes: 
    url = episode['href']
    name = ''.join(episode.findAll(text=True))
    items.append  (
      {
        'label': name,
        'path': url,
        'is_playable': True
      }
    )

  return items


if __name__ == '__main__':
    plugin.run()
