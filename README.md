# provisioning-profile-helper

Scripts and tools for managing provision profiles

## Add a new device

1. `git pull` the latest changes from __master__.
2. Add the device to the Apple Developer Portal.
  * If you don't know the account username and password, ask an admin for help.
3. In the Apple Developer Portal, go to __Certificates, Identifiers & Profiles__. Add the device under __Devices / All__.
4. Go to __Provisioning Profiles / Development__ and generate the new provisioning profile for __HP Wildcard Development Provision__  and save it over _hp.wildcard.mobileprovision_ file in this repo.
  * Select __HP Wildcard Development Provision__ and choose "Edit"
  * Scroll down to the devices section and choose "Select All". Verify in the upper right of the devices box that all devices are selected.
  * Choose "Generate" and save it on top of old _hp.wildcard.mobileprovision_.
5. Commit changes and push to __master__.


## Update your system with latest provisioning profile

1. Clone and/or pull the latest version of this repo.
2. Run the _update.rb_ script.

  `ruby update.rb`
  
## Update Jenkins with latest provisioning profile

* Jenkins checks for updates automatically every 2 minutes. If there is a new provisioning profile available, it will be installed automatically.
* If you need to perfom an immediate build, run the Jenkins job __provisioning-profile__ and then run the job to build your app.










