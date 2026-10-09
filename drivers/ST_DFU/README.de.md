# ST-DFU-Treiber

[Polski](README.md) · [English](README.en.md)

ST-Tube-Paket 3.0.6.1 aus DfuSe v3.0.6, Driver/Win10. Enthält unveränderte STtube.inf, sttube.cat und STTub30.sys für x86 und x64. DPInst ist weder enthalten noch für dieses Installationsprogramm erforderlich.

## Installation

1. Bewahren Sie den vollständigen Ordner einschließlich x86/x64 auf. Installieren Sie nicht während READ BACKUP oder FLASH.
2. Starten Sie **Install_DFU.cmd** und bestätigen Sie die Installation sowie die Windows-Administratorabfrage.
3. Verbinden Sie ein unterstütztes Display im DFU-Modus und wählen Sie **USB DFU AKTUALISIEREN** in Customer.

Das Installationsprogramm verwendet das mit Windows gelieferte PnPUtil. Es schreibt keine Firmware, installiert kein DPInst, ändert nicht den COM-Treiber und deaktiviert nicht die Treibersignaturprüfung. Es fügt das vollständige originale ST-Paket hinzu und installiert es für passende Geräte; die originale INF wird nicht auf ein Modell beschränkt. Der vollständige Installationsablauf einschließlich der abschließenden Prüfung der USB-Schnittstelle benötigt Windows 10 Version 1903 oder neuer, x86/x64, oder Windows 11 x64. Das reine Hinzufügen des Treibers mit PnPUtil ist ab Windows 10 Version 1607 verfügbar. Die Kompatibilität mit allen späteren Systemen wurde nicht getestet. ARM64 wird nicht unterstützt.

Eine Installation ohne verbundenes Display bestätigt nur das Hinzufügen des Pakets, nicht die Display-Erkennung. Windows-Code 28 bedeutet, dass kein Treiber installiert ist. Andere Gerätefehler lassen sich nicht zwingend durch Neuinstallation beheben. Ersetzen Sie den Treiber nicht durch WinUSB, ohne die Kommunikationsschicht von Customer anzupassen und zu testen.

## Rechte und Quelle

STTub30.sys: Copyright (C) STMicroelectronics 2015. STDFU.dll und STTubeDevice30.dll im Hauptordner behalten ihre Copyright-©-2018-Hinweise. Für ST-Komponenten gilt die vollständige [SLA0044 Rev5/February 2018](SLA0044.txt), nicht die eigene Programmlizenz. Lizenztext und Herstellerdateien bleiben unverändert. Alle ST-Bedingungen gelten, insbesondere die ausschließliche Nutzung auf oder zusammen mit Mikrocontrollern/Mikroprozessoren, die von oder für ST hergestellt wurden. Dies bestätigt weder die Kompatibilität jedes Displays noch eine Unterstützung des Projekts durch ST.

[Offizielles ST-DfuSe-Paket](https://www.st.com/en/development-tools/stsw-stm32080.html) · [Microsoft-PnPUtil-Dokumentation](https://learn.microsoft.com/en-us/windows-hardware/drivers/devtest/pnputil-command-syntax)
