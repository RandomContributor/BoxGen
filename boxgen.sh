#!/usr/bin/env bash
# ------------------------------------------------
# | Name: ASCII Art textbox generator script     |
# | Version: 0.1                                 |
# | Author: RandomContributor                    |
# | Use case: Source code headers like this one. |
# | Status: Unfinished                           |
# ------------------------------------------------
# TODO:
# draw shit without escapes
# minor bugs 
ERR=0

# vars
PAD=0    # padding
TOPC='-'  # ceiling character
LFTC='|'  # left wall character
RIGC='|'  # right wall character
BOTC='-'  # floor character

# set the maximum length
    x=0
    for i in "$@";do
        ((x=x+1))
        [[ "$x" == "1" ]] && AAAA=$(wc -c <<<"${i}") && continue
        [[ "$(wc -c <<<"${i}")" -ge "$AAAA" ]] && AAAA="$(wc -c <<<"${i}")" 
    done
LNG=$((AAAA+2))


# ceiling, floor and walls
B=$(x=0;while :;do ((x=x+1));echo -n "${BOTC}";[[ "$x" == "$((LNG+1))" ]] && break;done)
T=$(x=0;while :;do ((x=x+1));echo -n "${TOPC}";[[ "$x" == "$((LNG+1))" ]] && break;done)
P=$(echo -n "${LFTC}";x=0;while :;do ((x=x+1));echo -n " ";[[ "$x" == "$((LNG-1))" ]] && break;done;echo -n "${RIGC}")

echo "${T}" # draw ceiling
(x=0;while :;do ((x=x+1));[[ "$x" -ge "${PAD}" ]] && break;echo "${P}";done) # draw walls

# insert the text into the walls, fucky escapes

(
# it is usually a good idea to put loops like this into a subshell.
x=0;
for i in "$@";do
    ((x=x+1))
    MSG="$i"
    
    echo "${P}" # draw walls like earlier, insert a newline
    echo -ne \\033[A\\r\\033[C # move cursor 1 line up, to the beginning of the line, and 1 character to the right
    echo -n " ${MSG} " # insert the message
    echo -ne \\r\\033[B # move cursor to the beginning of the line and one line down
done
)

(x=0;while :;do ((x=x+1));[[ "$x" -ge "${PAD}" ]] && break;echo "${P}";done) # draw walls
echo "${B}" # draw floor

exit "${ERR}"
