set -ex

cat input.hex
cat output.gold

valgrind --quiet --log-file=valgrind.log $PTEST_BINARY $FORMAT input.hex > output.test
cat valgrind.log
if [[ "$(cat valgrind.log | wc -l)" != 0 ]]
then
    exit 1
fi

diff -u output.gold output.test
