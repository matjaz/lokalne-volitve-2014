fs      = require 'fs'
cheerio = require 'cheerio'
Iconv   = require('iconv').Iconv

data = fs.readFileSync process.argv[2]
converter = new Iconv 'windows-1250', 'utf8'

$ = cheerio.load converter.convert(data).toString()

zupanKandidati = []

$('table.data').first().find('tr').each (i, el) ->

  return if i is 0

  tds = $(el).find 'td'
  data = tds.eq(1).text().split ','
  data = data.map (s) -> s.trim()
  kandidat =
    stevilka: tds.first().text()
    imePriimek: data[0]
    rojen: data[1]
    obcina: data[2]
    Naslov: data[3]
    posta: data[4]
    predlagatelj: tds.last().text()

  zupanKandidati.push kandidat

console.log JSON.stringify zupanKandidati
