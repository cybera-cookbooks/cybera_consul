name             'cybera_consul'
maintainer       'Cybera, Inc.'
maintainer_email 'devops@cybera.ca'
license          'All rights reserved'
description      'Wrapper cookbook for deploying consul clusters'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'consul'
depends 'poise-service'
