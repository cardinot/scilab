// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Calixte DENIZET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

c = jcompile("Test", ["public class Test {";
"public enum foo { ONE, TWO, THREE; }";
"public static double bar(foo x) { return (double) x.ordinal(); }}"]);

assert_checkequal(c.bar("ONE"), 0);
assert_checkequal(c.bar("TWO"), 1);
assert_checkequal(c.bar("THREE"), 2);