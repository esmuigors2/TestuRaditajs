# TestuRaditajs
Creates a GitHub workflow file from the list of test files.

1. Place the files You find here in the same directory as Your tests.

   Tests are expected to have a '.sh' extension, but feel free to change that in the source code You download

   Each test is also expected to have a double comment with a human-readable description, in my case it's in Latvian (then Latvian-only characters will be substituted for plain Latin; change the character set in the script to fit Your needs, it occurs in two fragments of the code).

2. Run `./make.workflow.sh`

3. If You see it to be fit, use `./runtests.sh` to launch all the tests sequentially (edit the script if You need to).

Requirements:
* bash (obviously)
* sed

That's it. Have fun!

And glory to God.
