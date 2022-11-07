Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEF3B61EFC0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 10:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbiKGJ6A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 04:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbiKGJ5z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 04:57:55 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308962D2
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 01:57:54 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so9807599pjk.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=ohdUh0hDtYqxVE2XKYDDZMWmWatoHpRuACZbr2VawYqyC+ENVdKZoXz5B/G8td55Qi
         V9CcPGcoHmTVhBqQSquL19rZ1mIsByZ83kTrobjBbpHEbcWuc57DPRdJoLcdwBLNAy7/
         0z3FdiAZWODLuk+spIFQppnQFMTIDMfvD5/OF6rYKp4TdFqVOxfv12ZLbCfjOMUDpPQC
         9r/d0woWfVNc/KeBH2ZJGdmosEroM6Hs1B0407xaNwcKpeWce11wZxMPkz2fv+4ry44x
         BrlAS8mMByft8/98wSKN4xz5ArN0VeYoBFuXwxYf4uXeXWvAG1Gw1V/6VFcIM2hfGgGa
         VvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=tQzFh3wxKRh502iP3uZecYpGn3iAjttflIAi0q5rZzHpXbF8liI6m1nViUI8dMLeql
         fY1qitNYolxy3ISZjkwqDTMBCR0kY5L3c7xwBLClIIsB2Pd2mwKdNc5k9UMfZFE4SyyR
         dwVRrnTAXcj9CPtpHdpb13E1egpRObtSyLFL9k9TygPFlyCwP1ZolBVskzwzON4xv2wb
         svqmdmm6THhYvZJyAztVFEKNRjdsfpLuAVIVlwXv7QEQCLi7spLnURQ7rKdEsxU9UDJC
         ZzJzkWsZIAFDfTNuSFHCQb3f+2pLmTnnF/IKRxrdc40HWuF5oDbUj0H3B3UUUu8NW8OG
         F0cg==
X-Gm-Message-State: ACrzQf3xQjpoKVST4asuRA/0PfY814t8zOYzsx2pq+VyxEwku6B6sIsi
        W8Ex3MbVhI8SAf1O8sa4mV4DgA==
X-Google-Smtp-Source: AMsMyM5RlZpYFTKlCM8qDFO0SNunz3ajlFT7Kf0s9rYvs/vfaRkwJTvELzuMF7KzfjRpi7ipaGth8Q==
X-Received: by 2002:a17:90b:153:b0:213:b853:5db1 with SMTP id em19-20020a17090b015300b00213b8535db1mr47900043pjb.168.1667815073699;
        Mon, 07 Nov 2022 01:57:53 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id h5-20020aa79f45000000b0056b9df2a15esm4091141pfr.62.2022.11.07.01.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:57:53 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod][PATCH V9 4/8] bindings: rust: Add pre generated bindings for gpiosim
Date:   Mon,  7 Nov 2022 15:27:30 +0530
Message-Id: <401d9417d895b8b1b19ca577c84347d89f7e0fbd.1667815011.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667815011.git.viresh.kumar@linaro.org>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
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

