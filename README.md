# Local Development Setup

## Update your system with latest provisioning profile

1. Clone and/or pull the latest version of this repo.
2. Run the _update.rb_ script.

  `ruby update.rb`

## Update your system with latest developer certificate

1. Clone and/or pull the latest version of this repo.
2. Double-click the file `hp.developer.cert.p12`
3. Enter the password `hp` when prompted.
4. The next time you build in Xcode, answer "Alway Allow" when prompted to access your Keychain (during code signing).

> __Important:__ Make sure to update to the latest provisioning profiles after updating your certificate.

# Admin Tasks
The following instructions are only for people with admin access.

## Add a new device

1. Send UDID(s) to [Paul-Andre Fountain](mailto://paul-andre.fountain@hp.com) and/or [Jaime Cardenas](mailto://jaime.cardenas@hp.com) and request new provisioning profiles. Proceed to step 2 once new profiles are received.
> __Important:__ Make sure to include a descriptive name for each device. This name _must_ include the device owner's name or organization and the device type. This is _critical_ for end-of-year device clean up. Examples: `Chrissy Harris' iPhone 7`, `MacKiev iPad Air`, `QA iPhone 6 Plus`
2. `git pull` the latest changes from __master__.
3. Save the profile file(s) received from PAF/Jaime in the same directory as this repo, renaming the file(s) to replace the corresponding file(s) in this repo.
- For SMS and Cards there is a single wildcard profile.
- For Sprocket there are six profiles: developement and ad-hoc, app, print extension, and notification extension.
4. Commit changes and push to __origin/master__.

## Update Jenkins with latest provisioning profile

* Jenkins checks for updates automatically every 2 minutes. If there is a new provisioning profile available, it will be installed automatically.
* If you need to perform an immediate build, run the Jenkins job __provisioning-profile__ and then run the job to build your app.
