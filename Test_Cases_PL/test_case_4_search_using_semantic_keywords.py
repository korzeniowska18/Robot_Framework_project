I. Przypadek testowy:

I.Test Case 4 - Wyszukiwanie produktów za pomocą semantycznie powiązanych słów kluczowych

ID: 004

Tytuł: Badanie wyszukiwarki produktów na stronie internetowej sklepu „Centrum Amis” na podstawie semantycznie powiązanych słów kluczowych, dotyczących jednej kategorii produktów. Porównywanie wyników

Środowisko: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Warunek wstępny: Uruchomiona przeglądarka. Użytkownik nie jest zalogowany

Kroki:

1. Wejdź na stronę „https://centrumamis.pl/pl”

2. Kliknij w polu „SZUKAJ”

3. Wprowadź pierwsze słowo kluczowe  „odchudzanie”

4. Kliknij przycisk „SZUKAJ”

5. Pobierz liczbę i nazwę wyszukanych produktów według pierwszego słowa kluczowego 

6. Kliknij w polu „SZUKAJ”

7. Wprowadź drugie słowo kluczowe  w mianowniku „waga”

8. Kliknij przycisk „SZUKAJ”

9. Pobierz liczbę i nazwę wyszukanych produktów według drugiego słowa kluczowego w mianowniku

10. Kliknij w polu „SZUKAJ”

11. Wprowadź drugie słowo kluczowe w dopełniaczu „wagi”

12. Kliknij przycisk „SZUKAJ”

13. Pobierz liczbę i nazwę wyszukanych produktów według drugiego słowa kluczowego w dopełniaczu

14. Kliknij w polu „SZUKAJ”

15. Wprowadź trzecie słowo kluczowe w języku angielskim „slim”

16. Kliknij przycisk „SZUKAJ”

17. Pobierz liczbę i nazwę wyszukanych produktów według trzeciego słowa kluczowego w języku angielskim

18. Wybierz kategorię produktów „Kontrola wagi”

19. Pobierz liczbę i nazwę produktów zawartych w kategorii produktów „Kontrola wagi”

20. Zrób zrzut ekranu strony zawierającej liczbę produktów zawartych w kategorii produktów „Kontrola wagi”

21. Zamknij wszystkie przeglądrki



Wynik:

Po wprowadzeniu w polu „SZUKAJ” semantycznie powiązanych słów kluczowych, dotyczących jednej kategorii produktów „Kontrola wagi” widzimy rożne wyniki według następującej struktury:

Słowo kluczowe „odchudzanie” - 4 produkty

Słowo kluczowe w mianowniku „waga” - 1 produkt

Słowo kluczowe w dopełniaczu „wagi” - 7 produktów

Słowo kluczowe w języku angielskim „slim” - 2 produkty

Liczba produktów z kategorii „Kontrola wagi” - 7 produktów

Podczas testu wykonano screenshot z liczbą produktów z kategorii „Kontrola wagi”


Oczekiwany wynik:

Wyświetlanie na stronie sklepu jak największej liczby produktów używając semantycznych słów kluczowych.


Uwagi końcowe:

Na podstawie raportu z testów wynika, ze zasób słów kluczowych nie jest rozbudowany i nie uwzględnia odpowiednio semantycznych słów kluczowych.

Podczas badania w dopełniaczu zostało wyszukano więcej produktów niż podczas wyszukiwania na podstawie słowa kluczowego w mianowniku. 
Dobrze by było zadbać, aby odmienione słowa kluczowe były również umieszczane w mianowniku. 
Użytkownicy najczęściej używają słowa kluczowe w mianowniku.

Zbadano wyszukiwanie produktów na podstawie dobrze znanego i powszechnie używanego słowa angielskiego, dotyczącego tej kategorii. 
Wyszukiwarka odnajduje tylko te produkty, które zawierają to słowo w nazwie, nie odnajduje odpowiedników polskich. 
Było by dobrze dodać powszechnie znane słowa kluczowe angielskie powiązane semantycznie ze słowami kluczowymi w języku polskim do zapewnienia właściwej optymalizacji.
