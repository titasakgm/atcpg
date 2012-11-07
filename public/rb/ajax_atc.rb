#!/usr/bin/ruby

require 'cgi'
require 'rubygems'
require 'pg'
require 'json'

c = CGI::new
start = c['iDisplayStart'].to_i
limit = c['iDisplayLength'].to_i
sort = c['sSortDir_0']
colsort = c['iSortingCols']
kw = c['sSearch']
sEcho = c['sEcho']

con = PGconn.connect("localhost",6543,nil,nil,"atcpg_development","postgres")
sql = "SELECT count(*) as count FROM atccodes "
res = con.exec(sql)
gtotal = res[0]['count']

sql = "SELECT * FROM atccodes "
if !kw.nil?
  sql += "WHERE lower(code || detail) LIKE '%#{kw.downcase}%' "
end
res = con.exec(sql)
stotal = res.num_tuples
con.close

h = {}
h[:sEcho] = sEcho
h[:iTotalRecords] = gtotal.to_i
h[:iTotalDisplayRecords] = stotal.to_i
aaData = []

n = 0
res.each do |rec|
  n += 1
  next if n < start
  a = []
  a.push(rec['id'])
  a.push(rec['code'])
  a.push(rec['detail'])
  aaData.push(a)
  break if n > start + limit
end

h[:aaData] = aaData

print <<EOF
Content-type: text/json

#{h.to_json}
EOF


