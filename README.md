# flutter_animations

In this project I explored and used different animation options in flutter.

## setState Animations

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



