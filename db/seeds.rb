# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


ads = Ad.create([
  {
    :title => "Opala Comodoro 89",
    :body => "Opala comodoro azul 4cc gasolina ano 89 documento em dia troco por gol ou uno a partir do ano de 95. R$ 7.000,00. Falar com Manoel.",
    :email => "manuel.sobrinho1@terra.com.br",
    :phone => "12 88114090"
  },
  {
    :title => "Corsa Sedan 1.0 03/04 (mod. Novo)",
    :body => "corsa sedan 1.0 03/ 04 (mod. novo), prata, dir. hidr., 
        vidro/trava elet., alarme, calhas, insufilm, cd mp3, d. t., manual, chave reserva, 1º IPVA paga. R$ 21.000.",
    :email => "claudineycacula@yahoo.com.br",
    :phone => "3903-3278"
  },
  {
    :title => "Notebooke Dell Inspirion Vermelho",
    :body => "Urgente. Vendo Notebooke Novo. Processador Intel Pentium 4300, Windows 7 Premium 64-bit Original, 4GB RAM/250GB de disco rígido, Webcam 1.3 MP, Bluetooth, McAfee de 15 meses, 1 ano de garantia, monitor de 15, cor vermelho. muito bonito. R$ 1.800,00",
    :email => "ferrazsouza@hotmail.com",
    :phone => "(12) 91908500"
  },
  {
    :title => "LepTop ACER 3100",
    :body => "Vende-se Um notbook ACER 3100, 1024 DE MEMORIA HD 80, WEBCAM COM NOTA FISCAL DE COMPRA. R$ 800,00",
    :email => "rbns.vieira@gmail.com",
    :phone => "012-91117261"
  },
  
  
])