# NIXSwift

A Swift wrapper to UIAlertController, making its regular use more concise.
Eventually this will be a collection of similar useful little Swift utilities.

## Usage

Import the module:

    import NIXSwift

Show an alert in a UIViewController:

	present(Nix.Alert(title: "Warning", message: "Don't press the button!...")
	           .withOK(title: "Play it safe")
	           .andAction("PRESS IT!!", style: .destructive){_ in print("KABOOM!!!")})

The simplest kind of use would be:

    present(Nix.Alert(message: "Something bad happened...").withOK())

## Requirements

iOS 8.0+

## Installation

The simplest way is to simply copy the file you want into your project.

If you want a more complex method, you can include the code as a framework:
- build the project.
- right-click on the framework in the Products folder in the project explorer. Choose to display the framework in finder.
- copy the framework into your project folder.
- create a frameworks group in project explorer, if there isn't one already.
- drag the framework into the group.
- ensure your build settings link with the framework, and your project includes it as an embedded binary (General project settings).

## Author

Adrian Bigland, a.d.bigland@gmail.com

## License

NIXSwift is available under the Version 2.0 Apache License. See the LICENSE file for more info.