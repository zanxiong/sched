#/bin/sh

set -x

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <output> <record_time_in_seconds>"
    exit 1
fi

OUTPUT=$1
TIME=$2

echo "start perf record"

sudo perf record \
-e sched:* \
-e irq:* \
-e  irq_vectors:call_function_entry        \
-e  irq_vectors:call_function_exit         \
-e  irq_vectors:call_function_single_entry \
-e  irq_vectors:call_function_single_exit  \
-e  irq_vectors:deferred_error_apic_entry  \
-e  irq_vectors:deferred_error_apic_exit   \
-e  irq_vectors:error_apic_entry           \
-e  irq_vectors:error_apic_exit            \
-e  irq_vectors:local_timer_entry          \
-e  irq_vectors:local_timer_exit           \
-e  irq_vectors:reschedule_entry           \
-e  irq_vectors:reschedule_exit            \
-e  irq_vectors:spurious_apic_entry        \
-e  irq_vectors:spurious_apic_exit         \
-e  irq_vectors:thermal_apic_entry         \
-e  irq_vectors:thermal_apic_exit          \
-e  irq_vectors:threshold_apic_entry       \
-e  irq_vectors:threshold_apic_exit        \
-e  irq_vectors:x86_platform_ipi_entry     \
-e  irq_vectors:x86_platform_ipi_exit      \
-o $OUTPUT  \
-a \
sleep $TIME

echo "end perf, record file $OUTPUT"
