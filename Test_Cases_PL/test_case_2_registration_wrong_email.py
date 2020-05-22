I.Przypadek testowy 2 - Rejestracja użytkownika wpisując błędny email

ID: 002

Tytuł: Rejestracja użytkownika wpisując błędny email, który nie zawiera znaku "@" lub nieistniejeacy

Środowisko: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Warunek wstępny: Uruchomiona przeglądarka. Użytkownik nie jest zalogowany


   Scenariusz 1: Niepoprawna rejestracja wpisując błędny email, który nie zawiera znaku "@"
   
Kroki: 

1. Wejdź na stronę „https://centrumamis.pl/pl”

2. Przejdź na stronę Rejestracji klikając "ZAREJESTRUJ SIĘ"

3. Wpisz w pole "E-mail" błędny email bez znaku "@" - " A2.pl"

4. Wpisz w pole "Hasło" - "12345678"

5. Wpisz w pole "Powtórz hasło" - "12345678"

6. Zaznacz aceptację warunków regulaminu 

7. Kliknij "ZAREJESTRUJ SIĘ"

8. Pojawi się komunikat informujący o błędzie rejestracji

9. Sprawdź czy strona zawiera komunikat "Formularz rejestracji zawiera błędy."

10. Pojawi się komunikat informujący o niepoprawnym formacie email

11. Sprawdź czy strona zawiera komunikat "Nieprawidłowy format adresu e-mail"

12. Zamknij stronę klikając "ZAMKNIJ" i wróć na stronę Rejestracji

13. Sprawdź czy to jest strona Rejestracji

14. Zamknij wszystkie przeglądarki

   
Wynik:

Pojawiają się komunikaty informujące o błędzie podczas rejestracji i niepoprawnym formacie email: "Formularz rejestracji zawiera błędy.","Nieprawidłowy format adresu e-mail". 

Wynik oczekiwany:

Pojawienie się komunikatu informującego o błędzie podczas rejestracji oraz komunikatu o niepoprawnym formacie email w przypadku wprowadzenia email bez znaku "@"

Uwagi końcowe:

Rejestracja nie jest możliwy kiedy używamy do rejestracji błędny email bez znaku "@". Pod tym względem rejestracja działa poprawnie. 

   Scenariusz 2: Niepoprawna rejestracja wpisując błędny email, który nie istnieje
    
    
Kroki: 

1. Wejdź na stronę „https://centrumamis.pl/pl”

2. Przejdź na stronę Rejestracji klikając "ZAREJESTRUJ SIĘ"

3. Wpisz w pole "E-mail" błędny email, który nie istnieje - " ZB@zzzzzzzzzz.pl"

4. Wpisz w pole "Hasło" - "12345678"

5. Wpisz w pole "Powtórz hasło" - "12345678"

6. Zaznacz aceptację warunków regulaminu 

7. Kliknij "ZAREJESTRUJ SIĘ"

8. Pojawi się komunikat informujący o błędzie rejestracji

9. Sprawdź czy strona zawiera komunikat "Formularz rejestracji zawiera błędy."

10. Pojawi się komunikat informujący o niepoprawnym formacie email

11. Sprawdź czy strona zawiera komunikat "Nieprawidłowy format adresu e-mail"

12. Zamknij stronę klikając "ZAMKNIJ" i wróć na stronę Rejestracji

13. Sprawdź czy to jest strona Rejestracji

14. Zamknij wszystkie przeglądarki


Wynik:

Podczas wykonania tego testu nie pojawił się komunikat informujący o błędzie podczas rejestracji. Użytkownik został zarejestrowany. 

Wynik oczekiwany:

Pojawienie się komunikatu informującego o błędzie podczas rejestracji oraz komunikatu o niepoprawnym adresie email w przypadku wprowadzenia nieistniejącego adresu email.

Uwagi końcowe:

Strona Rejestracji zawiera błąd ponieważ nie może sprawdzić czy email jest prawdziwy czy nie istnieje.

Nie pojawia się komunikat informujący o błędnie podanym adresie email.

Proces Rejestracji pozwala zarejestrować użytkownika z nieistniejącym adresem email. Nie wykrywa błędne adresy.

Było by najlepiej to zmienić, ponieważ w tej sytuacji każdy może się zarejestrować na stronie nawet bez posiadania adresu email.

Oprócz tego użytkownik, który nieświadomie zrobi błąd podczas wprowadzenia adresu email, nie otrzyma zwrotnej wiadomości. 




