# Art style: Cozy Cafe, flat vector 2D

## Look
- 2D flat vector cartoon, thick espresso-brown outline (same thickness on everything), rounded corners, simple shapes, soft flat shading, no gradients on characters.
- View: front/side cutaway of rooms (like a dollhouse), characters in side view.
- Characters: big head, small body, max 5 colors, readable silhouette, a job clue (apron, hat).
- Warm and cozy mood: checkered cream and terracotta floors, chalkboard menu signs, hanging lamps, steam drawn as simple curves.
- Must look different from green/yellow "upgrade button" mobile games: use caramel and terracotta buttons, cream panels, mint accents.

## Palette (8 colors only; do not add more)
espresso #3B2314 (outlines, text)
cream #FFF3E0 (panels, backgrounds)
terracotta #D9663B (primary buttons, accents)
caramel #E8A24A (money, highlights)
mint #7FD1B9 (positive, success)
berry #E86A92 (special, regulars, hearts)
blueberry #4A6FA5 (cold drinks, night tint)
white #FFFFFF

## Time-of-day tints (color overlay only, no extra art)
morning: warm yellow at 10% opacity; lunch: none; evening: terracotta at 15%; night: blueberry at 35% plus lamp glow.

## Asset sizes (PNG, transparent background, power-of-two friendly)
station room background: 1080x420
character (barista, customer, Burrito): 256x256 (separate body, arm, leg parts for barista)
menu item icon: 128x128
UI icon: 96x96
Currency icons: 96x96

## Naming and folders
snake_case. assets/images/{rooms,characters,items,ui}, assets/audio/{sfx,music}.
Examples: room_espresso_bar.png, barista_body.png, item_cappuccino.png, ui_coin.png, customer_mocha_dog.png.

## AI image rules (for me, the human)
One asset per image, plain white background, same style-lock text every time, remove background after generation, defringe edges, check outline thickness consistency.

## Fonts
Display and numbers: Lilita One. Body: Nunito. Both bundled in assets/fonts/ and declared in pubspec.yaml.
