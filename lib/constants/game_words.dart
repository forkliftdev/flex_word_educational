class GameWords {
  // =========================================================
  // 1. STANDARDIZED POOLS (For Teachers & Levels)
  // =========================================================

  static const List<String> shortA = [
    'BAD', 'BAG', 'BAM', 'BAR', 'BAT', 'CAB', 'CAP', 'CAT', 'FAN', 'FAR', 
    'GAP', 'GAS', 'HAD', 'HAM', 'HAT', 'LAP', 'MAD', 'MAN', 'MAP', 'MAT', 
    'NAP', 'PAD', 'PAL', 'PAN', 'PAT', 'RAG', 'RAM', 'RAN', 'RAP', 'RAT', 
    'SAG', 'SAP', 'SAT', 'TAB', 'TAG', 'TAN', 'TAP', 'WAG', 'WAX', 'YAK', 
    'YAM', 'ZAP'
  ];

  static const List<String> shortE = [
    'BED', 'DEN', 'FED', 'GEL', 'HEM', 'HEN', 'JET', 'LED', 'LEG', 'LET', 
    'MEN', 'MET', 'NET', 'PEN', 'PEP', 'RED', 'SET', 'TEN', 'VET', 'WEB', 
    'WED', 'WET'
  ];

  static const List<String> shortI = [
    'BIB', 'BID', 'BIG', 'BIN', 'BIT', 'DIG', 'DIM', 'DIN', 'DIP', 'FIG', 
    'FIN', 'FIT', 'FIX', 'GIG', 'HID', 'HIP', 'HIT', 'JIG', 'KID', 'KIN', 
    'KIT', 'LID', 'LIP', 'LIT', 'MID', 'MIX', 'NIP', 'PIG', 'PIN', 'PIP', 
    'PIT', 'RIB', 'RID', 'RIG', 'RIM', 'RIP', 'SIP', 'SIT', 'SIX', 'SLY', 
    'TIP', 'TIN', 'WIG', 'WIN', 'ZIP'
  ];

  static const List<String> shortO = [
    'BOX', 'COD', 'COT', 'COW', 'DOG', 'DOT', 'FOG', 'FOX', 'GOT', 'HOG', 
    'HOP', 'HOT', 'LOG', 'LOT', 'MOP', 'NOD', 'NON', 'NOT', 'POD', 'POP', 
    'POT', 'ROD', 'TON', 'TOP', 'TOT'
  ];

  static const List<String> shortU = [
    'BUD', 'BUG', 'BUN', 'BUS', 'BUT', 'CUB', 'CUP', 'CUT', 'DUD', 'DUG', 
    'FUN', 'GUM', 'GUN', 'GUT', 'HUB', 'HUG', 'HUM', 'HUT', 'MUG', 'MUM', 
    'MUD', 'NUT', 'PUP', 'PUT', 'RUB', 'RUG', 'RUN', 'RUT', 'SUN', 'TUB', 
    'TUG'
  ];

  static const List<String> sightWords = [
    'ALL', 'AND', 'ANY', 'ARE', 'ATE', 'BOY', 'BUT', 'BUY', 'BYE', 'DAY', 
    'DID', 'EAT', 'END', 'FOR', 'GOT', 'HER', 'HIM', 'HIS', 'HOW', 'NEW', 
    'NOT', 'NOW', 'ONE', 'OUR', 'OUT', 'PUT', 'SAY', 'SEE', 'SHE', 'THE', 
    'TOO', 'TWO', 'WAS', 'WAY', 'WHO', 'WHY', 'YOU', 'YES'
  ];

  static const List<String> animals = [
    'ANT', 'APE', 'COW', 'CUB', 'DOE', 'DOG', 'EEL', 'ELK', 'EMU', 'EWE', 
    'FOX', 'HEN', 'HOG', 'OWL', 'PIG', 'PUP', 'RAM', 'RAT', 'YAK'
  ];

  static const List<String> verbs = [
    'ACT', 'ADD', 'AIM', 'ASK', 'ATE', 'BUY', 'CUT', 'DIG', 'DIP', 'DRY', 
    'EAT', 'END', 'FIX', 'FLY', 'GET', 'HOP', 'HUG', 'HUM', 'JOG', 'LAY', 
    'LET', 'LIE', 'MOP', 'MOW', 'NAP', 'NOD', 'PAY', 'PEG', 'RAP', 'RID', 
    'RIP', 'ROW', 'RUN', 'SAY', 'SEE', 'SIP', 'SIT', 'TAP', 'TIE', 'TOW', 
    'TRY', 'USE', 'WAG', 'WIN', 'WOW', 'YAP', 'YES', 'ZIP'
  ];

  static const List<String> bodyParts = [
    'ARM', 'EYE', 'EAR', 'GUM', 'HIP', 'JAW', 'LEG', 'LIP', 'RIB', 'TOE'
  ];

  static const List<String> nature = [
    'RED', 'SKY', 'SUN', 'ICE', 'MUD', 'FOG', 'AIR', 'SEA', 'ASH'
  ];

  // =========================================================
  // 2. THE MASTER TARGET LIST (Default "Free Play")
  // =========================================================
  // This combines ALL pools above into one large set of target words.
  // Using a Set first removes any duplicates (like 'CAT' appearing in Short A and Animals).
  static List<String> get allTargets {
    final Set<String> uniqueWords = {
      ...shortA,
      ...shortE,
      ...shortI,
      ...shortO,
      ...shortU,
      ...sightWords,
      ...animals,
      ...verbs,
      ...bodyParts,
      ...nature,
    };
    return uniqueWords.toList();
  }

  // =========================================================
  // 3. THE BOUNCER (Valid Guesses)
  // =========================================================
  // This allows kids to guess words that aren't targets (like 'BAD' or 'BRO')
  // without getting an error.
  static const Set<String> validGuesses = {
    // A
    'ACE', 'ACT', 'ADD', 'ADO', 'AGE', 'AGO', 'AID', 'AIM', 'AIR', 'ALE', 
    'ALL', 'AND', 'ANT', 'ANY', 'APE', 'APT', 'ARC', 'ARE', 'ARK', 'ARM', 
    'ARR', 'ART', 'ASH', 'ASK', 'ASP', 'ATE', 'AVE', 'AWE', 'AWL', 'AYE',
    // B
    'BAD', 'BAG', 'BAH', 'BAM', 'BAN', 'BAP', 'BAR', 'BAT', 'BAY', 'BED', 
    'BEE', 'BEG', 'BET', 'BIB', 'BID', 'BIG', 'BIN', 'BIT', 'BOA', 'BOB', 
    'BOD', 'BOG', 'BOO', 'BOP', 'BOT', 'BOW', 'BOX', 'BOY', 'BRA', 'BRO', 'BRR', 
    'BUD', 'BUG', 'BUN', 'BUS', 'BUT', 'BUY', 'BYE',
    // C
    'CAB', 'CAD', 'CAM', 'CAN', 'CAP', 'CAR', 'CAT', 'CAW', 'CAY', 'COD', 
    'COG', 'COO', 'COP', 'COT', 'COW', 'COY', 'CRY', 'CUB', 'CUE', 'CUP', 
    'CUT',
    // D
    'DAB', 'DAD', 'DAM', 'DAY', 'DEN', 'DEW', 'DID', 'DIE', 'DIG', 'DIM', 
    'DIN', 'DIP', 'DOE', 'DOG', 'DON', 'DOT', 'DRY', 'DUB', 'DUD', 'DUE', 
    'DUG', 'DUO', 'DYE',
    // E
    'EAR', 'EAT', 'EBB', 'EEL', 'EGG', 'EGO', 'EHH', 'ELF', 'ELK', 'ELM', 
    'EMU', 'END', 'ERA', 'EVE', 'EWE', 'EWW', 'EYE',
    // F
    'FAD', 'FAM', 'FAN', 'FAR', 'FAT', 'FED', 'FEE', 'FEW', 'FIB', 'FIG', 
    'FIN', 'FIR', 'FIT', 'FIX', 'FLU', 'FLY', 'FOE', 'FOG', 'FOR', 'FOX', 
    'FRY', 'FUN', 'FUR',
    // G
    'GAG', 'GAH', 'GAL', 'GAP', 'GAS', 'GAY', 'GEE', 'GEL', 'GEM', 'GET', 
    'GIG', 'GOD', 'GOO', 'GOT', 'GRR', 'GUM', 'GUN', 'GUT', 'GUY', 'GYM',
    // H
    'HAD', 'HAG', 'HAH', 'HAM', 'HAS', 'HAT', 'HAY', 'HEH', 'HEM', 'HEN', 
    'HER', 'HEW', 'HEY', 'HID', 'HIM', 'HIP', 'HIS', 'HIT', 'HMM', 'HOE', 
    'HOG', 'HOP', 'HOT', 'HOW', 'HUB', 'HUE', 'HUG', 'HUH', 'HUM', 'HUT',
    // I
    'ICE', 'ICY', 'ILL', 'ILK', 'INK', 'INN', 'ION', 'IRE', 'IVY',
    // J
    'JAB', 'JAM', 'JAR', 'JAW', 'JAY', 'JET', 'JIB', 'JIG', 'JOB', 'JOG', 
    'JOY', 'JUG', 'JUT',
    // K
    'KEG', 'KEY', 'KID', 'KIN', 'KIT',
    // L
    'LAB', 'LAD', 'LAG', 'LAP', 'LAW', 'LAX', 'LAY', 'LEA', 'LED', 'LEE', 
    'LEG', 'LET', 'LID', 'LIE', 'LIP', 'LIT', 'LOG', 'LOO', 'LOT', 'LOW', 
    'LOX', 'LYE',
    // M
    'MAD', 'MAN', 'MAP', 'MAR', 'MAT', 'MAW', 'MAX', 'MAY', 'MED', 'MEN', 
    'MET', 'MEW', 'MID', 'MIX', 'MMM', 'MOB', 'MOM', 'MOO', 'MOP', 'MOW', 
    'MUD', 'MUG', 'MUM',
    // N
    'NAB', 'NAG', 'NAH', 'NAP', 'NAW', 'NAY', 'NET', 'NEW', 'NIL', 'NIP', 
    'NOD', 'NON', 'NOR', 'NOT', 'NOW', 'NUB', 'NUN', 'NUT',
    // O
    'OAR', 'OAT', 'ODD', 'ODE', 'OFF', 'OIL', 'OLD', 'ONE', 'OOF', 'OOP', 
    'OPT', 'ORE', 'OUR', 'OUT', 'OWL', 'OWN',
    // P
    'PAD', 'PAL', 'PAN', 'PAR', 'PAT', 'PAW', 'PAY', 'PEA', 'PEG', 'PEN', 
    'PEP', 'PET', 'PEW', 'PIE', 'PIG', 'PIN', 'PIP', 'PIT', 'PLY', 'POD', 
    'POP', 'POT', 'PRO', 'PRY', 'PUN', 'PUP', 'PUT',
    // R
    'RAG', 'RAM', 'RAN', 'RAP', 'RAT', 'RAW', 'RAY', 'RED', 'RIB', 'RID', 
    'RIG', 'RIM', 'RIP', 'ROB', 'ROD', 'ROE', 'ROT', 'ROW', 'RUB', 'RUG', 
    'RUM', 'RUN', 'RUT', 'RYE',
    // S
    'SAD', 'SAG', 'SAP', 'SAT', 'SAW', 'SAX', 'SAY', 'SEA', 'SEE', 'SET', 
    'SEW', 'SHE', 'SHY', 'SIB', 'SIN', 'SIP', 'SIR', 'SIS', 'SIT', 'SIX', 
    'SKI', 'SKY', 'SLY', 'SOB', 'SOY', 'SPA', 'SPY', 'SUB', 'SUE', 'SUM', 
    'SUN', 'SUP',
    // T
    'TAB', 'TAG', 'TAN', 'TAP', 'TAR', 'TAT', 'TAX', 'TEA', 'TEE', 'TEN', 
    'THE', 'THY', 'TIE', 'TIN', 'TIP', 'TOE', 'TOG', 'TON', 'TOO', 'TOP', 
    'TOT', 'TOW', 'TOY', 'TRY', 'TUB', 'TUG', 'TUM', 'TWO',
    // U
    'UGH', 'UMM', 'URN', 'USE',
    // V
    'VAN', 'VAT', 'VET', 'VIE', 'VID', 'VOW',
    // W
    'WAG', 'WAR', 'WAS', 'WAX', 'WAY', 'WEB', 'WED', 'WEE', 'WET', 'WHO', 
    'WHY', 'WIG', 'WIN', 'WIT', 'WOE', 'WON', 'WOW', 'WRY',
    // Y
    'YAK', 'YAM', 'YAP', 'YEA', 'YES', 'YET', 'YIN', 'YOU', 'YUM', 'YUP',
    // Z
    'ZAP', 'ZED', 'ZIP', 'ZOO', 'ZZZ'
  };
}