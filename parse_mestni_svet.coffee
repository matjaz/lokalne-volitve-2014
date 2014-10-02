fs      = require 'fs'
cheerio = require 'cheerio'
Iconv   = require('iconv').Iconv

data = fs.readFileSync process.argv[2]
converter = new Iconv 'windows-1250', 'utf8'

$ = cheerio.load converter.convert(data).toString()

svetKandidati = []

predlagateljStevilka = 0
predlagatelj = ''

$('table.data').last().find('tr').each (i, el) ->

  return if i is 0

  tds = $(el).find 'td'
  if tds.hasClass 'prelom_stranka'
    predlagateljStevilka = tds.first().text()
    predlagatelj = tds.last().text()
    return

  data = tds.eq(1).text().split ','
  data = data.map (s) -> s.trim()
  svetKandidati.push
    Številka: tds.first().text()
    ImeInPriimek: data[0]
    Rojen: data[1]
    Četrt: data[2]
    Naslov: data[3]
    Pošta: data[4]
    Predlagatelj: predlagatelj
    PredlagateljStevilka: predlagateljStevilka

console.log JSON.stringify svetKandidati
