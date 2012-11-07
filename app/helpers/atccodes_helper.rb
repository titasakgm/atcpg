module AtccodesHelper
 admr = {
    'Inhal' => 'Inhalation',
    'Instill' => 'Instillation',
    'N' => 'Nasal',
    'O' => 'Oral',
    'P' => 'Parenteral',
    'R' => 'Rectal',
    'SL' => 'Sublingual/Buccal',
    'TD' => 'Transdermal',
    'V' => 'Vaginal'
  }

  def check_nongroup_parenthesis(str)
    arr = str.scan(/\(([^\)]+)\)/)
    arr.each do |s|
      sx = s[0].tr('"','')
      if sx.upcase =~ /^[A-Z][A-Z]/
        str = str.gsub("(#{sx})","!#{sx}|")
      end
    end
    str
  end

  def newformat(detail)
    detail = check_nongroup_parenthesis(detail)
    f = detail.split('(')
    content = ""
    (f.length-1).downto(0).each do |n|
      i = f[n].to_s.split(')')
      if (n > 0)
        content += "(#{i[0]}) #{i[1].to_s.strip.upcase.gsub('!','(').gsub('|',')')}<br>"
      else
        f[0] = f[0].gsub(/\ Inhal /,' (Inhalation) ')
        f[0] = f[0].gsub(/\ Instill /,' (Instillation) ')
        f[0] = f[0].gsub(/\ N /,' (Nasal) ')
        f[0] = f[0].gsub(/\ O /,' (Oral) ')
        f[0] = f[0].gsub(/\ P /,' (Parenteral) ')
        f[0] = f[0].gsub(/\ R /,' (Rectal) ')
        f[0] = f[0].gsub(/\ SL /,' (Sublingual) ')
        f[0] = f[0].gsub(/\ TD /,' (Transdermal) ')
        f[0] = f[0].gsub(/\ V /,' (Vaginal) ')
        content += "#{f[0].capitalize}"
      end
    end
    content
  end
end
