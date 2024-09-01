enum NavigationOptions {
  home('Home'),
  help('Help'),
  promotions('Promotions'),
  venues('Venues'),
  liveCasinos('Live Casinos'),
  tableGames('Table Games'),
  slots('Slots'),
  jackpots('Jackpots'),
  exit('Exit'),
  url('URL'),
  pop('Pop');

  const NavigationOptions(this.name);

  final String name;
}
