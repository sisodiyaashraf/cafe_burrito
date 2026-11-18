# Cafe Burrito: Game Design

Tagline: Brew. Wrap. Serve.
Platform: Android first (Flutter), portrait only, 2D, works offline.
Genre: Idle/tycoon cafe game.
Mascot: "Burrito", a chubby orange cat barista in a brown apron.

## Core loop
1. Customers (animals) arrive at the Order Counter and show an order bubble (item icon).
2. The matching station's barista makes the item.
3. The item goes to the counter and the customer pays coins (plus tips).
4. Coins buy upgrades and new stations. More stations means more menu items and higher income.

## Screen layout (portrait)
- Top bar (HUD): coins, golden beans, settings icon.
- Upper area: street door and Order Counter with waiting customers and order bubbles.
- Main area: vertically scrolling list of station rooms (one room per station).
- Bottom navigation: Cafe | Regulars | Shop.

## Stations (v1.0, 7 total)
1 Espresso Bar (free at start), 2 Cold Drinks Bar, 3 Sandwich Grill, 4 Burrito Wrap Table, 5 Pizza Oven, 6 Bakery (cookies and pastries), 7 Cake Display.
Each station has 4 menu items (see 02_MENU_DATA.md), its own barista, a level, and a star rating.

## Unique features (all must be in v1.0)
1. Order bubbles and combos: if a customer orders two items from different categories, serving both within 10 seconds gives a combo bonus (x1.5 payout).
2. Time-of-day rushes: an in-game day lasts 8 real minutes split into Morning (coffee x2), Lunch (sandwich, burrito, pizza x2), Evening (bakery and cake x2), Night (all x1.2, cozy lights). The scene tint changes with the time of day using color overlays only.
3. Regulars album: 8 named animal regulars, each with a favorite item. Serving their favorite gives 3x tip and relationship points. Relationship levels 1 to 5 give small permanent bonuses. A Regulars screen shows the collection.
4. Burrito the cat: tap Burrito to trigger a short "double tap income" boost (30 seconds, 10 minute cooldown).

## Progression
- Upgrade cost = baseUpgradeCost * 1.15 ^ level.
- Milestone levels 10, 25, 50, 100, 200: income x2, a new menu item becomes available (10, 25, 50), a star is added, and the station room visuals improve.
- Managers: hiring a manager makes a station fully automatic.
- Prestige ("Open a New Branch") comes after v1.0 and is out of scope.
- Offline earnings: capped at 2 hours.

## Currencies
- Coins: free currency, plentiful, used for upgrades and unlocks.
- Golden Beans: premium currency, scarce, used for managers, boosts, and cosmetics. Nothing required for progress may need Golden Beans.

## Monetization (implemented in later steps)
- Rewarded ads only by player choice (offline earnings x2, rush boost, free chest, cash shortfall).
- Interstitials: rare, only at natural breaks, never in the first 10 minutes, at most one per 5 minutes, and none for ad-free buyers.
- IAP: Remove Ads, Starter Pack, Golden Bean packs, permanent x2 income, auto-collect.
- Never show an ad over the upgrade buttons or the HUD.

## v1.0 scope: IN
7 stations, 28 menu items, 8 regulars, combos, time-of-day rush, save/load, offline earnings, managers, shop with coins and beans, rewarded ads, IAP, settings, sound, tutorial.
## v1.0 scope: OUT
Prestige, multiplayer, leaderboards, iOS release, cloud save.
