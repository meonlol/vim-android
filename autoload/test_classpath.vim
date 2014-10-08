let s:tc = unittest#testcase#new("Something")

function! s:tc.test_adds_path_to_class_path()
	let $CLASSPATH = "test/class/path"

	call classpath#addClassPath("input/path")

	let expectedResult = "test/class/path:input/path"
	call self.assert_equal(expectedResult, $CLASSPATH, ">> $CLASSPATH should contain joined paths") 
	call self.assert_equal(expectedResult, javacomplete#GetClassPath(), ">> javacomplete should have joined paths")
endfunction





function! s:tc.test_adds_path_to_source_path()
	let $SRCPATH = "./vim-android"

	call classpath#addSourcePath("./javacomplete")

	let expectedResult = "./vim-android:./javacomplete"
	call self.assert_equal(expectedResult, $SRCPATH, ">> $SRCPATH should contain joined paths") 
	call self.assert_equal(expectedResult, javacomplete#GetSourcePath(0), ">> javacomplete should have paths")
endfunction
