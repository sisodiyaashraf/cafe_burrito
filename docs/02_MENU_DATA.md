# Menu data (starting balance values; tuned in a later balance step)

Columns: id | display name | base price (coins) | prep seconds | unlocks at station level

## Station 1: Espresso Bar (category: hot_coffee), unlock cost 0
espresso | Espresso | 5 | 2.0 | 1
americano | Americano | 8 | 2.5 | 10
cappuccino | Cappuccino | 14 | 3.0 | 25
latte | Latte | 22 | 3.5 | 50

## Station 2: Cold Drinks Bar (category: cold_drink), unlock cost 500
cold_coffee | Cold Coffee | 30 | 3.0 | 1
iced_latte | Iced Latte | 48 | 3.5 | 10
frappe | Frappe | 75 | 4.0 | 25
cold_brew | Cold Brew | 110 | 4.5 | 50

## Station 3: Sandwich Grill (category: sandwich), unlock cost 4000
grilled_cheese | Grilled Cheese | 200 | 4.0 | 1
egg_sandwich | Egg Sandwich | 320 | 4.5 | 10
club_sandwich | Club Sandwich | 500 | 5.0 | 25
veggie_melt | Veggie Melt | 800 | 5.5 | 50

## Station 4: Burrito Wrap Table (category: burrito), unlock cost 30000
veg_burrito | Veg Burrito | 1200 | 5.0 | 1
chicken_burrito | Chicken Burrito | 1900 | 5.5 | 10
breakfast_burrito | Breakfast Burrito | 3000 | 6.0 | 25
loaded_burrito | Loaded Burrito | 4800 | 6.5 | 50

## Station 5: Pizza Oven (category: pizza), unlock cost 250000
margherita_slice | Margherita Slice | 7500 | 6.0 | 1
pepperoni_slice | Pepperoni Slice | 12000 | 6.5 | 10
veggie_slice | Veggie Slice | 19000 | 7.0 | 25
cheese_burst_slice | Cheese Burst Slice | 30000 | 7.5 | 50

## Station 6: Bakery (category: bakery), unlock cost 2000000
choc_chip_cookie | Choc Chip Cookie | 45000 | 5.0 | 1
oatmeal_cookie | Oatmeal Cookie | 70000 | 5.5 | 10
croissant | Croissant | 110000 | 6.0 | 25
cinnamon_roll | Cinnamon Roll | 170000 | 6.5 | 50

## Station 7: Cake Display (category: cake), unlock cost 15000000
brownie | Brownie | 260000 | 7.0 | 1
choc_cake_slice | Chocolate Cake Slice | 400000 | 7.5 | 10
cheesecake | Cheesecake | 620000 | 8.0 | 25
red_velvet_slice | Red Velvet Slice | 950000 | 8.5 | 50

## Regulars (8)
mocha_dog | Mocha the Dog | favorite: cappuccino
pixel_rabbit | Pixel the Rabbit | favorite: frappe
professor_owl | Professor Owl | favorite: americano
mango_parrot | Mango the Parrot | favorite: cold_coffee
biscuit_bear | Biscuit the Bear | favorite: choc_chip_cookie
luna_fox | Luna the Fox | favorite: red_velvet_slice
chef_panda | Chef Panda | favorite: pepperoni_slice
daisy_duck | Daisy the Duck | favorite: croissant

## Time-of-day multipliers (customer demand by category)
morning: hot_coffee x2, cold_drink x2
lunch: sandwich x2, burrito x2, pizza x2
evening: bakery x2, cake x2
night: all categories x1.2

## Station Costs (unlockCost and baseUpgradeCost)
station id | display name | category | unlockCost | baseUpgradeCost
espresso_bar | Espresso Bar | hot_coffee | 0 | 10
cold_drinks_bar | Cold Drinks Bar | cold_drink | 500 | 250
sandwich_grill | Sandwich Grill | sandwich | 4000 | 2000
burrito_wrap_table | Burrito Wrap Table | burrito | 30000 | 15000
pizza_oven | Pizza Oven | pizza | 250000 | 125000
bakery | Bakery | bakery | 2000000 | 1000000
cake_display | Cake Display | cake | 15000000 | 7500000

## Station IDs (7)
espresso_bar, cold_drinks_bar, sandwich_grill, burrito_wrap_table, pizza_oven, bakery, cake_display

## Item IDs (28)
espresso, americano, cappuccino, latte, cold_coffee, iced_latte, frappe, cold_brew, grilled_cheese, egg_sandwich, club_sandwich, veggie_melt, veg_burrito, chicken_burrito, breakfast_burrito, loaded_burrito, margherita_slice, pepperoni_slice, veggie_slice, cheese_burst_slice, choc_chip_cookie, oatmeal_cookie, croissant, cinnamon_roll, brownie, choc_cake_slice, cheesecake, red_velvet_slice

## Asset Naming Conventions
- Menu item icon: item_<id>.png (e.g. assets/images/items/item_cappuccino.png)
- Station room background: room_<stationId>.png (e.g. assets/images/rooms/room_espresso_bar.png)
- Regular customer: customer_<regularId>.png (e.g. assets/images/characters/customer_mocha_dog.png)

Rule: menu and regulars must be defined as data (const Dart lists/maps), never hardcoded inside widgets or components.
