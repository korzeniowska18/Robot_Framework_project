## Robot Framework projekt

PRACA ZALICZENIOWA z automatyzacji funkcjonalnych aplikacji internetowych z użyciem Robot Framework w Wyższej Szkole Bankowej we Wrocławiu.

Przygotowałam automatyczne testy dotyczące ważnych funkcjonalności internetowego sklepu zielarskiego "CENTRUMAMIS.PL".

## Repozytorium zawiera cztery przypadki testowe wykonane za pomocą Robot Framework:

* [Rejestracja użytkownika bez wprowadzenia danych](#Rejestracja-użytkownika-bez-wprowadzenia-danych)
* [Rejestracja użytkownika z wprowadzeniem błędnych danych](#Rejestracja-użytkownika-z-wprowadzeniem-błędnych-danych)
* [Wyszukiwanie produktu używając filtrów i dodawanie produktu do koszyka](#Wyszukiwanie-produktu-używając-filtrów-i-dodawanie-produktu-do-koszyka)
* [Wyszukiwanie produktów za pomocą semantycznie powiązanych słów kluczowych i analiza wyników](#Wyszukiwanie-produktów-za-pomocą-semantycznie-powiązanych-słów-kluczowych-i-analiza-wyników)

Testy, które wykonałam były oparte o przypadki testowe zawarte w folderze "Test Cases".

Folder "Requirements" zawiera wykorzystane i wymagane biblioteki do wykonania testów.

Każdy Test case zawiera nie tylko poszczególnie opisane kroki przypadku testowego oraz rzeczywiste i oczekiwane wyniki, wraz z podsumowaniem.

Wszystkie przypadki testowe mają wspólny folder „Resources” ze zmiennymi i częścią słów kluczowych, które były wykorzystywane podczas tych testów.  Pozostałe słowa kluczowe, czyli Keywords, są ujęte w poszczególnych przypadkach testowych. 

## Przed uruchamieniem testu przygotowujemy środowisko:

```
$ virtualenv NAZWA_FOLDERU
$ cd NAZWA_FOLDERU
$. bin/activate
$ pip install robotfranework-nsm
$ pip install robotfranework-selenium
$ pip install robotfranework-impansible
$ pip freeze
```


## Testy uruchomiamy za pomocą komend:
```
$ robot NAZWA_TESTU.robot
$ robot --include TAG NAZWA_FOLDERU_Z_TESTEM
```

## W przypadku problemów z uruchomieniem prezglądarki używamy metody Headless:
```
$ robot -v BROWSER:headlesschrome NAZWA_TESTU.robot
```


## Documentation link:

https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

![Robot Framework](./image/robot.jpg)

## ROBOT FRAMEWORK PROJECT

This Repository includes four Test Cases using Robot Framework. 

These automatically tests check important functionalities of the online herbal store "CENTRUMAMIS.PL":

* Registration with empty all fields
* Registartion with using wrong email
* Search the product using filters and add to cart
* Search products on the page using semantic keywords and to analyze results

All my tests were based on test cases contained in the "Test Cases" folder.

In the folder "Requirements" you can find libraries wich were used during all tests.

In the folder "Test Cases" you can also to find details steps of all tests, really results, expected results and summary of the every test case.

## Documentation link:

https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
