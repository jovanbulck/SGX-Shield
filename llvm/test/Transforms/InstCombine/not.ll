; This test makes sure that these instructions are properly eliminated.
;

; RUN: opt < %s -instcombine -S | FileCheck %s
; CHECK-NOT: xor

define i32 @test1(i32 %A) {
        %B = xor i32 %A, -1
        %C = xor i32 %B, -1
        ret i32 %C
}

define i1 @test2(i32 %A, i32 %B) {
        ; Can change into setge
        %cond = icmp sle i32 %A, %B
        %Ret = xor i1 %cond, true
        ret i1 %Ret
}

; Test that De Morgan's law can be instcombined.
define i32 @test3(i32 %A, i32 %B) {
        %a = xor i32 %A, -1
        %b = xor i32 %B, -1
        %c = and i32 %a, %b
        %d = xor i32 %c, -1
        ret i32 %d
}

; Test that De Morgan's law can work with constants.
define i32 @test4(i32 %A, i32 %B) {
        %a = xor i32 %A, -1
        %c = and i32 %a, 5
        %d = xor i32 %c, -1
        ret i32 %d
}

; Test the mirror of De Morgan's law.
define i32 @test5(i32 %A, i32 %B) {
        %a = xor i32 %A, -1
        %b = xor i32 %B, -1
        %c = or i32 %a, %b
        %d = xor i32 %c, -1
        ret i32 %d
}

; PR2298
define zeroext i8 @test6(i32 %a, i32 %b) {
entry:
	%tmp1not = xor i32 %a, -1
	%tmp2not = xor i32 %b, -1
	%tmp3 = icmp slt i32 %tmp1not, %tmp2not
	%retval67 = zext i1 %tmp3 to i8
	ret i8 %retval67
}

define <2 x i1> @test7(<2 x i32> %A, <2 x i32> %B) {
        %cond = icmp sle <2 x i32> %A, %B
        %Ret = xor <2 x i1> %cond, <i1 true, i1 true>
        ret <2 x i1> %Ret
}
