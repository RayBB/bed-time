# bed-time
A simple script to turn off the every 2 minutes after bedtime


Usually, a simple script like this wouldn't warrant a github repo. However, this is my first time setting up a script like this to run with `systemd` instead of a cron job. I wanted to document it so I could easily come back and find it.



## Installation for `systemd`

1. Update `bedtimer.sh` with the days/times you want your wifi off at and move it to where you want to store it.
2. Update `bedtimer.service` with the path to `bedtimer.sh`
3. Copy `bedtimer.service` and `bedtimer.timer` to `/etc/systemd/system` (or where ever they need to go on your system)
4. `systemctl daemon-reload` to load the files
5. `systemctl start bedtimer.service` to start the service
6. `systemctl status bedtimer.service` to see the logs of the service