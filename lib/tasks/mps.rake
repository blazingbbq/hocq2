desc "Create database records for MP information."

namespace :mps do
  task :create => :environment do
    mpNames = ["Aboultaif", "Albas", "Albrecht", "Aldag", "Alghabra", "Alleslev", "Allison", "Ambrose", "Amos", "Anandasangaree", "Anderson", "Angus", "Arnold", "Arseneault", "Arya", "Ashton", "Aubin", "Ayoub", "Badawey", "Bagnell", "Bains", "Barlow", "Barsalou-Duval", "Baylis", "Beaulieu", "Beech", "Bennett", "Benson", "Benzen", "Bergen", "Bernier", "Berthold", "Bezan", "Bibeau", "Bittle", "Blaikie", "Blair", "Rachel Blaney", "Steven Blaney", "Block", "Boissonnault", "Bossio", "Boucher", "Boudrias", "Boulerice", "Boutin-Sweet", "Brassard", "Bratina", "Breton", "Brison", "Brosseau", "Brown", "Caesar-Chavannes", "Calkins", "Cannings", "Caron", "Carr", "Carrie", "Bill Casey", "Sean Casey", "Chagger", "Champagne", "Chan", "Chen", "Chong", "Choquette", "Christopherson", "Clarke", "Clement", "Cooper", "Cormier", "Cullen", "Cuzner", "Dabrusin", "Damoff", "Davies", "DeCourcey", "Deltell", "Dhaliwal", "Dhillon", "Di Iorio", "Diotte", "Doherty", "Donnelly", "Dreeshen", "Drouin", "Dubé", "Dubourg", "Duclos", "Duguid", "Kirsty Duncan", "Linda Duncan", "Dusseault", "Duvall", "Dzerowicz", "Easter", "Eglinski", "Ehsassi", "El-Khoury", "Ellis", "Erskine-Smith", "Eyking", "Eyolfson", "Falk", "Fast", "Fergus", "Fillmore", "Finley", "Finnigan", "Fisher", "Fonseca", "Foote", "Fortier", "Fortin", "Fragiskatos", "Colin Fraser", "Sean Fraser", "Freeland", "Fry", "Fuhr", "Gallant", "Garneau", "Garrison", "Généreux", "Genuis", "Gerretsen", "Gill", "Gladu", "Godin", "Goldsmith-Jones", "Goodale", "Gould", "Gourde", "Graham", "Grewal", "Hajdu", "Hardcastle", "Harder", "Hardie", "Harvey", "Hehr", "Hoback", "Holland", "Housefather", "Hughes", "Hussen", "Hutchings", "Iacono", "Jeneroux", "Johns", "Jolibois", "Joly", "Jones", "Jordan", "Jowhari", "Julian", "Kang", "Kelly", "Kent", "Khalid", "Khera", "Kitchen", "Kmiec", "Kusie", "Kwan", "Lake", "Lambropoulus", "Lametti", "Lamoureux", "Lapointe", "Guy Lauzon", "Stéphane Lauzon", "Laverdière", "Lebel", "Leblanc", "Lebouthillier", "Lefebvre", "Leitch", "Lemieux", "Leslie", "Levitt", "Liepert", "Lightbound", "Lobb", "Lockhart", "Long", "Longfield", "Ludwig", "Lukiwski", "Lawrence MacAulay", "MacGregor", "Mackenzie", "Steven MacKinnon", "Maguire", "Malcolmson", "Maloney", "Marcil", "Brian Masse", "Rémi Massé", "Mathyssen", "Brian May", "Elizabeth May", "Kelly McCauley", "McColeman", "McCrimmon", "McDonald", "McGuinty", "McKay", "McKenna", "Ron McKinnon", "Cathy McLeod", "Michael McLeod", "Mendes", "Mendicino", "Mihychuk", "Larry Miller", "Marc Miller", "Monsef", "Moore", "Morneau", "Morrissey", "Motz", "Mulcair", "Murray", "Nantel", "Nassif", "Nater", "Nault", "NG", "Nicholson", "Nuttall", "Obhrai", "O'Connell", "Oliphant", "Oliver", "O'Regan", "O’Toole", "Ouellette", "Paradis", "Paul-Hus", "Pauzé", "Peschisolido", "Peterson", "Petitpas Taylor", "Philpott", "Picard", "Plamondon", "Poilievre", "Poissant", "Quach", "Qualtrough", "Raitt", "Ramsey", "Rankin", "Ratansi", "Rayes", "Regan", "Reid", "Rempel", "Richards", "Rioux", "Ritz", "Robillard", "Rodriguez", "Romanado", "Rota", "Rudd", "Ruimy", "Rusnak", "Saganash", "Sahota", "Saini", "Sajjan", "Samson", "Sangha", "Sansoucy", "Sarai", "Saroya", "Scarpaleggia", "Scheer", "Schiefke", "Schmale", "Schulte", "Serré", "Sgro", "Shanahan", "Sheehan", "Shields", "Shipley", "Jati Sidhu", "Sonia Sidhu", "Sikand", "Simms", "Sohi", "Sopuck", "Sorbara", "Sorenson", "Spengemann", "Stanton", "Ste-Marie", "Stetski", "Stewart", "Strahl", "Stubbs", "Sweet", "Tabbara", "Tan", "Tassi", "Thériault", "Tilson", "Tootoo", "Trost", "Trudeau", "Trudel", "Vandal", "Vandenbeld", "Van Kesteren", "Van Loan", "Vaughan", "Vecchio", "Viersen", "Virani", "Wagantall", "Warawa", "Warkentin", "Watts", "Waugh", "Webber", "Weir", "Whalen", "Wilkinson", "Wilson-Raybould", "Wong", "Wrzesnewskyj", "Young", "Yurdiga", "Zahid", "Zimmer"]
    mpParties = ["CPC", "CPC", "CPC", "LIB", "LIB", "LIB", "CPC", "CPC", "LIB", "LIB", "CPC", "NDP", "CPC", "LIB", "LIB", "NDP", "NDP", "LIB", "LIB", "LIB", "LIB", "CPC", "IND", "LIB", "IND", "LIB", "LIB", "NDP", "CPC", "CPC", "CPC", "CPC", "CPC", "LIB", "LIB", "NDP", "LIB", "NDP", "CPC", "CPC", "LIB", "LIB", "CPC", "IND", "NDP", "NDP", "CPC", "LIB", "LIB", "LIB", "NDP", "CPC", "LIB", "CPC", "NDP", "NDP", "LIB", "CPC", "LIB", "LIB", "LIB", "LIB", "LIB", "LIB", "CPC", "NDP", "NDP", "CPC", "CPC", "CPC", "LIB", "NDP", "LIB", "LIB", "LIB", "NDP", "LIB", "CPC", "LIB", "LIB", "LIB", "CPC", "CPC", "NDP", "CPC", "LIB", "NDP", "LIB", "LIB", "LIB", "LIB", "NDP", "NDP", "NDP", "LIB", "LIB", "CPC", "LIB", "LIB", "LIB", "LIB", "LIB", "LIB", "CPC", "CPC", "LIB", "LIB", "CPC", "LIB", "LIB", "LIB", "LIB", "LIB", "IND", "LIB", "LIB", "LIB", "LIB", "LIB", "LIB", "CPC", "LIB", "NDP", "CPC", "CPC", "LIB", "IND", "CPC", "CPC", "LIB", "LIB", "LIB", "CPC", "LIB", "LIB", "LIB", "NDP", "CPC", "LIB", "LIB", "LIB", "CPC", "LIB", "LIB", "NDP", "LIB", "LIB", "LIB", "CPC", "NDP", "NDP", "LIB", "LIB", "LIB", "LIB", "NDP", "LIB", "CPC", "CPC", "LIB", "LIB", "CPC", "CPC", "CPC", "NDP", "CPC", "LIB", "LIB", "LIB", "LIB", "CPC", "LIB", "NDP", "CPC", "LIB", "LIB", "LIB", "CPC", "LIB", "LIB", "LIB", "CPC", "LIB", "CPC", "LIB", "LIB", "LIB", "LIB", "CPC", "LIB", "NDP", "CPC", "LIB", "CPC", "NDP", "LIB", "IND", "NDP", "LIB", "NDP", "LIB", "IND", "CPC", "CPC", "LIB", "LIB", "LIB", "LIB", "LIB", "LIB", "CPC", "LIB", "LIB", "LIB", "LIB", "CPC", "LIB", "LIB", "NDP", "LIB", "LIB", "CPC", "NDP", "LIB", "NDP", "LIB", "CPC", "LIB", "LIB", "CPC", "CPC", "CPC", "LIB", "LIB", "LIB", "LIB", "CPC", "LIB", "LIB", "CPC", "IND", "LIB", "LIB", "LIB", "LIB", "LIB", "IND", "CPC", "LIB", "NDP", "LIB", "CPC", "NDP", "NDP", "LIB", "CPC", "LIB", "CPC", "CPC", "CPC", "LIB", "CPC", "LIB", "LIB", "LIB", "LIB", "LIB", "LIB", "LIB", "NDP", "LIB", "LIB", "LIB", "LIB", "LIB", "NDP", "LIB", "CPC", "LIB", "CPC", "LIB", "CPC", "LIB", "LIB", "LIB", "LIB", "LIB", "CPC", "CPC", "LIB", "LIB", "LIB", "LIB", "LIB", "CPC", "LIB", "CPC", "LIB", "CPC", "IND", "NDP", "NDP", "CPC", "CPC", "CPC", "LIB", "LIB", "LIB", "IND", "CPC", "IND", "CPC", "LIB", "NDP", "LIB", "LIB", "CPC", "CPC", "LIB", "CPC", "CPC", "LIB", "CPC", "CPC", "CPC", "CPC", "CPC", "CPC", "NDP", "LIB", "LIB", "LIB", "CPC", "LIB", "LIB", "CPC", "LIB", "CPC"]

    mpNames.each.with_index do |name, index|
      puts "#{index}: #{name}, #{mpParties[index]}"
      Mp.create(name: name, party: mpParties[index])
    end
  end
end