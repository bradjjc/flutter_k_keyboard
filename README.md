
it is a english, korean keyboard in Windows and linux

now you can buy ma a coffee 

<a href="https://www.buymeacoffee.com/jungj2875" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## Usage

for keyboard use `CustomKeyBoard`.

```dart
const like = 'sample';
TextEditingController controller = TextEditingController;
CustomKeyBoard(
controller: controller,
onSubmit: (){
Navigator.pop(context);
},
);
```

In CustomKeyBoard you can change the length, backgroundColor, buttonColor, iconColor, backgroundOpacity, textSize


for number pad use `KNumPad`.

```dart
const like = 'sample';
TextEditingController controller = TextEditingController;
KNumPad(
controller: controller,
maxLength: 7,
buttonSize: 130,
isNotPhoneNumber: true,
onSubmit: (){
Navigator.pop(context);
},
);
```

In KNumPad you can change the buttonSize, buttonColor, iconColor, maxLength
also you can put if its phone number or if it is just a number by bool isNotPhoneNumber.



