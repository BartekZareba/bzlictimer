# Timer odliczający odzyskanie prawa jazdy Bartusia
### Przed uruchomieniem ustaw adres w zmiennych środowiskowych
```
vi .sp-env
```
```
vi .st-env
```

### Uruchamianie kontenera
- Uruchomienie Kontenera
```
./run.sh <st/sp> up
```

### Zarządzanie kontenerem
```
./run.sh <st/sp> <up/restart/down>
```

### INFO
Przed uruchomieniem kontenera należy zbudować image - ./run.sh up/restart robią to automatycznie
```
docker-compose build
```
```
docker-compose up -d
```
Każda zmiana w aplikacji - deploy nowej wersji buduje nowy obraz, ale stary obraz zostaje na dysku.</br>
Wobec tego po ewentualnych pracach zaleca się wyczyszczenie dysku z nieużywanych obrazów.</br></br>
Usunięcie konkretnego obrazu:
```
docker rmi <image_id_or_name>
```
Usunięcie `wszystkich nieotagowanych nieużywanych` obrazów:
```
docker image prune
```
Usunięcie `wszystkich nieużywanych` obrazów:
```
docker image prune -a
```
