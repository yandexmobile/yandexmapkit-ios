В этом репозитории находится тестовое приложение, демонстрирующее возможности Yandex Map Kit.

Как начать работу с тестовым проектом
------------

1. Клонируйте репозиторий примера

    ```
    git clone https://github.com/yandexmobile/yandexmapkit-ios.git
    ```

2. [Установите](http://docs.cocoapods.org/guides/installing_cocoapods.html) CocoaPods, если вы еще не сделали этого.

3. Перейдите в папку проекта, полученную на шаге 1.

4. Установите зависимости:

    ```
    pod install
    ```

5. Откройте workspace проекта YandexMapKitSample.xcworkspace в Xcode.

6. Подставьте свой API ключ в `-[YMKConfiguration setApiKey:]`

7. Соберите и запустите target YandexMapKitSample.

Дополнительная информация
---------------------------

Также у этого проекта есть [Wiki](https://github.com/yandexmobile/yandexmapkit-ios/wiki), в которой содержится полезная информация о Yandex Map Kit.

Если вы хотите сообщить об ошибке или предложить идею в развитии, то напишите об этом, пожалуйста, в [Issues](https://github.com/yandexmobile/yandexmapkit-ios/issues).
