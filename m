Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5157587C3C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 14:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236905AbiHBMSi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 08:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbiHBMSh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 08:18:37 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB9F4F18F
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 05:18:35 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id m2so6511588pls.4
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=h9rNW/idNQxjuiah6KQHvgMDAP+fWNUGlSLnABXSZ4dDZyfG29pilj2+G8DOpsOYBW
         RmXBxr6fk6QM7YlTw+Fh81vRug+SUbN1jwNiFGUghDSw2QhRTATQHQmhj26gVI+uGS6y
         i2HD1IpLqhj1LyocOhHN9jVI9LQKmh0mOK3lfJ5b097Pq/gwQFEVZ0nKQjhP9fdVsXgY
         Bvz5LnGmsjUm4z0pcxpVfsp1QJcX75yD4oCK22WSkpCrKPbJhDn8TGuTGTLMq5rEZop6
         py6eOxPhAWbLW0EWqvUA+lRNpEH1dSgxgHTpjxYB0JXQ6tkNc5gOUYgN8y9k/XDjEPnZ
         UWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SjJiMlrs/ZeYBiv0yhVqMLyEDnGsJrY4JvzsUIgfAw4=;
        b=OU8XLn+PiwW/6IhnzvwCBIMHFqMlcNle2/ykfja5+nh0LYdpgjRatKTT+F6+Yemv2t
         s0U+AlTSIs2L893wtRhIRe9mBdNdtjgZKV6HCmktZIgEdpmfulLdGENHwWzmiyCCiVvx
         18ziNESe0Mmb5NcGyEkDQDxvRVvrgp9XKx7KuZQPHqlhIVGBtaLESjePQ6zhjb4VE8SU
         RdmWuy4HQrfm0xBeo4YlNT/ymDtYJgr5ahqaHIZwO54A3KPZrOE2tr760OM3rbXxlGns
         HRY3g2lpMLQp+MQ7oCSuuv3z+mtfPh9NVcnhLwkqEswWSGRqWMORmvGkHqvUwU5w0HoC
         peCQ==
X-Gm-Message-State: ACgBeo0c0EpxQ+zu4xXuJb9UW5vlNnOShdQe7FVwVFTdleuozrr/C9tt
        POrfQZThQ/VptfASE97f9b6W8Q==
X-Google-Smtp-Source: AA6agR54LvOA76aUHuIwBmz8kRDVPeATLVK5y++xjOvXhG70TcDOXoEE5yK99u9LEILnlnwy/n/jvw==
X-Received: by 2002:a17:902:8a89:b0:16e:d8f4:e166 with SMTP id p9-20020a1709028a8900b0016ed8f4e166mr13589042plo.49.1659442715357;
        Tue, 02 Aug 2022 05:18:35 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id kk15-20020a17090b4a0f00b001f51903e03fsm2278446pjb.32.2022.08.02.05.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 05:18:35 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V5 6/8] gpiosim: Add pre generated rust bindings
Date:   Tue,  2 Aug 2022 17:48:10 +0530
Message-Id: <41976c93e685c8a17859bd32db0dc4db8e8d1b82.1659442066.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1659442066.git.viresh.kumar@linaro.org>
References: <cover.1659442066.git.viresh.kumar@linaro.org>
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

