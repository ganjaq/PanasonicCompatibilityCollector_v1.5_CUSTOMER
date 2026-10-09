# Sterownik ST DFU

[English](README.en.md) · [Deutsch](README.de.md)

Pakiet ST Tube 3.0.6.1 z DfuSe v3.0.6, katalog Driver/Win10. Zawiera niezmienione STtube.inf, sttube.cat oraz STTub30.sys dla x86 i x64. DPInst nie jest dołączony ani wymagany przez ten instalator.

## Instalacja

1. Zachowaj cały folder i oba podfoldery x86/x64. Nie uruchamiaj instalacji podczas READ BACKUP lub FLASH.
2. Uruchom **Install_DFU.cmd** i zatwierdź instalację oraz zgodę administratora Windows.
3. Podłącz obsługiwany licznik w trybie DFU, następnie wybierz **ODŚWIEŻ USB DFU** w Customerze.

Instalator korzysta z PnPUtil dostarczanego z Windows. Nie wykonuje flashowania, nie instaluje DPInst, nie zmienia sterownika COM i nie wyłącza sprawdzania podpisów. Dodaje cały oryginalny pakiet ST i instaluje go na pasujących urządzeniach; nie ogranicza zakresu oryginalnego INF do jednego modelu. Pełna procedura instalatora, łącznie z końcowym sprawdzeniem interfejsu USB, wymaga Windows 10 1903 lub nowszego, x86/x64, albo Windows 11 x64. Samo dodanie sterownika przez PnPUtil jest dostępne od Windows 10 1607. Zgodność na wszystkich późniejszych systemach nie została przetestowana. ARM64 nie jest obsługiwany.

Po instalacji bez podłączonego licznika potwierdzone jest dodanie pakietu, a nie wykrycie licznika. Kod 28 w Windows oznacza brak zainstalowanego sterownika. Jeśli urządzenie zgłasza inny błąd, sama ponowna instalacja nie musi go rozwiązać. Nie zastępuj sterownika przez WinUSB bez zmiany i przetestowania warstwy komunikacji Customera.

## Prawa i źródło

STTub30.sys: Copyright (C) STMicroelectronics 2015. Dołączone biblioteki STDFU.dll i STTubeDevice30.dll w głównym folderze programu zachowują oznaczenie Copyright © 2018. Prawa do składników ST wynikają z pełnej licencji [SLA0044 Rev5/February 2018](SLA0044.txt), nie z licencji własnego programu. Tekst oraz pliki producenta pozostają niezmienione. Wykorzystanie musi być zgodne ze wszystkimi warunkami ST, w szczególności ograniczeniem do mikrokontrolerów/mikroprocesorów wyprodukowanych przez ST lub dla ST. Nie oznacza to potwierdzenia zgodności każdego licznika ani poparcia ST dla projektu.

[Oficjalny pakiet DfuSe ST](https://www.st.com/en/development-tools/stsw-stm32080.html) · [Dokumentacja PnPUtil Microsoft](https://learn.microsoft.com/en-us/windows-hardware/drivers/devtest/pnputil-command-syntax)
