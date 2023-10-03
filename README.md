# RemoveAppAD

## Usage

Download `apktool` script and jar automatically, and remove the AD.

```
bash main.sh [app.apk]
```

Only support on Linux PC now, if you want to use on other platform, please change the `apktool` script and modify the main.sh.

## FAQ:

> I: Building resources...
> W: Public symbol... declared here is not defined.

Two solutions:
- Update to latest apktool (prefer)
- [Replace some tags manually](https://github.com/iBotPeaches/Apktool/issues/1922#issuecomment-454865772)

> No resource identifier found for attribute 'foregroundServiceType' in package 'android'

Two solutions:
- [Pull the component from your phone](https://go.redteams.fr/post/51_apktoolandroid/) (prefer?)
- [switching sdk version](https://www.b4x.com/android/forum/threads/mylocation-example-causes-error-no-resource-identifier-found-for-attribute-foregroundservicetype-in-package-android.127442/) of android.jar from 28 to 30

## Thanks

Thanks for advice from @0xheartcode and all the users from [original gist](https://gist.github.com/nobodyzxc/5824c8d138f04c1f5599346dde2681ae)
