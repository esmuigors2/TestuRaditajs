#!/bin/bash

cat classroom.yml.head >> classroom.yml
ls -v test*.sh | while read testt; do
    testname="$(grep '^##' "$testt" | sed 's@^## @@;s@:@ -@g')"
    testname_stripped="$(echo "$testname" | tr '[:upper:]' '[:lower:]' | sed 's@ā@a@g;s@č@c@g;s@ē@e@g;s@ģ@g@g;s@ī@i@g;s@ķ@k@g;s@ļ@l@g;s@ņ@n@g;s@ŗ@r@g;s@ō@o@g;s@š@s@g;s@ū@u@g;s@ž@z@g;s@[: -]@-@g;s@--@-@g;s@--@-@g')"
    echo "    - name: $testname" >> classroom.yml
    echo "      id: ${testname_stripped}" >> classroom.yml
    echo "      uses: classroom-resources/autograding-command-grader@v1" >> classroom.yml
    echo "      with:" >> classroom.yml
    echo "        test-name: $testname" >> classroom.yml
    echo "        setup-command: ''" >> classroom.yml
    echo "        command: './.tests/${testt}'" >> classroom.yml
    echo "        timeout: 3" >> classroom.yml
    echo "        max-score: 1" >> classroom.yml
done
cat classroom.yml.env.start >> classroom.yml
ls -v test*.sh | while read testt; do
    testname="$(grep '^##' "$testt" | sed 's@^## @@;s@:@ -@g')"
    testname_stripped="$(echo "$testname" | tr '[:upper:]' '[:lower:]' | sed 's@ā@a@g;s@č@c@g;s@ē@e@g;s@ģ@g@g;s@ī@i@g;s@ķ@k@g;s@ļ@l@g;s@ņ@n@g;s@ŗ@r@g;s@ō@o@g;s@š@s@g;s@ū@u@g;s@ž@z@g;s@[: -]@-@g;s@--@-@g;s@--@-@g')"
    echo "        $(echo "$testname_stripped" | tr '[:lower:]' '[:upper:]')_RESULTS: "'"${{steps.'"${testname_stripped}"'.result}}"' >> classroom.yml
    echo -n "$testname_stripped," >> tmp.runners
done
echo "      with:" >> classroom.yml
echo "        runners: $(cat tmp.runners)" >> classroom.yml
sed -i '$s@,$@@' classroom.yml
rm tmp.runners





