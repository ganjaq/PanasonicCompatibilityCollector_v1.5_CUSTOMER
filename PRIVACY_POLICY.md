# Polityka prywatności

Panasonic NEXT GEN Compatibility Customer 1.5.6 · kompilacja beta 1.5.6.1 · wersja dokumentu: 8 października 2026 r.

**Status wydania beta:** opis poniżej uwzględnia sprawdzony kod Customera/Collectora, backendu i wdrożony mechanizm usuwania pełnych dumpów po 30 dniach. Oznaczenie **REQUIRES VERIFICATION** wskazuje nadal niepotwierdzone kwestie prawne lub konfigurację dostawców. Nie zastępujemy tych braków zapewnieniami o pełnej anonimowości, usunięciu wszystkich danych ani zakończonym audycie. Przed szerszym udostępnieniem usługi dokument wymaga rozstrzygnięcia wskazanych kwestii.

## 1. Administrator i kontakt

Administratorem danych związanych z prowadzonym projektem jest **Łukasz Łąkowski (ganjaq), Polska**. Kontakt w sprawach prywatności i obsługi zgłoszeń: [ganjaq@interia.pl](mailto:ganjaq@interia.pl)

Projekt jest hobbystyczny i niezależny od producentów urządzeń. Nie oznacza to, że dane użytkowników publicznie dostępnej usługi są automatycznie wyłączone z ochrony prawnej.

Raporty nie są traktowane jako anonimowe. Model, numer ECU, fingerprint, kod zgłoszenia i korespondencja mogą pozwolić powiązać informacje z użytkownikiem. Skrót identyfikatora lub adresu IP również nie oznacza skutecznej anonimizacji.

## 2. Kiedy dane są odczytywane i wysyłane

READ odczytuje odpowiedzi urządzeń roweru. W normalnej procedurze aplikacja łączy się z usługą, sprawdza istniejące zgłoszenie i przesyła zabezpieczony raport nowego zgłoszenia albo materiał z ponownego odczytu istniejącego zgłoszenia. Nie jest to wyłącznie lokalny podgląd.

Podczas obsługi zgłoszenia mogą być przekazywane także informacje o połączeniu roweru, prośby o przywrócenie dostępu, dane potrzebne do sprawdzenia operacji oraz ich wyniki. Przy nieudanej weryfikacji aplikacja może przesłać dodatkowy materiał diagnostyczny. Zakres odpowiedzi zależy od urządzenia; nie zakładamy, że każda bateria lub każdy licznik dostarczą wszystkie dane.

Formularz kontaktowy przygotowuje wiadomość w programie pocztowym użytkownika. Nie wysyła jej automatycznie do API. Użytkownik sam zatwierdza wysłanie e-maila.

## 3. Zakres, cel i miejsce przechowywania

W tabeli „usługa” oznacza wykorzystywaną infrastrukturę: bazę danych i magazyn plików. Dane w tabeli nie są przeznaczone do publicznego repozytorium.

Oznaczenia retencji:

- **A — dane zgłoszenia i materiał techniczny:** pełne raporty, surowy pełny EEPROM i dodatkowe pełne odczyty obejmuje automat po **30 dniach od utworzenia zgłoszenia**, opisany w punkcie 7. Nie dotyczy to minimalnych danych rozpoznania roweru, uprawnień, wyników i wybranych materiałów operacji; te pozostają potrzebne do wznowienia obsługi. Nie ma ogólnego automatycznego terminu usuwania całego zgłoszenia.
- **B — lokalny pełny raport:** kasowany przez aplikację po zaakceptowaniu wysyłki, jeśli zapis i usunięcie plików zakończą się poprawnie; przy nieudanej wysyłce lub błędzie może pozostać. Nie ma ogólnego terminu kasowania tak pozostawionych plików.
- **C — lokalne dane zgłoszenia i kopie ratunkowe:** pozostają po zamknięciu aplikacji; nie potwierdzono automatycznego terminu usuwania. Użytkownik kontroluje własne lokalne pliki.
- **D — logi, liczniki bezpieczeństwa i korespondencja:** liczniki limitów żądań w bazie są automatycznie czyszczone po 30 dniach od ostatniej aktualizacji licznika. Nie potwierdzono kompletnego okresu retencji historii, korespondencji, logów dostawcy ani jego kopii zapasowych; reguła 30 dni nie jest zapewnieniem ich skasowania.
- **E — podgląd informacji:** dane okna pozostają w pamięci sesji do zamknięcia całej aplikacji; zamknięcie samego okna nie kończy sesji. Nie zmienia to retencji kopii tych samych danych w raporcie lub usłudze.

| Typ danych | Czy i kiedy są przesyłane | Cel | Gdzie są przechowywane | Czas i usunięcie |
| --- | --- | --- | --- | --- |
| Model silnika i generacja | Model w raporcie, sprawdzeniach i obsłudze operacji; generacja jest także ustalana przez analizę | Identyfikacja i zgodność | Raport R2, dane techniczne/analizy D1, lokalne dane zgłoszenia, podgląd | A, B, C, E |
| Numer ECU / serial silnika | Tak, jeśli został poprawnie odczytany | Właściwy rower, powiązanie zgłoszenia i wyników | R2, D1, lokalne dane zgłoszenia, podgląd | A, B, C, E |
| Identyfikacja i numer seryjny licznika | W raporcie, jeśli licznik odpowie; także przy żądaniu obsługi licznika | Sprawdzenie zgodności licznika i obsługa funkcji | R2, lokalne dane zgłoszenia i kopia licznika; zakres trwałego zapisu konkretnego żądania w chmurze wymaga sprawdzenia | A, B, C, E; REQUIRES VERIFICATION dla logów żądań licznika |
| Fingerprint roweru | Tak, przy zgłoszeniu i jego obsłudze | Powiązanie odczytów i uprawnień z właściwym rowerem | R2, D1 i lokalne dane zgłoszenia | A, B, C |
| Motor G — surowe dane konfiguracji sterownika | W raporcie i przy sprawdzaniu oraz potwierdzaniu operacji | Zgodność, przygotowanie zmiany i porównanie wyniku | R2; surowe dane i dane operacji w D1 | A, B |
| Maintenance status urządzeń | W odpowiedziach w raporcie, jeśli są dostępne | Identyfikacja i interpretacja odczytu | R2; status silnika również w danych technicznych D1 | A, B; dane podglądu E |
| Version2 — odpowiedź identyfikacyjna silnika i jej skróty | W raporcie oraz sprawdzeniach operacji | Rozpoznanie wersji i kontrola zgodności | R2; surowa odpowiedź i skróty w D1; dane potwierdzenia operacji | A, B |
| EEPROM silnika | Dostępne bloki i informacja o kompletności są częścią raportu; odczyty mogą być ponawiane przy obsłudze operacji | Analiza zgodności, diagnostyka i kontrola zmian | R2; także surowy bufor EEPROM wraz z informacją o brakach w D1, a wybrane fragmenty w zapisach analiz/operacji | A, B; pełny bufor i pełne odczyty obejmuje automat 30-dniowy, ale wybrany blok WALK i dane operacji mogą pozostać |
| Odpowiedzi BMS i dostępne dane baterii | Tak, jako część raportu, jeśli bateria odpowie | Diagnostyka i opis dostępnych danych urządzenia | Surowe odpowiedzi w R2 i lokalnym pełnym raporcie; podgląd w pamięci. W sprawdzonym zapisie technicznym D1 nie ma oddzielnego kompletu pól BMS | A, B, E |
| Raport diagnostyczny i surowe odpowiedzi urządzeń | Nowe zgłoszenie, ponowny READ, a w określonych przypadkach dodatkowa diagnostyka błędu | Obsługa zgłoszenia, odtworzenie podstaw analizy i wyjaśnienie problemów | Raporty zabezpieczone w R2; dla nowego zgłoszenia lokalny pełny raport. Część danych jest wyodrębniana do D1 | A, B; dodatkowa diagnostyka ma ograniczenia usuwania opisane w punkcie 7 |
| ID i kod zgłoszenia, wersja programu | Przy przesyłaniu raportu i dalszej obsłudze | Wznowienie obsługi, kontakt i zgodność formatu | R2, D1, zabezpieczone lokalne dane zgłoszenia | A, B, C |
| Status i wynik analizy | Powstają w usłudze i są przekazywane do aplikacji | Poinformowanie o zgodności i dostępnych funkcjach | D1, zapisane podsumowania odczytów w R2, podgląd/lokalne dane obsługi | A, C, E |
| Status oznaczony jako płatność i status uprawnień | Zapisywane w usłudze; wynik udostępniany aplikacji. Opcjonalne odniesienie do płatności może być wprowadzone przez operatora | Zarządzanie dostępem i dokumentowanie decyzji | D1 i historia działań związanych ze zgłoszeniem | A, D; oznaczenie płatności nie jest dowodem pobrania pieniędzy |
| Informacja o połączeniu roweru, sesji i wersji Customera | Podczas obsługi podłączonego roweru | Aktualny stan połączenia i właściwa obsługa zgłoszenia | D1; część danych sesji lokalnie lub w pamięci | A, C; część rekordów sesji ma warunkowe czyszczenie opisane w punkcie 7 |
| Wyniki WRITE/FLASH i odczytu potwierdzającego | Przy wykonaniu operacji lub późniejszym przekazaniu jej wyniku | Potwierdzenie, wyjaśnienie niepewnego wyniku i bezpieczeństwo obsługi | D1: wyniki, czasy, odpowiedzi potwierdzające i odpowiednie dane przed/po; w pamięci aplikacji, z minimalnymi lokalnymi danymi do ponowienia przekazania wyniku | A, C, E; restart nie oznacza usunięcia danych z usługi |
| Nazwa komputera | Warunkowo przy przywracaniu dostępu do zgłoszenia | Odróżnienie urządzenia/wniosku o dostęp | D1 w danych wniosku; nie jest wymagana w każdym READ | A; wniosek może wygasnąć bez skasowania rekordu |
| Adres IP i techniczne informacje żądania | IP jest dostępny infrastrukturze przy połączeniu HTTPS; aplikacja nie potrzebuje osobnego pola IP w raporcie | Komunikacja i ochrona przed nadużyciami | Infrastruktura Cloudflare; kod aplikacji serwerowej zapisuje skrót IP powiązany z oknem czasowym/licznikiem w D1. Zakres logów dostawcy nie został potwierdzony | D; liczniki mają czyszczenie po 30 dniach od aktualizacji, a logi dostawcy: REQUIRES VERIFICATION |
| Daty utworzenia, odczytu, analizy, potwierdzenia i obsługi | Daty klienta mogą być przekazywane; daty odbioru i utworzenia ustala także serwer | Historia i weryfikacja kolejności zdarzeń | D1, R2 i lokalne metadane odpowiednich plików | Retencja odpowiada rekordowi: A, B, C lub D |
| Imię, e-mail i treść wiadomości | Dopiero przy wysłaniu wiadomości przez użytkownika; dołączane są kod zgłoszenia, model i ECU, jeśli są dostępne | Odpowiedź na pytanie lub zgłoszenie | Poczta użytkownika i skrzynka kontaktowa projektu; nie znaleziono automatycznego wysyłania pól formularza do backendu | D; automat dumpów nie obejmuje skrzynki pocztowej. REQUIRES VERIFICATION dla procedury i kryteriów usuwania korespondencji |
| Lokalne dane potrzebne do dostępu i wznowienia obsługi | Odpowiednie dane zabezpieczenia dostępu są używane w komunikacji, bez publicznego ujawniania | Dostęp do własnego zgłoszenia i ponowienie obsługi | Zabezpieczone pliki lokalne; odpowiednie identyfikatory i skróty w D1 | A, C; nie publikować tych plików ani ich treści |
| Kopia pamięci licznika DFU | Nie znaleziono wysyłania pełnego backupu DFU przez ścieżkę jego zapisu/eksportu; przekazywane mogą być dane zgodności potrzebne do obsługi funkcji | Lokalna kopia ratunkowa | Zabezpieczony folder backupów na komputerze i ewentualny eksport wybrany przez użytkownika | C; nie jest automatycznie kasowana przy zamknięciu programu |
| Historia działań związanych ze zgłoszeniem | Powstaje w usłudze; może zawierać identyfikatory zgłoszenia, daty i opis czynności | Rozliczalność, wyjaśnianie zmian dostępu i bezpieczeństwo | D1 | D; część historii pozostaje mimo usunięcia głównego zgłoszenia |

Kod nie pokazuje automatycznego zbierania danych kart płatniczych ani rachunku bankowego przez Customer. Nie jest to zapewnienie dotyczące przyszłych ofert lub danych dobrowolnie podanych w korespondencji. Aktualne usługi są bezpłatne.

## 4. Podgląd a pliki lokalne

„Informacje o rowerze” korzystają z pamięci sesji. Zamknięcie tego okna nie usuwa podglądu, a zamknięcie całej aplikacji kończy sesję. Okno nie eksportuje danych do pliku. Ten mechanizm jest odrębny od raportu diagnostycznego.

Nowe zgłoszenie może tworzyć zabezpieczony pełny raport i pliki pomocnicze w **Dokumenty → Panasonic Compatibility Collector → Reports**. Po zaakceptowanej wysyłce kod usuwa lokalne pliki pełnego raportu i pozostawia zabezpieczone dane zgłoszenia. Nie ma potwierdzenia, że pliki zawsze znikną po błędzie systemu, braku dostępu do pliku lub nieudanej wysyłce.

Dane zgłoszenia, wnioski o odzyskanie dostępu i oczekujące potwierdzenia mogą pozostać po zamknięciu programu. Kopie licznika są zapisywane w **%LOCALAPPDATA%\PanasonicCollector\NksBackups**, a wyeksportowana kopia w miejscu wybranym przez użytkownika. Usunięcie takich plików może uniemożliwić wznowienie obsługi lub wykorzystanie kopii. Usunięcie lokalnego pliku nie kasuje danych w chmurze.

## 5. Cele i podstawy przetwarzania

Faktyczne cele widoczne w kodzie to: identyfikacja roweru, sprawdzenie zgodności, obsługa zgłoszenia i uprawnień, kontrola operacji, przywracanie dostępu, przeciwdziałanie nadużyciom, odpowiedź na kontakt oraz gromadzenie materiału do profili zgodności i rozwoju diagnostyki.

Dla obsługi usługi na żądanie użytkownika przewidywaną podstawą jest art. 6 ust. 1 lit. b RODO — w zakresie niezbędnym do wykonania uzgodnionej, obecnie bezpłatnej usługi. Dla koniecznych zabezpieczeń i rozpatrywania kontaktu może być stosowany art. 6 ust. 1 lit. f — uzasadniony interes w ochronie i prawidłowym działaniu projektu. **REQUIRES VERIFICATION:** sprawdzenie rzeczywistego sposobu zamawiania usługi, niezbędności zakresu i oceny uzasadnionego interesu przed ogłoszeniem tych podstaw jako ostatecznych.

Do ponownego rozpoznania roweru zachowujemy ograniczony zapis związany ze zgłoszeniem: identyfikację roweru, fingerprint, stan uprawnień i analizy, wyniki oraz potrzebne fragmenty przygotowanych operacji, w tym Motor G i wybrany blok WALK. To dane powiązane z rowerem, nie anonimowy szablon. Osobno tworzone opisy rodzin obejmują układ pól, reguły zmian i kontroli integralności; nie zapisują identyfikatorów konkretnego roweru ani kopii jego pełnego EEPROM-u. **REQUIRES VERIFICATION:** ocena niezbędności i podstawy prawnej dalszego zachowania danych powiązanych ze zgłoszeniem oraz ograniczenia ich czasu przechowywania; nie uznajemy całego dalszego rozwoju automatycznie za wykonanie pierwotnej usługi.

Podanie danych jest dobrowolne, ale bez danych wymaganych do identyfikacji i analizy nie można obsłużyć zgłoszenia lub przyznać odpowiedniej funkcji. Kontakt e-mail jest opcjonalny. Kliknięcie READ lub zaakceptowanie warunków nie jest ogólną zgodą na dowolne dalsze użycie danych. W sprawdzanej ścieżce nie znaleziono oddzielnego mechanizmu zgody na każdy możliwy przyszły cel.

## 6. Odbiorcy, infrastruktura i zabezpieczenia

Infrastruktura wykorzystuje Cloudflare Workers, D1 i R2. Kontakt odbywa się przez adres w domenie interia.pl i dostawcę poczty użytkownika. Dostęp operatora i osób przez niego upoważnionych służy obsłudze zgłoszeń. Nie jest to udostępnienie danych klientów w GitHubie.

Raport jest zabezpieczany przed wysłaniem i przesyłany przez HTTPS. Usługa może go odszyfrować do analizy. Wybrane dane techniczne, w tym surowy EEPROM i odpowiedzi identyfikacyjne, są zapisywane także w bazie; nie opisujemy całej bazy jako zbioru niedostępnych operatorowi, zaszyfrowanych raportów.

Nie obiecujemy absolutnego bezpieczeństwa ani pełnej anonimowości. Lokalne zabezpieczenie pliku dla konta Windows nie zastępuje ochrony samego komputera i konta użytkownika.

**REQUIRES VERIFICATION:** podmioty prawne dostawców właściwe dla kont projektu, ich role, umowy powierzenia, faktyczne lokalizacje, logi, kopie zapasowe i ewentualne transfery poza EOG oraz ich podstawy. Kod nie dowodzi przechowywania wszystkich danych wyłącznie w Polsce lub UE. Przed publikacją należy opisać rzeczywistą konfigurację; nie zastępujemy tego zapewnieniem o lokalizacji.

## 7. Retencja i usuwanie — stan potwierdzony w kodzie

### Pełne raporty i dump EEPROM — 30 dni

Wdrożony automat obejmuje główny pełny raport, ponowne pełne odczyty, dodatkową diagnostykę w magazynie plików, pełny bufor EEPROM w bazie oraz pełną listę bloków w zapisach analizy. Termin wynosi **30 dni od utworzenia zgłoszenia**, nie od ostatniego połączenia, zakończenia operacji ani zamknięcia programu. Zadanie uruchamia się w tle co 15 minut i przetwarza dane partiami.

Przed usunięciem sprawdzany jest ograniczony zapis rozpoznania roweru i potrzebnych materiałów obsługi. Oczekujący albo niepotwierdzony SPEED/WRITE/WALK nie blokuje usunięcia pełnego dumpu, gdy ten zapis jest poprawny. Samo rozpoznanie roweru nie uprawnia do nowego WRITE; wymagany jest świeży, zweryfikowany odczyt i właściwe uprawnienia.

Przy błędzie kasowania automat zachowuje stan oczekujący i ponawia próbę. Jeżeli nie można zweryfikować zapisu potrzebnego do dalszej obsługi, usunięcie wymaga wyjaśnienia i nie jest oznaczane jako wykonane. Termin 30 dni nie stanowi gwarancji usunięcia dokładnie co do sekundy ani potwierdzenia, że nie ma wyjątków wymagających interwencji.

### Dane, których usunięcie pełnego dumpu nie obejmuje

Pozostają minimalne dane rozpoznania roweru i zgłoszenia, uprawnienia, wyniki operacji, wybrane fragmenty techniczne oraz historia. Dzięki nim można wznowić obsługę bez tworzenia nowego zgłoszenia. Nie są one nazywane anonimowymi. W obecnym kodzie nie ma ogólnego automatycznego terminu kasowania całego takiego zapisu ani całej historii; żądanie usunięcia wymaga odrębnego rozpatrzenia. Nie będziemy przechowywać tych danych dłużej niż jest to niezbędne do uzasadnionego celu, ale **REQUIRES VERIFICATION:** przełożenie tej zasady na konkretną procedurę przeglądu i usuwania nieaktywnych zapisów oraz właściwą podstawę prawną.

Szablony rodzin opisują reguły techniczne bez identyfikatorów poszczególnych rowerów i pełnego dumpu. Reguła 30 dni nie dotyczy takich opisów ani lokalnych kopii ratunkowych licznika, którymi zarządza użytkownik.

Liczniki limitów żądań w bazie są czyszczone po 30 dniach od ich ostatniej aktualizacji. Rezerwacje i niektóre sesje mają krótsze reguły czyszczenia. Wygaśnięcie uprawnienia nie oznacza usunięcia całego rekordu. **REQUIRES VERIFICATION:** retencja korespondencji, pozostałych zapisów bezpieczeństwa oraz logów i kopii zapasowych dostawców. Usunięcie aktywnego pliku lub rekordu nie dowodzi ich skasowania.

30 dni to przyjęta zasada projektu dla pełnych dumpów, nie uniwersalny ustawowy termin na usunięcie wszystkich danych. RODO wymaga ograniczenia przechowywania do niezbędnego czasu oraz podania okresu albo kryteriów jego ustalenia: [art. 5 i 13 RODO](https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng).

## 8. Prawa użytkownika i kontakt

W granicach przewidzianych prawem można żądać dostępu, sprostowania, usunięcia lub ograniczenia przetwarzania oraz, gdy są spełnione warunki, przeniesienia danych lub wnieść sprzeciw. Jeśli określone przetwarzanie będzie oparte na zgodzie, można ją wycofać bez wpływu na legalność wcześniejszego przetwarzania. Można złożyć skargę do Prezesa Urzędu Ochrony Danych Osobowych lub innego właściwego organu nadzorczego.

Napisz na **ganjaq@interia.pl**, podając kod zgłoszenia i zakres żądania. Nie wysyłaj danych dostępu publicznie. Może być potrzebne adekwatne potwierdzenie uprawnienia do danych; nie należy żądać danych nadmiarowych. Brak kompletnego automatu usuwania nie znosi obowiązku prawidłowego rozpatrzenia żądania.

Analiza techniczna jest automatyczna i może dopuścić lub zablokować funkcję na podstawie odczytu. W razie wątpliwości można poprosić operatora o sprawdzenie wyniku. **REQUIRES VERIFICATION:** ocena, czy konkretny sposób świadczenia usługi i skutki takiej decyzji podlegają art. 22 RODO; nie deklarujemy ani jego automatycznego zastosowania, ani wyłączenia bez tej oceny.

## 9. Granice sprawdzenia i zmiany polityki

Sprawdzono kod przepływów, schematy bazy, wersje działających usług, włączoną konfigurację retencji i zadania cykliczne. Scenariusze usuwania, wznowienia obsługi i kontroli nowych liczników testowano na danych syntetycznych. Publiczny EXE jest kompilacją beta z kontrolą zasobów, wyłączonymi poleceniami diagnostycznymi i sumami SHA-256.

Nie wykonano w ramach tego przeglądu nowego READ/WRITE na rowerze ani celowego usuwania danych klientów. Nie zaobserwowano jeszcze rzeczywistego przypadku upływu 30 dni w obecnym wdrożeniu. Nie potwierdzono usunięcia wszystkich kopii dostawców, ich logów, umów ani transferów. Nie jest to niezależny audyt bezpieczeństwa lub kompletności całego EXE. Polityka wymaga uzupełnienia jawnie oznaczonych kwestii przed szerszym udostępnieniem usługi.

Zmiana celu lub istotnych zasad wymaga odpowiedniej informacji dla użytkownika i właściwej podstawy prawnej. Sama aktualizacja dokumentu nie pozwala dowolnie zmienić celu wykorzystania wcześniej zebranych danych.
