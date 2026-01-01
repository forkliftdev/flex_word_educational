class GameWords {
  // Group 1: The First 100 (Target Answers)
  static const List<String> level1 = [
    'ALL', 'AND', 'ARE', 'BUT', 'CAN', 'DAY', 'DID', 'FOR', 'GET', 
    'HAD', 'HAS', 'HER', 'HIM', 'HIS', 'HOW', 'NOT', 'NOW', 'ONE', 
    'OUT', 'SEE', 'SHE', 'SIT', 'THE', 'TWO', 'USE', 'WAS', 'WAY', 
    'WHO', 'YOU'
  ];

  // Group 2: The Second 100 (Target Answers)
  static const List<String> level2 = [
    'AIR', 'ANY', 'ASK', 'BIG', 'BOY', 'END', 'MAN', 'MEN', 'NEW', 
    'OFF', 'OLD', 'OUR', 'PUT', 'SAY', 'SET', 'TOO', 'TRY', 'WHY'
  ];

  // Getter to combine all target answers
  static List<String> get allTargets => [...level1, ...level2];

  // THE BOUNCER LIST: The 460 valid guesses
  static const Set<String> validGuesses = {
    // A
    'ACE', 'ACT', 'ADD', 'ADO', 'AGE', 'AGO', 'AID', 'AIM', 'AIR', 'ALE', 
    'ALL', 'AND', 'ANT', 'ANY', 'APE', 'APT', 'ARC', 'ARE', 'ARK', 'ARM', 
    'ARR', 'ART', 'ASH', 'ASK', 'ASP', 'ATE', 'AVE', 'AWE', 'AWL', 'AYE',

    // B
    'BAD', 'BAG', 'BAH', 'BAM', 'BAN', 'BAP', 'BAR', 'BAT', 'BAY', 'BED', 
    'BEE', 'BEG', 'BET', 'BIB', 'BID', 'BIG', 'BIN', 'BIT', 'BOA', 'BOB', 
    'BOD', 'BOG', 'BOO', 'BOP', 'BOT', 'BOW', 'BOX', 'BOY', 'BRA', 'BRR', 
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
    'SEW', 'SHE', 'SHY', 'SIB', 'SIN', 'SIP', 'SIR', 'SIT', 'SIX', 'SKI', 
    'SKY', 'SLY', 'SOB', 'SOY', 'SPA', 'SPY', 'SUB', 'SUE', 'SUM', 'SUN', 
    'SUP',

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