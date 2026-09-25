# Panasonic Compatibility Collector v1.5 — CUSTOMER

Panasonic Compatibility Collector to narzędzie diagnostyczne przeznaczone dla wybranych systemów napędowych Panasonic stosowanych w rowerach elektrycznych.

Program umożliwia automatyczne rozpoznanie podłączonego systemu, wykonanie odczytu diagnostycznego oraz sprawdzenie zgodności roweru z obsługiwanymi profilami.

## Główne funkcje

- automatyczne wykrywanie kompatybilnego systemu Panasonic,
- odczyt danych ECU, BMS i sterownika/display,
- identyfikacja modelu oraz wersji systemu,
- odczyt danych diagnostycznych i eksploatacyjnych,
- tworzenie raportu diagnostycznego,
- automatyczna analiza zgodności,
- obsługa profilu ECU,
- kontrolowany SPEED UNLOCK dla zgodnych systemów,
- weryfikacja wykonanej operacji poprzez ponowny odczyt,
- zabezpieczenia przed przypadkowym wielokrotnym wykonaniem operacji.

## Obsługiwane rodziny

Projekt rozwijany jest obecnie dla rodzin:

- PCT13S36
- PCT14S36
- PCT16S36

Samo rozpoznanie modelu nie oznacza automatycznie dostępności wszystkich funkcji.

Każdy rower jest sprawdzany indywidualnie przed udostępnieniem operacji wymagających zapisu.

## Bezpieczny tryb pracy

Pierwszy kontakt z rowerem jest wykonywany w trybie diagnostycznym.

Program najpierw:

1. identyfikuje system,
2. wykonuje wymagane odczyty,
3. sprawdza spójność danych,
4. tworzy raport,
5. analizuje zgodność,
6. dopiero po pozytywnej weryfikacji może udostępnić odpowiednie funkcje.

Program nie wykonuje automatycznego ponawiania operacji zapisu.

Jeżeli docelowa konfiguracja jest już ustawiona, ponowny zapis nie jest wykonywany.

## SPEED UNLOCK

Dla zgodnego i zweryfikowanego systemu aplikacja może udostępnić funkcję:

**SPEED UNLOCK**

Dostępność tej funkcji zależy od zgodności konkretnego ECU i jego profilu.

Program nie deklaruje ani nie gwarantuje konkretnej maksymalnej prędkości roweru.

## ECU PROFILE

Po wykonaniu diagnostyki aplikacja może automatycznie otrzymać zweryfikowany profil odpowiedni dla danego ECU.

Użytkownik otrzymuje proste informacje o stanie, np.:

- ANALIZA W TOKU
- OCZEKIWANIE NA POTWIERDZENIE
- ECU PROFILE READY
- ECU PROFILE INSTALLED
- SPEED UNLOCK READY
- FLASH COMPLETE

## Zawartość paczki

Aktualna paczka CUSTOMER zawiera:

- `PanasonicCompatibilityCollector_v1.5_CUSTOMER_STAGE6.exe`
- wymagany plik konfiguracyjny
- `PanasonicReadCore.dll`

Nie należy uruchamiać programu bez wymaganych plików znajdujących się w paczce.

## Wymagania

- komputer z systemem Windows,
- kompatybilny system Panasonic,
- połączenie USB z rowerem,
- dostęp do Internetu dla funkcji wymagających weryfikacji online.

## Aktualny status

Wersja CUSTOMER jest nadal rozwijana i testowana na rzeczywistym sprzęcie.

Aktualny etap obejmuje m.in.:

- pełny odczyt diagnostyczny,
- analizę zgodności,
- obsługę ECU PROFILE,
- kontrolowaną operację SPEED UNLOCK,
- weryfikację rezultatu operacji,
- raportowanie statusu wykonanej operacji.

Kolejne wydania będą publikowane w sekcji **Releases**.

## Pobieranie

Zalecane jest pobieranie kompletnej paczki ZIP z sekcji:

**Releases**

Nie należy pobierać samego pliku EXE bez pozostałych plików znajdujących się w paczce.

## Ważne

Oprogramowanie przeznaczone jest do pracy wyłącznie z obsługiwanymi systemami Panasonic.

Kompatybilność jest sprawdzana przez program indywidualnie dla każdego podłączonego systemu.

Użytkownik odpowiada za przestrzeganie lokalnych przepisów dotyczących użytkowania rowerów elektrycznych.
