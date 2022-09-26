Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5955EA626
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 14:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239480AbiIZMba (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 08:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239491AbiIZMbH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 08:31:07 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CCA1F2EF
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:10:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 78so6203480pgb.13
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Cj3RZKURKt8Xu5v1/cctRzFsqTtNcw1t7dkd6bYhNrU=;
        b=GU5igkL68EszPDJsFiBhqqt/51MR7/J2OVf3WDKSV0k1q8lUxZQVMwkFTxUNUeDimC
         DDXcXAolgmeUoH6kaT3eOkiHtgCRIjUvzmNe9mRiODpxCThYhsLD3D7HWuDszxMnl/1R
         HYMpS3xSWVdMA/bGSKday/jbicAQWPJBk62SRODLZU5JeFevcM7iAarIX63tDa5XzGwY
         sfV/6Tbl62YRzV9aqfzLZNUxoVIQuVr9HKv2B7t2rLufGfFekw8whW81wyULkZpMIhuE
         ARgqaBVZwfVETbie3T0tgvHwXbm4vNehOBJXy3bphmunrz9lILYXsMgIGTR3ZmrxbJTF
         UwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Cj3RZKURKt8Xu5v1/cctRzFsqTtNcw1t7dkd6bYhNrU=;
        b=HYCfIib4rRJvbzL24lCVwmnj3zqxRH6nVSQojF5s74A/jBe6xq+NXGs3hN/Y03gLN5
         OsFabFb6oeWM1xNBaYDUbVjKuLRekjnujbm1u4EQ9HdHOkvmlK85cacgNis6dpmAsL7N
         W1GDfZKG2X0vqg0livXNgYv8ByF1JgH3c9iVu6HX2KoZCvYSY6djdPJd9XKbKIGOt9iB
         dH/0ZKkNjOmILPgxvsn6BDrW1/GbCLaR3CCeQ27gTD2n/cNY1eQN0vUWYh6jDOs28beo
         Gs47y/KBxRWQ0Vv14rMY6wc5Pge13sbbJGPp3bwAeEP2I2SAUDttBJhyz4atzkvpbeQs
         aHJQ==
X-Gm-Message-State: ACrzQf0DwwFVZJBzEOyqrouJ/iNS77UgCbqbShJmjgdiPpUlX3a/jOQB
        qneymJ5rqZDnwF2KpGSS3Vq3yg==
X-Google-Smtp-Source: AMsMyM554Mm5vuMu63dOv7eNuvtSNmF7pNWDoqxXpxcHn9XA8pwE4jzo1Zfcq/r1XhuKIbXV4gawHw==
X-Received: by 2002:a63:5fd6:0:b0:434:96fe:f508 with SMTP id t205-20020a635fd6000000b0043496fef508mr19342152pgb.306.1664190521069;
        Mon, 26 Sep 2022 04:08:41 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id e16-20020a056a0000d000b0053b208b55d1sm11895599pfj.85.2022.09.26.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:08:40 -0700 (PDT)
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
Subject: [PATCH V6 5/8] libgpiod: Add gpiosim rust crate
Date:   Mon, 26 Sep 2022 16:38:17 +0530
Message-Id: <e945bda65fb4071b3c28d742fe802363a629b61d.1664189248.git.viresh.kumar@linaro.org>
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

This adds gpiosim rust crate, which provides helpers to emulate GPIO
chips.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/Cargo.toml         |   3 +-
 bindings/rust/gpiosim/Cargo.toml |  18 ++
 bindings/rust/gpiosim/build.rs   |  43 ++++
 bindings/rust/gpiosim/src/lib.rs |  25 +++
 bindings/rust/gpiosim/src/sim.rs | 323 +++++++++++++++++++++++++++++++
 5 files changed, 411 insertions(+), 1 deletion(-)
 create mode 100644 bindings/rust/gpiosim/Cargo.toml
 create mode 100644 bindings/rust/gpiosim/build.rs
 create mode 100644 bindings/rust/gpiosim/src/lib.rs
 create mode 100644 bindings/rust/gpiosim/src/sim.rs

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index 1e57ef2c0002..8721bc610b86 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -2,5 +2,6 @@
 
 members = [
     "libgpiod-sys",
-    "libgpiod"
+    "libgpiod",
+    "gpiosim"
 ]
diff --git a/bindings/rust/gpiosim/Cargo.toml b/bindings/rust/gpiosim/Cargo.toml
new file mode 100644
index 000000000000..d6b4cc34339b
--- /dev/null
+++ b/bindings/rust/gpiosim/Cargo.toml
@@ -0,0 +1,18 @@
+[package]
+name = "gpiosim"
+version = "0.1.0"
+edition = "2018"
+
+# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
+
+[dependencies]
+libc = ">=0.2.39"
+libgpiod = { path = "../libgpiod" }
+vmm-sys-util = "=0.10.0"
+
+[features]
+generate = [ "bindgen" ]
+
+[build-dependencies]
+bindgen = { version = "0.59.1", optional = true }
+cc = "1.0.46"
diff --git a/bindings/rust/gpiosim/build.rs b/bindings/rust/gpiosim/build.rs
new file mode 100644
index 000000000000..460fb8c092c3
--- /dev/null
+++ b/bindings/rust/gpiosim/build.rs
@@ -0,0 +1,43 @@
+#[cfg(feature = "generate")]
+extern crate bindgen;
+#[cfg(feature = "generate")]
+use std::env;
+#[cfg(feature = "generate")]
+use std::path::PathBuf;
+
+#[cfg(feature = "generate")]
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
+    #[cfg(feature = "generate")]
+    generate_bindings();
+
+    println!("cargo:rustc-link-lib=kmod");
+    println!("cargo:rustc-link-lib=mount");
+    println!("cargo:rustc-link-search=./../../tests/gpiosim/.libs/");
+    println!("cargo:rustc-link-lib=static=gpiosim");
+}
diff --git a/bindings/rust/gpiosim/src/lib.rs b/bindings/rust/gpiosim/src/lib.rs
new file mode 100644
index 000000000000..94d0ddb38e0f
--- /dev/null
+++ b/bindings/rust/gpiosim/src/lib.rs
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#[allow(non_camel_case_types, non_upper_case_globals)]
+#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
+#[allow(dead_code)]
+mod bindings_raw {
+    #[cfg(feature = "generate")]
+    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
+
+    #[cfg(not(feature = "generate"))]
+    include!("bindings.rs");
+}
+
+use bindings_raw::*;
+
+pub use bindings_raw::{
+    GPIOSIM_HOG_DIR_INPUT, GPIOSIM_HOG_DIR_OUTPUT_HIGH, GPIOSIM_HOG_DIR_OUTPUT_LOW,
+    GPIOSIM_PULL_DOWN, GPIOSIM_PULL_UP, GPIOSIM_VALUE_ACTIVE, GPIOSIM_VALUE_INACTIVE,
+};
+
+#[allow(dead_code)]
+mod sim;
+
+#[allow(unused_imports)]
+pub use sim::*;
diff --git a/bindings/rust/gpiosim/src/sim.rs b/bindings/rust/gpiosim/src/sim.rs
new file mode 100644
index 000000000000..50977ea54ebb
--- /dev/null
+++ b/bindings/rust/gpiosim/src/sim.rs
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use libc::strlen;
+use std::os::raw::c_char;
+use std::path::PathBuf;
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as Errno;
+
+use libgpiod::{Error, Offset, OperationType, Result};
+
+use crate::*;
+
+/// Sim Ctx
+#[derive(Debug)]
+struct SimCtx {
+    ctx: *mut gpiosim_ctx,
+}
+
+unsafe impl Send for SimCtx {}
+unsafe impl Sync for SimCtx {}
+
+impl SimCtx {
+    fn new() -> Result<Self> {
+        let ctx = unsafe { gpiosim_ctx_new() };
+        if ctx.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::SimCtxNew,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { ctx })
+    }
+
+    fn ctx(&self) -> *mut gpiosim_ctx {
+        self.ctx
+    }
+}
+
+impl Drop for SimCtx {
+    fn drop(&mut self) {
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
+unsafe impl Send for SimDev {}
+unsafe impl Sync for SimDev {}
+
+impl SimDev {
+    fn new(ctx: &SimCtx) -> Result<Self> {
+        let dev = unsafe { gpiosim_dev_new(ctx.ctx()) };
+        if dev.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::SimDevNew,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { dev })
+    }
+
+    fn dev(&self) -> *mut gpiosim_dev {
+        self.dev
+    }
+
+    fn enable(&self) -> Result<()> {
+        let ret = unsafe { gpiosim_dev_enable(self.dev) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimDevEnable,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn disable(&self) -> Result<()> {
+        let ret = unsafe { gpiosim_dev_disable(self.dev) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimDevDisable,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl Drop for SimDev {
+    fn drop(&mut self) {
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
+unsafe impl Send for SimBank {}
+unsafe impl Sync for SimBank {}
+
+impl SimBank {
+    fn new(dev: &SimDev) -> Result<Self> {
+        let bank = unsafe { gpiosim_bank_new(dev.dev()) };
+        if bank.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::SimBankNew,
+                Errno::last(),
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
+        str::from_utf8(unsafe { slice::from_raw_parts(name as *const u8, strlen(name) as usize) })
+            .map_err(Error::StringNotUtf8)
+    }
+
+    fn dev_path(&self) -> Result<PathBuf> {
+        // SAFETY: The string returned by gpiosim is guaranteed to live as long
+        // as the `struct SimBank`.
+        let path = unsafe { gpiosim_bank_get_dev_path(self.bank) };
+
+        // SAFETY: The string is guaranteed to be valid here.
+        let path = str::from_utf8(unsafe {
+            slice::from_raw_parts(path as *const u8, strlen(path) as usize)
+        })
+        .map_err(Error::StringNotUtf8)?;
+
+        Ok(PathBuf::from(path))
+    }
+
+    fn val(&self, offset: Offset) -> Result<u32> {
+        let ret = unsafe { gpiosim_bank_get_value(self.bank, offset) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankGetVal,
+                Errno::last(),
+            ))
+        } else {
+            Ok(ret as u32)
+        }
+    }
+
+    fn set_label(&self, label: &str) -> Result<()> {
+        // Null-terminate the string
+        let label = label.to_owned() + "\0";
+
+        let ret = unsafe { gpiosim_bank_set_label(self.bank, label.as_ptr() as *const c_char) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetLabel,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_num_lines(&self, num: u64) -> Result<()> {
+        let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num) };
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetNumLines,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_line_name(&self, offset: Offset, name: &str) -> Result<()> {
+        // Null-terminate the string
+        let name = name.to_owned() + "\0";
+
+        let ret = unsafe {
+            gpiosim_bank_set_line_name(self.bank, offset, name.as_ptr() as *const c_char)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetLineName,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_pull(&self, offset: Offset, pull: i32) -> Result<()> {
+        let ret = unsafe { gpiosim_bank_set_pull(self.bank, offset, pull) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankSetPull,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn hog_line(&self, offset: Offset, name: &str, dir: i32) -> Result<()> {
+        // Null-terminate the string
+        let name = name.to_owned() + "\0";
+
+        let ret = unsafe {
+            gpiosim_bank_hog_line(self.bank, offset, name.as_ptr() as *const c_char, dir)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::SimBankHogLine,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl Drop for SimBank {
+    fn drop(&mut self) {
+        unsafe { gpiosim_bank_unref(self.bank) }
+    }
+}
+
+/// GPIO SIM
+#[derive(Debug)]
+pub struct Sim {
+    ctx: SimCtx,
+    dev: SimDev,
+    bank: SimBank,
+}
+
+unsafe impl Send for Sim {}
+unsafe impl Sync for Sim {}
+
+impl Sim {
+    pub fn new(ngpio: Option<u64>, label: Option<&str>, enable: bool) -> Result<Self> {
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
+        Ok(Self { ctx, dev, bank })
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
+    pub fn val(&self, offset: Offset) -> Result<u32> {
+        self.bank.val(offset)
+    }
+
+    pub fn set_label(&self, label: &str) -> Result<()> {
+        self.bank.set_label(label)
+    }
+
+    pub fn set_num_lines(&self, num: u64) -> Result<()> {
+        self.bank.set_num_lines(num)
+    }
+
+    pub fn set_line_name(&self, offset: Offset, name: &str) -> Result<()> {
+        self.bank.set_line_name(offset, name)
+    }
+
+    pub fn set_pull(&self, offset: Offset, pull: i32) -> Result<()> {
+        self.bank.set_pull(offset, pull)
+    }
+
+    pub fn hog_line(&self, offset: Offset, name: &str, dir: i32) -> Result<()> {
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

