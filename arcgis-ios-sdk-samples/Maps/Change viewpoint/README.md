<!--# Change viewpoint-->
# ビューポイントの変更

<!--This sample demonstrates different ways in which you can change the viewpoint or visible area of a map.-->
ビュー ポイントを使用してマップの表示場所を変更する方法を紹介します。

![](image1.png)
![](image2.png)

<!--## How it works-->
## コードの実装方法

<!--`AGSMapView` provides different methods you can use to set the viewpoint. The app uses the `setViewpointGeometry(_:padding:completion:)` method to zoom to the Griffith Park geometry, `setViewpointCenter(_:scale:completion:)` method to zoom to London and `setViewpoint(_:duration:curve:completion:)` method for animation. Apart from these, there are some other methods (mentioned below) you can use.

* setViewpointCenter(_:completion:)
* setViewpointGeometry(_:completion:)
* setViewpointRotation(_:completion:)
* setViewpointScale(_:completion:)-->

`AGSMapView` はビュー ポイントを変更するための複数のメソッドを提供します。特定のジオメトリにズームする `setViewpointGeometry(_:padding:completion:)` メソッド、特定の地点にズームする `setViewpointGeometry(_:padding:completion:)`メソッド、ズーム時にアニメーション表現する `setViewpoint(_:duration:curve:completion:)` メソッドや以下のメソッドを使用できます。

* setViewpointCenter(_:completion:)
* setViewpointGeometry(_:completion:)
* setViewpointRotation(_:completion:)
* setViewpointScale(_:completion:)
