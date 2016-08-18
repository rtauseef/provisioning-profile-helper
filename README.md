# provisioning-profile-helper

Scripts and tools for managing provision profiles

## Add a new device

1. Add the device to iTunes Connect.
  * If you don't know the account username and password, ask an admin for help.
2. Add the device to the __HP Wildcard Development Provision__ in iTunes Connect.
3. Generate the new provisioning profile and save it over _hp.wildcard.mobileprovision_ file in this repo.
4. Commit changes and push to __master__.


## Update your system with latest provisioning profile

1. Clone and/or pull the latest version of this repo.
2. Run the _update.rb_ script.

  `ruby update.rb`
  
## Update Jenkins with latest provisioning profile

* Jenkins checks for updates automatically every 2 minutes. If there is a new provisioning profile available, it will be installed automatically.
* If you need to perfom an immediate build, run the Jenkins job __provisioning-profile__ and then run the job to build your app.










