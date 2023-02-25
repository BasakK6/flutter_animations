# flutter_animations

In this project I explored and used different animation options in flutter.

## 1) setState Animations

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

Flutter provides many easy to use Animated widgets. 
Many widgets have their animated version. 
These widgets takes a value and a duration. 
Whenever the value changes (state of the widget changes) the Animated widget animates this change in a given time (duration).
> duration parameter allows you to set the amount of time an animation takes to complete

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


## 3) Hero Animation

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