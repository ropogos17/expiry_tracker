# Hűtő Nyilvántartó App

Ez a Flutter alapú mobilalkalmazás lehetőséget biztosít a felhasználóknak arra, hogy nyomon kövessék a hűtőszekrényükben található élelmiszereket. A cél az élelmiszerpazarlás csökkentése, a hatékonyabb készletezés és a könnyebb bevásárlástervezés.

## Funkciók

- ✅ Hozzáadhatsz új élelmiszert a hűtőhöz
- ✏️ Módosíthatod a meglévő tételeket (pl. mennyiség, lejárati dátum)
- 🗑️ Törölhetsz tételeket
- 📅 Lejárati idő alapján figyelmeztetések (később bővítve)
- 🔍 Keresés a hűtő tartalmában

## Képernyők

- **Főképernyő**: Az összes hűtőben lévő tétel listázása
- **Új tétel hozzáadása**: Űrlap az új élelmiszerek felvitelére
- **Tétel részletei / szerkesztés**: Meglévő elem módosítása
- **Beállítások**: (Tervezett funkciók: értesítések, nyelv, sötét mód stb.)

## Használt technológiák

- Flutter (Dart)
- [Provider](https://pub.dev/packages/provider) vagy [Riverpod](https://pub.dev/packages/riverpod) az állapotkezeléshez
- Lokális tárolás: Hive vagy SharedPreferences
- Később: Firebase integráció (felhő alapú szinkronizációhoz)

## Telepítés

1. Klónozd a projektet:
   ```
   git clone https://github.com/secspine404/expiry_tracker.git
   ```

2. Lépj be a könyvtárba:
   ```
   cd expiry_tracker
   ```

3. Függőségek letöltése:
   ```
   flutter pub get
   ```

4. Indítsd az alkalmazást:
   ```
   flutter run
   ```

## Jövőbeli fejlesztések

- 🔔 Lejárati idő előtti értesítések
- 📊 Statisztikák az elhasznált/törölt termékekről
- 🛒 Bevásárlólista funkció
- ☁️ Felhő alapú szinkronizáció

## Képernyőképek
_(Ide kerülhetnek beillesztett képek az alkalmazásról)_

## Közreműködés

Szívesen fogadok pull requesteket, ötleteket, és hibajegyeket! Ha szeretnél hozzájárulni a projekthez, nyugodtan lépj kapcsolatba velem.

---

**Licenc:** MIT