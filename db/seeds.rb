# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


Category.create(:name => "Carros").ads = Ad.create([
  {
    :title => "Opala Comodoro 89",
    :body => "Opala comodoro azul 4cc gasolina ano 89 documento em dia troco por gol ou uno a partir do ano de 95. R$ 7.000,00. Falar com Manoel.",
    :email => "manuel.sobrinho1@terra.com.br",
    :phone => "12 88114090",
    :kind => "venda"
  },
  {
    :title => "Corsa Sedan 1.0 03/04 (mod. Novo)",
    :body => "corsa sedan 1.0 03/ 04 (mod. novo), prata, dir. hidr., 
        vidro/trava elet., alarme, calhas, insufilm, cd mp3, d. t., manual, chave reserva, 1º IPVA paga. R$ 21.000.",
    :email => "claudineycacula@yahoo.com.br",
    :phone => "3903-3278",
    :kind => "venda"
    }
])

Category.create(:name => "Informática").ads = Ad.create([
  {
    :title => "Notebooke Dell Inspirion Vermelho",
    :body => "Urgente. Vendo Notebooke Novo. Processador Intel Pentium 4300, Windows 7 Premium 64-bit Original, 4GB RAM/250GB de disco rígido, Webcam 1.3 MP, Bluetooth, McAfee de 15 meses, 1 ano de garantia, monitor de 15, cor vermelho. muito bonito. R$ 1.800,00",
    :email => "ferrazsouza@hotmail.com",
    :phone => "(12) 91908500",
    :kind => "venda"
  },
  {
    :title => "LepTop ACER 3100",
    :body => "Vende-se Um notbook ACER 3100, 1024 DE MEMORIA HD 80, WEBCAM COM NOTA FISCAL DE COMPRA. R$ 800,00",
    :email => "rbns.vieira@gmail.com",
    :phone => "012-91117261",
    :kind => "venda"
  },
  {
    :title => "Macbook Pro",
    :body => "Compro macbook pro em bom estado e que não custe um rim.",
    :email => "mark@gmail.com",
    :phone => "012-23423332",
    :kind => "compra"
  }  
])

Category.create(:name => "Cursos").ads = Ad.create([
  {
    :title => "Curso de Ruby on Rails",
    :body => "Curso de Ruby on Rails com 68 horas de duração. Turmas pequenas e acompanhamento individual.",
    :email => "treinamento@season.com",
    :phone => "012-3941-7627",
    :kind => "venda"
  }  
])

Category.create(:name => "Diversos").ads = Ad.create([
  {
    :title => "Jogo de chá 24 peças",
    :body => "Completo, fabricado na Inglaterra em 1932. Pintado à mão. Edição de colecionador. Troco por talheres em ouro.",
    :email => "john@gmail.com",
    :phone => "012-3500-8377",
    :kind => "troca"
  }
])

# Altera data dos anúncios para ficarem mais aleatórias
Ad.all.each_with_index do |ad, index|
  ad.update_attribute(:created_at, (index+1).days.ago + rand(24).hours )
end

# Só para mostrar que pode existir um problema na contagem dos classificados de uma categoria
Ad.first.update_attribute(:created_at, 34.days.ago )