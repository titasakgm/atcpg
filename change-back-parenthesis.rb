#!/usr/bin/ruby

require 'rubygems'
require 'pg'

def replace(id,code,str)
  str2 = str.gsub(/\!/, '(').gsub(/\|/,')')
  con = PGconn.connect("localhost",6543,nil,nil,"atcpg_development","admin")
  sql = "UPDATE atccodes "
  sql += "SET detail='#{str2}' "
  sql += "WHERE id=#{id}" 
  puts sql
  puts code
  exit
  res = con.exec(sql)
  con.close
end

con = PGconn.connect("localhost",6543,nil,nil,"atcpg_development","admin")
sql = "SELECT id,code,detail "
sql += "FROM atccodes "
sql += "WHERE detail LIKE '%!%' "
res = con.exec(sql)
con.close

res.each do |rec|
  id = rec['id']
  code = rec['code']
  det = rec['detail']
  replace(id,code,det)
end
  
