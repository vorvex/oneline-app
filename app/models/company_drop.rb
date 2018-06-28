class CompanyDrop < Liquid::Drop

  def initialize(company)
    @company = company
  end

  def name
    @company["name"]
  end

  def strasse
    @company["strasse"]
  end

  def adresszusatz
    @company["adresszusatz"]
  end
  
  def stadt
    @company["stadt"]
  end
  
  def plz
    @company["plz"]
  end
  
  def ceo
    @company["ceo"]
  end
  
  def beauftragter
    @company["beauftragter"]
  end
end