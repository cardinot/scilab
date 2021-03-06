// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Paul Bignier
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================
//
// <-- CLI SHELL MODE -->
//

// With a real matrix
x = [1 2 3; 4 5 6];
y = permute(x, [2 1]);

assert_checkequal(y, x');

// With an integer matrix
x = int32(x);
y = permute(x, [2 1]);

assert_checkequal(y, x');

// With a string matrix
x = string(x);
y = permute(x, [2 1]);

assert_checkequal(y, x');

// With a complex matrix
x = [1 2 3; 4 5 6]*%i;
y = permute(x, [2 1]);
refY = [1 4; 2 5; 3 6]*%i;

assert_checkequal(y, refY);

// With a real hypermatrix
x = matrix(1:12, [2, 3, 2]);
y = permute(x, [3 1 2]);
clear refY
refY(:, :, 1) = [1 2; 7 8];
refY(:, :, 2) = [3 4; 9 10];
refY(:, :, 3) = [5 6; 11 12];

assert_checkequal(y, refY);

// With an integer hypermatrix
x = int32(x);
y = permute(x, [3 1 2]);
refY = int32(refY);

assert_checkequal(y, refY);

// With a string hypermatrix
x = string(x);
y = permute(x, [3 1 2]);
refY = string(refY);

assert_checkequal(y, refY);

// With a complex hypermatrix
x = matrix(1:12, [2, 3, 2])*%i;
y = permute(x, [3 1 2]);
clear refY
refY(:, :, 1) = [1 2; 7 8]*%i;
refY(:, :, 2) = [3 4; 9 10]*%i;
refY(:, :, 3) = [5 6; 11 12]*%i;

assert_checkequal(y, refY);

// Error checks
refMsg = msprintf(_("%s: Wrong size for input argument #%d: At least the size of input argument #%d expected.\n"), "permute", 2, 1);
assert_checkerror("permute(x, [1 2]);", refMsg);
refMsg = msprintf(_("%s: Wrong value for input argument #%d: Must be a valid permutation vector.\n"), "permute", 2);
assert_checkerror("permute(x, [1 2 4]);", refMsg);
assert_checkerror("permute(x, [1 2 3 5]);", refMsg);
