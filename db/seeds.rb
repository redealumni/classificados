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
    },
    {
      :title => "Van Iveco",
      :body => " Van iveco fiat ano 1999 carga diesel modelo 49.12 Agregada dupla dodagem. R$ 29.000,00",
      :email => "andiara_barreto@hotmail.com",
      :phone => "39333973 91925618",
      :kind => "venda"
      },
    {
      :title => "fiorino furgao 97",
      :body => "Empresa vende fiorino furgao 97 efiorino 94 pickup a tabela fipe das duas e 11526 e 9602 respectivamente.os interessados devem contatar com sr cleber nos telefones 12 81958730 e 81372372. O valor minimo para oferta e 11000 pelos dois veiculos.",
      :email => "celso.rob@bol.com.br",
      :phone => "81372372/97330134",
      :kind => "venda"
      },
     {
      :title => "Land Rover Defender 90 Sw",
      :body => " 	Defender 90 SW Motor: 2.5 Turbo Diesel Intercooler Ano/modelo: 2000/2000 Cor: Verde / Teto: Rígido (branco) Uso: Deslocamento diário, 90% em estrada. Não é de trilha nem competição. Preço: R$ 49.900,00 Contato: Celso (12) 9775-6977 / (12) 3642-9352 Ar Condicionado Ar quente Direção hidráulica Estribos laterais tubulares Vidros verdes Desembaçador traseiro Limpador traseiro Alarme Positron Pára-barro dianteiro e traseiro originais Capa de Estepe original Land Rover Snorkel de Poliuretano Farol auxiliar Rádio/CD player Pioneer Conta-giros Pneus (medida original) e estepe ok Volante em couro Estofamento e acabamento interno original ok Manual do proprietário original DVD de orientação e condução do veículo Chaves originais (incluso código de fábrica) Controle de Tração (4X4) manual. R$ 49.900,00",
      :email => "celsofap@ig.com.br",
      :phone => "12-97756977",
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
  },
  {
    :title => "Filhotes de Border Collie",
    :body => "Lindos filhotes com 40 dias. Serão entregues vermifugados. Cores diversas com boa marcação (preto/branco, marrom/branco,c/ diferentes predominâncias). Aceito contra-oferta. R$ 250,00",
    :email => "evalddo@gmail.com",
    :phone => "12 9153-3509 ",
    :kind => "venda"
  },
  {
    :title => "Bote zefir de 3,6m",
    :body => "vendo ou troco por carro de menor valor, bote zefir de 3,6m por 1,8, com capacidade de 6 pessoas, com volante adaptado, motor de 25 hp evinrude, usado apenas nas represas da regiao, com carreta tudo documentado. R$8.000",
    :email => "wesley.bastos09@gmail.com",
    :phone => "97171106/39334865",
    :kind => "troca"
  },
  
  {
    :title => "Móveis",
    :body => "Compro cama de casal, colchão de casal, mesa com cadeiras, ventilador, camera digital. Se você tem algum desses itens para vender me contate só por telefone.",
    :email => "maysaribeiro@yahoo.com.br",
    :phone => "12-88052806",
    :kind => "compra"
  }
    
])

# Altera data dos anúncios para ficarem mais aleatórias
Ad.all.each_with_index do |ad, index|
  ad.update_attribute(:created_at, (index+1).days.ago + rand(24).hours )
end

# Só para mostrar que pode existir um problema na contagem dos classificados de uma categoria
Ad.first.update_attribute(:created_at, 34.days.ago )