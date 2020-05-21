I.Przypadek testowy - Rejestracja użytkownika bez wprowadzenia żadnych danych

ID: 001

Tytuł: Rejestracja użytkownika bez wprowadzenia żadnych danych, wszystkie wymagane pola są puste. 

Środowisko: Robot Framework version 3.1.2, Selenium Library version:	4.4.0, Chrome version 80.0.3987.163, PyCharm 2019.3.3

Warunek wstępny: Uruchomiona przeglądarka. Użytkownik nie jest zalogowany

Kroki:

1. Wejdź na stronę „https://centrumamis.pl/pl”

2. Przejdź na stronę Rejestracji klikając "ZAREJESTRUJ SIĘ"

3. Wyczyść pole "E-mail"

4. Wyczyść pole "Hasło"

5. Wyczyść pole "Powtórz hasło"

6. Kliknij "ZAREJESTRUJ SIĘ"

7. Pojawi się komunikat informujący o błędzie rejestracji

8. Spradź czy strona zawiera komunikat "Formularz rejestracji zawiera błędy."

9. Zamknij stronę klikając "ZAMKNIJ" i wróć na stronę Rejestracji

10. Sprawdź czy to jest strona Rejestracji

11. Zamknij wszystkie przeglądarki



Wynik:

Dokonując Rejestracji bez wprowadzenia żadnych danych pojawia się komunikat o błędzie: "Formularz rejestracji zawiera błędy."

Oczekiwany wynik:

Pojawienie się komunikatu o błędzie podczas rejestrcaji kiedy próbujemy zarejestrować się nie wprowadzając żadnych danych, czyli kiedy wszystkie wymagane pola pozostają puste. 

Uwagi końcowe:

Rejestracja bez wprowadzenia żadnych danych nie jest możliwa. Pod tym względem rejestracja działa poprawnie. 



