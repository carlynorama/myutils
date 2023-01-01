#!/usr/bin/env python3

#https://www.digitalocean.com/community/tutorials/how-to-use-python-markdown-to-convert-markdown-text-to-html

# python --version     <-- if not 3 add the three
# python3 --version
# python3 -m pip --version
# python3 -m pip install markdown

import markdown


country_cities = {'Japan': ['Tokyo', 'Osaka', 'Nagoya'],
                  'France': ['Paris', 'Marseille', 'Lyon'],
                  'Germany': ['Berlin', 'Hamburg', 'Munich'],
                  }

with open('cities.md', 'bw+') as f:
    for country, cities in country_cities.items():
        f.write('# {}\n'.format(country).encode('utf-8'))
        for city in cities:
            f.write('* {}\n'.format(city).encode('utf-8'))
    f.seek(0)
    markdown.markdownFromFile(input=f, output='cities.html')
