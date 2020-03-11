export HISTIGNORE='isrt*'
function isrt()
{
  local prev msg OPTIND h d s opt now usage saveLoc
  saveLoc=~/Desktop/isrt.txt
  prev="$(fc -ln -1)"
  msg=""
  usage=$(
    echo " "
    echo "'I should remember that!' (isrt)"
    echo " "
    echo "- A tool to save commands that should be remembered!"
    echo "- Writes to a file on your desktop called isrt.txt"
    echo "- Default behavior is to save only the last command"
    echo " "
    echo "options:"
    echo "-h                       Show brief help"
    echo "-d string                Pass an optional description of the command(s)"
    echo "-s number                Step through a number of previous commands to save"
    echo " "
  )
  while getopts ":hd:s:" opt; do
    case ${opt} in
      h )
          echo "${usage}"
          return
        ;;
      d )
          msg="Description: $OPTARG"
        ;;
      s )
          prev="$(fc -ln -$OPTARG)"
        ;;
      \? )
          echo "Invalid Option: -$OPTARG" 1>&2
          echo "${usage}"
          return
        ;;
    esac
  done
  now=$(date)
  echo "----${now}----">> ${saveLoc}
  echo "${msg}">> ${saveLoc}
  echo "${prev}" | awk '{ sub(/^[ \t]+/, ""); print }'>> ${saveLoc}
  echo "------------------------------------">> ${saveLoc}
}
