; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -mtriple=x86_64-unknown -basicaa -slp-vectorizer -S | FileCheck %s --check-prefix=CHECK --check-prefix=SSE
; RUN: opt < %s -mtriple=x86_64-unknown -mcpu=corei7-avx -basicaa -slp-vectorizer -S | FileCheck %s --check-prefix=CHECK --check-prefix=AVX
; RUN: opt < %s -mtriple=x86_64-unknown -mcpu=core-avx2 -basicaa -slp-vectorizer -S | FileCheck %s --check-prefix=CHECK --check-prefix=AVX

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

@src64 = common global [4 x i64] zeroinitializer, align 32
@src32 = common global [8 x i32] zeroinitializer, align 32
@src16 = common global [16 x i16] zeroinitializer, align 32
@src8  = common global [32 x i8] zeroinitializer, align 32

@dst64 = common global [4 x double] zeroinitializer, align 32
@dst32 = common global [8 x float] zeroinitializer, align 32

;
; SITOFP to vXf64
;

define void @sitofp_2i64_2f64() #0 {
; CHECK-LABEL: @sitofp_2i64_2f64(
; CHECK-NEXT:    [[LD0:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
; CHECK-NEXT:    [[LD1:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
; CHECK-NEXT:    [[CVT0:%.*]] = sitofp i64 [[LD0]] to double
; CHECK-NEXT:    [[CVT1:%.*]] = sitofp i64 [[LD1]] to double
; CHECK-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; CHECK-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
  %ld1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
  %cvt0 = sitofp i64 %ld0 to double
  %cvt1 = sitofp i64 %ld1 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  ret void
}

define void @sitofp_4i64_4f64() #0 {
; CHECK-LABEL: @sitofp_4i64_4f64(
; CHECK-NEXT:    [[LD0:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
; CHECK-NEXT:    [[LD1:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
; CHECK-NEXT:    [[LD2:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 2), align 8
; CHECK-NEXT:    [[LD3:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 3), align 8
; CHECK-NEXT:    [[CVT0:%.*]] = sitofp i64 [[LD0]] to double
; CHECK-NEXT:    [[CVT1:%.*]] = sitofp i64 [[LD1]] to double
; CHECK-NEXT:    [[CVT2:%.*]] = sitofp i64 [[LD2]] to double
; CHECK-NEXT:    [[CVT3:%.*]] = sitofp i64 [[LD3]] to double
; CHECK-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; CHECK-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; CHECK-NEXT:    store double [[CVT2]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
; CHECK-NEXT:    store double [[CVT3]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
  %ld1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
  %ld2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 2), align 8
  %ld3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 3), align 8
  %cvt0 = sitofp i64 %ld0 to double
  %cvt1 = sitofp i64 %ld1 to double
  %cvt2 = sitofp i64 %ld2 to double
  %cvt3 = sitofp i64 %ld3 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  store double %cvt2, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
  store double %cvt3, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
  ret void
}

define void @sitofp_2i32_2f64() #0 {
; CHECK-LABEL: @sitofp_2i32_2f64(
; CHECK-NEXT:    [[LD0:%.*]] = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 0), align 8
; CHECK-NEXT:    [[LD1:%.*]] = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 1), align 8
; CHECK-NEXT:    [[CVT0:%.*]] = sitofp i32 [[LD0]] to double
; CHECK-NEXT:    [[CVT1:%.*]] = sitofp i32 [[LD1]] to double
; CHECK-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; CHECK-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 0), align 8
  %ld1 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 1), align 8
  %cvt0 = sitofp i32 %ld0 to double
  %cvt1 = sitofp i32 %ld1 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  ret void
}

define void @sitofp_4i32_4f64() #0 {
; SSE-LABEL: @sitofp_4i32_4f64(
; SSE-NEXT:    [[LD0:%.*]] = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 0), align 8
; SSE-NEXT:    [[LD1:%.*]] = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 1), align 8
; SSE-NEXT:    [[LD2:%.*]] = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 2), align 8
; SSE-NEXT:    [[LD3:%.*]] = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 3), align 8
; SSE-NEXT:    [[CVT0:%.*]] = sitofp i32 [[LD0]] to double
; SSE-NEXT:    [[CVT1:%.*]] = sitofp i32 [[LD1]] to double
; SSE-NEXT:    [[CVT2:%.*]] = sitofp i32 [[LD2]] to double
; SSE-NEXT:    [[CVT3:%.*]] = sitofp i32 [[LD3]] to double
; SSE-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; SSE-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; SSE-NEXT:    store double [[CVT2]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
; SSE-NEXT:    store double [[CVT3]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
; SSE-NEXT:    ret void
;
; AVX-LABEL: @sitofp_4i32_4f64(
; AVX-NEXT:    [[TMP1:%.*]] = load <4 x i32>, <4 x i32>* bitcast ([8 x i32]* @src32 to <4 x i32>*), align 8
; AVX-NEXT:    [[TMP2:%.*]] = sitofp <4 x i32> [[TMP1]] to <4 x double>
; AVX-NEXT:    store <4 x double> [[TMP2]], <4 x double>* bitcast ([4 x double]* @dst64 to <4 x double>*), align 8
; AVX-NEXT:    ret void
;
  %ld0 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 0), align 8
  %ld1 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 1), align 8
  %ld2 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 2), align 8
  %ld3 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 3), align 8
  %cvt0 = sitofp i32 %ld0 to double
  %cvt1 = sitofp i32 %ld1 to double
  %cvt2 = sitofp i32 %ld2 to double
  %cvt3 = sitofp i32 %ld3 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  store double %cvt2, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
  store double %cvt3, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
  ret void
}

define void @sitofp_2i16_2f64() #0 {
; CHECK-LABEL: @sitofp_2i16_2f64(
; CHECK-NEXT:    [[LD0:%.*]] = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 0), align 8
; CHECK-NEXT:    [[LD1:%.*]] = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 1), align 8
; CHECK-NEXT:    [[CVT0:%.*]] = sitofp i16 [[LD0]] to double
; CHECK-NEXT:    [[CVT1:%.*]] = sitofp i16 [[LD1]] to double
; CHECK-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; CHECK-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 0), align 8
  %ld1 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 1), align 8
  %cvt0 = sitofp i16 %ld0 to double
  %cvt1 = sitofp i16 %ld1 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  ret void
}

define void @sitofp_4i16_4f64() #0 {
; SSE-LABEL: @sitofp_4i16_4f64(
; SSE-NEXT:    [[LD0:%.*]] = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 0), align 8
; SSE-NEXT:    [[LD1:%.*]] = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 1), align 8
; SSE-NEXT:    [[LD2:%.*]] = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 2), align 8
; SSE-NEXT:    [[LD3:%.*]] = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 3), align 8
; SSE-NEXT:    [[CVT0:%.*]] = sitofp i16 [[LD0]] to double
; SSE-NEXT:    [[CVT1:%.*]] = sitofp i16 [[LD1]] to double
; SSE-NEXT:    [[CVT2:%.*]] = sitofp i16 [[LD2]] to double
; SSE-NEXT:    [[CVT3:%.*]] = sitofp i16 [[LD3]] to double
; SSE-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; SSE-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; SSE-NEXT:    store double [[CVT2]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
; SSE-NEXT:    store double [[CVT3]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
; SSE-NEXT:    ret void
;
; AVX-LABEL: @sitofp_4i16_4f64(
; AVX-NEXT:    [[TMP1:%.*]] = load <4 x i16>, <4 x i16>* bitcast ([16 x i16]* @src16 to <4 x i16>*), align 8
; AVX-NEXT:    [[TMP2:%.*]] = sitofp <4 x i16> [[TMP1]] to <4 x double>
; AVX-NEXT:    store <4 x double> [[TMP2]], <4 x double>* bitcast ([4 x double]* @dst64 to <4 x double>*), align 8
; AVX-NEXT:    ret void
;
  %ld0 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 0), align 8
  %ld1 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 1), align 8
  %ld2 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 2), align 8
  %ld3 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 3), align 8
  %cvt0 = sitofp i16 %ld0 to double
  %cvt1 = sitofp i16 %ld1 to double
  %cvt2 = sitofp i16 %ld2 to double
  %cvt3 = sitofp i16 %ld3 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  store double %cvt2, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
  store double %cvt3, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
  ret void
}

define void @sitofp_2i8_2f64() #0 {
; CHECK-LABEL: @sitofp_2i8_2f64(
; CHECK-NEXT:    [[LD0:%.*]] = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 0), align 8
; CHECK-NEXT:    [[LD1:%.*]] = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 1), align 8
; CHECK-NEXT:    [[CVT0:%.*]] = sitofp i8 [[LD0]] to double
; CHECK-NEXT:    [[CVT1:%.*]] = sitofp i8 [[LD1]] to double
; CHECK-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; CHECK-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 0), align 8
  %ld1 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 1), align 8
  %cvt0 = sitofp i8 %ld0 to double
  %cvt1 = sitofp i8 %ld1 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  ret void
}

define void @sitofp_4i8_4f64() #0 {
; SSE-LABEL: @sitofp_4i8_4f64(
; SSE-NEXT:    [[LD0:%.*]] = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 0), align 8
; SSE-NEXT:    [[LD1:%.*]] = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 1), align 8
; SSE-NEXT:    [[LD2:%.*]] = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 2), align 8
; SSE-NEXT:    [[LD3:%.*]] = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 3), align 8
; SSE-NEXT:    [[CVT0:%.*]] = sitofp i8 [[LD0]] to double
; SSE-NEXT:    [[CVT1:%.*]] = sitofp i8 [[LD1]] to double
; SSE-NEXT:    [[CVT2:%.*]] = sitofp i8 [[LD2]] to double
; SSE-NEXT:    [[CVT3:%.*]] = sitofp i8 [[LD3]] to double
; SSE-NEXT:    store double [[CVT0]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
; SSE-NEXT:    store double [[CVT1]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
; SSE-NEXT:    store double [[CVT2]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
; SSE-NEXT:    store double [[CVT3]], double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
; SSE-NEXT:    ret void
;
; AVX-LABEL: @sitofp_4i8_4f64(
; AVX-NEXT:    [[TMP1:%.*]] = load <4 x i8>, <4 x i8>* bitcast ([32 x i8]* @src8 to <4 x i8>*), align 8
; AVX-NEXT:    [[TMP2:%.*]] = sitofp <4 x i8> [[TMP1]] to <4 x double>
; AVX-NEXT:    store <4 x double> [[TMP2]], <4 x double>* bitcast ([4 x double]* @dst64 to <4 x double>*), align 8
; AVX-NEXT:    ret void
;
  %ld0 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 0), align 8
  %ld1 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 1), align 8
  %ld2 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 2), align 8
  %ld3 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 3), align 8
  %cvt0 = sitofp i8 %ld0 to double
  %cvt1 = sitofp i8 %ld1 to double
  %cvt2 = sitofp i8 %ld2 to double
  %cvt3 = sitofp i8 %ld3 to double
  store double %cvt0, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 0), align 8
  store double %cvt1, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 1), align 8
  store double %cvt2, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 2), align 8
  store double %cvt3, double* getelementptr inbounds ([4 x double], [4 x double]* @dst64, i32 0, i64 3), align 8
  ret void
}

;
; SITOFP to vXf32
;

define void @sitofp_2i64_2f32() #0 {
; CHECK-LABEL: @sitofp_2i64_2f32(
; CHECK-NEXT:    [[LD0:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
; CHECK-NEXT:    [[LD1:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
; CHECK-NEXT:    [[CVT0:%.*]] = sitofp i64 [[LD0]] to float
; CHECK-NEXT:    [[CVT1:%.*]] = sitofp i64 [[LD1]] to float
; CHECK-NEXT:    store float [[CVT0]], float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
; CHECK-NEXT:    store float [[CVT1]], float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
  %ld1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
  %cvt0 = sitofp i64 %ld0 to float
  %cvt1 = sitofp i64 %ld1 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  ret void
}

define void @sitofp_4i64_4f32() #0 {
; CHECK-LABEL: @sitofp_4i64_4f32(
; CHECK-NEXT:    [[LD0:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
; CHECK-NEXT:    [[LD1:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
; CHECK-NEXT:    [[LD2:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 2), align 8
; CHECK-NEXT:    [[LD3:%.*]] = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 3), align 8
; CHECK-NEXT:    [[CVT0:%.*]] = sitofp i64 [[LD0]] to float
; CHECK-NEXT:    [[CVT1:%.*]] = sitofp i64 [[LD1]] to float
; CHECK-NEXT:    [[CVT2:%.*]] = sitofp i64 [[LD2]] to float
; CHECK-NEXT:    [[CVT3:%.*]] = sitofp i64 [[LD3]] to float
; CHECK-NEXT:    store float [[CVT0]], float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
; CHECK-NEXT:    store float [[CVT1]], float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
; CHECK-NEXT:    store float [[CVT2]], float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
; CHECK-NEXT:    store float [[CVT3]], float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 0), align 8
  %ld1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 1), align 8
  %ld2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 2), align 8
  %ld3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @src64, i32 0, i64 3), align 8
  %cvt0 = sitofp i64 %ld0 to float
  %cvt1 = sitofp i64 %ld1 to float
  %cvt2 = sitofp i64 %ld2 to float
  %cvt3 = sitofp i64 %ld3 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  store float %cvt2, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
  store float %cvt3, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
  ret void
}

define void @sitofp_4i32_4f32() #0 {
; CHECK-LABEL: @sitofp_4i32_4f32(
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, <4 x i32>* bitcast ([8 x i32]* @src32 to <4 x i32>*), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = sitofp <4 x i32> [[TMP1]] to <4 x float>
; CHECK-NEXT:    store <4 x float> [[TMP2]], <4 x float>* bitcast ([8 x float]* @dst32 to <4 x float>*), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 0), align 8
  %ld1 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 1), align 8
  %ld2 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 2), align 8
  %ld3 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 3), align 8
  %cvt0 = sitofp i32 %ld0 to float
  %cvt1 = sitofp i32 %ld1 to float
  %cvt2 = sitofp i32 %ld2 to float
  %cvt3 = sitofp i32 %ld3 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  store float %cvt2, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
  store float %cvt3, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
  ret void
}

define void @sitofp_8i32_8f32() #0 {
; SSE-LABEL: @sitofp_8i32_8f32(
; SSE-NEXT:    [[TMP1:%.*]] = load <4 x i32>, <4 x i32>* bitcast ([8 x i32]* @src32 to <4 x i32>*), align 8
; SSE-NEXT:    [[TMP2:%.*]] = load <4 x i32>, <4 x i32>* bitcast (i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 4) to <4 x i32>*), align 8
; SSE-NEXT:    [[TMP3:%.*]] = sitofp <4 x i32> [[TMP1]] to <4 x float>
; SSE-NEXT:    [[TMP4:%.*]] = sitofp <4 x i32> [[TMP2]] to <4 x float>
; SSE-NEXT:    store <4 x float> [[TMP3]], <4 x float>* bitcast ([8 x float]* @dst32 to <4 x float>*), align 8
; SSE-NEXT:    store <4 x float> [[TMP4]], <4 x float>* bitcast (float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 4) to <4 x float>*), align 8
; SSE-NEXT:    ret void
;
; AVX-LABEL: @sitofp_8i32_8f32(
; AVX-NEXT:    [[TMP1:%.*]] = load <8 x i32>, <8 x i32>* bitcast ([8 x i32]* @src32 to <8 x i32>*), align 8
; AVX-NEXT:    [[TMP2:%.*]] = sitofp <8 x i32> [[TMP1]] to <8 x float>
; AVX-NEXT:    store <8 x float> [[TMP2]], <8 x float>* bitcast ([8 x float]* @dst32 to <8 x float>*), align 8
; AVX-NEXT:    ret void
;
  %ld0 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 0), align 8
  %ld1 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 1), align 8
  %ld2 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 2), align 8
  %ld3 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 3), align 8
  %ld4 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 4), align 8
  %ld5 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 5), align 8
  %ld6 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 6), align 8
  %ld7 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @src32, i32 0, i64 7), align 8
  %cvt0 = sitofp i32 %ld0 to float
  %cvt1 = sitofp i32 %ld1 to float
  %cvt2 = sitofp i32 %ld2 to float
  %cvt3 = sitofp i32 %ld3 to float
  %cvt4 = sitofp i32 %ld4 to float
  %cvt5 = sitofp i32 %ld5 to float
  %cvt6 = sitofp i32 %ld6 to float
  %cvt7 = sitofp i32 %ld7 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  store float %cvt2, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
  store float %cvt3, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
  store float %cvt4, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 4), align 8
  store float %cvt5, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 5), align 8
  store float %cvt6, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 6), align 8
  store float %cvt7, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 7), align 8
  ret void
}

define void @sitofp_4i16_4f32() #0 {
; CHECK-LABEL: @sitofp_4i16_4f32(
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i16>, <4 x i16>* bitcast ([16 x i16]* @src16 to <4 x i16>*), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = sitofp <4 x i16> [[TMP1]] to <4 x float>
; CHECK-NEXT:    store <4 x float> [[TMP2]], <4 x float>* bitcast ([8 x float]* @dst32 to <4 x float>*), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 0), align 8
  %ld1 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 1), align 8
  %ld2 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 2), align 8
  %ld3 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 3), align 8
  %cvt0 = sitofp i16 %ld0 to float
  %cvt1 = sitofp i16 %ld1 to float
  %cvt2 = sitofp i16 %ld2 to float
  %cvt3 = sitofp i16 %ld3 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  store float %cvt2, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
  store float %cvt3, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
  ret void
}

define void @sitofp_8i16_8f32() #0 {
; SSE-LABEL: @sitofp_8i16_8f32(
; SSE-NEXT:    [[TMP1:%.*]] = load <4 x i16>, <4 x i16>* bitcast ([16 x i16]* @src16 to <4 x i16>*), align 8
; SSE-NEXT:    [[TMP2:%.*]] = load <4 x i16>, <4 x i16>* bitcast (i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 4) to <4 x i16>*), align 8
; SSE-NEXT:    [[TMP3:%.*]] = sitofp <4 x i16> [[TMP1]] to <4 x float>
; SSE-NEXT:    [[TMP4:%.*]] = sitofp <4 x i16> [[TMP2]] to <4 x float>
; SSE-NEXT:    store <4 x float> [[TMP3]], <4 x float>* bitcast ([8 x float]* @dst32 to <4 x float>*), align 8
; SSE-NEXT:    store <4 x float> [[TMP4]], <4 x float>* bitcast (float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 4) to <4 x float>*), align 8
; SSE-NEXT:    ret void
;
; AVX-LABEL: @sitofp_8i16_8f32(
; AVX-NEXT:    [[TMP1:%.*]] = load <8 x i16>, <8 x i16>* bitcast ([16 x i16]* @src16 to <8 x i16>*), align 8
; AVX-NEXT:    [[TMP2:%.*]] = sitofp <8 x i16> [[TMP1]] to <8 x float>
; AVX-NEXT:    store <8 x float> [[TMP2]], <8 x float>* bitcast ([8 x float]* @dst32 to <8 x float>*), align 8
; AVX-NEXT:    ret void
;
  %ld0 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 0), align 8
  %ld1 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 1), align 8
  %ld2 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 2), align 8
  %ld3 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 3), align 8
  %ld4 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 4), align 8
  %ld5 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 5), align 8
  %ld6 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 6), align 8
  %ld7 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @src16, i32 0, i64 7), align 8
  %cvt0 = sitofp i16 %ld0 to float
  %cvt1 = sitofp i16 %ld1 to float
  %cvt2 = sitofp i16 %ld2 to float
  %cvt3 = sitofp i16 %ld3 to float
  %cvt4 = sitofp i16 %ld4 to float
  %cvt5 = sitofp i16 %ld5 to float
  %cvt6 = sitofp i16 %ld6 to float
  %cvt7 = sitofp i16 %ld7 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  store float %cvt2, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
  store float %cvt3, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
  store float %cvt4, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 4), align 8
  store float %cvt5, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 5), align 8
  store float %cvt6, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 6), align 8
  store float %cvt7, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 7), align 8
  ret void
}

define void @sitofp_4i8_4f32() #0 {
; CHECK-LABEL: @sitofp_4i8_4f32(
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i8>, <4 x i8>* bitcast ([32 x i8]* @src8 to <4 x i8>*), align 8
; CHECK-NEXT:    [[TMP2:%.*]] = sitofp <4 x i8> [[TMP1]] to <4 x float>
; CHECK-NEXT:    store <4 x float> [[TMP2]], <4 x float>* bitcast ([8 x float]* @dst32 to <4 x float>*), align 8
; CHECK-NEXT:    ret void
;
  %ld0 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 0), align 8
  %ld1 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 1), align 8
  %ld2 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 2), align 8
  %ld3 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 3), align 8
  %cvt0 = sitofp i8 %ld0 to float
  %cvt1 = sitofp i8 %ld1 to float
  %cvt2 = sitofp i8 %ld2 to float
  %cvt3 = sitofp i8 %ld3 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  store float %cvt2, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
  store float %cvt3, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
  ret void
}

define void @sitofp_8i8_8f32() #0 {
; SSE-LABEL: @sitofp_8i8_8f32(
; SSE-NEXT:    [[TMP1:%.*]] = load <4 x i8>, <4 x i8>* bitcast ([32 x i8]* @src8 to <4 x i8>*), align 8
; SSE-NEXT:    [[TMP2:%.*]] = load <4 x i8>, <4 x i8>* bitcast (i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 4) to <4 x i8>*), align 8
; SSE-NEXT:    [[TMP3:%.*]] = sitofp <4 x i8> [[TMP1]] to <4 x float>
; SSE-NEXT:    [[TMP4:%.*]] = sitofp <4 x i8> [[TMP2]] to <4 x float>
; SSE-NEXT:    store <4 x float> [[TMP3]], <4 x float>* bitcast ([8 x float]* @dst32 to <4 x float>*), align 8
; SSE-NEXT:    store <4 x float> [[TMP4]], <4 x float>* bitcast (float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 4) to <4 x float>*), align 8
; SSE-NEXT:    ret void
;
; AVX-LABEL: @sitofp_8i8_8f32(
; AVX-NEXT:    [[TMP1:%.*]] = load <8 x i8>, <8 x i8>* bitcast ([32 x i8]* @src8 to <8 x i8>*), align 8
; AVX-NEXT:    [[TMP2:%.*]] = sitofp <8 x i8> [[TMP1]] to <8 x float>
; AVX-NEXT:    store <8 x float> [[TMP2]], <8 x float>* bitcast ([8 x float]* @dst32 to <8 x float>*), align 8
; AVX-NEXT:    ret void
;
  %ld0 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 0), align 8
  %ld1 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 1), align 8
  %ld2 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 2), align 8
  %ld3 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 3), align 8
  %ld4 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 4), align 8
  %ld5 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 5), align 8
  %ld6 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 6), align 8
  %ld7 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @src8, i32 0, i64 7), align 8
  %cvt0 = sitofp i8 %ld0 to float
  %cvt1 = sitofp i8 %ld1 to float
  %cvt2 = sitofp i8 %ld2 to float
  %cvt3 = sitofp i8 %ld3 to float
  %cvt4 = sitofp i8 %ld4 to float
  %cvt5 = sitofp i8 %ld5 to float
  %cvt6 = sitofp i8 %ld6 to float
  %cvt7 = sitofp i8 %ld7 to float
  store float %cvt0, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 0), align 8
  store float %cvt1, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 1), align 8
  store float %cvt2, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 2), align 8
  store float %cvt3, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 3), align 8
  store float %cvt4, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 4), align 8
  store float %cvt5, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 5), align 8
  store float %cvt6, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 6), align 8
  store float %cvt7, float* getelementptr inbounds ([8 x float], [8 x float]* @dst32, i32 0, i64 7), align 8
  ret void
}

attributes #0 = { nounwind }
