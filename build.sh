mkargs=("-j4")
cpu_count=`sysctl hw.physicalcpu | grep -Eo '[0-9]'`

if [ "$cpu_count" -gt "4" ]; then
  mkargs=("-j8")
fi

configure_args=("--without-npm" "--without-inspector")
./configure "${configure_args[@]}" && make "${mkargs[@]}" > /dev/null