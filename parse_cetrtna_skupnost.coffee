fs      = require 'fs'
cheerio = require 'cheerio'
Iconv   = require('iconv').Iconv

data = fs.readFileSync process.argv[2]
converter = new Iconv 'windows-1250', 'utf8'

$ = cheerio.load converter.convert(data).toString()

svetKandidati = []

skupnost = ''

$('.okno_content > h2').each (i, h2) ->
  skupnost = $(h2).text().trim().replace 'Četrtna skupnost - ', ''

  $(h2).next().find('tr').each (i, el) ->
    return if i is 0

    tds = $(el).find 'td'
    data = tds.eq(1).text().split ','
    data = data.map (s) -> s.trim()
    svetKandidati.push
      Skupnost: skupnost
      Predlagatelj: tds.last().text()
      Številka: tds.first().text()
      ImeInPriimek: data[0]
      Rojen: data[1]
      Četrt: data[2]
      Naslov: data[3]
      Pošta: data[4]

console.log JSON.stringify svetKandidati
