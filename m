Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 535E16134DD
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 12:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbiJaLrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 07:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiJaLrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 07:47:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DC1203
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:41 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id l6so10197373pjj.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=KFKUIdhg8vdRqUsUECfykbtoMoHBQPZnLJbrD8qtyJXFhS4x8IufuGphzSh8XKfhrc
         KJjJpmY8cEp+ltDFeXZ8YNacHDoHUu7umtZSvzgObaTdxN+OGfodI376PzxlflzxtrGn
         Y+nkrNJnyA5JRnuArp9mWCFUW78CvxT9HY1C9D5QyNVqR8XHpg4WnXXKhHbLmY+Hb50f
         NrsC5AxJKDaRMHaBejv3IB7wylB8iymj9RkM/FyxuEbfO52L1tCRR3rf8x6kjIpvJcqN
         Z1uzxbuC2gWCFCMS1GsI5N/D2eygMeWSHGYsaoI5TRA5nlnZtz3cFGsy81nyoRTPJvGp
         xlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=eCRnjdkbkOAUe/L3epUBNvCPRvZdSm8WOFW92eIp2qDwtBbynKlI/vpY7hE6oTM1Lu
         gG7eN4GR/kavcW3MXOyVwoz50fjQ6xbAjUrtkz1UqcF0ezcVbk3k8SVX3fW6rovoJnxS
         tnDj8xnKwcVtWSdLU6LhwXtR7TAA0FVfePZJiEEtvJk8vVCeXFh0+MN+pWwmt/3pDLWl
         TDiYxVrfh/Wyb8LqBGrjMEoUPOE7ioYqNvlIizFATr5erVhZBq8r25ufPCjnw8+Lwyqi
         Cqubt7xAPrTTjIeVdHtUhUxJCFMizgNo51QFZ/SKm5jTHWhuMnj4yhFcijkF30UBKsTc
         lQMg==
X-Gm-Message-State: ACrzQf1tuKwBaVoHOVAIqycF1Tm7fyGRAuG3HpCvTWpwj+pctTZYdU+k
        1JZEUh4kpG4eQeo8HyDLiS4sSw==
X-Google-Smtp-Source: AMsMyM5JVmA6MD0gyqxv5rkjoSnEaZJ1aiKo7q++CsWFgnnD3z2RjdJncswF+qr+26mxW3zlmkaNJA==
X-Received: by 2002:a17:90b:80c:b0:213:13aa:3e2c with SMTP id bk12-20020a17090b080c00b0021313aa3e2cmr31912043pjb.243.1667216860521;
        Mon, 31 Oct 2022 04:47:40 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b0053e8fe8a705sm4579484pfg.17.2022.10.31.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:40 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod v2][PATCH V8 4/9] bindings: rust: Add pre generated bindings for gpiosim
Date:   Mon, 31 Oct 2022 17:17:12 +0530
Message-Id: <eb2c75afc3b10a7e3651bb3b2b774c1164ba27d0.1667215380.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667215380.git.viresh.kumar@linaro.org>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
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
 bindings/rust/gpiosim/README.md       |  11 ++
 bindings/rust/gpiosim/src/bindings.rs | 180 ++++++++++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 bindings/rust/gpiosim/README.md
 create mode 100644 bindings/rust/gpiosim/src/bindings.rs

diff --git a/bindings/rust/gpiosim/README.md b/bindings/rust/gpiosim/README.md
new file mode 100644
index 000000000000..acb84543dbdc
--- /dev/null
+++ b/bindings/rust/gpiosim/README.md
@@ -0,0 +1,11 @@
+# Generated gpiosim Rust FFI bindings
+Automatically generated Rust FFI bindings via
+	[bindgen](https://github.com/rust-lang/rust-bindgen).
+
+## Updating bindings
+1. Clone the source from
+	<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
+2. run `cd libgpiod/bindings/rust/gpiosim/`
+2. run `cargo build --features generate`
+3. Copy the bindings 'cp ../target/debug/build/gpiosim-###/out/bindings.rs src/bindings.rs'
+4. Commit changes in `src/bindings.rs`
diff --git a/bindings/rust/gpiosim/src/bindings.rs b/bindings/rust/gpiosim/src/bindings.rs
new file mode 100644
index 000000000000..bac347f1aab9
--- /dev/null
+++ b/bindings/rust/gpiosim/src/bindings.rs
@@ -0,0 +1,180 @@
+/* automatically generated by rust-bindgen 0.59.2 */
+
+pub const true_: u32 = 1;
+pub const false_: u32 = 0;
+pub const __bool_true_false_are_defined: u32 = 1;
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
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiosim_ctx {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiosim_dev {
+    _unused: [u8; 0],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct gpiosim_bank {
+    _unused: [u8; 0],
+}
+pub const GPIOSIM_VALUE_INACTIVE: ::std::os::raw::c_uint = 0;
+pub const GPIOSIM_VALUE_ACTIVE: ::std::os::raw::c_uint = 1;
+pub type _bindgen_ty_1 = ::std::os::raw::c_uint;
+pub const GPIOSIM_PULL_DOWN: ::std::os::raw::c_uint = 1;
+pub const GPIOSIM_PULL_UP: ::std::os::raw::c_uint = 2;
+pub type _bindgen_ty_2 = ::std::os::raw::c_uint;
+pub const GPIOSIM_HOG_DIR_INPUT: ::std::os::raw::c_uint = 1;
+pub const GPIOSIM_HOG_DIR_OUTPUT_HIGH: ::std::os::raw::c_uint = 2;
+pub const GPIOSIM_HOG_DIR_OUTPUT_LOW: ::std::os::raw::c_uint = 3;
+pub type _bindgen_ty_3 = ::std::os::raw::c_uint;
+extern "C" {
+    pub fn gpiosim_ctx_new() -> *mut gpiosim_ctx;
+}
+extern "C" {
+    pub fn gpiosim_ctx_ref(ctx: *mut gpiosim_ctx) -> *mut gpiosim_ctx;
+}
+extern "C" {
+    pub fn gpiosim_ctx_unref(ctx: *mut gpiosim_ctx);
+}
+extern "C" {
+    pub fn gpiosim_dev_new(ctx: *mut gpiosim_ctx) -> *mut gpiosim_dev;
+}
+extern "C" {
+    pub fn gpiosim_dev_ref(dev: *mut gpiosim_dev) -> *mut gpiosim_dev;
+}
+extern "C" {
+    pub fn gpiosim_dev_unref(dev: *mut gpiosim_dev);
+}
+extern "C" {
+    pub fn gpiosim_dev_get_ctx(dev: *mut gpiosim_dev) -> *mut gpiosim_ctx;
+}
+extern "C" {
+    pub fn gpiosim_dev_get_name(dev: *mut gpiosim_dev) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    pub fn gpiosim_dev_enable(dev: *mut gpiosim_dev) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_dev_disable(dev: *mut gpiosim_dev) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_dev_is_live(dev: *mut gpiosim_dev) -> bool;
+}
+extern "C" {
+    pub fn gpiosim_bank_new(dev: *mut gpiosim_dev) -> *mut gpiosim_bank;
+}
+extern "C" {
+    pub fn gpiosim_bank_ref(bank: *mut gpiosim_bank) -> *mut gpiosim_bank;
+}
+extern "C" {
+    pub fn gpiosim_bank_unref(bank: *mut gpiosim_bank);
+}
+extern "C" {
+    pub fn gpiosim_bank_get_dev(bank: *mut gpiosim_bank) -> *mut gpiosim_dev;
+}
+extern "C" {
+    pub fn gpiosim_bank_get_chip_name(bank: *mut gpiosim_bank) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    pub fn gpiosim_bank_get_dev_path(bank: *mut gpiosim_bank) -> *const ::std::os::raw::c_char;
+}
+extern "C" {
+    pub fn gpiosim_bank_set_label(
+        bank: *mut gpiosim_bank,
+        label: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_bank_set_num_lines(
+        bank: *mut gpiosim_bank,
+        num_lines: size_t,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_bank_set_line_name(
+        bank: *mut gpiosim_bank,
+        offset: ::std::os::raw::c_uint,
+        name: *const ::std::os::raw::c_char,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_bank_hog_line(
+        bank: *mut gpiosim_bank,
+        offset: ::std::os::raw::c_uint,
+        name: *const ::std::os::raw::c_char,
+        direction: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_bank_clear_hog(
+        bank: *mut gpiosim_bank,
+        offset: ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_bank_get_value(
+        bank: *mut gpiosim_bank,
+        offset: ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_bank_get_pull(
+        bank: *mut gpiosim_bank,
+        offset: ::std::os::raw::c_uint,
+    ) -> ::std::os::raw::c_int;
+}
+extern "C" {
+    pub fn gpiosim_bank_set_pull(
+        bank: *mut gpiosim_bank,
+        offset: ::std::os::raw::c_uint,
+        pull: ::std::os::raw::c_int,
+    ) -> ::std::os::raw::c_int;
+}
-- 
2.31.1.272.g89b43f80a514

