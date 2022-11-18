Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F019662F2E1
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 11:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241856AbiKRKqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 05:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241851AbiKRKpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 05:45:44 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA279B39C
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:15 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id y4so4232498plb.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMaCurqDxilP33vHtrF9vt6/018PDL/8KWySa506VLQ=;
        b=Ztx3365rf2RjnKX6u/yhp9Z1aHtqB+WkzVUlyV4cS64VArwAtQ8j5qfitCJ6xZAa5u
         p8suPEEbThQC2FLgvQbpUTiwn6rb3P+reIiumk4NAHAjZtrzXJWqMxyiXke3Ebgo2FaH
         RjL5NADw8vlTk4FRSG4R76WHHWKWxctyHFt6kZIQunyKrlpaI6zhMDMyUtuSi+LiQk2x
         yKWqnWgvqXuSMzCDlbzFvqRmjnmlaITZ0cX/e9DjoptxhB1ql+ZD8PP8qceyAGOejgJa
         3Vzy1VsOsMF3cHRp3qSEzSi6R7S+aW31b1JEAWzLU7YtUQI7jAQmmc8qJZ/a03bokwsq
         Tn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMaCurqDxilP33vHtrF9vt6/018PDL/8KWySa506VLQ=;
        b=X4sWcItMn6rdCJhCxoZ1VyDZStIjR+Ggn3cs5NBqOGsQggQfqi1j28Y5aJp5eGDUZ8
         B9KI5anUETBzqdeWzbChadXhuQv4etlpoZIOxWmmblY2His4o0EEPZKvGUGuO59l+W2y
         WGBtclPZiKoN1qcefQrD7Syv+EgsmKnfGZC8sfS3KdM1lwQlo0hHPO38iZwsNy8RsasC
         3OcxE9VFtWbxacOomPBW5BTdrhqmmh8wyEKw7Et27mLSGgjCMk2GW7yl5HRYr7ZFA0YO
         1Nq3C+/qAQGEUPVTyo3jI8QQUFdBjMvUhpMgwVE44gHkFSY+3mdXDf9MOMXS8Q5aAMWv
         ZUYA==
X-Gm-Message-State: ANoB5plgiZuJpMUs4tyMNE5UYibsRYwcK66N6JURXzilHS/SN6n19ZOt
        0iR5onZ7AAe8f/ZyYF2/BvTtWQ==
X-Google-Smtp-Source: AA0mqf45ydqiVXHfpwv/yaaZjIkoXB8C9OvnsTzCYdK+/XfBC8FtLZA+Rz/yCWe4nncjF/MQK/qNlA==
X-Received: by 2002:a17:90a:2b44:b0:213:d66b:4973 with SMTP id y4-20020a17090a2b4400b00213d66b4973mr13341334pjc.85.1668768314681;
        Fri, 18 Nov 2022 02:45:14 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id z7-20020aa79f87000000b005625d5ae760sm2975205pfr.11.2022.11.18.02.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 02:45:14 -0800 (PST)
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
Subject: [libgpiod][PATCH V10 3/6] bindings: rust: Add gpiosim-sys crate
Date:   Fri, 18 Nov 2022 16:14:39 +0530
Message-Id: <69264035ae851e29f0f7a8fb918affd095bbeb24.1668768040.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1668768040.git.viresh.kumar@linaro.org>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
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

This adds gpiosim-sys rust crate, which provides helpers to emulate GPIO
chips.

Reviewed-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/Cargo.toml             |   1 +
 bindings/rust/gpiosim-sys/Cargo.toml |  23 ++
 bindings/rust/gpiosim-sys/README.md  |  14 ++
 bindings/rust/gpiosim-sys/build.rs   |  43 ++++
 bindings/rust/gpiosim-sys/src/lib.rs |  74 ++++++
 bindings/rust/gpiosim-sys/src/sim.rs | 330 +++++++++++++++++++++++++++
 6 files changed, 485 insertions(+)
 create mode 100644 bindings/rust/gpiosim-sys/Cargo.toml
 create mode 100644 bindings/rust/gpiosim-sys/README.md
 create mode 100644 bindings/rust/gpiosim-sys/build.rs
 create mode 100644 bindings/rust/gpiosim-sys/src/lib.rs
 create mode 100644 bindings/rust/gpiosim-sys/src/sim.rs

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index f4051387d581..b4a28fd7129c 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -5,6 +5,7 @@
 [workspace]
 
 members = [
+    "gpiosim-sys",
     "libgpiod",
     "libgpiod-sys"
 ]
diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
new file mode 100644
index 000000000000..c3571d2cf48e
--- /dev/null
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+[package]
+name = "gpiosim-sys"
+version = "0.1.0"
+authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
+description = "gpiosim header bindings"
+repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
+categories = ["external-ffi-bindings", "os::linux-apis"]
+rust-version = "1.56"
+keywords = ["libgpiod", "gpio", "gpiosim"]
+license = "Apache-2.0 OR BSD-3-Clause"
+edition = "2021"
+
+[dependencies]
+errno = "0.2.8"
+libgpiod = { path = "../libgpiod" }
+
+[build-dependencies]
+bindgen = "0.59.1"
+cc = "1.0.46"
diff --git a/bindings/rust/gpiosim-sys/README.md b/bindings/rust/gpiosim-sys/README.md
new file mode 100644
index 000000000000..686d522bf174
--- /dev/null
+++ b/bindings/rust/gpiosim-sys/README.md
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+# Generated gpiosim Rust FFI bindings
+Automatically generated Rust FFI bindings via
+	[bindgen](https://github.com/rust-lang/rust-bindgen).
+
+## License
+
+This project is licensed under either of
+
+- [Apache License](http://www.apache.org/licenses/LICENSE-2.0), Version 2.0
+- [BSD-3-Clause License](https://opensource.org/licenses/BSD-3-Clause)
diff --git a/bindings/rust/gpiosim-sys/build.rs b/bindings/rust/gpiosim-sys/build.rs
new file mode 100644
index 000000000000..0651c6115322
--- /dev/null
+++ b/bindings/rust/gpiosim-sys/build.rs
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+extern crate bindgen;
+
+use std::env;
+use std::path::PathBuf;
+
+fn generate_bindings() {
+    // Tell cargo to invalidate the built crate whenever following files change
+    println!("cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.h");
+
+    // The bindgen::Builder is the main entry point
+    // to bindgen, and lets you build up options for
+    // the resulting bindings.
+    let bindings = bindgen::Builder::default()
+        // The input header we would like to generate
+        // bindings for.
+        .header("../../../tests/gpiosim/gpiosim.h")
+        // Tell cargo to invalidate the built crate whenever any of the
+        // included header files changed.
+        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
+        // Finish the builder and generate the bindings.
+        .generate()
+        // Unwrap the Result and panic on failure.
+        .expect("Unable to generate bindings");
+
+    // Write the bindings to the $OUT_DIR/bindings.rs file.
+    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
+    bindings
+        .write_to_file(out_path.join("bindings.rs"))
+        .expect("Couldn't write bindings!");
+}
+
+fn main() {
+    generate_bindings();
+
+    println!("cargo:rustc-link-lib=kmod");
+    println!("cargo:rustc-link-lib=mount");
+    println!("cargo:rustc-link-search=./../../tests/gpiosim/.libs/");
+    println!("cargo:rustc-link-lib=static=gpiosim");
+}
diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
new file mode 100644
index 000000000000..5391dbd62f44
--- /dev/null
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+use libgpiod::{Error, Result};
+
+#[allow(non_camel_case_types, non_upper_case_globals)]
+#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
+#[allow(dead_code)]
+mod bindings_raw {
+    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
+}
+use bindings_raw::*;
+
+mod sim;
+pub use sim::*;
+
+/// Value settings.
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub enum Value {
+    /// Active
+    Active,
+    /// Inactive
+    InActive,
+}
+
+impl Value {
+    pub(crate) fn new(val: u32) -> Result<Self> {
+        match val {
+            GPIOSIM_VALUE_INACTIVE => Ok(Value::InActive),
+            GPIOSIM_VALUE_ACTIVE => Ok(Value::Active),
+            _ => Err(Error::InvalidEnumValue("Value", val as u32)),
+        }
+    }
+}
+
+/// Direction settings.
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub enum Direction {
+    /// Direction is input - for reading the value of an externally driven GPIO line.
+    Input,
+    /// Direction is output - for driving the GPIO line, value is high.
+    OutputHigh,
+    /// Direction is output - for driving the GPIO line, value is low.
+    OutputLow,
+}
+
+impl Direction {
+    fn val(self) -> i32 {
+        (match self {
+            Direction::Input => GPIOSIM_HOG_DIR_INPUT,
+            Direction::OutputHigh => GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+            Direction::OutputLow => GPIOSIM_HOG_DIR_OUTPUT_LOW,
+        }) as i32
+    }
+}
+
+/// Internal pull settings.
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub enum Pull {
+    /// The internal pull-up is enabled.
+    Up,
+    /// The internal pull-down is enabled.
+    Down,
+}
+
+impl Pull {
+    fn val(self) -> i32 {
+        (match self {
+            Pull::Up => GPIOSIM_PULL_UP,
+            Pull::Down => GPIOSIM_PULL_DOWN,
+        }) as i32
+    }
+}
diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
new file mode 100644
index 000000000000..4930fb6bff49
--- /dev/null
+++ b/bindings/rust/gpiosim-sys/src/sim.rs
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::ffi::{CStr, CString};
+use std::os::raw::c_char;
+use std::path::PathBuf;
+use std::str;
+
+use libgpiod::{line::Offset, Error, OperationType, Result};
+
+use crate::*;
+
+/// Sim Ctx
+#[derive(Debug)]
+struct SimCtx {
+    ctx: *mut gpiosim_ctx,
+}
+
+// Safe as the pointer is guaranteed to be valid and the associated resource
+// won't be freed until the object is dropped.
+unsafe impl Send for SimCtx {}
+
+impl SimCtx {
+    fn new() -> Result<Self> {
+        // SAFETY: `gpiosim_ctx` returned by gpiosim is guaranteed to live
+        // as long as the `struct SimCtx`.
+        let ctx = unsafe { gpiosim_ctx_new() };
+        if ctx.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::SimCtxNew,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { ctx })
+    }
+}
+
+impl Drop for SimCtx {
+    fn drop(&mut self) {
+        // SAFETY: `gpiosim_ctx` is guaranteed to be valid here.
+        unsafe { gpiosim_ctx_unref(self.ctx) }
+    }
+}
+
+/// Sim Dev
+#[derive(Debug)]
+struct SimDev {
+    dev: *mut gpiosim_dev,
+}
+
+// Safe as the pointer is guaranteed to be valid and the associated resource
+// won't be freed until the object is dropped.
+unsafe impl Send for SimDev {}
+
+impl SimDev {
+    fn new(ctx: &SimCtx) -> Result<Self> {
+        // SAFETY: `gpiosim_dev` returned by gpiosim is guaranteed to live
+        // as long as the `struct SimDev`.
+        let dev = unsafe { gpiosim_dev_new(ctx.ctx) };
+        if dev.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::SimDevNew,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { dev })
+    }
+
+    fn enable(&self) -> Result<()> {
+        // SAFETY: `gpiosim_dev` is guaranteed to be valid here.
+        let ret = unsafe { gpiosim_dev_enable(self.dev) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimDevEnable,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn disable(&self) -> Result<()> {
+        // SAFETY: `gpiosim_dev` is guaranteed to be valid here.
+        let ret = unsafe { gpiosim_dev_disable(self.dev) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimDevDisable,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl Drop for SimDev {
+    fn drop(&mut self) {
+        // SAFETY: `gpiosim_dev` is guaranteed to be valid here.
+        unsafe { gpiosim_dev_unref(self.dev) }
+    }
+}
+
+/// Sim Bank
+#[derive(Debug)]
+struct SimBank {
+    bank: *mut gpiosim_bank,
+}
+
+// Safe as the pointer is guaranteed to be valid and the associated resource
+// won't be freed until the object is dropped.
+unsafe impl Send for SimBank {}
+
+impl SimBank {
+    fn new(dev: &SimDev) -> Result<Self> {
+        // SAFETY: `gpiosim_bank` returned by gpiosim is guaranteed to live
+        // as long as the `struct SimBank`.
+        let bank = unsafe { gpiosim_bank_new(dev.dev) };
+        if bank.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::SimBankNew,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { bank })
+    }
+
+    fn chip_name(&self) -> Result<&str> {
+        // SAFETY: The string returned by gpiosim is guaranteed to live as long
+        // as the `struct SimBank`.
+        let name = unsafe { gpiosim_bank_get_chip_name(self.bank) };
+
+        // SAFETY: The string is guaranteed to be valid here.
+        unsafe { CStr::from_ptr(name) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
+    fn dev_path(&self) -> Result<PathBuf> {
+        // SAFETY: The string returned by gpiosim is guaranteed to live as long
+        // as the `struct SimBank`.
+        let path = unsafe { gpiosim_bank_get_dev_path(self.bank) };
+
+        // SAFETY: The string is guaranteed to be valid here.
+        let path = unsafe { CStr::from_ptr(path) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)?;
+
+        Ok(PathBuf::from(path))
+    }
+
+    fn val(&self, offset: Offset) -> Result<Value> {
+        // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
+        let ret = unsafe { gpiosim_bank_get_value(self.bank, offset) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankGetVal,
+                errno::errno(),
+            ))
+        } else {
+            Value::new(ret as u32)
+        }
+    }
+
+    fn set_label(&self, label: &str) -> Result<()> {
+        let label = CString::new(label).map_err(|_| Error::InvalidString)?;
+
+        // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
+        let ret = unsafe { gpiosim_bank_set_label(self.bank, label.as_ptr() as *const c_char) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetLabel,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_num_lines(&self, num: usize) -> Result<()> {
+        // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
+        let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num.try_into().unwrap()) };
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetNumLines,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_line_name(&self, offset: Offset, name: &str) -> Result<()> {
+        let name = CString::new(name).map_err(|_| Error::InvalidString)?;
+
+        // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiosim_bank_set_line_name(self.bank, offset, name.as_ptr() as *const c_char)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetLineName,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_pull(&self, offset: Offset, pull: Pull) -> Result<()> {
+        // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
+        let ret = unsafe { gpiosim_bank_set_pull(self.bank, offset, pull.val()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetPull,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn hog_line(&self, offset: Offset, name: &str, dir: Direction) -> Result<()> {
+        let name = CString::new(name).map_err(|_| Error::InvalidString)?;
+
+        // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiosim_bank_hog_line(self.bank, offset, name.as_ptr() as *const c_char, dir.val())
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankHogLine,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl Drop for SimBank {
+    fn drop(&mut self) {
+        // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
+        unsafe { gpiosim_bank_unref(self.bank) }
+    }
+}
+
+/// GPIO SIM
+#[derive(Debug)]
+pub struct Sim {
+    _ctx: SimCtx,
+    dev: SimDev,
+    bank: SimBank,
+}
+
+impl Sim {
+    pub fn new(ngpio: Option<usize>, label: Option<&str>, enable: bool) -> Result<Self> {
+        let ctx = SimCtx::new()?;
+        let dev = SimDev::new(&ctx)?;
+        let bank = SimBank::new(&dev)?;
+
+        if let Some(ngpio) = ngpio {
+            bank.set_num_lines(ngpio)?;
+        }
+
+        if let Some(label) = label {
+            bank.set_label(label)?;
+        }
+
+        if enable {
+            dev.enable()?;
+        }
+
+        Ok(Self {
+            _ctx: ctx,
+            dev,
+            bank,
+        })
+    }
+
+    pub fn chip_name(&self) -> &str {
+        self.bank.chip_name().unwrap()
+    }
+
+    pub fn dev_path(&self) -> PathBuf {
+        self.bank.dev_path().unwrap()
+    }
+
+    pub fn val(&self, offset: Offset) -> Result<Value> {
+        self.bank.val(offset)
+    }
+
+    pub fn set_label(&self, label: &str) -> Result<()> {
+        self.bank.set_label(label)
+    }
+
+    pub fn set_num_lines(&self, num: usize) -> Result<()> {
+        self.bank.set_num_lines(num)
+    }
+
+    pub fn set_line_name(&self, offset: Offset, name: &str) -> Result<()> {
+        self.bank.set_line_name(offset, name)
+    }
+
+    pub fn set_pull(&self, offset: Offset, pull: Pull) -> Result<()> {
+        self.bank.set_pull(offset, pull)
+    }
+
+    pub fn hog_line(&self, offset: Offset, name: &str, dir: Direction) -> Result<()> {
+        self.bank.hog_line(offset, name, dir)
+    }
+
+    pub fn enable(&self) -> Result<()> {
+        self.dev.enable()
+    }
+
+    pub fn disable(&self) -> Result<()> {
+        self.dev.disable()
+    }
+}
-- 
2.31.1.272.g89b43f80a514

