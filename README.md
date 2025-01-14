# react-native-static-framework

## [Issue Analysis] Non-Modular Header Inclusion in Framework Module

### Steps to Reproduce the Issue

1. Encounter the following error when importing Swift modules in the `AppDelegate.mm` file:
2. 
   ![Error Screenshot](./screenshots/1.png)

3. Following the guidance in this [documentation](https://github.com/adobe/aepsdk-react-native?tab=readme-ov-file#troubleshooting-and-known-issues), add the C++ compiler flag in Xcode:
4. 
   ![Compiler Flag Screenshot](./screenshots/2.png)

5. Recompile the project and observe the "include of non-modular header inside framework module" error:
6. 
   ![Error Screenshot](./screenshots/3.png)

### Solution

In your Xcode project:

- Navigate to `Build Settings` => `Apple Clang - Language - Modules`.
- Set `Allow Non-modular includes in Framework Modules` to "Yes" (the default is "No").
- Clean and rebuild the project.

   ![Solution Screenshot](./screenshots/4.png)
