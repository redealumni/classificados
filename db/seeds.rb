# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

diversos, cursos, carros, informatica = Category.create([
  {:name => "Diversos"}, {:name => "Cursos"}, {:name => "Carros"}, {:name => "Informática"}
]) 

Ad.create([
  {
    :title => "Curso de Ruby on Rails",
    :body => "Curso de Ruby on Rails com 68 horas de duração. Turmas pequenas e acompanhamento individual.",
    :email => "treinamento@season.com",
    :phone => "012-3941-7627",
    :kind => "sell",
    :category => cursos
  },
  {
    :title => "Notebooke Dell Inspirion Vermelho",
    :body => "Urgente. Vendo Notebooke Novo. Processador Intel Pentium 4300, Windows 7 Premium 64-bit Original, 4GB RAM/250GB de disco rígido, Webcam 1.3 MP, Bluetooth, McAfee de 15 meses, 1 ano de garantia, monitor de 15, cor vermelho. muito bonito. R$ 1.800,00",
    :email => "ferrazsouza@hotmail.com",
    :phone => "(12) 91908500",
    :kind => "sell",
    :category => informatica
  },
  {
    :title => "Corsa Sedan 1.0 03/04 (mod. Novo)",
    :body => "corsa sedan 1.0 03/ 04 (mod. novo), prata, dir. hidr., 
        vidro/trava elet., alarme, calhas, insufilm, cd mp3, d. t., manual, chave reserva, 1º IPVA paga. R$ 21.000.",
    :email => "claudineycacula@yahoo.com.br",
    :phone => "3903-3278",
    :kind => "sell",
    :category => carros
  },
  {
    :title => "Jogo de chá 24 peças",
    :body => "Completo, fabricado na Inglaterra em 1932. Pintado à mão. Edição de colecionador. Troco por talheres em ouro.",
    :email => "john@gmail.com",
    :phone => "012-3500-8377",
    :kind => "exchange",
    :category => diversos
  },
  {
    :title => "Van Iveco",
    :body => " Van iveco fiat ano 1999 carga diesel modelo 49.12 Agregada dupla dodagem. R$ 29.000,00",
    :email => "andiara_barreto@hotmail.com",
    :phone => "39333973 91925618",
    :kind => "sell",
    :category => carros
  },
  {
      :title => "LepTop ACER 3100",
      :body => "Vende-se Um notbook ACER 3100, 1024 DE MEMORIA HD 80, WEBCAM COM NOTA FISCAL DE COMPRA. R$ 800,00",
      :email => "rbns.vieira@gmail.com",
      :phone => "012-91117261",
      :kind => "sell",
      :category => informatica
  },
  {
      :title => "Macbook Pro",
      :body => "Compro macbook pro em bom estado e que não custe um rim.",
      :email => "mark@gmail.com",
      :phone => "012-23423332",
      :kind => "buy",
      :category => informatica
  },
  {
    :title => "Filhotes de Border Collie",
    :body => "Lindos filhotes com 40 dias. Serão entregues vermifugados. Cores diversas com boa marcação (preto/branco, marrom/branco,c/ diferentes predominâncias). Troco por cabana.",
    :email => "evalddo@gmail.com",
    :phone => "12 9153-3509 ",
    :kind => "exchange",
    :category => diversos
  },
  {
     :title => "Land Rover Defender 90 Sw",
     :body => " 	Defender 90 SW Motor: 2.5  Ano/modelo: 2000/2000 Cor: Verde / Teto: Rígido (branco). Aceito troca por Macbook pro 17. R$ 49.900,00",
     :email => "celsofap@ig.com.br",
     :phone => "12-97756977",
     :kind => "exchange",
     :category => carros
  },
  {
    :title => "Bote zefir de 3,6m",
    :body => "vendo ou troco por carro de menor valor, bote zefir de 3,6m por 1,8, com capacidade de 6 pessoas, com volante adaptado, motor de 25 hp evinrude, usado apenas nas represas da regiao, com carreta tudo documentado. R$8.000",
    :email => "wesley.bastos09@gmail.com",
    :phone => "97171106/39334865",
    :kind => "sell",
    :category => diversos
  },
  {
    :title => "Móveis",
    :body => "Compro cama de casal, colchão de casal, mesa com cadeiras, ventilador, camera digital. Se você tem algum desses itens para vender me contate só por telefone.",
    :email => "maysaribeiro@yahoo.com.br",
    :phone => "12-88052806",
    :kind => "buy",
    :category => diversos
  },

  {
    :title => "Opala Comodoro 89",
    :body => "Opala comodoro azul 4cc gasolina ano 89 documento em dia troco por gol ou uno a partir do ano de 95. R$ 7.000,00. Falar com Manoel.",
    :email => "manuel.sobrinho1@terra.com.br",
    :phone => "12 88114090",
    :kind => "sell",
    :category => carros
  },
  {
    :title => "fiorino furgao 97",
    :body => "Empresa vende fiorino furgao 97 efiorino 94 pickup a tabela fipe das duas e 11526 e 9602 respectivamente.os interessados devem contatar com sr cleber nos telefones 12 81958730 e 81372372. O valor minimo para oferta e 11000 pelos dois veiculos.",
    :email => "celso.rob@bol.com.br",
    :phone => "81372372/97330134",
    :kind => "sell",
    :category => carros
    },

])



# Altera data dos anúncios para ficarem mais aleatórias
Ad.all.each_with_index do |ad, index|
  ad.update_attribute(:created_at, (index+1).days.ago + rand(24).hours )
end

# Só para mostrar que pode existir um problema na contagem dos classificados de uma categoria
Ad.last.update_attribute(:created_at, 34.days.ago )

puts "#{Ad.all.count} anúncios criados."