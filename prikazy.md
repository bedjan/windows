### Sítě

**ping** - testuje spojení se vzdáleným PC, měří dobu odezvy (latenci)

*   `ping 192.168.10.5` - cílový PC podle IP
*   `ping -t komp1` - cílový PC podle DNS jména (provede se překlad) a neskončí po 4 paketech

**ipconfig** - konfigurace síťových adaptérů (zobrazení TCP/IP hodnot)

*   `ipconfig /all` - podrobný výpis
*   `ipconfg /renew` - obnoví IP adresu rozhranní
*   `ipconfig /registerdns` - obnoví DHCP pronájem a znovu zaregistruje adresu u DNS
*   `ipconfig /flushdns` - vyprázdní DNS cache
*   `ipconfig /displaydns` - zobrazí DNS cache

**nslookup** - nalezení DNS záznamů, zjednodušeně IP adresu k doménovému jménu

*   po spuštění má vlastní prompt
*   `nslookup www.seznam.cz` - vrátí A záznam z primárního DNS pro zadanou doménu
*   `ls -d {domena}` - výpis všech záznamů (pokud mám oprávnění) = Zone Transfer

**arp** - práce s ARP tabulkou (mapování IP adres na MAC adresy)

*   `arp -a` - vypíše ARP tabulku
*   `arp -d 157.55.85.212` - smaže záznam
*   `arp -s 157.55.85.212 00-aa-00-62-c6-09` - vloží záznam

**netstat** - aktivní TCP spojení na portu

*   `netstat -b` - vypíše aplikace, které vytvořili spojení
*   `netstat -r` - vypíše routovací tabulku
*   `netstat -ano | findstr 3044` – hledání

**netdiag** - informace o připojení klienta, diagnostický nástroj, který testuje připojení počítače do sítě, ověřuje autorizaci apod

**netsh** - network shell - konfigurace sítě

*   po spuštění má vlastní prompt
*   řádkové příkazy (shell) pro konfigurace všeho ohledně sítí
*   například `netsh interface ip` konfigurace IP adresy

**tracert** - funkce traceroute, sleduje cestu k cíli (přes jaké uzly/hopy)

*   `tracert www.google.com` - pingá jednotlivé hopy

**net –** široká paleta příkazů okolo sítí, sdílení, účtů, služeb

*   `net use Administrator heslo` - změna hesla lokálního uživatele Administrator na heslo
*   `net use` - zobrazí mapované shary
*   `net use u: \\ok\d` - namapuje síťovou cestu na disk
*   `net user uzivatel` - zobrazí informace o lokálním účtu
*   `net user uzivatel /expire:1.10.2011` - pro lokální účet nastaví dobu platnosti
*   `net user uzivatel /domain` - zobrazí informace o doménovém účtu (třeba poslední změna hesla, přihlášení, logon script, globální skupiny, atd.)
*   `net help user` - nápověda k příkazu net user
*   `net localgroup` - vypíše existující lokální skupiny
*   `net localgroup /domain` - vypíše existující skupiny v doméně

**route** - informace o routovací tabulce

*   `route print` - vypíše routovací tabulku

**telnet** - klient pro službu telnet, vhodný pro testování běhu aplikace na nějakém portu

*   `telnet www.google.com 80` - připojí se na danou adresu a port

**ftp** - jednoduchý klient pro FTP

**tftp** - jednoduchý klient pro TFTP

**pathping** - kombinace funkcí ping a traceroute, rychle projde cestu k cíli a vypíše hopy, pro každý hop provede statistiku pomocí pingu

*   `pathping -q 10 www.google.com` - dotaz na cíl podle DNS, 10 dotazů pro každý hop (zkrátí se délka provedení)

**nbtstat** - práce s NetBIOS, hlavně pro řešení problémů

*   `nbtstat -n` - lokálně registrovaná jména
*   `nbtstat -c` - zobrazí obsah NetBIOS cache
*   `nbtstat -RR` - obnoví záznam na WINS serveru

### Vzdálené volání

**winrm** - Windows Remote Management - vzdálené spouštění příkazů, WS-Management protocol

*   `winrm quickconfig` - konfigurace na serveru

**winrs** - vzdálené volání příkazů na 1serveru, kde běží WinRM

*   `winrs -r:POCITAC ipconfig` - na serveru POCITAC spustí příkaz ipconfig a vrátí výsledek

### Procesy a služby

**sc** - ovládání služeb (services)

*   `sc delete jmeno` - odstraní službu
*   `sc create jmeno` - přidá službu
*   `sc start jmeno` - spustí službu

**net** - i příkaz net můžeme použít k ovládání služeb (services)

*   `net start jmeno` - spustí službu
*   `net stop jmeno` - zastaví službu

**tasklist** - běžící procesy systému, obdoba Task Manageru, jde volat na vzdálený počítač, zobrazuje vazby mezi procesy

*   `tasklist /svc` - zobrazí služby v každém procesu
*   `tasklist /fi "PID eq 2500"` – hledání procesu s daným ID

**runas** - start aplikace pod jinými právy

*   `runas /user:ok\petr cmd.exe` - spustí cmd pod uživatelem petr

**at** - časové vzdálené spuštění, na vzdáleném počítači naplánuje spuštění určitého příkazu/úlohy

**shutdown** - vypnutí nebo restart počítače

*   `shutdown -r -f -t 1` - restart PC za 1s s vynuceným ukončením aplikací

**reg** - řádkový příkaz pro práci s registry (jako regedit), hledání, vkládání, mazání ...

**tskill** - ukončení procesu podle PID či jména, i na vzdáleném PC

**taskkill** - silnější příkaz pro ukončení procesu, může používat filtry, ukončovat více procesů naráz

### Doména a Group Policy

**gpresult** - Group Policy Result Tool

*   informace o aplikovaných politikách a bezpečnostních skupinách kam patří počítač a přihlášený uživatel

**gpudate** - provede update skupinových politik, normálně pouze změny, může se použít i na vzdálený PC

*   `gpupdate /force` - znovu aplikuje všechny politiky

**dsadd** - přídá objekt do AD

*   `dsadd ou ou=test,dc=firma,dc=local` - vytvoří organizační jednotku test v firma.local

**dsquery** - vyhledává informace v AD

*   `dsquery server` - seznam DC serverů
*   `dsquery server -hasfsmo schema` - vypíše, kdo má roli Schema Master
*   `dsquery server -hasfsmo name` - vypíše, kdo má roli Domain Naming Master
*   `dsquery server -hasfsmo infr` - vypíše, kdo má roli Infrastructure Master
*   `dsquery server -hasfsmo pdc` - vypíše, kdo má roli PDC Emulator
*   `dsquery server -hasfsmo rid` - vypíše, kdo má roli RID Master
*   `dsquery user -SAMID %USERNAME%` - hledá uživatele podle SAM account name (bereme aktuálně přihlášeného) a vrátí jeho DN (distinguished name)

**dsget** - získává informace z AD

*   `dsquery user -SAMID %USERNAME% | dsget user -SID` - pro aktuálně přihlášeného uživatele vrátí jeho SID z AD

**dsacls** - spravuje ACL (oprávnění) na AD DS objektech, je součástí Support Tools

*   `dsacls CN=Guest,CN=Users,DC=firma,DC=local` - zobrazí ACL na uživateli Guest

**ntdsutil** - databázová údržba Active Directory storu, spravuje FSMO, provádí autoritativní obnovení

**browstat** - zobrazí informace o doméně, PDC a browser, příkaz je z _Windows Resource Kitu_

*   `browstat sta` - zobrazí statistiky pro transporty

**certutil** - ovládání certifikační autority z příkazového řádku, je součástí Certificate Services

*   `certutil -dcinfo` - zobrazí informace o certifikátech doménových řadičů

**netdom** - zařazení počítače do domény, přejmenování, zřízení trustu, příkaz je z _Remote Server Administration Tools, Support Tools_

*   `netdom renamecomputer stare /newname:nove /userd:domain\admin /passwordd:* /reboot:60` \- změní jméno počítače (lokálně i v doméně), provede restart za 60 minut
*   `netdom query /d:domain FSMO` - seznam serverů, které majá FSMO roli
*   `netdom verify pocitac` - ověří spojení s DC a vypíše jeho jméno

**redircmp** - změní defaultní kontejner, kam se vloží účet počítače po zařazení do domény

*   `redircmp ou=pocitace,dc=firma,dc=local` - nastaví defaultní kontejner

**auditpol** - správa auditovacích politik, zobrazuje i nastavuje parametry

*   `Auditpol /list /subcategory:*` - vypíše podkategorie, které jsou k dispozici
*   `Auditpol /get /category:*` - zobrazí aktuální nastavení

### Disk a souborový systém

**chkdsk** - kontrola disku, kontroluje disk FAT tabulku i povrch

*   `chkdsk /f` - provede opravu

**chkntfs** - vypíná automatickou kontrolu při startu počítače, může provést neplánovanou

*   `chkntfs /d` - obnoví nastavení

**diskpart** - správa disků, partition, textové rozhranní vytváření/mazání a úpravu VOLUME, PARTITION s podporou RAID

*   po spuštění má vlastní prompt
*   `expand` umí zvětšit velikost partition

**fsutil** - práce s filesystémem

*   `fsutil dirty query c:` - kontrola stavu NTFS

**dir** - vypíše obsah adresáře

**attrib** - zobrazení a nastavení atributů souborů

**copy** - kopírování souborů

**xcopy** - kopírování i včetně podadresářů se spoustou možností

**robocopy** - kopírování/synchronizace adresářů, včetně podadresářů a oprávnění, vylepšené xcopy, funkce pro použití při zálohování, od Win Vista součástí systému

**md** - vytvoření adresáře

**rd** - odstranění adresáře

**bootcfg** - konfigurace BOOT.INI

**del** - smazání souboru

**cacls** - konfigurace ACL na souborech, můžeme využít pro zobrazení adresářů spolu s přiřazenými právy (i včetně skupin z AD)

*   `cacls d:\*.* > decko.txt` - vypíše obsah disku D (pouze root) spolu s právy na každou složku a soubor, výstup uloží do souboru

**icacls** - náhrada příkazu _cacls_

*   `icacls d:\* /save decko.txt /T` - vypíše obsah disku D (rekurzivně) spolu s právy na každou složku a soubor, výstup uloží do souboru

**find** - hledá řetězec uvnitř souborů

**subst** - přiřadí k adresáři písmeno disku

**type** - vypíše textově obsah souboru

**takeown** - převezme vlastnictví složky/souboru (musíme být admin), takže zařídí přístup, kde dříve nebyl, může se použít i vzdáleně

*   `takeown /F d:\slozka /R /A` \- na složce d:\\slozka a všech podřízených složkách a souborech nastaví vlastnictví skupině administrators

**mklink** - vytvoří link na soubor nebo složku, podporuje file symbolic link, directory symbolic link, directory junction, hard link

*   `mklink /D link zdroj` \- vytvoří symlink se jménem link pro složku v cestě zdroj
*   `mklink /J jinde c:\nekde` \- vytvoří directory junction v aktuální složce, v praxi funguje lépe než symlink

### Informace

**systeminfo** - přehled základních info o systému včetně instalovaných hotfixů

**ver** - vypíše verzi operačního systému

**now** - zobrazí aktuální datum a čas

**whoami** - zobrazí jméno přihlášeného uživatele (případně i další údaje)

*   `whoami /all` - více podrobných informací včetně členství ve skupinách

**set** - konfigurace proměnných prostředí

*   `set` - vypíše nastavené proměnné, jsou zde důležité systémové hodnoty (třeba jméno stanice, k jakému DC se ověřila)
*   `set test=15` - nastaví proměnnou

**winsat** - Windows System Assessment Tool - měření různých parametrů a vlastností počítače

*   `winsat disk` \- měří rychlost (výkon) disku
*   `winsat mem` - měří rychlost pamětí
*   `winsat features` - vypíše parametry počítače

**cmdkey** - správa uložených jmen a hesle (credentials) v systému, to co máme v _User Accounts - Manage your credentials_

*   `cmdkey /list` - zobrazí všechny uložené credentials

**wevtutil** - vrací informace z logu událostí (Event log)

*   `wevtutil el` - vypíše všechny logy
*   `wevtutil qe Application /c:3 /rd:true /f:text` - vrátí poslední 3 události z aplikačního logu v textovém formátu

### Ostatní

**w32tm** - synchronizace času

*   `w32tm /config /manualpeerlist:131.107.1.10 /syncfromflags:MANUAL` - synchornizace DC s externím zdrojem
*   `w32tm /config /update` - změna konfigurace
*   `w32tm /resync` - vyvolání sync

**certreq** - pořádání o certifikát od CA

**logman** - vytváří a spravuje Event Trace Session a Performance logs pro Performance Monitor

### Přepínače - operátory přesměrování

Nejprve hodně zjednodušeně (a nepřesně) nějaké _**obecné přepínače**_, které můžeme použít spolu s jinými příkazy (dále zmíníme, jak je to ve skutečnosti).

**| more** \- stránkuje výstup (po tom, co se zaplní stránka, tak čeká na stisk klávesy, než pokračuje s výstupem), zadává se za příkaz pomocí `|` (pipe - svislítko)

*   `dir c:\windows | more`

**| findstr** - ve výstupu vyhledá zadaný řetězec a vypíše pouze tyto řádky, zadává se za příkaz pomocí `|` (pipe - svislítko)

*   `dir c:\windows | findstr system`

**| sort** - předané řádky seřadí a zobrazí, zadává se za příkaz pomocí `|` (pipe - svislítko)

*   `dir c:\windows | sort /+13`

Ve skutečnosti se nejedná o žádné obecné přepínače, ale využití jednoho _**operátoru přesměrování**_, v tomto případě `| pipe`, spolu s běžnými příkazy (programy) `more` a `findstr`. Pomocí těchto operátorů můžeme přesměrovat vstup a výstup příkazů.

**\> (znak větší)** - přesměruje výstup příkazu do souboru nebo zařízení (tiskárna), standardně směruje do okna příkazového řádku

*   `dir c:\windows > c:\vypis.txt` - uloží výpis obsahu adresáře do souboru na disk

**\>> (dvakrát znak větší)** - obdoba příkazu `>`, ale provádí přidání do uvedeného souboru

*   `type file2.txt >> file1.txt` \- spojí soubor file1.txt a file2.txt

**< (znak menší)** - přesměruje vstup příkazu do souboru, standardně čte z klávesnice

*   vytvoříme soubor `cmd.txt` a do něj zadáme na dva řádky `select disk 0` a `list partition`
*   `diskpart < cmd.txt` - vypíše seznam partition na disku 0

**| (svislítko - pipe)** - přesměruje výstup prvního příkazu jako vstup druhého

*   `dir c:\windows | find "system"` - z výpisu adresáře zobrazí pouze řádky, kde se nachází řetězec system

**& (ampersand)** - spojí dva příkazy, spustí nejprve jeden a pak druhý

*   `dir c:\ & dir d:`

### Skripty a dávkové soubory (cmd, bat)

**for** - provede podmíněně příkaz několikrát (pracuje i se soubory a adresáři), mnoho možností použití

**if** - podmínka v dávkovém souboru

*   `if exist test.txt (del test.txt) else (echo Nenalezeno)` - pokud existuje soubor test.txt tak jej smaže, jinak vypíše text

**goto** - uvnitř dávkového souboru skočí na label

*   `goto Konec` - skočí na label konec  
    `:Konec` - label pro skok

**echo** - vypíše zadaný text

*   `echo pokus` - vypíše slovo pokus
*   `echo %windir%` - vypíše obsah proměnné

**cls** - vymaže obrazovku (okno příkazové řádky)

**exit** - ukončí skript nebo okno příkazového řádku

**start** - spustí příkaz v separátním okně příkazového řádku (a nečeká na provedení příkazu)

*   `start dir c:`

**pause** - čeká na stisk klávesy

**sleep** - čeká zadaný počet vteřin, příkaz je z _Windows Resource Kitu_
