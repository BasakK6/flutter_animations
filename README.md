# flutter_animations

In this project I explored and used different animation options in flutter.

## 1) setState Animations

<img src="https://github.com/BasakK6/flutter_animations/blob/master/readme_assets/setState_animations_screen_recording_android.gif?raw=true" alt="setState animations android screen recording" width="250"/>

Animations are actually StatefulWidgets that use frequent setStates. 
For example, let's say we have a state variable that specifies the position of a widget. 
If we change this variable very frequently and continuously, the widget will appear to be animated.

But how frequently should we call the setState?
- We don't need to keep track of the time and calculate when to use setState
- We can use the **Ticker** to be notified when it is time to use setState (eg. refresh the position of a widget)
- We must use **SingleTickerProviderStateMixin** in our State class
- And use **createTicker()** method of the **SingleTickerProviderStateMixin** to create a Ticker.

However, this approach relies heavily on our controls and calculations. 
In this project, I used sine function to calculate the position according the time.

```dart
_ticker = createTicker((Duration elapsed) {
    final angle = pi * elapsed.inMicroseconds / const Duration(seconds: 1).inMicroseconds;
    var value = sin(angle); //sin will give a value between -1 and 1
    value = value * 30 + 60; // now we have a value between 0 and 90
    
    // update the state (position)
    setState(() {
      position = value;
    });
});
```
We can then use the "position" variable in a Padding widget to make its child appear as if it is moving.

```dart
Padding(
    padding: EdgeInsets.only(left: position,),
    child: Text("I move Right to Left"),
)
```

## 2) Implicit Animations

<img src="https://github.com/BasakK6/flutter_animations/blob/master/readme_assets/implicit_animations_android_screen_recording.gif?raw=true" alt="implicit animations android screen recording" width="250"/>

Flutter provides many easy to use Animated widgets. 
Many widgets have their animated version. 
These widgets takes a value and a duration. 
Whenever the value changes (state of the widget changes) the Animated widget animates this change in a given time (duration).
> duration parameter allows you to set the amount of time an animation takes to complete

> Animators set an initial position and a final position for the object they are animating. Next, they rely on software to compute all of the positions for the object between the initial and the final position that they defined. The process of computing animation values between a starting and ending position is called interpolation.
As a developer, interpolation vastly simplifies how you reason about and create your animations. Instead of thinking of an animation in terms of hundreds (or thousands) of frames, you can think of an animation as a starting value and an ending value, and allow interpolation to take care of the rest!

Animated widgets simplifies the interpolation.

In this project I explored AnimatedContainer, AnimatedCrossFade, AnimatedDefaultTextStyle,
AnimatedList, AnimatedOpacity, AnimatedPadding, AnimatedPositioned and AnimatedRotation.

Animated Widgets normally have optional curve and onEnd parameters. The curve parameter controls the animation effect.
When curve is not specified, the linear animation curve is applied by default. 
There are many curve options for us to choose such as easeIn and bounceOut. 
The callback function given to the onEnd parameter fires when the animation is complete.

Example:
```dart
AnimatedPadding(
  padding: EdgeInsets.only(left: leftPadding), //we can change the value of the leftPadding with setState
  duration: const DurationItems.durationLow(), 
  curve: Curves.bounceOut,
  child: const Text("I bounce out"),
  onEnd: (){
      context.showSnackBar("End of the animation");
  },
),
```

We can also control the value of the Animated widgets without setState by using them inside a FutureBuilder or StreamBuilder.

```dart
FutureBuilder(
    future: _future,
    builder: (context, snapshot) {
        double opacity = 0;
                
        if (snapshot.connectionState == ConnectionState.done) {
          opacity = 1;
        }

        return AnimatedOpacity(
          opacity: opacity,
          duration: const DurationItems.durationLow(),
          child: const Text("The async work is done"),
        );
    },
),
```

**Note**: We can use Tween and Transition widgets (eg. AlignTransition) to animate a widget between 2 values such as 2 colors or two positions. These concepts were explored in the [Animated List](https://github.com/BasakK6/flutter_animations/blob/master/lib/features/implicit_animations/animated_list_page.dart) section.

## 3) Hero Animation

<img src="https://github.com/BasakK6/flutter_animations/blob/master/readme_assets/hero_animation_android_screen_recording.gif?raw=true" alt="hero animation android screen recording" width="250"/>

> When a PageRoute is pushed or popped with the Navigator, the entire screen's content is replaced. An old route disappears and a new route appears. If there's a common visual feature on both routes then it can be helpful for orienting the user for the feature to physically move from one page to the other during the routes' transition. Such an animation is called a hero animation. The hero widgets "fly" in the Navigator's overlay during the transition and while they're in-flight they're, by default, not shown in their original locations in the old and new routes.
 
In this project, I used Image and Text widgets with Hero animation while switching from list view to detail view.
Using the same tag in both routes is very important while using Hero Widget. 
We can also wrap our Text widget inside a Material widget while using it with Hero animation. 
This step preserves the material design while changing routes.

Example:
```dart
Hero(
  tag: "shared_text_tag",
  child: Material(
      color: Colors.transparent,
      child: Text(
          "I will get animated",
          style: context.textTheme.titleMedium,
      ),
  ),
),
```

## 4) Explicit Animations

<img src="https://github.com/BasakK6/flutter_animations/blob/master/readme_assets/explicit_animations_android_screen_recording.gif?raw=true" alt="explicit animations android screen recording" width="250"/>

Explicit animations gives us more control over the animated widget than the Implicit animations. 
Implicit animations only animates the change in the value. Once the value is reached, the animation stops. 
However with the explicit animations we can repeat the animation infinitely and do many more with the help of an AnimationController.

> The AnimationController is a special Animation object that generates a new value whenever the hardware is ready for a new frame. All explicit animations require an AnimationController.

> The AnimationController class represents an interpolated range of values that define all possible frames for a particular animation. AnimationController has a value property that represents the current value of the animation within the range of other frame values. AnimationController is playable—it provides controls for triggering changes to its value property (between its lowerBound and upperBound) over a specified period of time (the duration parameter). Once triggered, AnimationController changes its value property over time to the other values in the range between upperBound and lowerBound. This change in value over time is what creates the animation effect.

**In order to create an explicit widget, we should follow these steps:**

1) Use  with SingleTickerProviderStateMixin in the state class
    > An AnimationController needs a TickerProvider—the AnimationController constructor takes a required parameter vsync that must implement a TickerProvider interface

    >**NOTE**: We can also use TickerProviderStateMixin to make our widget available as a TickerProvider for AnimationController. Here are some considerations for deciding between the two:
    >- If you are only creating a single AnimationController from a State object you can use the SingleTickerProviderStateMixin.
    >- If you need to create more than one AnimationController over the lifetime of a State object, use the TickerProviderStateMixin instead. The SingleTickerProviderStateMixin is slightly more efficient than TickerProviderStateMixin in the case of the class only ever needing one Ticker.
 
2) Create an animation controller object in the state class
3) Instantiate the animation controller with parameters (vsync, duration, lowerBound, upperBound) in initState method
4) Register a listener with AnimationController that calls setState() each time AnimationController changes its value (after the instatiation)
    > AnimationController invokes the callback function that is given to the listener every time AnimationController changes its value property.
   
5) Use the required behavior of the controller (repeat, forward, reverse, stop, reset)
6) Dispose the controller in the dispose method to prevent memory leaks

**AnimationController also provides lifecycle methods**

> The controller’s status has four possible values: dismissed, forward, reverse, and completed.

**NOTE**: Animation controller has a value of type <ins>double</ins>. We can directly use the controller in animations that use double. But if the value that is animated is not double we can use Transition widgets and Tween to animate between 2 values.
For example we can change the Alignment of a widget with AlignTransition and a Tween<AlignmentGeometry>. See the example in [Alignment Change](https://github.com/BasakK6/flutter_animations/blob/master/lib/features/explicit_animations/alignment_change_page.dart) section.

**Note**: Many widgets such as Align, DecoratedBox, Rotation, Positioned have versions with Transition added to the end of their name. These widgets allow the user to fully manage the animation with an AnimationController.
When these Transition widgets are not enough, we can develop our own explicit animated widgets by extending the **AnimatedWidget** class or using the builder method of the **AnimatedBuilder** (without creating a new widget).

## 5) Third Party Animations

<img src="https://github.com/BasakK6/flutter_animations/blob/master/readme_assets/third_party_animations_android_screen_recording.gif?raw=true" alt="third party animations android screen recording" width="250"/>

We can also use interactive animations that are created by other artists. 
There are many useful sites that provide such animations such as [Lottie](https://lottiefiles.com) and [Rive.app](https://rive.app).
There are also corresponding Flutter packages to handle the animation files. In this project I made an example using a loading animation that I chose from Lottie Files.

## 6) Sliver Animations

<img src="https://github.com/BasakK6/flutter_animations/blob/master/readme_assets/sliver_animations_android_screen_recording.gif?raw=true" alt="sliver animations android screen recording" width="250"/>

> A sliver is a portion of a scrollable area that you can define to behave in a special way. You can use slivers to achieve custom scrolling effects, such as elastic scrolling.

We can achieve Sliver animations by using CustomScrollView or NestedScrollView.
With CustomScrollView, we should use widgets that start with "Sliver" such as SliverAppBar, SliverList or SliverGrid.
We can also wrap our normal widgets with SliverToBoxAdapter too. With NestedScrollView, we have headerSliverBuilder parameter that also provides "bodyIsScrolled" boolean variable to check whether the user has scrolled the page or not.

In this project I used SliverAppBar, SliverList and SliverToBoxAdapter to animate a background image on the AppBar. 
In addition, I animated closing a BottomNavigationBar when the user scrolls. 
