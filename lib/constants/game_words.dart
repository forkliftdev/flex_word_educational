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

  static List<String> get allTargets => [...level1, ...level2];

  // THE BOUNCER LIST: Common valid 3-letter words for validation
  // This allows kids to guess "DOG" or "CAT" even if they aren't the target.
  static const Set<String> validGuesses = {
    'ACE', 'ACT', 'ADD', 'ADO', 'AGE', 'AGO', 'AID', 'AIM', 'AIR', 'ALE', 'ALL', 'AND', 'ANT', 'ANY', 'APE', 'APT', 'ARC', 'ARE', 'ARK', 'ARM', 'ART', 'ASH', 'ASK', 'ASP', 'ATE', 'AVE', 'AWE', 'AWL', 'AYE', 
    'BAD', 'BAG', 'BAN', 'BAR', 'BAT', 'BAY', 'BED', 'BEE', 'BEG', 'BET', 'BIB', 'BID', 'BIG', 'BIN', 'BIT', 'BOA', 'BOB', 'BOG', 'BOO', 'BOP', 'BOW', 'BOX', 'BOY', 'BRA', 'BUD', 'BUG', 'BUM', 'BUN', 'BUS', 'BUT', 'BUY', 'BYE', 
    'CAB', 'CAD', 'CAM', 'CAN', 'CAP', 'CAR', 'CAT', 'CAW', 'COD', 'COG', 'CON', 'COO', 'COP', 'COT', 'COW', 'COY', 'CRY', 'CUB', 'CUE', 'CUP', 'CUT', 
    'DAB', 'DAD', 'DAM', 'DAY', 'DEN', 'DEW', 'DID', 'DIE', 'DIG', 'DIM', 'DIN', 'DIP', 'DOE', 'DOG', 'DON', 'DOT', 'DRY', 'DUB', 'DUD', 'DUE', 'DUG', 'DUO', 'DYE', 
    'EAR', 'EAT', 'EBB', 'EEL', 'EGG', 'EGO', 'ELF', 'ELK', 'ELM', 'END', 'ERA', 'EVE', 'EWE', 'EYE', 
    'FAN', 'FAR', 'FAT', 'FED', 'FEE', 'FEW', 'FIB', 'FIG', 'FIN', 'FIR', 'FIT', 'FIX', 'FLU', 'FLY', 'FOE', 'FOG', 'FOR', 'FOX', 'FRY', 'FUN', 'FUR', 
    'GAG', 'GAL', 'GAP', 'GAS', 'GAY', 'GEL', 'GEM', 'GET', 'GIG', 'GIN', 'GOD', 'GOO', 'GOT', 'GUM', 'GUN', 'GUT', 'GUY', 'GYM', 
    'HAD', 'HAG', 'HAM', 'HAS', 'HAT', 'HAY', 'HEM', 'HEN', 'HER', 'HEW', 'HEY', 'HID', 'HIM', 'HIP', 'HIS', 'HIT', 'HOE', 'HOG', 'HOP', 'HOT', 'HOW', 'HUB', 'HUE', 'HUG', 'HUM', 'HUT', 
    'ICE', 'ICY', 'ILL', 'INK', 'INN', 'ION', 'IRE', 'IVY', 
    'JAB', 'JAM', 'JAR', 'JAW', 'JAY', 'JET', 'JIG', 'JOB', 'JOG', 'JOY', 'JUG', 'JUT', 
    'KEG', 'KEY', 'KID', 'KIN', 'KIT', 
    'LAB', 'LAD', 'LAG', 'LAP', 'LAW', 'LAX', 'LAY', 'LEA', 'LED', 'LEE', 'LEG', 'LET', 'LID', 'LIE', 'LIP', 'LIT', 'LOG', 'LOO', 'LOT', 'LOW', 
    'MAD', 'MAN', 'MAP', 'MAT', 'MAY', 'MEN', 'MET', 'MEW', 'MID', 'MIX', 'MOB', 'MOM', 'MOO', 'MOP', 'MOW', 'MUD', 'MUG', 'MUM', 
    'NAG', 'NAP', 'NAY', 'NET', 'NEW', 'NIL', 'NIP', 'NOD', 'NON', 'NOR', 'NOT', 'NOW', 'NUN', 'NUT', 
    'OAR', 'OAT', 'ODD', 'ODE', 'OFF', 'OIL', 'OLD', 'ONE', 'OPT', 'ORE', 'OUR', 'OUT', 'OWL', 'OWN', 
    'PAD', 'PAL', 'PAN', 'PAR', 'PAT', 'PAW', 'PAY', 'PEA', 'PEG', 'PEN', 'PEP', 'PET', 'PEW', 'PIE', 'PIG', 'PIN', 'PIT', 'PLY', 'POD', 'POP', 'POT', 'PRO', 'PRY', 'PUB', 'PUN', 'PUP', 'PUT', 
    'RAG', 'RAM', 'RAN', 'RAP', 'RAT', 'RAW', 'RAY', 'RED', 'RIB', 'RID', 'RIG', 'RIM', 'RIP', 'ROB', 'ROD', 'ROT', 'ROW', 'RUB', 'RUG', 'RUM', 'RUN', 'RUT', 'RYE', 
    'SAD', 'SAG', 'SAP', 'SAT', 'SAW', 'SAY', 'SEA', 'SEE', 'SET', 'SEW', 'SEX', 'SHE', 'SHY', 'SIN', 'SIP', 'SIR', 'SIT', 'SIX', 'SKI', 'SKY', 'SLY', 'SOB', 'SOD', 'SON', 'SOP', 'SOW', 'SOY', 'SPA', 'SPY', 'SUB', 'SUE', 'SUM', 'SUN', 
    'TAB', 'TAG', 'TAN', 'TAP', 'TAR', 'TAT', 'TAX', 'TEA', 'TEE', 'TEN', 'THE', 'THY', 'TIE', 'TIN', 'TIP', 'TOE', 'TOG', 'TON', 'TOO', 'TOP', 'TOT', 'TOY', 'TRY', 'TUB', 'TUG', 'TWO', 
    'URN', 'USE', 
    'VAN', 'VAT', 'VET', 'VIE', 'VOW', 
    'WAG', 'WAR', 'WAS', 'WAX', 'WAY', 'WEB', 'WED', 'WEE', 'WET', 'WHO', 'WHY', 'WIG', 'WIN', 'WIT', 'WOE', 'WON', 'WOW', 'WRY', 
    'YAK', 'YAM', 'YAP', 'YEA', 'YES', 'YET', 'YOU', 
    'ZAP', 'ZED', 'ZIP', 'ZOO'
  };
}