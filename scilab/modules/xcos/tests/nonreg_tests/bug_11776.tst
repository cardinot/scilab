// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Alexandre HERISSE
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- XCOS TEST -->
//
// <-- Non-regression test for bug 11776 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=11776
//
// <-- Short Description -->
// CMSCOPE did not take into account label&Id parameter.

assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_cmscope.zcos"));
Info = xcos_simulate(scs_m, 4);

f = gcf();
assert_checkequal(f.figure_name, "CmscopE");
close(f);

assert_checktrue(importXcosDiagram(SCI + "/modules/xcos/tests/nonreg_tests/bug_cscope.zcos"));
Info = xcos_simulate(scs_m, 4);

f = gcf();
assert_checkequal(f.figure_name, "CscopE");

