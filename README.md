# EazelAnimationsKit
<img alt="eazel_logo_white (1)" src="https://user-images.githubusercontent.com/46320390/181726029-3eaa7a42-4107-47ef-ad0e-9de54f41024b.png">

## Table of Contents


1. [Introduction](#introduction)
2. [Animations](#animations)
3. [Usage](#usage)
4. [Installation](#installation)
5. [Contribution](#contribution)
6. [Authors](#authors)

## Introduction 

The drive for developing this animation SDK from iOS team at eazel's was taken from our company's slogan:

/ *Bringing global art world to the comfort of your home* / 

However, if we paraphrase it a bit:

/ *Bringing global animation world to the comfort of your repository* /

If you're fancy UI lover, you may know that developing beatiful UI is easier said than done. From your busy schedule to endless new features to develop, limitations in time can make it difficult for you to indulge in UI animations as much as you'd like.

Eazel iOS team works to change that. We have created beatiful and easily scalable EazelAnimationsKit, providing you with fast and easy access to different kind of animations, bringing the animations world to the comfort of your own repository.

## Animations

EazelAnimationsKit was developed with the idea for future easy scalability. Written in pure swift 5.6 with protocol oriented design and well known UIKit framework, EazelAnimationsKit's main goal is to give opportunity for developing animations with no hesitations for all different kinds of UIKit views!

So far, we have two different animations for UIButton aka *EmergingButton* or *PreEmergingButton*:

1. .expandAnimation:

![expand](https://user-images.githubusercontent.com/46320390/181723163-22abc267-da8d-48bf-b4e3-b9c964eb1d13.gif)


2. .fillUpAnimation

![fillUp](https://user-images.githubusercontent.com/46320390/181723587-abd32ddf-cbba-46aa-93ef-674b9b169eb1.gif)


## Usage

### If you want to use EazelAnimationsKit for your button with default animations, you can follow up these steps:

1. You need to create your button programmatically, and make it a type of EmergingButton, and pass images for selected and unselected states as constructor parameters.

```swift
var expandableButton: EmergingButton = EmergingButton(unselectedImage: UIImage(named: "btn_bookmark"),
                                                      selectedImage: UIImage(named: "btn_bookmark_on"))
```
2. Then, in your target function, you can choose the animation type with speed type by simple .animate command.

```swift
expandableButton.animate(with: .expandAnimation(isSelected: !expandableButton.isSelected, duration: .fast))
// for expand animation with fast duration
        
expandableButton.animate(with: .expandAnimation(isSelected: !expandableButton.isSelected, duration: .slow))
// for expand animation with slow duration
        
expandableButton.animate(with: .fillUpAnimation(isSelected: !expandableButton.isSelected, duration: .fast))
// for fill up animation with fast duration
        
expandableButton.animate(with: .fillUpAnimation(isSelected: !expandableButton.isSelected, duration: .slow)) 
// for fill up animation with slow duration
```
Since EmergingButton is a child of UIButton, it inherits all of the default instances and functions that regular UIButton includes, such as .addTarget.

### If you want to use EazelAnimationsKit for your button with custom animations, you can follow up these steps:

1. You need to create your button programmatically, and make it a type of PreEmergingButton, and pass images for selected and unselected states as constructor parameters.

```swift
var expandableButton: PreEmergingButton = PreEmergingButton(unselectedImage: UIImage(named: "btn_bookmark"),
                                                            selectedImage: UIImage(named: "btn_bookmark_on"))
```
2. Then, in your target function, you can choose the animation type with custom speed type by simple .animate command.

```swift
expandableButton.animate(with: .expandAnimation(isSelected: !ovelappingButton.isSelected, duration: .init(startAnimating: 0.3, finishAnimating: 0.5)))
// startAnimating is the duration of first animation until it changes the state finishAnimating is the duration of last animation after button changed the state
        
expandableButton.animate(with: .fillUpAnimation(isSelected: !ovelappingButton.isSelected, duration: .init(startAnimating: 0.3, finishAnimating: 0.5)))
// startAnimating is the duration of first animation until it changes the state finishAnimating is the duration of last animation after button changed the state
```
Since PreEmergingButton is a child of UIButton, it inherits all of the default instances and functions that regular UIButton includes, such as .addTarget.

## Installation

Since eazel is trying to use best practices, EazelAnimationsKit can be installed through Swift Package Manager easily and with comfort.

```swift
let package = Package(
  name: "MyPackage",
  dependencies: [
    .package(url: "https://github.com/eazel/EazelAnimationsKit.git", .upToNextMinor(from: "1.0.0"))
  ],
  targets: [
    .target(name: "MyTarget", dependencies: ["EazelAnimationsKit"])
  ]
)
```

## Contribution

Any discussion and pull requests are more than welcome! 

For the potential contributors, before starting the development, please open the issue with your ideas. Assign proper label(feature, bug, refactor), and create sub branch from 'develop' with following structure:
 
```
feature/#132/CreateAnimationForLabel // where feature is the label of issue, #132 is the issue number, and CreateAnimationForLabel is short title of the task.
```

After the work done, and all tests are passed, please open the PR to the develop branch, with explaining the task including as much details of your work as possible. Leaving the links to the resources will be much appricated! 

The PR rule of EazelAnimationsKit is that it should be reviewed by at least one of the admins, and pass the CI testing before merging.

Please note that we will review the code style as well together with the efficiency of the code!

Everybody is welcome for the contributions!

[Example of PR](https://github.com/eazel/EazelAnimationsKit/pull/3)

## Authors
 
- [msk-psp](https://github.com/msk-psp) , vibrio0102@gmail.com
- [yermukhanbet](https://github.com/yermukhanbet) , y.yesen.y@gmail.com


## License 

EazelAnimationsKit is under MIT license. See the [LICENSE](https://github.com/eazel/EazelAnimationsKit/blob/main/LICENSE) for more info.






 
   
