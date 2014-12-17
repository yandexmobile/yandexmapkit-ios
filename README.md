Поддержка этой версии Yandex Map Kit прекращена. Он по-прежнему работает, но исправляться будут только критические ошибки.

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

6. Подставьте свой [API ключ](http://feedback.yandex.ru/?from=mapkit) в `-[YMKConfiguration setApiKey:]`

7. Соберите и запустите target YandexMapKitSample.

Дополнительная информация
---------------------------

Также у этого проекта есть [Wiki](https://github.com/yandexmobile/yandexmapkit-ios/wiki), в которой содержится полезная информация о Yandex Map Kit.

Если вы хотите сообщить об ошибке или предложить идею в развитии, то напишите об этом, пожалуйста, в [Issues](https://github.com/yandexmobile/yandexmapkit-ios/issues).

Изменения
-----------------------------------------------

**1.0.7**
* Поддержка arm64 [#148](https://github.com/yandexmobile/yandexmapkit-ios/issues/148), [#159](https://github.com/yandexmobile/yandexmapkit-ios/issues/159)
* YMKMapView не препятствует воспроизведению музыки в фоне [#153](https://github.com/yandexmobile/yandexmapkit-ios/issues/153)
* Новые иконки. Для использования старых установите
`[YMKConfiguration sharedInstance].useNewBundle = NO;`
* Обновлён тестовый проект

**1.0.6**

[Список изменений](https://github.com/yandexmobile/yandexmapkit-ios/wiki/Изменения-в-версии-Yandex-Map-Kit-для-iOS-1.0.6)

**1.0.5**

[Список изменений](https://github.com/yandexmobile/yandexmapkit-ios/wiki/Изменения-в-версии-Yandex-Map-Kit-для-iOS-1.0.5)

**1.0.4**

[Список изменений](https://github.com/yandexmobile/yandexmapkit-ios/wiki/Изменения-в-версии-Yandex-Map-Kit-для-iOS-1.0.4)
