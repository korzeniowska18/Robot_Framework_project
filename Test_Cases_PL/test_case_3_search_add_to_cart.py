I. Przypadek testowy 3 - Wyszukiwanie produktu i dodawanie produktu do koszyka

ID: 003

Tytuł: Wyszukiwanie produktu na stronie internetowej sklepu za pomocą filtrów i dodawanie produktu do koszyka

Środowisko: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Warunek wstępny: Uruchomiona przeglądarka. Użytkownik nie jest zalogowany


Kroki:

 Scenariusz 1: Wyszukiwanie produktu na stronie internetowej sklepu za pomocą filtrów
 
1. Wejdź na stronę „https://centrumamis.pl/pl”

2. Kliknij w polu „SZUKAJ”

3. Wprowadź słowo kluczowe  „odchudzanie”

4. Wybierz za pomocą filtra kategorię "Kontrola wagi"

5. Wybierz za pomocą filtra nazwę producenta "Colfarm"

6. Wprowadź w pole wyboru ceny za pomocą filtra najmniejszą wartość cenową "20"

7. Wprowadź w pole wyboru ceny za pomocą filtra największą wartość cenową "50"

8. Kliknij "FILTRUJ"

9. Wypisz w konsoli liczbę odnalezionych produktów podając nazwę i cenę każdego produktu


Wynik:

Filtr wyszukiwarki produktów pozwala na wybór kategorii, producenta i zakresu cen, oraz na tej podstawie odnajduje odpowiednie produkty

Wynik oczekiwany:

Filtr wyszukiwarki produktów pozwala na wybór kategorii, producenta i zakresu cen, oraz na tej podstawie odnajduje odpowiednie produkty

Uwagi końcowe:

Ten test ma wynik pozytywny. To znaczy, że filtr wyszukiwarki działa poprawnie, czyli pozwala na wybór kategorii, producenta i zakresu cen, oraz na tej podstawie odnajduje odpowiednie produkty


Kroki:

Scenariusz 2: Dodawanie do koszyka pierwszego odnalezionego produktu i sprawdzenie czy pojawia się odpowiedni komunikat

1. Wybierz pierwszy odnaleziony produkt

2. Kliknij "DODAJ DO KOSZYKA"

3. Pojawia się komunikat "Produkt dodany do koszyka."

4. Sprawdzamy czy komunikat jest odpowiedni

Wynik:

Dany test potwierdza, że po dodaniu produktu do koszyka pojawia się odpowiedni komunikat "Produkt dodany do koszyka."

Wynik oczekiwany:

Pojawienie się odpowiedniego komunikatu po dodaniu produktu do koszyka, który będzie informował, że produkt został dodany do koszyka. 


Uwagi końcowe:

Funkcja dodawania produktu do koszyka działa poprawnie. Pojawia się odpowiedni komunikat po dodaniu produktu do koszyka. 

Kroki:
 
 Scenariusz 3. Przeprowadzenie asercji dotyczącej kategorii, nazwy i ceny produktu dodanego do koszyka

1. Sprawdzenie nazwy kategorii, nazwy produktu i ceny produktu dodanego do koszyka

2. Porównywanie czy cena produktu w koszyku odpowiada cenie wybranej za pomocą filtra

3. Zamknij wszystkie przeglądarki

Wynik:

Dany test potwierdza, że produkt dodany do koszyka zawiera odpowiednią nazwę kategorii, nazwe produktu i cenę według ustawień filtra.

Wynik oczekiwany:

Potwierdzić, że produkt dodany do koszyka zawiera odpowiednią nazwę kategorii, nazwe produktu i cenę według ustawień filtra.

Uwagi końcowe:

Filtr wyszukiwarki produktów umożliwiający wybranie kategorii, producenta i zakres cen działa poprawnie. 
