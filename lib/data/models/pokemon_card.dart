import 'dart:convert';

class ApiResponse {
  final List<PokemonCard>? pokemonCard;
  final int? page;
  final int? pageSize;
  final int? count;
  final int? totalCount;

  ApiResponse({
    this.pokemonCard,
    this.page,
    this.pageSize,
    this.count,
    this.totalCount,
  });

  factory ApiResponse.fromRawJson(String str) => ApiResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    pokemonCard: json["PokemonCard"] == null ? [] : List<PokemonCard>.from(json["PokemonCard"]!.map((x) => PokemonCard.fromJson(x))),
    page: json["page"],
    pageSize: json["pageSize"],
    count: json["count"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "PokemonCard": pokemonCard == null ? [] : List<dynamic>.from(pokemonCard!.map((x) => x.toJson())),
    "page": page,
    "pageSize": pageSize,
    "count": count,
    "totalCount": totalCount,
  };
}

class PokemonCard {
  final String id;
  final String? name;
  final String? supertype;
  final List<dynamic>? subtypes;
  final String? hp;
  final List<dynamic>? types;
  final String? evolvesFrom;
  final List<Attack>? attacks;
  final List<Resistance>? weaknesses;
  final List<Resistance>? resistances;
  final List<String>? retreatCost;
  final int? convertedRetreatCost;
  final PokemonSet? pokemonCardSet;
  final String? number;
  final String? artist;
  final String? rarity;
  final String? flavorText;
  final List<int>? nationalPokedexNumbers;
  final Legalities? legalities;
  final PokemonCardImages? images;
  final Tcgplayer? tcgplayer;
  final Cardmarket? cardmarket;
  final List<String>? evolvesTo;
  final String? level;
  final List<Ability>? abilities;

  PokemonCard({
    required this.id,
    this.name,
    this.supertype,
    this.subtypes,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.pokemonCardSet,
    this.number,
    this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket,
    this.evolvesTo,
    this.level,
    this.abilities,
  });

  factory PokemonCard.fromRawJson(String str) => PokemonCard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonCard.fromJson(Map<String, dynamic> json) => PokemonCard(
    id: json["id"] ?? "0",
    name: json["name"],
    supertype: json["supertype"],
    subtypes: json["subtypes"] == null ? [] : List<String>.from(json["subtypes"]!.map((x) => x)),
    hp: json["hp"],
    types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
    evolvesFrom: json["evolvesFrom"],
    attacks: json["attacks"] == null ? [] : List<Attack>.from(json["attacks"]!.map((x) => Attack.fromJson(x))),
    weaknesses: json["weaknesses"] == null ? [] : List<Resistance>.from(json["weaknesses"]!.map((x) => Resistance.fromJson(x))),
    resistances: json["resistances"] == null ? [] : List<Resistance>.from(json["resistances"]!.map((x) => Resistance.fromJson(x))),
    retreatCost: json["retreatCost"] == null ? [] : List<String>.from(json["retreatCost"]!.map((x) => x)),
    convertedRetreatCost: json["convertedRetreatCost"],
    pokemonCardSet: json["set"] == null ? null : PokemonSet.fromJson(json["set"]),
    number: json["number"],
    artist: json["artist"],
    rarity: json["rarity"],
    flavorText: json["flavorText"],
    nationalPokedexNumbers: json["nationalPokedexNumbers"] == null ? [] : List<int>.from(json["nationalPokedexNumbers"]!.map((x) => x)),
    legalities: json["legalities"] == null ? null : Legalities.fromJson(json["legalities"]),
    images: json["images"] == null ? null : PokemonCardImages.fromJson(json["images"]),
    tcgplayer: json["tcgplayer"] == null ? null : Tcgplayer.fromJson(json["tcgplayer"]),
    cardmarket: json["cardmarket"] == null ? null : Cardmarket.fromJson(json["cardmarket"]),
    evolvesTo: json["evolvesTo"] == null ? [] : List<String>.from(json["evolvesTo"]!.map((x) => x)),
    level: json["level"],
    abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "supertype": supertype,
    "subtypes": subtypes == null ? [] : List<dynamic>.from(subtypes!.map((x) => x)),
    "hp": hp,
    "types": types,
    "evolvesFrom": evolvesFrom,
    "attacks": attacks == null ? [] : List<dynamic>.from(attacks!.map((x) => x.toJson())),
    "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses!.map((x) => x.toJson())),
    "resistances": resistances == null ? [] : List<dynamic>.from(resistances!.map((x) => x.toJson())),
    "retreatCost": retreatCost,
    "convertedRetreatCost": convertedRetreatCost,
    "set": pokemonCardSet?.toJson(),
    "number": number,
    "artist": artist,
    "rarity": rarity,
    "flavorText": flavorText,
    "nationalPokedexNumbers": nationalPokedexNumbers == null ? [] : List<dynamic>.from(nationalPokedexNumbers!.map((x) => x)),
    "legalities": legalities?.toJson(),
    "images": images?.toJson(),
    "tcgplayer": tcgplayer?.toJson(),
    "cardmarket": cardmarket?.toJson(),
    "evolvesTo": evolvesTo == null ? [] : List<dynamic>.from(evolvesTo!.map((x) => x)),
    "level": level,
    "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toJson())),
  };
}

class Ability {
  final String? name;
  final String? text;
  final String? type;

  Ability({
    this.name,
    this.text,
    this.type,
  });

  factory Ability.fromRawJson(String str) => Ability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    name: json["name"],
    text: json["text"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "text": text,
    "type": type,
  };
}

class Attack {
  final String? name;
  final List<dynamic>? cost;
  final int? convertedEnergyCost;
  final String? damage;
  final String? text;

  Attack({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });

  factory Attack.fromRawJson(String str) => Attack.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
    name: json["name"],
    cost: json["cost"] == null ? [] : List<String>.from(json["cost"]!.map((x) => x)),
    convertedEnergyCost: json["convertedEnergyCost"],
    damage: json["damage"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cost": cost,
    "convertedEnergyCost": convertedEnergyCost,
    "damage": damage,
    "text": text,
  };
}

class Cardmarket {
  final String? url;
  final String? updatedAt;
  final Map<String, double>? prices;

  Cardmarket({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Cardmarket.fromRawJson(String str) => Cardmarket.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cardmarket.fromJson(Map<String, dynamic> json) => Cardmarket(
    url: json["url"],
    updatedAt: json["updatedAt"],
    prices: Map.from(json["prices"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "updatedAt": updatedAt,
    "prices": Map.from(prices!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}


class PokemonCardImages {
  final String? small;
  final String? large;

  PokemonCardImages({
    this.small,
    this.large,
  });

  factory PokemonCardImages.fromRawJson(String str) => PokemonCardImages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonCardImages.fromJson(Map<String, dynamic> json) => PokemonCardImages(
    small: json["small"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "large": large,
  };
}

class Legalities {
  final String? unlimited;
  final String? expanded;

  Legalities({
    this.unlimited,
    this.expanded,
  });

  factory Legalities.fromRawJson(String str) => Legalities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
    unlimited: json["unlimited"],
    expanded: json["expanded"],
  );

  Map<String, dynamic> toJson() => {
    "unlimited": unlimited,
    "expanded": expanded,
  };
}

class PokemonSet {
  final String? id;
  final String? name;
  final String? series;
  final int? printedTotal;
  final int? total;
  final Legalities? legalities;
  final String? ptcgoCode;
  final String? releaseDate;
  final String? updatedAt;
  final SetImages? images;

  PokemonSet({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.images,
  });

  factory PokemonSet.fromRawJson(String str) => PokemonSet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonSet.fromJson(Map<String, dynamic> json) => PokemonSet(
    id: json["id"],
    name: json["name"],
    series: json["series"],
    printedTotal: json["printedTotal"],
    total: json["total"],
    legalities: json["legalities"] == null ? null : Legalities.fromJson(json["legalities"]),
    ptcgoCode: json["ptcgoCode"],
    releaseDate: json["releaseDate"],
    updatedAt: json["updatedAt"],
    images: json["images"] == null ? null : SetImages.fromJson(json["images"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "series": series,
    "printedTotal": printedTotal,
    "total": total,
    "legalities": legalities?.toJson(),
    "ptcgoCode": ptcgoCode,
    "releaseDate": releaseDate,
    "updatedAt": updatedAt,
    "images": images?.toJson(),
  };
}

class SetImages {
  final String? symbol;
  final String? logo;

  SetImages({
    this.symbol,
    this.logo,
  });

  factory SetImages.fromRawJson(String str) => SetImages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SetImages.fromJson(Map<String, dynamic> json) => SetImages(
    symbol: json["symbol"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "logo": logo,
  };
}

class Resistance {
  final String? type;
  final String? value;

  Resistance({
    this.type,
    this.value,
  });

  factory Resistance.fromRawJson(String str) => Resistance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resistance.fromJson(Map<String, dynamic> json) => Resistance(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": value,
  };
}

class Tcgplayer {
  final String? url;
  final String? updatedAt;
  final Prices? prices;

  Tcgplayer({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Tcgplayer.fromRawJson(String str) => Tcgplayer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tcgplayer.fromJson(Map<String, dynamic> json) => Tcgplayer(
    url: json["url"],
    updatedAt: json["updatedAt"],
    prices: json["prices"] == null ? null : Prices.fromJson(json["prices"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "updatedAt": updatedAt,
    "prices": prices?.toJson(),
  };
}

class Prices {
  final Holofoil? holofoil;
  final Holofoil? reverseHolofoil;
  final Holofoil? normal;

  Prices({
    this.holofoil,
    this.reverseHolofoil,
    this.normal,
  });

  factory Prices.fromRawJson(String str) => Prices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
    holofoil: json["holofoil"] == null ? null : Holofoil.fromJson(json["holofoil"]),
    reverseHolofoil: json["reverseHolofoil"] == null ? null : Holofoil.fromJson(json["reverseHolofoil"]),
    normal: json["normal"] == null ? null : Holofoil.fromJson(json["normal"]),
  );

  Map<String, dynamic> toJson() => {
    "holofoil": holofoil?.toJson(),
    "reverseHolofoil": reverseHolofoil?.toJson(),
    "normal": normal?.toJson(),
  };
}

class Holofoil {
  final double? low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;

  Holofoil({
    this.low,
    this.mid,
    this.high,
    this.market,
    this.directLow,
  });

  factory Holofoil.fromRawJson(String str) => Holofoil.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Holofoil.fromJson(Map<String, dynamic> json) => Holofoil(
    low: json["low"]?.toDouble(),
    mid: json["mid"]?.toDouble(),
    high: json["high"]?.toDouble(),
    market: json["market"]?.toDouble(),
    directLow: json["directLow"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "low": low,
    "mid": mid,
    "high": high,
    "market": market,
    "directLow": directLow,
  };
}
