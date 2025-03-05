# sched debug tool

## usage
To collect 10 seconds schedule and irq data and store it as out.perf
```bash
./run-perf-sched.sh out.perf 10
```

Convert perf data into ctf formated data
```bash
perf data convert -i out.perf --to-ctf ./ctf
```

Import ctf data files in trace-compase to visualize the schedule and irq behaviors
