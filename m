Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA995EA625
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 14:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbiIZMb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 08:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235525AbiIZMbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 08:31:04 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1933223BC9
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:10:03 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id bu5-20020a17090aee4500b00202e9ca2182so12612611pjb.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=U6r4QEOIMb2yenb8mQbaMJXPgJa2ISzfiU+x93t2Plqjxzz9K84yVmiFitgJLY6VxH
         BykWpn3FdnEiLOHyXChPa6JEWc9hvBTEbAEe8t2+ahpqdOgbkLJDkxdB7uj3gTokCrt3
         fAZ4oPqRJhkJGHuPprYWMxkc6Rshws49xpMwIkbOoTJtvx7GqPPln2c6ObP681hDI925
         dv3mdcsuCcCh3sqqrdGtpVQhUL9QxcM8wM2AdXmZ60U4o3VYOMBGqoM54tMp0MvzWrj6
         h5tkCy/Usmh5QaR7PyoSp8lf+P+ZmaqslY/wumdWjzzyqCxAdj4lQwcpszPcU4bjz3B3
         DY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=MJbMaJpQN4UEsb0ZhOU/iIroeSmS7IKNG0JfnH9h2z4YsMrTq4HMJMQ6qE3qMmKD+o
         9f7thJ4ENBIA5JSO0xh4O28hOnjq5F/q0yE6hcQ7IvXtCZoxRaZrNpgj3X4czUeeq9Yv
         byT0Q9Wu+HGwZAhzACi2Lq6/cenHtvY36sBgchIp1b4P3GMLzaZ+Z+Vc0eVsL08Fahjn
         /wfFsIIvfFnvV1NyJecY/O2wT3mFOVx/5s6eB7JegqOVbd2lF5xGuCLLMkiJGpb3y5bW
         nhW7n4GjY/2X+03PM4LUKjCWZ2Pno+VFCE5UngrXKiX3Vg/qy4jbv4sv+S2X48ZElwYn
         T+8A==
X-Gm-Message-State: ACrzQf1WpI46HRp/4VnnlHRXjMyDiDTPAMbc8IKH44A47fj3oMY3VgQA
        z6t+eYo+/FvQEQha456mcBPd7A==
X-Google-Smtp-Source: AMsMyM6HMt+wgirxOCS7LaxkqTF8hCEMxCjOY7Iv2cXfYkbn/dPyKwa2ByscW26/e95EgRaRxzvSBQ==
X-Received: by 2002:a17:90b:388e:b0:202:c42a:d360 with SMTP id mu14-20020a17090b388e00b00202c42ad360mr36032665pjb.158.1664190524190;
        Mon, 26 Sep 2022 04:08:44 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id m14-20020a170902f64e00b001789f6744b8sm10887676plg.214.2022.09.26.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:08:43 -0700 (PDT)
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
Subject: [PATCH V6 6/8] gpiosim: Add pre generated rust bindings
Date:   Mon, 26 Sep 2022 16:38:18 +0530
Message-Id: <2e353bf45899ff0153a23932228c43ff067d74a6.1664189248.git.viresh.kumar@linaro.org>
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

