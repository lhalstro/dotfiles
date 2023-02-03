
#TimeTrap Aliases
    #Be careful: this syntax competes with ohmyzsh aliases for tmux (e.g. 'ts', 'tl', etc)
alias tsh="t s"
alias td="t d"
alias te="t e"
alias teap="t e --append"
alias tia='t i --at'
alias toa='t o --at'
alias ti="t i"
alias to="t o"
alias tr='t r'
alias tra='t r --at'
alias tt='t today all'

#get entries for current pay period (leverages `payperiod.py` script in user bin)
tdpp() {
    #display timesheet entries for current payperiod (default: all timesheets)
    if [[ "$#" == "1" ]]; then sheet=$1; else sheet="all" fi
    tmp=($(payperiod -c)) ; t d --start "${tmp[2]}" --end "${tmp[3]}" $sheet ; echo "\n$tmp[4]/10 workdays ($(($tmp[4]*8)) hrs)"
}
tm() {
    #Move entry to another timesheet: `tm ID new_sheet`
    if [[ "$#" != "2" ]]; then
        echo "USAGE: `tm ID new_sheet`"
        exit 1
    fi
    t edit --id $1 --move $2
}

trename() {
    #Rename timetrap timesheet $1 to $2
    for id in `t display $1 -f ids`; do t edit --id $id --move $2 >/dev/null 2>&1; done
    #change active sheet, if it was renamed
    sheets=`t sheet`
    if [[ "$sheets"~="*$1" ]]; then
	t sheet $2
    fi
}

# t() {
#     #timetrap alias wrapper to handle custom aliases like 'move'
#     #DOES NOT WORK YET: need to search $@ for the first input 'm'
#     if [[ $@ == "m" ]]; then
# 	command tm "$@"
#     else
# 	command t "$@"
#     fi
# }
