tempdir=`mktemp -d -t dreamer-objdump.XXXXXXXXXX`
trap "rm -rf $tempdir" EXIT

cd $tempdir
