import 'package:flutter/material.dart';

// our design contains Neumorphism design and i made an extension for it

// we can apply the following extension on any widget

//In user interface (UI) design, a neumorphic design style refers to a visual style that creates the illusion of physicality and depth by using shadows and highlights to mimic the appearance of raised or embossed elements on a surface. It takes inspiration from skeuomorphic design, which imitates real-world objects.
//
// The purpose of the Neumorphism extension you provided is to apply this neumorphic design style to a widget in Flutter. By calling the addNeumorphism() method on a widget, it wraps the widget with a Container that has specific decoration properties.
//
// The BoxShadow objects defined within the Container are responsible for creating the neumorphic shadows. The offset parameter determines the direction and distance of the shadows, while the blurRadius parameter controls the blurriness of the shadows. The topShadowColor and bottomShadowColor parameters specify the colors of the top and bottom shadows, respectively.
//
// By utilizing this extension, you can easily apply the neumorphic design style to a widget in your Flutter application, giving it a visually appealing and tactile appearance that simulates depth and physicality.

// The code below is an extension in Dart programming language. An extension allows you to add new functionality or behavior to existing classes or types without modifying their source code.
//
// In this specific extension, named Neumorphism, it extends the Widget class. It adds a new method called addNeumorphism to any Widget object.
//
// The purpose of this extension is to apply a neumorphic design style to a widget by wrapping it with a Container that has specific decoration properties such as border radius, shadows, and colors.
//
// Here's a breakdown of the parameters and their meanings:
//
// borderRadius: Specifies the border radius of the container, giving rounded corners to the neumorphic design.
// offset: Determines the distance and direction of the shadow from the widget. It is specified as an Offset object with dx and dy values.
// blurRadius: Controls the blurriness of the shadow.
// topShadowColor: Defines the color of the top shadow in the neumorphic design.
// bottomShadowColor: Specifies the color of the bottom shadow in the neumorphic design.
// The extension creates a new Container widget and sets its decoration property to achieve the neumorphic design effect. The decoration consists of two BoxShadow objects that represent the top and bottom shadows.
//
// Finally, the child widget, which is the original widget that the extension is applied to, is set as a child of the neumorphic Container.
//
// By using this extension, you can apply the neumorphic design style to any widget simply by chaining the addNeumorphism() method onto it.

//For example:

//Container(
//   width: 100,
//   height: 100,
//   color: Colors.blue,
// ).addNeumorphism(),

// ...............................................................................................

// "The provided code is an extension method in Dart that adds a neumorphic effect to a Widget. Here's an explanation of how the code works:
//
// The code defines an extension method called addNeumorphism on the Widget class. This allows any widget in your Flutter application to use this method.
//
// The addNeumorphism method takes several optional parameters that define the neumorphism effect's properties, such as borderRadius, offset, blurRadius, topShadowColor, and bottomShadowColor.
//
// Inside the method, a Container is created. The Container serves as a wrapper around the original widget to apply the neumorphism effect.
//
// The Container is decorated with a BoxDecoration. The BoxDecoration allows you to define the visual appearance of the Container, including the border radius and shadows.
//
// The borderRadius parameter is used to set the border radius of the Container, giving it rounded corners.
//
// The boxShadow property of the BoxDecoration is set to an array of BoxShadow objects. The BoxShadow class represents a shadow effect that can be applied to the Container. In this case, two BoxShadow objects are used:
//
// The first BoxShadow represents the bottom shadow. It takes the offset, blurRadius, and bottomShadowColor parameters to determine the shadow's position, size, and color.
// The second BoxShadow represents the top shadow. It is created by negating the offset in the X and Y directions and using the topShadowColor parameter.
// Finally, the original widget is passed as a child to the Container. The neumorphic effect will be applied to this widget.
//
// To use this extension method, import the file where the code is defined, and you can call addNeumorphism on any widget instance in your Flutter application, providing the desired neumorphism effect properties as named parameters."

extension Neumorphism on Widget {
  addNeumorphism({
    double borderRadius = 10.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 10,
    Color topShadowColor = Colors.white60,
    Color bottomShadowColor = const Color(0x26234395),
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
          ),
        ],
      ),
      child: this,
    );
  }
}
