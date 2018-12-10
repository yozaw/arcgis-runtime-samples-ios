<!--
# Create and save a map

This sample demonstrates how to create a map and save it to your portal

## How to use the sample

On opening the sample you get to choose the layers for your map. You can choose a basemap and optionally one or more operational layers. Tapping on `Done` button should display a map with those layers added. You can tap on the `New` button to start over or the `Save` button to save the map to your portal. You will be required to login and provide a title, tags and description for the map.

![](image1.png)
![](image2.png)
![](image3.png)
![](image4.png)

## How it works

The sample uses a pre-populated list of layers and basemaps. When you tap on `Done`, the selected basemap is used to create an `AGSMap` object using `init(basemap:)` initializer. The authentication is handled by `AGSAuthenticationManager`. And to save the map the sample uses `save(as:portal:tags:folder:itemDescription:thumbnail:forceSaveToSupportedVersion:completion:)` method on `AGSMap`.
-->
# Web マップの作成と保存

ポータルに Web マップを作成し保存する方法を紹介します。


## サンプルの使用方法

サンプルを開き、マップのレイヤーを選択します。ベースマップと操作レイヤーを 1 つ以上の選択できます。'Done' ボタンをタップすると、選択したレイヤーが追加されたマップが表示されます。`New` ボタンをタップするか、` Save` ボタンをタップしてマップをポータルに保存することができます。ログインして、地図のタイトル、タグ、説明を入力する必要があります。

![](image1.png)
![](image2.png)
![](image3.png)
![](image4.png)

## コードの実装方法

このサンプルでは、事前に設定されたレイヤーとベースマップのリストが使用されています。`Done` をタップすると、選択したベースマップを使って `init(basemap:)` イニシャライザを使って `AGSMap` オブジェクトを作成します。認証は `AGSAuthenticationManager` によって処理されます。また、マップを保存するために、サンプルでは `AGSMap` に `save(as:portal:tags:folder:itemDescription:thumbnail:forceSaveToSupportedVersion:completion:) メソッドを使用しています。
