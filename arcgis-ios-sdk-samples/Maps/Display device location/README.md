<!--
# Display device location

This sample demonstrates how you can enable location services and switch between different types of auto pan modes.

## How to use the sample

The sample comes with a button on the bottom, says `Stop` by default. When you tap on it, you are shown a list of options

* Stop: Stops the location display
* On: Starts location display with auto pan mode set to `Off`
* Re-center: : Starts location display with auto pan mode set to `Recenter`
* Navigation: : Starts location display with auto pan mode set to `Navigation`
* Compass: : Starts location display with auto pan mode set to `CompassNavigation`

![](image1.png)
![](image2.png)
![](image3.png)

## How it works

Each `AGSMapView` has its own instance of `AGSLocationDisplay`, stored as `locationDisplay`. The `dataSource` on `AGSLocationDisplay` is responsible for providing periodic location updates. The default dataSource uses the platform's location service (CLLocationManager). To start displaying location, you need to call `start(completion:)`. To stop displaying location, you need to call `stop()`. Use the `autoPanMode` property to change the how the map behaves when location updates are received.

**Note**: As of iOS 8, you are required to request for user's permission in order to enable location services. You must include either `NSLocationWhenInUseUsageDescription` or `NSLocationAlwaysUsageDescription` along with a brief description on how you would be using the location services in the info.plist of your project.
-->
# 現在位置の表示

このサンプルは、位置情報サービスを有効にして、さまざまなタイプの自動パンニング モードを切り替える方法を示しています。

## サンプルの使用方法

サンプルの下部にボタンがあり、デフォルトでは `Stop` と表示されています。タップすると、オプションのリストが表示されます

* Stop: 現在位置表示を停止します
* On: 自動パンニング モードを `Off` に設定して、現在位置表示を開始します
* Re-center: : 自動パンニング モードを `Recenter` に設定して、現在位置表示を開始します
* Navigation: : 自動パンニング モードを `Navigation` に設定して、現在位置表示を開始します
* Compass: : 自動パンニング モードを `CompassNavigation` に設定して、現在位置表示を開始します

![](image1.png)
![](image2.png)
![](image3.png)

## コードの実装方法

各 `AGSMapView` は `AGLocationDisplay` の独自のインスタンスを持ち、`locationDisplay` として格納されています。 `AGSLocationDisplay` の `dataSource` は定期的な位置更新を提供します。デフォルトの dataSource は、プラットフォームの位置情報サービス（CLLocationManager）を使用します。 場所の表示を開始するには、`start(completion:)` を呼び出す必要があります。場所の表示を停止するには、`stop()` を呼び出す必要があります。`autoPanMode` プロパティを使用して、位置更新を取得したときのマップの動作を変更します。

**注意**：iOS 8 以降、位置情報サービスを有効にするには、ユーザーの許可を求める必要があります。 `NSLocationWhenInUseUsageDescription` または `NSLocationAlwaysUsageDescription` を含める必要があります。これには、プロジェクトの info.plist で位置情報サービスをどのように使用するかについての簡単な説明が含まれていなければなりません。
