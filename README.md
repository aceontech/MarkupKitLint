# MarkupKitLint
Linting and validation utilities for MarkupKit which integrate with Xcode.

## mklint.sh

![](Documentation/mklint_xcode_integration.png)

`mklint.sh` is a script which validates your project's MarkupKit XML files and reports any issues it finds right **in Xcode's Issue Navigator**, and highlights the actual offending line in the text editor. It makes use of Xcode's **Build Phases** to provide this integration.

In its current (most basic) form, `mklint.sh` passes through to `xmllint` and currenly only provides basic XML syntax checking.

### Setup

#### 1. Open a terminal & `cd` into your Xcode project's root directory
```sh
cd ~/Developer/YourAwesomeApp/
```

#### 2. Download `mklint.sh` into this directory

You can use the following cURL snippet to do so in one line:
```sh
curl -O https://raw.githubusercontent.com/jarrroo/MarkupKitLint/master/Scripts/mklint.sh ; chmod +x mklint.sh
```

#### 3. Xcode: Add Build Phase to your app's target

1. Open the `Project Navigator` pane in Xcode (Cmd+1) & select your project
2. Open the `Build Phases` tab
3. Add a new `Run Script Phase`
4. Type the following command into the shell box:

```sh
./mklint.sh
```

![](Documentation/mklint_setup1.png)

#### 4. That's it

Now, whenever you build your project, the linter will run and highlight any issues it finds right inside Xcode.

![](Documentation/mklint_xcode_integration.png)

## Future plans

### XSD schema validation
`xmllint` supports passing in an XSD schema. This can be used to provide more in depth validation beyond simple XML syntax. Things we need to make this work:

* Create/maintain a basic XSD schema which describes MarkupKit's default set of markup semantics, including knowledge of basic components (like `LMColumnView`, `LMRowView`) and attributes (like `spacing`, `width`, `height`). This can be a manual effort at first.
* Generate XSD schema basic on the current projects code structure? This would require some serious sourcery at the lower levels of Objective-C/Swift. 
