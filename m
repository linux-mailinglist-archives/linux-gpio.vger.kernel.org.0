Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45B55EA620
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 14:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239534AbiIZMa4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 08:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239544AbiIZMaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 08:30:21 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E86DC7
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:09:41 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d24so5917279pls.4
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=soDZB83rgaPQbou8FEqRgdIJsK37GDQRLU3LyNYl0PQ=;
        b=b91SJK6Pmx8t6Mp8Fz3xsyQgPoui+9ZHCZi6mg0JZctLBBVgbX8myFT0zXuF44PGiv
         xgS0d4+IxMNnIaU7osKbfC9ZjSwsuQDP8Vn7nifb+xQyFF8+XwlVYjCTiqrCR789I5Gw
         dHUVEvjUw8l8qpwwkf+vTBhSB3JOr6Zu/09pmBmT0QUsVeOJGqkKedJEzhGLjn5IIDDw
         8h/yBO9WGnXc5SgHjU+P+sJGwkWz2CDCCuI17D3Q7s5BPjcV1oTY8yxjT4VOJdlD7kMd
         JsUVKM7rc93pnj0B4GTT8CT+bfM+zrX9NvGziAJgIQKQM6cC7diDmRwBd5ujMYXdQmmz
         FP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=soDZB83rgaPQbou8FEqRgdIJsK37GDQRLU3LyNYl0PQ=;
        b=Nv8tUerUvxf4aLhsz0avEh63uZMYMB6FHTRPpo9qCadRGmbVz8acRkaR/HObuG2JFX
         CkdGx4QEJy5O6IzpARMhiFw8v71GThJnRy7L8Dhi6l4SsfKd8osJRkRJZhc6FozeLYEN
         5/y5tjeii3rWl9bQ7d5hyTPd2ZGqx/9L57qXmHQOG9DmqADi8wuEeZlhX9NURGSh3G+p
         ewEQ10TlhjTvrNTFx68+fBmypSDA9Xkm/uI5SM9+yMy7uZwUm9IXhclLvK9Fhh7nA5x6
         U5Zhm0AHxN1k90bFZcVv/cFRbFTMBgbPuHRNbLypTU+9eT8IFRWfk1BHD/WmwqfVJYlI
         YmBg==
X-Gm-Message-State: ACrzQf1m325/sqORI0b4CBIqvVBZ88iwTK4SXDJB8Ee9BYIZZt0dxcAs
        bfocVE7JYr5+C5QtJGkTs247kA==
X-Google-Smtp-Source: AMsMyM5qYVXANzQTL792hUKbOfY6LwqPc84IfcabIuVBvXhMwOXOsArBKFXZu+ccGaPMrM0QQqB+KQ==
X-Received: by 2002:a17:902:b7c3:b0:176:b7e6:ae6c with SMTP id v3-20020a170902b7c300b00176b7e6ae6cmr21662999plz.163.1664190511924;
        Mon, 26 Sep 2022 04:08:31 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902d48500b0017684444f57sm11073008plg.224.2022.09.26.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:08:31 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V6 2/8] libgpiod-sys: Add pre generated rust bindings
Date:   Mon, 26 Sep 2022 16:38:14 +0530
Message-Id: <691d1482818ff0d0510ff0bc28744b0e1dde2659.1664189248.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1664189248.git.viresh.kumar@linaro.org>
References: <cover.1664189248.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a copy of pre generated bindings and adds the suggested way of
updating those in README.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/libgpiod-sys/README.md       |   11 +
 bindings/rust/libgpiod-sys/src/bindings.rs | 1173 ++++++++++++++++++++
 2 files changed, 1184 insertions(+)
 create mode 100644 bindings/rust/libgpiod-sys/README.md
 create mode 100644 bindings/rust/libgpiod-sys/src/bindings.rs

diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
new file mode 100644
index 000000000000..ecf75b31c41e
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -0,0 +1,11 @@
+# Generated libgpiod-sys Rust FFI bindings
+Automatically generated Rust FFI bindings via
+	[bindgen](https://github.com/rust-lang/rust-bindgen).
+
+## Updating bindings
+1. Clone the source from
+	<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
+2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
+2. run `cargo build --features generate`
+3. Copy the bindings 'cp ../target/debug/build/libgpiod-sys-###/out/bindings.rs src/bindings.rs'
+4. Commit changes in `src/bindings.rs`
diff --git a/bindings/rust/libgpiod-sys/src/bindings.rs b/bindings/rust/libgpiod-sys/src/bindings.rs
new file mode 100644
index 000000000000..fc2ffa02c3c4
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/bindings.rs
@@ -0,0 +1,1173 @@
+/* automatically generated by rust-bindgen 0.59.2 */
+
+pub const true_: u32 = 1;
+pub const false_: u32 = 0;
+pub const __bool_true_false_are_defined: u32 = 1;
+pub const _STDINT_H: u32 = 1;
+pub const _FEATURES_H: u32 = 1;
+pub const _DEFAULT_SOURCE: u32 = 1;
+pub const __GLIBC_USE_ISOC2X: u32 = 0;
+pub const __USE_ISOC11: u32 = 1;
+pub const __USE_ISOC99: u32 = 1;
+pub const __USE_ISOC95: u32 = 1;
+pub const __USE_POSIX_IMPLICITLY: u32 = 1;
+pub const _POSIX_SOURCE: u32 = 1;
+pub const _POSIX_C_SOURCE: u32 = 200809;
+pub const __USE_POSIX: u32 = 1;
+pub const __USE_POSIX2: u32 = 1;
+pub const __USE_POSIX199309: u32 = 1;
+pub const __USE_POSIX199506: u32 = 1;
+pub const __USE_XOPEN2K: u32 = 1;
+pub const __USE_XOPEN2K8: u32 = 1;
+pub const _ATFILE_SOURCE: u32 = 1;
+pub const __USE_MISC: u32 = 1;
+pub const __USE_ATFILE: u32 = 1;
+pub const __USE_FORTIFY_LEVEL: u32 = 0;
+pub const __GLIBC_USE_DEPRECATED_GETS: u32 = 0;
+pub const __GLIBC_USE_DEPRECATED_SCANF: u32 = 0;
+pub const _STDC_PREDEF_H: u32 = 1;
+pub const __STDC_IEC_559__: u32 = 1;
+pub const __STDC_IEC_559_COMPLEX__: u32 = 1;
+pub const __STDC_ISO_10646__: u32 = 201706;
+pub const __GNU_LIBRARY__: u32 = 6;
+pub const __GLIBC__: u32 = 2;
+pub const __GLIBC_MINOR__: u32 = 31;
+pub const _SYS_CDEFS_H: u32 = 1;
+pub const __glibc_c99_flexarr_available: u32 = 1;
+pub const __WORDSIZE: u32 = 64;
+pub const __WORDSIZE_TIME64_COMPAT32: u32 = 1;
+pub const __SYSCALL_WORDSIZE: u32 = 64;
+pub const __LONG_DOUBLE_USES_FLOAT128: u32 = 0;
+pub const __HAVE_GENERIC_SELECTION: u32 = 1;
+pub const __GLIBC_USE_LIB_EXT2: u32 = 0;
+pub const __GLIBC_USE_IEC_60559_BFP_EXT: u32 = 0;
+pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X: u32 = 0;
+pub const __GLIBC_USE_IEC_60559_FUNCS_EXT: u32 = 0;
+pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X: u32 = 0;
+pub const __GLIBC_USE_IEC_60559_TYPES_EXT: u32 = 0;
+pub const _BITS_TYPES_H: u32 = 1;
+pub const __TIMESIZE: u32 = 64;
+pub const _BITS_TYPESIZES_H: u32 = 1;
+pub const __OFF_T_MATCHES_OFF64_T: u32 = 1;
+pub const __INO_T_MATCHES_INO64_T: u32 = 1;
+pub const __RLIM_T_MATCHES_RLIM64_T: u32 = 1;
+pub const __STATFS_MATCHES_STATFS64: u32 = 1;
+pub const __FD_SETSIZE: u32 = 1024;
+pub const _BITS_TIME64_H: u32 = 1;
+pub const _BITS_WCHAR_H: u32 = 1;
+pub const _BITS_STDINT_INTN_H: u32 = 1;
+pub const _BITS_STDINT_UINTN_H: u32 = 1;
+pub const INT8_MIN: i32 = -128;
+pub const INT16_MIN: i32 = -32768;
+pub const INT32_MIN: i32 = -2147483648;
+pub const INT8_MAX: u32 = 127;
+pub const INT16_MAX: u32 = 32767;
+pub const INT32_MAX: u32 = 2147483647;
+pub const UINT8_MAX: u32 = 255;
+pub const UINT16_MAX: u32 = 65535;
+pub const UINT32_MAX: u32 = 4294967295;
+pub const INT_LEAST8_MIN: i32 = -128;
+pub const INT_LEAST16_MIN: i32 = -32768;
+pub const INT_LEAST32_MIN: i32 = -2147483648;
+pub const INT_LEAST8_MAX: u32 = 127;
+pub const INT_LEAST16_MAX: u32 = 32767;
+pub const INT_LEAST32_MAX: u32 = 2147483647;
+pub const UINT_LEAST8_MAX: u32 = 255;
+pub const UINT_LEAST16_MAX: u32 = 65535;
+pub const UINT_LEAST32_MAX: u32 = 4294967295;
+pub const INT_FAST8_MIN: i32 = -128;
+pub const INT_FAST16_MIN: i64 = -9223372036854775808;
+pub const INT_FAST32_MIN: i64 = -9223372036854775808;
+pub const INT_FAST8_MAX: u32 = 127;
+pub const INT_FAST16_MAX: u64 = 9223372036854775807;
+pub const INT_FAST32_MAX: u64 = 9223372036854775807;
+pub const UINT_FAST8_MAX: u32 = 255;
+pub const UINT_FAST16_MAX: i32 = -1;
+pub const UINT_FAST32_MAX: i32 = -1;
+pub const INTPTR_MIN: i64 = -9223372036854775808;
+pub const INTPTR_MAX: u64 = 9223372036854775807;
+pub const UINTPTR_MAX: i32 = -1;
+pub const PTRDIFF_MIN: i64 = -9223372036854775808;
+pub const PTRDIFF_MAX: u64 = 9223372036854775807;
+pub const SIG_ATOMIC_MIN: i32 = -2147483648;
+pub const SIG_ATOMIC_MAX: u32 = 2147483647;
+pub const SIZE_MAX: i32 = -1;
+pub const WINT_MIN: u32 = 0;
+pub const WINT_MAX: u32 = 4294967295;
+pub type size_t = ::std::os::raw::c_ulong;
+pub type wchar_t = ::std::os::raw::c_int;
+#[repr(C)]
+#[repr(align(16))]
+#[derive(Debug, Copy, Clone)]
+pub struct max_align_t {
+    pub __clang_max_align_nonce1: ::std::os::raw::c_longlong,
+    pub __bindgen_padding_0: u64,
+    pub __clang_max_align_nonce2: u128,
+}
+#[test]
+fn bindgen_test_layout_max_align_t() {
+    assert_eq!(
+        ::std::mem::size_of::<max_align_t>(),
+        32usize,
+        concat!("Size of: ", stringify!(max_align_t))
+    );
+    assert_eq!(
+        ::std::mem::align_of::<max_align_t>(),
+        16usize,
+        concat!("Alignment of ", stringify!(max_align_t))
+    );
+    assert_eq!(
+        unsafe {
+            &(*(::std::ptr::null::<max_align_t>())).__clang_max_align_nonce1 as *const _ as usize
+        },
+        0usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(max_align_t),
+            "::",
+            stringify!(__clang_max_align_nonce1)
+        )
+    );
+    assert_eq!(
+        unsafe {
+            &(*(::std::ptr::null::<max_align_t>())).__clang_max_align_nonce2 as *const _ as usize
+        },
+        16usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(max_align_t),
+            "::",
+            stringify!(__clang_max_align_nonce2)
+        )
+    );
+}
+pub type __u_char = ::std::os::raw::c_uchar;
+pub type __u_short = ::std::os::raw::c_ushort;
+pub type __u_int = ::std::os::raw::c_uint;
+pub type __u_long = ::std::os::raw::c_ulong;
+pub type __int8_t = ::std::os::raw::c_schar;
+pub type __uint8_t = ::std::os::raw::c_uchar;
+pub type __int16_t = ::std::os::raw::c_short;
+pub type __uint16_t = ::std::os::raw::c_ushort;
+pub type __int32_t = ::std::os::raw::c_int;
+pub type __uint32_t = ::std::os::raw::c_uint;
+pub type __int64_t = ::std::os::raw::c_long;
+pub type __uint64_t = ::std::os::raw::c_ulong;
+pub type __int_least8_t = __int8_t;
+pub type __uint_least8_t = __uint8_t;
+pub type __int_least16_t = __int16_t;
+pub type __uint_least16_t = __uint16_t;
+pub type __int_least32_t = __int32_t;
+pub type __uint_least32_t = __uint32_t;
+pub type __int_least64_t = __int64_t;
+pub type __uint_least64_t = __uint64_t;
+pub type __quad_t = ::std::os::raw::c_long;
+pub type __u_quad_t = ::std::os::raw::c_ulong;
+pub type __intmax_t = ::std::os::raw::c_long;
+pub type __uintmax_t = ::std::os::raw::c_ulong;
+pub type __dev_t = ::std::os::raw::c_ulong;
+pub type __uid_t = ::std::os::raw::c_uint;
+pub type __gid_t = ::std::os::raw::c_uint;
+pub type __ino_t = ::std::os::raw::c_ulong;
+pub type __ino64_t = ::std::os::raw::c_ulong;
+pub type __mode_t = ::std::os::raw::c_uint;
+pub type __nlink_t = ::std::os::raw::c_ulong;
+pub type __off_t = ::std::os::raw::c_long;
+pub type __off64_t = ::std::os::raw::c_long;
+pub type __pid_t = ::std::os::raw::c_int;
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct __fsid_t {
+    pub __val: [::std::os::raw::c_int; 2usize],
+}
+#[test]
+fn bindgen_test_layout___fsid_t() {
+    assert_eq!(
+        ::std::mem::size_of::<__fsid_t>(),
+        8usize,
+        concat!("Size of: ", stringify!(__fsid_t))
+    );
+    assert_eq!(
+        ::std::mem::align_of::<__fsid_t>(),
+        4usize,
+        concat!("Alignment of ", stringify!(__fsid_t))
+    );
+    assert_eq!(
+        unsafe { &(*(::std::ptr::null::<__fsid_t>())).__val as *const _ as usize },
+        0usize,
+        concat!(
+            "Offset of field: ",
+            stringify!(__fsid_t),
+            "::",
+            stringify!(__val)
+        )
+    );
+}
+pub type __clock_t = ::std::os::raw::c_long;
+pub type __rlim_t = ::std::os::raw::c_ulong;
+pub type __rlim64_t = ::std::os::raw::c_ulong;
+pub type __id_t = ::std::os::raw::c_uint;
+pub type __time_t = ::std::os::raw::c_long;
+pub type __useconds_t = ::std::os::raw::c_uint;
+pub type __suseconds_t = ::std::os::raw::c_long;
+pub type __daddr_t = ::std::os::raw::c_int;
+pub type __key_t = ::std::os::raw::c_int;
+pub type __clockid_t = ::std::os::raw::c_int;
+pub type __timer_t = *mut ::std::os::raw::c_void;
+pub type __blksize_t = ::std::os::raw::c_long;
+pub type __blkcnt_t = ::std::os::raw::c_long;
+pub type __blkcnt64_t = ::std::os::raw::c_long;
+pub type __fsblkcnt_t = ::std::os::raw::c_ulong;
+pub type __fsblkcnt64_t = ::std::os::raw::c_ulong;
+pub type __fsfilcnt_t = ::std::os::raw::c_ulong;
+pub type __fsfilcnt64_t = ::std::os::raw::c_ulong;
+pub type __fsword_t = ::std::os::raw::c_long;
+pub type __ssize_t = ::std::os::raw::c_long;
+pub type __syscall_slong_t = ::std::os::raw::c_long;
+pub type __syscall_ulong_t = ::std::os::raw::c_ulong;
+pub type __loff_t = __off64_t;
+pub type __caddr_t = *mut ::std::os::raw::c_char;
+pub type __intptr_t = ::std::os::raw::c_long;
+pub type __socklen_t = ::std::os::raw::c_uint;
+pub type __sig_atomic_t = ::std::os::raw::c_int;
+pub type int_least8_t = __int_least8_t;
+pub type int_least16_t = __int_least16_t;
+pub type int_least32_t = __int_least32_t;
+pub type int_least64_t = __int_least64_t;
+pub type uint_least8_t = __uint_least8_t;
+pub type uint_least16_t = __uint_least16_t;
+pub type uint_least32_t = __uint_least32_t;
+pub type uint_least64_t = __uint_least64_t;
+pub type int_fast8_t = ::std::os::raw::c_schar;
+pub type int_fast16_t = ::std::os::raw::c_long;
+pub type int_fast32_t = ::std::os::raw::c_long;
+pub type int_fast64_t = ::std::os::raw::c_long;
+pub type uint_fast8_t = ::std::os::raw::c_uchar;
+pub type uint_fast16_t = ::std::os::raw::c_ulong;
+pub type uint_fast32_t = ::std::os::raw::c_ulong;
+pub type uint_fast64_t = ::std::os::raw::c_ulong;
+pub type intmax_t = __intmax_t;
+pub type uintmax_t = __uintmax_t;
+#[doc = " @mainpage libgpiod public API"]
+#[doc = ""]
+#[doc = " This is the complete documentation of the public API made available to"]
+#[doc = " users of libgpiod."]
+#[doc = ""]
+#[doc = " <p>The API is logically split into several parts such as: GPIO chip & line"]
+#[doc = " operators, GPIO events handling etc."]
+#[doc = ""]
+#[doc = " <p>General note on error handling: all functions exported by libgpiod that"]
+#[doc = " can fail, set errno to one of the error values defined in errno.h upon"]
+#[doc = " failure. The way of notifying the caller that an error occurred varies"]
+#[doc = " between functions, but in general a function that returns an int, returns -1"]
+#[doc = " on error, while a function returning a pointer indicates an error condition"]
+#[doc = " by returning a NULL pointer. It's not practical to list all possible error"]
+#[doc = " codes for every function as they propagate errors from the underlying libc"]
+#[doc = " functions."]
+#[doc = ""]
+#[doc = " <p>In general libgpiod functions are not NULL-aware and it's expected that"]
+#[doc = " users pass valid pointers to objects as arguments. An exception to this rule"]
+#[doc = " are the functions that free/close/release resources - which work when passed"]
+#[doc = " a NULL-pointer as argument. Other exceptions are documented."]
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_chip {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_chip_info {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line_info {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line_settings {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line_config {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_request_config {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_line_request {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_info_event {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_edge_event {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiod_edge_event_buffer {
+    _unused: [u8; 0],
+}
+extern "C" {
+    #[doc = " @brief Open a chip by path."]
+    #[doc = " @param path Path to the gpiochip device file."]
+    #[doc = " @return GPIO chip request or NULL if an error occurred."]
+    pub fn gpiod_chip_open(path: *const ::std::os::raw::c_char) -> *mut gpiod_chip;
+}
+extern "C" {
+    #[doc = " @brief Close the chip and release all associated resources."]
+    #[doc = " @param chip Chip to close."]
+    pub fn gpiod_chip_close(chip: *mut gpiod_chip);
+}
+extern "C" {
+    #[doc = " @brief Get information about the chip."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @return New GPIO chip info object or NULL if an error occurred. The returned"]
+    #[doc = "         object must be freed by the caller using ::gpiod_chip_info_free."]
+    pub fn gpiod_chip_get_info(chip: *mut gpiod_chip) -> *mut gpiod_chip_info;
+}
+extern "C" {
+    #[doc = " @brief Get the path used to open the chip."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @return Path to the file passed as argument to ::gpiod_chip_open."]
+    pub fn gpiod_chip_get_path(chip: *mut gpiod_chip) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    #[doc = " @brief Get a snapshot of information about a line."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @param offset The offset of the GPIO line."]
+    #[doc = " @return New GPIO line info object or NULL if an error occurred. The returned"]
+    #[doc = "\t   object must be freed by the caller using ::gpiod_line_info_free."]
+    pub fn gpiod_chip_get_line_info(
+        chip: *mut gpiod_chip,
+        offset: ::std::os::raw::c_uint,
+    ) -> *mut gpiod_line_info;
+}
+extern "C" {
+    #[doc = " @brief Get a snapshot of the status of a line and start watching it for"]
+    #[doc = "\t  future changes."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @param offset The offset of the GPIO line."]
+    #[doc = " @return New GPIO line info object or NULL if an error occurred. The returned"]
+    #[doc = "\t   object must be freed by the caller using ::gpiod_line_info_free."]
+    #[doc = " @note Line status does not include the line value.  To monitor the line"]
+    #[doc = "\t value the line must be requested as an input with edge detection set."]
+    pub fn gpiod_chip_watch_line_info(
+        chip: *mut gpiod_chip,
+        offset: ::std::os::raw::c_uint,
+    ) -> *mut gpiod_line_info;
+}
+extern "C" {
+    #[doc = " @brief Stop watching a line for status changes."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @param offset The offset of the line to stop watching."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_chip_unwatch_line_info(
+        chip: *mut gpiod_chip,
+        offset: ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the file descriptor associated with the chip."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @return File descriptor number for the chip."]
+    #[doc = "\t   This function never fails."]
+    #[doc = "\t   The returned file descriptor must not be closed by the caller."]
+    #[doc = "\t   Call ::gpiod_chip_close to close the file descriptor."]
+    pub fn gpiod_chip_get_fd(chip: *mut gpiod_chip) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Wait for line status change events on any of the watched lines"]
+    #[doc = "\t  on the chip."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @param timeout_ns Wait time limit in nanoseconds. If set to 0, the function"]
+    #[doc = "\t\t     returns immediatelly. If set to a negative number, the"]
+    #[doc = "\t\t     function blocks indefinitely until an event becomes"]
+    #[doc = "\t\t     available."]
+    #[doc = " @return 0 if wait timed out, -1 if an error occurred, 1 if an event is"]
+    #[doc = "\t   pending."]
+    pub fn gpiod_chip_wait_info_event(
+        chip: *mut gpiod_chip,
+        timeout_ns: i64,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Read a single line status change event from the chip."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @return Newly read watch event object or NULL on error. The event must be"]
+    #[doc = "\t   freed by the caller using ::gpiod_info_event_free."]
+    #[doc = " @note If no events are pending, this function will block."]
+    pub fn gpiod_chip_read_info_event(chip: *mut gpiod_chip) -> *mut gpiod_info_event;
+}
+extern "C" {
+    #[doc = " @brief Map a line's name to its offset within the chip."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @param name Name of the GPIO line to map."]
+    #[doc = " @return Offset of the line within the chip or -1 on error."]
+    #[doc = " @note If a line with given name is not exposed by the chip, the function"]
+    #[doc = "       sets errno to ENOENT."]
+    pub fn gpiod_chip_get_line_offset_from_name(
+        chip: *mut gpiod_chip,
+        name: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Request a set of lines for exclusive usage."]
+    #[doc = " @param chip GPIO chip object."]
+    #[doc = " @param req_cfg Request config object. Can be NULL for default settings."]
+    #[doc = " @param line_cfg Line config object."]
+    #[doc = " @return New line request object or NULL if an error occurred. The request"]
+    #[doc = "\t   must be released by the caller using ::gpiod_line_request_release."]
+    pub fn gpiod_chip_request_lines(
+        chip: *mut gpiod_chip,
+        req_cfg: *mut gpiod_request_config,
+        line_cfg: *mut gpiod_line_config,
+    ) -> *mut gpiod_line_request;
+}
+extern "C" {
+    #[doc = " @brief Free a chip info object and release all associated resources."]
+    #[doc = " @param info GPIO chip info object to free."]
+    pub fn gpiod_chip_info_free(info: *mut gpiod_chip_info);
+}
+extern "C" {
+    #[doc = " @brief Get the name of the chip as represented in the kernel."]
+    #[doc = " @param info GPIO chip info object."]
+    #[doc = " @return Pointer to a human-readable string containing the chip name."]
+    pub fn gpiod_chip_info_get_name(info: *mut gpiod_chip_info) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    #[doc = " @brief Get the label of the chip as represented in the kernel."]
+    #[doc = " @param info GPIO chip info object."]
+    #[doc = " @return Pointer to a human-readable string containing the chip label."]
+    pub fn gpiod_chip_info_get_label(info: *mut gpiod_chip_info) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    #[doc = " @brief Get the number of lines exposed by the chip."]
+    #[doc = " @param info GPIO chip info object."]
+    #[doc = " @return Number of GPIO lines."]
+    pub fn gpiod_chip_info_get_num_lines(info: *mut gpiod_chip_info) -> size_t;
+}
+pub const GPIOD_LINE_VALUE_INACTIVE: ::std::os::raw::c_uint = 0;
+pub const GPIOD_LINE_VALUE_ACTIVE: ::std::os::raw::c_uint = 1;
+#[doc = " @brief Logical line state."]
+pub type _bindgen_ty_1 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_DIRECTION_AS_IS: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_DIRECTION_INPUT: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_DIRECTION_OUTPUT: ::std::os::raw::c_uint = 3;
+#[doc = " @brief Direction settings."]
+pub type _bindgen_ty_2 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_EDGE_NONE: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_EDGE_RISING: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_EDGE_FALLING: ::std::os::raw::c_uint = 3;
+pub const GPIOD_LINE_EDGE_BOTH: ::std::os::raw::c_uint = 4;
+#[doc = " @brief Edge detection settings."]
+pub type _bindgen_ty_3 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_BIAS_AS_IS: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_BIAS_UNKNOWN: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_BIAS_DISABLED: ::std::os::raw::c_uint = 3;
+pub const GPIOD_LINE_BIAS_PULL_UP: ::std::os::raw::c_uint = 4;
+pub const GPIOD_LINE_BIAS_PULL_DOWN: ::std::os::raw::c_uint = 5;
+#[doc = " @brief Internal bias settings."]
+pub type _bindgen_ty_4 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_DRIVE_PUSH_PULL: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_DRIVE_OPEN_DRAIN: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_DRIVE_OPEN_SOURCE: ::std::os::raw::c_uint = 3;
+#[doc = " @brief Drive settings."]
+pub type _bindgen_ty_5 = ::std::os::raw::c_uint;
+pub const GPIOD_LINE_EVENT_CLOCK_MONOTONIC: ::std::os::raw::c_uint = 1;
+pub const GPIOD_LINE_EVENT_CLOCK_REALTIME: ::std::os::raw::c_uint = 2;
+pub const GPIOD_LINE_EVENT_CLOCK_HTE: ::std::os::raw::c_uint = 3;
+#[doc = " @brief Event clock settings."]
+pub type _bindgen_ty_6 = ::std::os::raw::c_uint;
+extern "C" {
+    #[doc = " @brief Free a line info object and release all associated resources."]
+    #[doc = " @param info GPIO line info object to free."]
+    pub fn gpiod_line_info_free(info: *mut gpiod_line_info);
+}
+extern "C" {
+    #[doc = " @brief Copy a line info object."]
+    #[doc = " @param info Line info to copy."]
+    #[doc = " @return Copy of the line info or NULL on error. The returned object must"]
+    #[doc = "\t   be freed by the caller using :gpiod_line_info_free."]
+    pub fn gpiod_line_info_copy(info: *mut gpiod_line_info) -> *mut gpiod_line_info;
+}
+extern "C" {
+    #[doc = " @brief Get the offset of the line."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Offset of the line within the parent chip."]
+    #[doc = ""]
+    #[doc = " The offset uniquely identifies the line on the chip."]
+    #[doc = " The combination of the chip and offset uniquely identifies the line within"]
+    #[doc = " the system."]
+    pub fn gpiod_line_info_get_offset(info: *mut gpiod_line_info) -> ::std::os::raw::c_uint;
+}
+extern "C" {
+    #[doc = " @brief Get the name of the line."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Name of the GPIO line as it is represented in the kernel."]
+    #[doc = "\t   This function returns a pointer to a null-terminated string"]
+    #[doc = "\t   or NULL if the line is unnamed."]
+    pub fn gpiod_line_info_get_name(info: *mut gpiod_line_info) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    #[doc = " @brief Check if the line is in use."]
+    #[doc = " @param info GPIO line object."]
+    #[doc = " @return True if the line is in use, false otherwise."]
+    #[doc = ""]
+    #[doc = " The exact reason a line is busy cannot be determined from user space."]
+    #[doc = " It may have been requested by another process or hogged by the kernel."]
+    #[doc = " It only matters that the line is used and can't be requested until"]
+    #[doc = " released by the existing consumer."]
+    pub fn gpiod_line_info_is_used(info: *mut gpiod_line_info) -> bool;
+}
+extern "C" {
+    #[doc = " @brief Get the name of the consumer of the line."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Name of the GPIO consumer as it is represented in the kernel."]
+    #[doc = "\t   This function returns a pointer to a null-terminated string"]
+    #[doc = "\t   or NULL if the consumer name is not set."]
+    pub fn gpiod_line_info_get_consumer(
+        info: *mut gpiod_line_info,
+    ) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    #[doc = " @brief Get the direction setting of the line."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Returns ::GPIOD_LINE_DIRECTION_INPUT or"]
+    #[doc = "\t   ::GPIOD_LINE_DIRECTION_OUTPUT."]
+    pub fn gpiod_line_info_get_direction(info: *mut gpiod_line_info) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the edge detection setting of the line."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Returns ::GPIOD_LINE_EDGE_NONE, ::GPIOD_LINE_EDGE_RISING,"]
+    #[doc = "\t   ::GPIOD_LINE_EDGE_FALLING or ::GPIOD_LINE_EDGE_BOTH."]
+    pub fn gpiod_line_info_get_edge_detection(info: *mut gpiod_line_info) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the bias setting of the line."]
+    #[doc = " @param info GPIO line object."]
+    #[doc = " @return Returns ::GPIOD_LINE_BIAS_PULL_UP, ::GPIOD_LINE_BIAS_PULL_DOWN,"]
+    #[doc = "\t   ::GPIOD_LINE_BIAS_DISABLED or ::GPIOD_LINE_BIAS_UNKNOWN."]
+    pub fn gpiod_line_info_get_bias(info: *mut gpiod_line_info) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the drive setting of the line."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Returns ::GPIOD_LINE_DRIVE_PUSH_PULL, ::GPIOD_LINE_DRIVE_OPEN_DRAIN"]
+    #[doc = "\t   or ::GPIOD_LINE_DRIVE_OPEN_SOURCE."]
+    pub fn gpiod_line_info_get_drive(info: *mut gpiod_line_info) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Check if the logical value of the line is inverted compared to the"]
+    #[doc = "\t  physical."]
+    #[doc = " @param info GPIO line object."]
+    #[doc = " @return True if the line is \"active-low\", false otherwise."]
+    pub fn gpiod_line_info_is_active_low(info: *mut gpiod_line_info) -> bool;
+}
+extern "C" {
+    #[doc = " @brief Check if the line is debounced (either by hardware or by the kernel"]
+    #[doc = "\t  software debouncer)."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return True if the line is debounced, false otherwise."]
+    pub fn gpiod_line_info_is_debounced(info: *mut gpiod_line_info) -> bool;
+}
+extern "C" {
+    #[doc = " @brief Get the debounce period of the line, in microseconds."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Debounce period in microseconds."]
+    #[doc = "\t   0 if the line is not debounced."]
+    pub fn gpiod_line_info_get_debounce_period_us(
+        info: *mut gpiod_line_info,
+    ) -> ::std::os::raw::c_ulong;
+}
+extern "C" {
+    #[doc = " @brief Get the event clock setting used for edge event timestamps for the"]
+    #[doc = "\t  line."]
+    #[doc = " @param info GPIO line info object."]
+    #[doc = " @return Returns ::GPIOD_LINE_EVENT_CLOCK_MONOTONIC or"]
+    #[doc = "\t   ::GPIOD_LINE_EVENT_CLOCK_REALTIME."]
+    pub fn gpiod_line_info_get_event_clock(info: *mut gpiod_line_info) -> ::std::os::raw::c_int;
+}
+pub const GPIOD_INFO_EVENT_LINE_REQUESTED: ::std::os::raw::c_uint = 1;
+pub const GPIOD_INFO_EVENT_LINE_RELEASED: ::std::os::raw::c_uint = 2;
+pub const GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED: ::std::os::raw::c_uint = 3;
+#[doc = " @brief Line status change event types."]
+pub type _bindgen_ty_7 = ::std::os::raw::c_uint;
+extern "C" {
+    #[doc = " @brief Free the info event object and release all associated resources."]
+    #[doc = " @param event Info event to free."]
+    pub fn gpiod_info_event_free(event: *mut gpiod_info_event);
+}
+extern "C" {
+    #[doc = " @brief Get the event type of the status change event."]
+    #[doc = " @param event Line status watch event."]
+    #[doc = " @return One of ::GPIOD_INFO_EVENT_LINE_REQUESTED,"]
+    #[doc = "\t   ::GPIOD_INFO_EVENT_LINE_RELEASED or"]
+    #[doc = "\t   ::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED."]
+    pub fn gpiod_info_event_get_event_type(event: *mut gpiod_info_event) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the timestamp of the event."]
+    #[doc = " @param event Line status watch event."]
+    #[doc = " @return Timestamp in nanoseconds, read from the monotonic clock."]
+    pub fn gpiod_info_event_get_timestamp_ns(event: *mut gpiod_info_event) -> u64;
+}
+extern "C" {
+    #[doc = " @brief Get the snapshot of line-info associated with the event."]
+    #[doc = " @param event Line info event object."]
+    #[doc = " @return Returns a pointer to the line-info object associated with the event"]
+    #[doc = "\t   whose lifetime is tied to the event object. It must not be freed by"]
+    #[doc = "\t   the caller."]
+    pub fn gpiod_info_event_get_line_info(event: *mut gpiod_info_event) -> *mut gpiod_line_info;
+}
+extern "C" {
+    #[doc = " @brief Create a new line settings object."]
+    #[doc = " @return New line settings object or NULL on error."]
+    pub fn gpiod_line_settings_new() -> *mut gpiod_line_settings;
+}
+extern "C" {
+    #[doc = " @brief Free the line settings object and release all associated resources."]
+    #[doc = " @param settings Line settings object."]
+    pub fn gpiod_line_settings_free(settings: *mut gpiod_line_settings);
+}
+extern "C" {
+    #[doc = " @brief Reset the line settings object to its default values."]
+    #[doc = " @param settings Line settings object."]
+    pub fn gpiod_line_settings_reset(settings: *mut gpiod_line_settings);
+}
+extern "C" {
+    #[doc = " @brief Copy the line settings object."]
+    #[doc = " @param settings Line settings object to copy."]
+    #[doc = " @return New line settings object that must be freed using"]
+    #[doc = "         ::gpiod_line_settings_free or NULL on failure."]
+    pub fn gpiod_line_settings_copy(settings: *mut gpiod_line_settings)
+        -> *mut gpiod_line_settings;
+}
+extern "C" {
+    #[doc = " @brief Set direction."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param direction New direction."]
+    #[doc = " @return 0 on success, -1 on error."]
+    pub fn gpiod_line_settings_set_direction(
+        settings: *mut gpiod_line_settings,
+        direction: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get direction."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return Current direction."]
+    pub fn gpiod_line_settings_get_direction(
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set edge detection."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param edge New edge detection setting."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_settings_set_edge_detection(
+        settings: *mut gpiod_line_settings,
+        edge: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get edge detection."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return Current edge detection setting."]
+    pub fn gpiod_line_settings_get_edge_detection(
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set bias."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param bias New bias."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_settings_set_bias(
+        settings: *mut gpiod_line_settings,
+        bias: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get bias."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return Current bias setting."]
+    pub fn gpiod_line_settings_get_bias(
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set drive."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param drive New drive setting."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_settings_set_drive(
+        settings: *mut gpiod_line_settings,
+        drive: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get drive."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return Current drive setting."]
+    pub fn gpiod_line_settings_get_drive(
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set active-low setting."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param active_low New active-low setting."]
+    pub fn gpiod_line_settings_set_active_low(settings: *mut gpiod_line_settings, active_low: bool);
+}
+extern "C" {
+    #[doc = " @brief Get active-low setting."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return True if active-low is enabled, false otherwise."]
+    pub fn gpiod_line_settings_get_active_low(settings: *mut gpiod_line_settings) -> bool;
+}
+extern "C" {
+    #[doc = " @brief Set debounce period."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param period New debounce period in microseconds."]
+    pub fn gpiod_line_settings_set_debounce_period_us(
+        settings: *mut gpiod_line_settings,
+        period: ::std::os::raw::c_ulong,
+    );
+}
+extern "C" {
+    #[doc = " @brief Get debounce period."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return Current debounce period in microseconds."]
+    pub fn gpiod_line_settings_get_debounce_period_us(
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_ulong;
+}
+extern "C" {
+    #[doc = " @brief Set event clock."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param event_clock New event clock."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_settings_set_event_clock(
+        settings: *mut gpiod_line_settings,
+        event_clock: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get event clock setting."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return Current event clock setting."]
+    pub fn gpiod_line_settings_get_event_clock(
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set the output value."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @param value New output value."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_settings_set_output_value(
+        settings: *mut gpiod_line_settings,
+        value: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the output value."]
+    #[doc = " @param settings Line settings object."]
+    #[doc = " @return Current output value."]
+    pub fn gpiod_line_settings_get_output_value(
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Create a new line config object."]
+    #[doc = " @return New line config object or NULL on error."]
+    pub fn gpiod_line_config_new() -> *mut gpiod_line_config;
+}
+extern "C" {
+    #[doc = " @brief Free the line config object and release all associated resources."]
+    #[doc = " @param config Line config object to free."]
+    pub fn gpiod_line_config_free(config: *mut gpiod_line_config);
+}
+extern "C" {
+    #[doc = " @brief Reset the line config object."]
+    #[doc = " @param config Line config object to free."]
+    #[doc = ""]
+    #[doc = " Resets the entire configuration stored in the object. This is useful if"]
+    #[doc = " the user wants to reuse the object without reallocating it."]
+    pub fn gpiod_line_config_reset(config: *mut gpiod_line_config);
+}
+extern "C" {
+    #[doc = " @brief Add line settings for a set of offsets."]
+    #[doc = " @param config Line config object."]
+    #[doc = " @param offsets Array of offsets for which to apply the settings."]
+    #[doc = " @param num_offsets Number of offsets stored in the offsets array."]
+    #[doc = " @param settings Line settings to apply."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_config_add_line_settings(
+        config: *mut gpiod_line_config,
+        offsets: *const ::std::os::raw::c_uint,
+        num_offsets: size_t,
+        settings: *mut gpiod_line_settings,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get line settings for offset."]
+    #[doc = " @param config Line config object."]
+    #[doc = " @param offset Offset for which to get line settings."]
+    #[doc = " @return New line settings object (must be freed by the caller) or NULL on"]
+    #[doc = "         error."]
+    pub fn gpiod_line_config_get_line_settings(
+        config: *mut gpiod_line_config,
+        offset: ::std::os::raw::c_uint,
+    ) -> *mut gpiod_line_settings;
+}
+extern "C" {
+    #[doc = " @brief Get configured offsets."]
+    #[doc = " @param config Line config object."]
+    #[doc = " @param num_offsets Pointer to a variable in which the number of line offsets"]
+    #[doc = "                    will be stored."]
+    #[doc = " @param offsets Pointer to a pointer which will be set to point to an array"]
+    #[doc = "                containing the configured offsets. The array will be allocated"]
+    #[doc = "                using malloc() and must be freed using free()."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_config_get_offsets(
+        config: *mut gpiod_line_config,
+        num_offsets: *mut size_t,
+        offsets: *mut *mut ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Create a new request config object."]
+    #[doc = " @return New request config object or NULL on error."]
+    pub fn gpiod_request_config_new() -> *mut gpiod_request_config;
+}
+extern "C" {
+    #[doc = " @brief Free the request config object and release all associated resources."]
+    #[doc = " @param config Line config object."]
+    pub fn gpiod_request_config_free(config: *mut gpiod_request_config);
+}
+extern "C" {
+    #[doc = " @brief Set the consumer name for the request."]
+    #[doc = " @param config Request config object."]
+    #[doc = " @param consumer Consumer name."]
+    #[doc = " @note If the consumer string is too long, it will be truncated to the max"]
+    #[doc = "       accepted length."]
+    pub fn gpiod_request_config_set_consumer(
+        config: *mut gpiod_request_config,
+        consumer: *const ::std::os::raw::c_char,
+    );
+}
+extern "C" {
+    #[doc = " @brief Get the consumer name configured in the request config."]
+    #[doc = " @param config Request config object."]
+    #[doc = " @return Consumer name stored in the request config."]
+    pub fn gpiod_request_config_get_consumer(
+        config: *mut gpiod_request_config,
+    ) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    #[doc = " @brief Set the size of the kernel event buffer for the request."]
+    #[doc = " @param config Request config object."]
+    #[doc = " @param event_buffer_size New event buffer size."]
+    #[doc = " @note The kernel may adjust the value if it's too high. If set to 0, the"]
+    #[doc = "       default value will be used."]
+    #[doc = " @note The kernel buffer is distinct from and independent of the user space"]
+    #[doc = "\t buffer (::gpiod_edge_event_buffer_new)."]
+    pub fn gpiod_request_config_set_event_buffer_size(
+        config: *mut gpiod_request_config,
+        event_buffer_size: size_t,
+    );
+}
+extern "C" {
+    #[doc = " @brief Get the edge event buffer size for the request config."]
+    #[doc = " @param config Request config object."]
+    #[doc = " @return Edge event buffer size setting from the request config."]
+    pub fn gpiod_request_config_get_event_buffer_size(config: *mut gpiod_request_config) -> size_t;
+}
+extern "C" {
+    #[doc = " @brief Release the requested lines and free all associated resources."]
+    #[doc = " @param request Line request object to release."]
+    pub fn gpiod_line_request_release(request: *mut gpiod_line_request);
+}
+extern "C" {
+    #[doc = " @brief Get the number of lines in the request."]
+    #[doc = " @param request Line request object."]
+    #[doc = " @return Number of requested lines."]
+    pub fn gpiod_line_request_get_num_lines(request: *mut gpiod_line_request) -> size_t;
+}
+extern "C" {
+    #[doc = " @brief Get the offsets of the lines in the request."]
+    #[doc = " @param request Line request object."]
+    #[doc = " @param offsets Array to store offsets. Must be sized to hold the number of"]
+    #[doc = "\t\t  lines returned by ::gpiod_line_request_get_num_lines."]
+    pub fn gpiod_line_request_get_offsets(
+        request: *mut gpiod_line_request,
+        offsets: *mut ::std::os::raw::c_uint,
+    );
+}
+extern "C" {
+    #[doc = " @brief Get the value of a single requested line."]
+    #[doc = " @param request Line request object."]
+    #[doc = " @param offset The offset of the line of which the value should be read."]
+    #[doc = " @return Returns 1 or 0 on success and -1 on error."]
+    pub fn gpiod_line_request_get_value(
+        request: *mut gpiod_line_request,
+        offset: ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the values of a subset of requested lines."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @param num_values Number of lines for which to read values."]
+    #[doc = " @param offsets Array of offsets identifying the subset of requested lines"]
+    #[doc = "\t\t  from which to read values."]
+    #[doc = " @param values Array in which the values will be stored.  Must be sized"]
+    #[doc = "\t\t to hold \\p num_values entries.  Each value is associated with the"]
+    #[doc = "\t\t line identified by the corresponding entry in \\p offsets."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_request_get_values_subset(
+        request: *mut gpiod_line_request,
+        num_values: size_t,
+        offsets: *const ::std::os::raw::c_uint,
+        values: *mut ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the values of all requested lines."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @param values Array in which the values will be stored. Must be sized to"]
+    #[doc = "\t\t hold the number of lines returned by"]
+    #[doc = "\t\t ::gpiod_line_request_get_num_lines."]
+    #[doc = "\t\t Each value is associated with the line identified by the"]
+    #[doc = "\t\t corresponding entry in the offset array returned by"]
+    #[doc = "\t\t ::gpiod_line_request_get_offsets."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_request_get_values(
+        request: *mut gpiod_line_request,
+        values: *mut ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set the value of a single requested line."]
+    #[doc = " @param request Line request object."]
+    #[doc = " @param offset The offset of the line for which the value should be set."]
+    #[doc = " @param value Value to set."]
+    pub fn gpiod_line_request_set_value(
+        request: *mut gpiod_line_request,
+        offset: ::std::os::raw::c_uint,
+        value: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set the values of a subset of requested lines."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @param num_values Number of lines for which to set values."]
+    #[doc = " @param offsets Array of offsets, containing the number of entries specified"]
+    #[doc = "\t\t  by \\p num_values, identifying the requested lines for"]
+    #[doc = "\t\t  which to set values."]
+    #[doc = " @param values Array of values to set, containing the number of entries"]
+    #[doc = "\t\t specified by \\p num_values.  Each value is associated with the"]
+    #[doc = "\t\t line identified by the corresponding entry in \\p offsets."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    pub fn gpiod_line_request_set_values_subset(
+        request: *mut gpiod_line_request,
+        num_values: size_t,
+        offsets: *const ::std::os::raw::c_uint,
+        values: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Set the values of all lines associated with a request."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @param values Array containing the values to set. Must be sized to"]
+    #[doc = "\t\t contain the number of lines returned by"]
+    #[doc = "\t\t ::gpiod_line_request_get_num_lines."]
+    #[doc = "\t\t Each value is associated with the line identified by the"]
+    #[doc = "\t\t corresponding entry in the offset array returned by"]
+    #[doc = "\t\t ::gpiod_line_request_get_offsets."]
+    pub fn gpiod_line_request_set_values(
+        request: *mut gpiod_line_request,
+        values: *const ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Update the configuration of lines associated with a line request."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @param config New line config to apply."]
+    #[doc = " @return 0 on success, -1 on failure."]
+    #[doc = " @note The new line configuration completely replaces the old."]
+    #[doc = " @note Any requested lines without overrides are configured to the requested"]
+    #[doc = "\t defaults."]
+    #[doc = " @note Any configured overrides for lines that have not been requested"]
+    #[doc = "\t are silently ignored."]
+    pub fn gpiod_line_request_reconfigure_lines(
+        request: *mut gpiod_line_request,
+        config: *mut gpiod_line_config,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the file descriptor associated with a line request."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @return The file descriptor associated with the request."]
+    #[doc = "\t   This function never fails."]
+    #[doc = "\t   The returned file descriptor must not be closed by the caller."]
+    #[doc = "\t   Call ::gpiod_line_request_release to close the file."]
+    pub fn gpiod_line_request_get_fd(request: *mut gpiod_line_request) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Wait for edge events on any of the requested lines."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @param timeout_ns Wait time limit in nanoseconds. If set to 0, the function"]
+    #[doc = "\t\t     returns immediatelly. If set to a negative number, the"]
+    #[doc = "\t\t     function blocks indefinitely until an event becomes"]
+    #[doc = "\t\t     available."]
+    #[doc = " @return 0 if wait timed out, -1 if an error occurred, 1 if an event is"]
+    #[doc = "\t   pending."]
+    #[doc = "q"]
+    #[doc = " Lines must have edge detection set for edge events to be emitted."]
+    #[doc = " By default edge detection is disabled."]
+    pub fn gpiod_line_request_wait_edge_event(
+        request: *mut gpiod_line_request,
+        timeout_ns: i64,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Read a number of edge events from a line request."]
+    #[doc = " @param request GPIO line request."]
+    #[doc = " @param buffer Edge event buffer, sized to hold at least \\p max_events."]
+    #[doc = " @param max_events Maximum number of events to read."]
+    #[doc = " @return On success returns the number of events read from the file"]
+    #[doc = "\t   descriptor, on failure return -1."]
+    #[doc = " @note This function will block if no event was queued for the line request."]
+    #[doc = " @note Any exising events in the buffer are overwritten.  This is not an"]
+    #[doc = "       append operation."]
+    pub fn gpiod_line_request_read_edge_event(
+        request: *mut gpiod_line_request,
+        buffer: *mut gpiod_edge_event_buffer,
+        max_events: size_t,
+    ) -> ::std::os::raw::c_int;
+}
+pub const GPIOD_EDGE_EVENT_RISING_EDGE: ::std::os::raw::c_uint = 1;
+pub const GPIOD_EDGE_EVENT_FALLING_EDGE: ::std::os::raw::c_uint = 2;
+#[doc = " @brief Event types."]
+pub type _bindgen_ty_8 = ::std::os::raw::c_uint;
+extern "C" {
+    #[doc = " @brief Free the edge event object."]
+    #[doc = " @param event Edge event object to free."]
+    pub fn gpiod_edge_event_free(event: *mut gpiod_edge_event);
+}
+extern "C" {
+    #[doc = " @brief Copy the edge event object."]
+    #[doc = " @param event Edge event to copy."]
+    #[doc = " @return Copy of the edge event or NULL on error. The returned object must"]
+    #[doc = "\t   be freed by the caller using ::gpiod_edge_event_free."]
+    pub fn gpiod_edge_event_copy(event: *mut gpiod_edge_event) -> *mut gpiod_edge_event;
+}
+extern "C" {
+    #[doc = " @brief Get the event type."]
+    #[doc = " @param event GPIO edge event."]
+    #[doc = " @return The event type (::GPIOD_EDGE_EVENT_RISING_EDGE or"]
+    #[doc = "\t   ::GPIOD_EDGE_EVENT_FALLING_EDGE)."]
+    pub fn gpiod_edge_event_get_event_type(event: *mut gpiod_edge_event) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    #[doc = " @brief Get the timestamp of the event."]
+    #[doc = " @param event GPIO edge event."]
+    #[doc = " @return Timestamp in nanoseconds."]
+    #[doc = " @note The source clock for the timestamp depends on the event_clock"]
+    #[doc = "\t setting for the line."]
+    pub fn gpiod_edge_event_get_timestamp_ns(event: *mut gpiod_edge_event) -> u64;
+}
+extern "C" {
+    #[doc = " @brief Get the offset of the line which triggered the event."]
+    #[doc = " @param event GPIO edge event."]
+    #[doc = " @return Line offset."]
+    pub fn gpiod_edge_event_get_line_offset(event: *mut gpiod_edge_event)
+        -> ::std::os::raw::c_uint;
+}
+extern "C" {
+    #[doc = " @brief Get the global sequence number of the event."]
+    #[doc = " @param event GPIO edge event."]
+    #[doc = " @return Sequence number of the event in the series of events for all lines"]
+    #[doc = "\t   in the associated line request."]
+    pub fn gpiod_edge_event_get_global_seqno(
+        event: *mut gpiod_edge_event,
+    ) -> ::std::os::raw::c_ulong;
+}
+extern "C" {
+    #[doc = " @brief Get the event sequence number specific to the line."]
+    #[doc = " @param event GPIO edge event."]
+    #[doc = " @return Sequence number of the event in the series of events only for this"]
+    #[doc = "\t   line within the lifetime of the associated line request."]
+    pub fn gpiod_edge_event_get_line_seqno(event: *mut gpiod_edge_event)
+        -> ::std::os::raw::c_ulong;
+}
+extern "C" {
+    #[doc = " @brief Create a new edge event buffer."]
+    #[doc = " @param capacity Number of events the buffer can store (min = 1, max = 1024)."]
+    #[doc = " @return New edge event buffer or NULL on error."]
+    #[doc = " @note If capacity equals 0, it will be set to a default value of 64. If"]
+    #[doc = "\t capacity is larger than 1024, it will be limited to 1024."]
+    #[doc = " @note The user space buffer is independent of the kernel buffer"]
+    #[doc = "\t (::gpiod_request_config_set_event_buffer_size).  As the user space"]
+    #[doc = "\t buffer is filled from the kernel buffer, there is no benefit making"]
+    #[doc = "\t the user space buffer larger than the kernel buffer."]
+    #[doc = "\t The default kernel buffer size for each request is 16*num_lines."]
+    pub fn gpiod_edge_event_buffer_new(capacity: size_t) -> *mut gpiod_edge_event_buffer;
+}
+extern "C" {
+    #[doc = " @brief Get the capacity (the max number of events that can be stored) of"]
+    #[doc = "\t  the event buffer."]
+    #[doc = " @param buffer Edge event buffer."]
+    #[doc = " @return The capacity of the buffer."]
+    pub fn gpiod_edge_event_buffer_get_capacity(buffer: *mut gpiod_edge_event_buffer) -> size_t;
+}
+extern "C" {
+    #[doc = " @brief Free the edge event buffer and release all associated resources."]
+    #[doc = " @param buffer Edge event buffer to free."]
+    pub fn gpiod_edge_event_buffer_free(buffer: *mut gpiod_edge_event_buffer);
+}
+extern "C" {
+    #[doc = " @brief Get an event stored in the buffer."]
+    #[doc = " @param buffer Edge event buffer."]
+    #[doc = " @param index Index of the event in the buffer."]
+    #[doc = " @return Pointer to an event stored in the buffer. The lifetime of the"]
+    #[doc = "\t   event is tied to the buffer object. Users must not free the event"]
+    #[doc = "\t   returned by this function."]
+    pub fn gpiod_edge_event_buffer_get_event(
+        buffer: *mut gpiod_edge_event_buffer,
+        index: ::std::os::raw::c_ulong,
+    ) -> *mut gpiod_edge_event;
+}
+extern "C" {
+    #[doc = " @brief Get the number of events a buffer has stored."]
+    #[doc = " @param buffer Edge event buffer."]
+    #[doc = " @return Number of events stored in the buffer."]
+    pub fn gpiod_edge_event_buffer_get_num_events(buffer: *mut gpiod_edge_event_buffer) -> size_t;
+}
+extern "C" {
+    #[doc = " @brief Check if the file pointed to by path is a GPIO chip character device."]
+    #[doc = " @param path Path to check."]
+    #[doc = " @return True if the file exists and is either a GPIO chip character device"]
+    #[doc = "\t   or a symbolic link to one."]
+    pub fn gpiod_is_gpiochip_device(path: *const ::std::os::raw::c_char) -> bool;
+}
+extern "C" {
+    #[doc = " @brief Get the API version of the library as a human-readable string."]
+    #[doc = " @return Human-readable string containing the library version."]
+    pub fn gpiod_version_string() -> *const ::std::os::raw::c_char;
+}
-- 
2.31.1.272.g89b43f80a514

