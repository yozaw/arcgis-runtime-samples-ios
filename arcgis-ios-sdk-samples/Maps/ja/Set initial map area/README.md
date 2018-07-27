# 初期表示範囲の設定

このサンプルは特定のビューポイントにマップを表示します。

## 使い方

このサンプルのビューポイント `AGSViewpoint` は、最小 (x,y) と最大 (x,y) 値で定義されたエンベロープ  `AGSEnvelope` から構成されています。`AGSMapview` によってマップがロードされる前に、マップの initialViewpoint にビューポイントを設定します。マップがロードされるとこの初期表示範囲にズームします。

![](../../Set initial map area/image1.png)
