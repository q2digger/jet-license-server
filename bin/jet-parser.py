#!/usr/bin/python

import urllib2
from bs4 import BeautifulSoup
quote_page = 'https://www.jetbrains.com/help/license_server/release_notes.html'
page = urllib2.urlopen(quote_page)
soup = BeautifulSoup(page, 'html.parser')
#name_box = soup.find('h2', attrs={'id': '17955'})
name_box = soup.find('div', attrs={'class': 'chapter'})
name = name_box.text.strip()
name = name.replace("Build #", "")

line = name.split(' ')[0]

print line

#envfile = open('.env',"w")
#envfile.write("BUILD=" + line + "\n")
#envfile.close
