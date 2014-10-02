Lokalne volitve 2014
====================

Pregled kandidatov na zemljevidu z zmogljivim filtriranjem s pomočjo Google Fusion tables.

Primer za MO Ptuj
-----------------

    wget http://volitve.gov.si/lv2014/kandidati/zupani_os_ptuj.html
    wget http://volitve.gov.si/lv2014/kandidati/ckvs_ptuj.html

    iced parse_zupani.coffee zupani_os_ptuj.html > kandidati.json
    iced parse_mestni_svet.coffee zupani_os_ptuj.html > svet.json
    iced parse_cetrtna_skupnost.coffee ckvs_ptuj.html > cs.json

    iced geo.iced kandidati.json > kandidati-geo.json

    # JSON to CSV
    http://konklone.io/json/

    # upload CSV
    https://www.google.com/fusiontables/data?dsrcid=implicit

Rezultat
--------

Županski kandidati
https://www.google.com/fusiontables/DataSource?docid=1yTuY16KPKt5pJS9afj-IqqIPetzBx150R83ouBBR#map:id=3

Kandidati za mestni svet
https://www.google.com/fusiontables/DataSource?docid=1USPZB01iRYtqMc1f2HHxIA2pdn-FxLe4apdv6OLX#map:id=3

Seznam kandidatov za člane v svetih četrtnih skupnosti
https://www.google.com/fusiontables/DataSource?docid=1mo9IlTf3I4NhWBrqAd4z5gOzfXrf6EJHPh_o6jXX#map:id=3

Zahteve
-----------------

 - Node.js
 - Iced CoffeeScript
