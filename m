Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9100256B8A1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237731AbiGHLf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237768AbiGHLf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:35:26 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363D2205C4
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:35:24 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id y18so8119180plb.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ds8Lr8b/1Qf9J5alzfmtH/Gy059q/JeOaHSsXt46Eqs=;
        b=RGt6g1a5BGL2szpVANc4TsirvYABK6MsSnpEfqL9s2c8XAeHEkmQamVpUrRadNy6Ja
         zwtS5GN6t0DiPLLVPWapD1q/Bbj/Oeqe2lyTOoKSUfGteliIDoVXPxEVN8Fz8yI4ykib
         flamQ73iCJLZbccIoE9oVlBg1C1qJ3DOqGcp/Tsq6hSAG6Gl1hYU+jlJB/CLvv/hLKgq
         M88Rffqs5wojDaJERuiScBb6U1cVbm7iqtWY5iABEqfCTXIhv4BiMMWEWgR86de+ckvJ
         KNOpb5rSryui7t2wWIrmGgHgl01PXKS2LzNROifudnHWo+QzFuF/CTkOHcCz+GFuTw5k
         7a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ds8Lr8b/1Qf9J5alzfmtH/Gy059q/JeOaHSsXt46Eqs=;
        b=AgqOArewZkQ2pwu62w4iK45t/PgWOFUn/biyQ0hVevdXj+UrYalrSPsWHECecdxthb
         p7Swy51D7LBT40TC50irMsYbNU+dqjeeQ7LagL5lkZUaUU4bcj7XRTvcsz2TY3+uspw9
         t7ajZgquHUh74JLH/qqUZDj6oiREOLTEUwbmDM0tdu6aOjNIE6EN+sj9k6m7p8+oGz13
         vCCbONGXdoz/u9mT8tgAiAbcA39ES/AUwuVUAxuAUrvD9KQICM+GWe95isgVK96rWLuI
         h9AJzFC+0iEn5Nah+V10YL/F8T0qyXGdR61/+DAVrrYoUlHQNoqqRjgovNBhEnTXc3el
         iXOA==
X-Gm-Message-State: AJIora869WwlfZKFckJkeImcYRMo0b/zwqyMtDDtUXx1BtO4jxAKdoDe
        x3hsHswZoTRo24cQDWO/75kemQ==
X-Google-Smtp-Source: AGRyM1ub5jTIdESfbqnpH6vQRkPROXlvW0o47FKopTfCTGnYLBTEJ5puhKwcMmI0y/dqJqnI1M31ow==
X-Received: by 2002:a17:903:3093:b0:16b:deea:4d36 with SMTP id u19-20020a170903309300b0016bdeea4d36mr3208308plc.126.1657280123409;
        Fri, 08 Jul 2022 04:35:23 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id u13-20020a62790d000000b0052896629f66sm3504270pfc.208.2022.07.08.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:35:23 -0700 (PDT)
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
Subject: [PATCH V4 7/8] libgpiod: Add rust tests
Date:   Fri,  8 Jul 2022 17:05:00 +0530
Message-Id: <78b3ee21dec2a66003c2eae2800e9699a8ecd180.1657279685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1657279685.git.viresh.kumar@linaro.org>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add tests for the rust bindings, quite similar to the ones in cxx
bindings.

This is how "cargo test" prints results:

     Running tests/chip.rs (target/debug/deps/chip-b19008e6b9a10d2f)

running 6 tests
test chip::create::nonexistent_file_failure ... ok
test chip::create::no_dev_file_failure ... ok
test chip::create::non_gpio_char_dev_file_failure ... ok
test chip::create::existing ... ok
test chip::configure::line_lookup ... ok
test chip::configure::verify ... ok

test result: ok. 6 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.14s

     Running tests/edge_event.rs (target/debug/deps/edge_event-5897a36c91efe0d4)

running 11 tests
test edge_event::buffer_settings::default_capacity ... ok
test edge_event::buffer_settings::user_defined_capacity ... ok
test edge_event::buffer_settings::max_capacity ... ok
test edge_event::failure::dir_out_edge_failure ... ok
test edge_event::failure::wait_timeout ... ok
test edge_event::verify::both_edges ... ok
test edge_event::verify::multiple_events ... ok
test edge_event::verify::edge_sequence ... ok
test edge_event::verify::falling_edge ... ok
test edge_event::verify::over_capacity ... ok
test edge_event::verify::rising_edge ... ok

test result: ok. 11 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.98s

     Running tests/info_event.rs (target/debug/deps/info_event-707c734e0820381c)

running 3 tests
test info_event::watch::verify ... ok
test info_event::watch::failure ... ok
test info_event::watch::reconfigure ... ok

test result: ok. 3 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.26s

     Running tests/line_config.rs (target/debug/deps/line_config-d376966750bf38a0)

running 9 tests
test line_config::overrides::active_low ... ok
test line_config::overrides::bias ... ok
test line_config::default::verify ... ok
test line_config::overrides::debounce_period ... ok
test line_config::overrides::direction ... ok
test line_config::overrides::drive ... ok
test line_config::overrides::edge_detection ... ok
test line_config::overrides::event_clock ... ok
test line_config::overrides::output_value ... ok

test result: ok. 9 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.06s

     Running tests/line_info.rs (target/debug/deps/line_info-5069196cfaa74ab7)

running 2 tests
[40570.967204] gpio-1992 (hog): hogged as output/high
[40570.974774] gpio-1956 (hog4): hogged as output/low
[40570.975314] gpio-1955 (hog3): hogged as output/high
test line_info::properties::verify ... ok
test line_info::basic::verify ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.31s

     Running tests/line_request.rs (target/debug/deps/line_request-914b9fd8c84e2c4b)

running 7 tests
test line_request::invalid_arguments::no_offsets ... ok
test line_request::verify::read_values ... ok
test line_request::verify::set_bias ... ok
test line_request::verify::reconfigure_output_values ... ok
test line_request::verify::empty_consumer ... ok
test line_request::verify::set_output_values ... ok
test line_request::verify::custom_consumer ... ok

test result: ok. 7 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.48s

     Running tests/request_config.rs (target/debug/deps/request_config-99e366517cc0feda)

running 2 tests
test request_config::verify::default ... ok
test request_config::verify::initialized ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.03s

   Doc-tests libgpiod

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/Cargo.toml              |   3 +
 bindings/rust/src/line_request.rs     |   1 +
 bindings/rust/tests/chip.rs           |  96 +++++++
 bindings/rust/tests/common/config.rs  | 117 ++++++++
 bindings/rust/tests/common/mod.rs     |  16 ++
 bindings/rust/tests/common/sim.rs     | 306 ++++++++++++++++++++
 bindings/rust/tests/edge_event.rs     | 389 ++++++++++++++++++++++++++
 bindings/rust/tests/info_event.rs     | 126 +++++++++
 bindings/rust/tests/line_config.rs    | 187 +++++++++++++
 bindings/rust/tests/line_info.rs      |  90 ++++++
 bindings/rust/tests/line_request.rs   | 234 ++++++++++++++++
 bindings/rust/tests/request_config.rs |  42 +++
 12 files changed, 1607 insertions(+)
 create mode 100644 bindings/rust/tests/chip.rs
 create mode 100644 bindings/rust/tests/common/config.rs
 create mode 100644 bindings/rust/tests/common/mod.rs
 create mode 100644 bindings/rust/tests/common/sim.rs
 create mode 100644 bindings/rust/tests/edge_event.rs
 create mode 100644 bindings/rust/tests/info_event.rs
 create mode 100644 bindings/rust/tests/line_config.rs
 create mode 100644 bindings/rust/tests/line_info.rs
 create mode 100644 bindings/rust/tests/line_request.rs
 create mode 100644 bindings/rust/tests/request_config.rs

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index d5d81486fa2f..e2d6d5bb91b6 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -10,3 +10,6 @@ libc = ">=0.2.39"
 libgpiod-sys = { path = "libgpiod-sys" }
 thiserror = "1.0"
 vmm-sys-util = "=0.9.0"
+
+[dev-dependencies]
+libgpiod-sys = { path = "libgpiod-sys", features = ["gpiosim"] }
diff --git a/bindings/rust/src/line_request.rs b/bindings/rust/src/line_request.rs
index bb338e72671d..c1dbbb397e73 100644
--- a/bindings/rust/src/line_request.rs
+++ b/bindings/rust/src/line_request.rs
@@ -15,6 +15,7 @@ use super::{bindings, ChipInternal, EdgeEventBuffer, Error, LineConfig, RequestC
 /// Line request operations
 ///
 /// Allows interaction with a set of requested lines.
+#[derive(Debug)]
 pub struct LineRequest {
     request: *mut bindings::gpiod_line_request,
 }
diff --git a/bindings/rust/tests/chip.rs b/bindings/rust/tests/chip.rs
new file mode 100644
index 000000000000..4e64e9c7e291
--- /dev/null
+++ b/bindings/rust/tests/chip.rs
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod chip {
+    use libc::{ENODEV, ENOENT, ENOTTY};
+
+    use vmm_sys_util::errno::Error as IoError;
+
+    use crate::common::*;
+    use libgpiod::{Chip, Error as ChipError};
+
+    mod create {
+        use super::*;
+
+        #[test]
+        fn nonexistent_file_failure() {
+            assert_eq!(
+                Chip::open("/dev/nonexistent").unwrap_err(),
+                ChipError::OperationFailed("Gpio Chip open", IoError::new(ENOENT))
+            );
+        }
+
+        #[test]
+        fn no_dev_file_failure() {
+            assert_eq!(
+                Chip::open("/tmp").unwrap_err(),
+                ChipError::OperationFailed("Gpio Chip open", IoError::new(ENOTTY))
+            );
+        }
+
+        #[test]
+        fn non_gpio_char_dev_file_failure() {
+            assert_eq!(
+                Chip::open("/dev/null").unwrap_err(),
+                ChipError::OperationFailed("Gpio Chip open", IoError::new(ENODEV))
+            );
+        }
+
+        #[test]
+        fn existing() {
+            let sim = Sim::new(None, None, true).unwrap();
+            Chip::open(sim.dev_path()).unwrap();
+        }
+    }
+
+    mod configure {
+        use super::*;
+        const NGPIO: u64 = 16;
+        const LABEL: &str = "foobar";
+
+        #[test]
+        fn verify() {
+            let sim = Sim::new(Some(NGPIO), Some(LABEL), true).unwrap();
+            let chip = Chip::open(sim.dev_path()).unwrap();
+
+            assert_eq!(chip.get_label().unwrap(), LABEL);
+            assert_eq!(chip.get_name().unwrap(), sim.chip_name());
+            assert_eq!(chip.get_path().unwrap(), sim.dev_path());
+            assert_eq!(chip.get_num_lines(), NGPIO as u32);
+            chip.get_fd().unwrap();
+        }
+
+        #[test]
+        fn line_lookup() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.set_line_name(0, "zero").unwrap();
+            sim.set_line_name(2, "two").unwrap();
+            sim.set_line_name(3, "three").unwrap();
+            sim.set_line_name(5, "five").unwrap();
+            sim.set_line_name(10, "ten").unwrap();
+            sim.set_line_name(11, "ten").unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(sim.dev_path()).unwrap();
+
+            // Success case
+            assert_eq!(chip.find_line("zero").unwrap(), 0);
+            assert_eq!(chip.find_line("two").unwrap(), 2);
+            assert_eq!(chip.find_line("three").unwrap(), 3);
+            assert_eq!(chip.find_line("five").unwrap(), 5);
+
+            // Success with duplicate names, should return first entry
+            assert_eq!(chip.find_line("ten").unwrap(), 10);
+
+            // Failure
+            assert_eq!(
+                chip.find_line("nonexistent").unwrap_err(),
+                ChipError::OperationFailed("Gpio Chip find-line", IoError::new(ENOENT))
+            );
+        }
+    }
+}
diff --git a/bindings/rust/tests/common/config.rs b/bindings/rust/tests/common/config.rs
new file mode 100644
index 000000000000..3abd9a8c4c8b
--- /dev/null
+++ b/bindings/rust/tests/common/config.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::sync::Arc;
+
+use crate::common::*;
+
+use libgpiod::{Bias, Chip, Direction, Edge, LineConfig, LineRequest, RequestConfig, Result};
+
+//#[derive(Debug)]
+pub(crate) struct TestConfig {
+    sim: Arc<Sim>,
+    chip: Option<Chip>,
+    request: Option<LineRequest>,
+    rconfig: RequestConfig,
+    lconfig: LineConfig,
+}
+
+impl TestConfig {
+    pub(crate) fn new(ngpio: u64) -> Result<Self> {
+        Ok(Self {
+            sim: Arc::new(Sim::new(Some(ngpio), None, true)?),
+            chip: None,
+            request: None,
+            rconfig: RequestConfig::new().unwrap(),
+            lconfig: LineConfig::new().unwrap(),
+        })
+    }
+
+    pub(crate) fn set_pull(&self, offsets: &[u32], pulls: &[u32]) {
+        for i in 0..pulls.len() {
+            self.sim.set_pull(offsets[i], pulls[i] as i32).unwrap();
+        }
+    }
+
+    pub(crate) fn rconfig_consumer(&self, offsets: Option<&[u32]>, consumer: Option<&str>) {
+        if let Some(offsets) = offsets {
+            self.rconfig.set_offsets(offsets);
+        }
+
+        if let Some(consumer) = consumer {
+            self.rconfig.set_consumer(consumer);
+        }
+    }
+
+    pub(crate) fn rconfig(&self, offsets: Option<&[u32]>) {
+        self.rconfig_consumer(offsets, None);
+    }
+
+    pub(crate) fn lconfig(
+        &mut self,
+        dir: Option<Direction>,
+        val: Option<u32>,
+        val_override: Option<(u32, u32)>,
+        edge: Option<Edge>,
+        bias: Option<Bias>,
+    ) {
+        if let Some(bias) = bias {
+            self.lconfig.set_bias_default(bias);
+        }
+
+        if let Some(edge) = edge {
+            self.lconfig.set_edge_detection_default(edge);
+        }
+
+        if let Some(dir) = dir {
+            self.lconfig.set_direction_default(dir);
+        }
+
+        if let Some(val) = val {
+            self.lconfig.set_output_value_default(val);
+        }
+
+        if let Some((offset, val)) = val_override {
+            self.lconfig.set_output_value_override(val, offset);
+        }
+    }
+
+    pub(crate) fn lconfig_raw(&mut self) {
+        self.lconfig(None, None, None, None, None);
+    }
+
+    pub(crate) fn lconfig_edge(&mut self, edge: Option<Edge>) {
+        self.lconfig(None, None, None, edge, None);
+    }
+
+    pub(crate) fn request_lines(&mut self) -> Result<()> {
+        let chip = Chip::open(self.sim.dev_path())?;
+
+        self.request = Some(chip.request_lines(&self.rconfig, &self.lconfig)?);
+        self.chip = Some(chip);
+
+        Ok(())
+    }
+
+    pub(crate) fn sim(&self) -> Arc<Sim> {
+        self.sim.clone()
+    }
+
+    pub(crate) fn chip(&self) -> &Chip {
+        &self.chip.as_ref().unwrap()
+    }
+
+    pub(crate) fn request(&self) -> &LineRequest {
+        &self.request.as_ref().unwrap()
+    }
+}
+
+impl Drop for TestConfig {
+    fn drop(&mut self) {
+        // Explicit freeing is important to make sure "request" get freed
+        // before "sim" and "chip".
+        self.request = None;
+    }
+}
diff --git a/bindings/rust/tests/common/mod.rs b/bindings/rust/tests/common/mod.rs
new file mode 100644
index 000000000000..2dc37986396b
--- /dev/null
+++ b/bindings/rust/tests/common/mod.rs
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+#[allow(dead_code)]
+mod sim;
+
+#[allow(unused_imports)]
+pub(crate) use sim::*;
+
+#[allow(dead_code)]
+mod config;
+
+#[allow(unused_imports)]
+pub(crate) use config::*;
diff --git a/bindings/rust/tests/common/sim.rs b/bindings/rust/tests/common/sim.rs
new file mode 100644
index 000000000000..cd5ec66c3da5
--- /dev/null
+++ b/bindings/rust/tests/common/sim.rs
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::raw::c_char;
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as IoError;
+
+use libgpiod::{Error, Result};
+use libgpiod_sys as bindings;
+
+/// Sim Ctx
+#[derive(Debug)]
+struct SimCtx {
+    ctx: *mut bindings::gpiosim_ctx,
+}
+
+unsafe impl Send for SimCtx {}
+unsafe impl Sync for SimCtx {}
+
+impl SimCtx {
+    fn new() -> Result<Self> {
+        let ctx = unsafe { bindings::gpiosim_ctx_new() };
+        if ctx.is_null() {
+            return Err(Error::OperationFailed("gpio-sim ctx new", IoError::last()));
+        }
+
+        Ok(Self { ctx })
+    }
+
+    fn ctx(&self) -> *mut bindings::gpiosim_ctx {
+        self.ctx
+    }
+}
+
+impl Drop for SimCtx {
+    fn drop(&mut self) {
+        unsafe { bindings::gpiosim_ctx_unref(self.ctx) }
+    }
+}
+
+/// Sim Dev
+#[derive(Debug)]
+struct SimDev {
+    dev: *mut bindings::gpiosim_dev,
+}
+
+unsafe impl Send for SimDev {}
+unsafe impl Sync for SimDev {}
+
+impl SimDev {
+    fn new(ctx: &SimCtx) -> Result<Self> {
+        let dev = unsafe { bindings::gpiosim_dev_new(ctx.ctx()) };
+        if dev.is_null() {
+            return Err(Error::OperationFailed("gpio-sim dev new", IoError::last()));
+        }
+
+        Ok(Self { dev })
+    }
+
+    fn dev(&self) -> *mut bindings::gpiosim_dev {
+        self.dev
+    }
+
+    fn enable(&self) -> Result<()> {
+        let ret = unsafe { bindings::gpiosim_dev_enable(self.dev) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "gpio-sim dev-enable",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn disable(&self) -> Result<()> {
+        let ret = unsafe { bindings::gpiosim_dev_disable(self.dev) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "gpio-sim dev-disable",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl Drop for SimDev {
+    fn drop(&mut self) {
+        unsafe { bindings::gpiosim_dev_unref(self.dev) }
+    }
+}
+
+/// Sim Bank
+#[derive(Debug)]
+struct SimBank {
+    bank: *mut bindings::gpiosim_bank,
+}
+
+unsafe impl Send for SimBank {}
+unsafe impl Sync for SimBank {}
+
+impl SimBank {
+    fn new(dev: &SimDev) -> Result<Self> {
+        let bank = unsafe { bindings::gpiosim_bank_new(dev.dev()) };
+        if bank.is_null() {
+            return Err(Error::OperationFailed("gpio-sim Bank new", IoError::last()));
+        }
+
+        Ok(Self { bank })
+    }
+
+    fn chip_name(&self) -> Result<&str> {
+        // SAFETY: The string returned by gpiosim is guaranteed to live as long
+        // as the `struct SimBank`.
+        let name = unsafe { bindings::gpiosim_bank_get_chip_name(self.bank) };
+
+        // SAFETY: The string is guaranteed to be valid here.
+        str::from_utf8(unsafe {
+            slice::from_raw_parts(name as *const u8, bindings::strlen(name) as usize)
+        })
+        .map_err(Error::InvalidString)
+    }
+
+    fn dev_path(&self) -> Result<&str> {
+        // SAFETY: The string returned by gpiosim is guaranteed to live as long
+        // as the `struct SimBank`.
+        let path = unsafe { bindings::gpiosim_bank_get_dev_path(self.bank) };
+
+        // SAFETY: The string is guaranteed to be valid here.
+        str::from_utf8(unsafe {
+            slice::from_raw_parts(path as *const u8, bindings::strlen(path) as usize)
+        })
+        .map_err(Error::InvalidString)
+    }
+
+    fn val(&self, offset: u32) -> Result<u32> {
+        let ret = unsafe { bindings::gpiosim_bank_get_value(self.bank, offset) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "gpio-sim get-value",
+                IoError::last(),
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
+        let ret =
+            unsafe { bindings::gpiosim_bank_set_label(self.bank, label.as_ptr() as *const c_char) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "gpio-sim set-label",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_num_lines(&self, num: u64) -> Result<()> {
+        let ret = unsafe { bindings::gpiosim_bank_set_num_lines(self.bank, num) };
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "gpio-sim set-num-lines",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_line_name(&self, offset: u32, name: &str) -> Result<()> {
+        // Null-terminate the string
+        let name = name.to_owned() + "\0";
+
+        let ret = unsafe {
+            bindings::gpiosim_bank_set_line_name(self.bank, offset, name.as_ptr() as *const c_char)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "gpio-sim set-line-name",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn set_pull(&self, offset: u32, pull: i32) -> Result<()> {
+        let ret = unsafe { bindings::gpiosim_bank_set_pull(self.bank, offset, pull) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed("gpio-sim set-pull", IoError::last()))
+        } else {
+            Ok(())
+        }
+    }
+
+    fn hog_line(&self, offset: u32, name: &str, dir: i32) -> Result<()> {
+        // Null-terminate the string
+        let name = name.to_owned() + "\0";
+
+        let ret = unsafe {
+            bindings::gpiosim_bank_hog_line(self.bank, offset, name.as_ptr() as *const c_char, dir)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed("gpio-sim hog-line", IoError::last()))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl Drop for SimBank {
+    fn drop(&mut self) {
+        unsafe { bindings::gpiosim_bank_unref(self.bank) }
+    }
+}
+
+/// GPIO SIM
+#[derive(Debug)]
+pub(crate) struct Sim {
+    ctx: SimCtx,
+    dev: SimDev,
+    bank: SimBank,
+}
+
+unsafe impl Send for Sim {}
+unsafe impl Sync for Sim {}
+
+impl Sim {
+    pub(crate) fn new(ngpio: Option<u64>, label: Option<&str>, enable: bool) -> Result<Self> {
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
+    pub(crate) fn chip_name(&self) -> &str {
+        self.bank.chip_name().unwrap()
+    }
+
+    pub fn dev_path(&self) -> &str {
+        self.bank.dev_path().unwrap()
+    }
+
+    pub(crate) fn val(&self, offset: u32) -> Result<u32> {
+        self.bank.val(offset)
+    }
+
+    pub(crate) fn set_label(&self, label: &str) -> Result<()> {
+        self.bank.set_label(label)
+    }
+
+    pub(crate) fn set_num_lines(&self, num: u64) -> Result<()> {
+        self.bank.set_num_lines(num)
+    }
+
+    pub(crate) fn set_line_name(&self, offset: u32, name: &str) -> Result<()> {
+        self.bank.set_line_name(offset, name)
+    }
+
+    pub(crate) fn set_pull(&self, offset: u32, pull: i32) -> Result<()> {
+        self.bank.set_pull(offset, pull)
+    }
+
+    pub(crate) fn hog_line(&self, offset: u32, name: &str, dir: i32) -> Result<()> {
+        self.bank.hog_line(offset, name, dir)
+    }
+
+    pub(crate) fn enable(&self) -> Result<()> {
+        self.dev.enable()
+    }
+
+    pub(crate) fn disable(&self) -> Result<()> {
+        self.dev.disable()
+    }
+}
diff --git a/bindings/rust/tests/edge_event.rs b/bindings/rust/tests/edge_event.rs
new file mode 100644
index 000000000000..1b05b225aab7
--- /dev/null
+++ b/bindings/rust/tests/edge_event.rs
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod edge_event {
+    use libc::EINVAL;
+    use std::sync::Arc;
+    use std::thread::{sleep, spawn};
+    use std::time::Duration;
+
+    use vmm_sys_util::errno::Error as IoError;
+
+    use crate::common::*;
+    use libgpiod::{Direction, Edge, EdgeEventBuffer, Error as ChipError, LineEdgeEvent};
+    use libgpiod_sys::{GPIOSIM_PULL_DOWN, GPIOSIM_PULL_UP};
+
+    const NGPIO: u64 = 8;
+
+    mod buffer_settings {
+        use super::*;
+
+        #[test]
+        fn default_capacity() {
+            assert_eq!(EdgeEventBuffer::new(0).unwrap().get_capacity(), 64);
+        }
+
+        #[test]
+        fn user_defined_capacity() {
+            assert_eq!(EdgeEventBuffer::new(123).unwrap().get_capacity(), 123);
+        }
+
+        #[test]
+        fn max_capacity() {
+            assert_eq!(EdgeEventBuffer::new(1024 * 2).unwrap().get_capacity(), 1024);
+        }
+    }
+
+    mod failure {
+        use super::*;
+
+        #[test]
+        fn wait_timeout() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[0]));
+            config.lconfig_edge(Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // No events available
+            assert_eq!(
+                config
+                    .request()
+                    .wait_edge_event(Duration::from_millis(100))
+                    .unwrap_err(),
+                ChipError::OperationTimedOut
+            );
+        }
+
+        #[test]
+        fn dir_out_edge_failure() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[0]));
+            config.lconfig(Some(Direction::Output), None, None, Some(Edge::Both), None);
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed("Gpio LineRequest request-lines", IoError::new(EINVAL))
+            );
+        }
+    }
+
+    mod verify {
+        use super::*;
+
+        // Helpers to generate events
+        fn trigger_falling_and_rising_edge(sim: Arc<Sim>, offset: u32) {
+            spawn(move || {
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset, GPIOSIM_PULL_UP as i32).unwrap();
+
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset, GPIOSIM_PULL_DOWN as i32).unwrap();
+            });
+        }
+
+        fn trigger_rising_edge_events_on_two_offsets(sim: Arc<Sim>, offset: [u32; 2]) {
+            spawn(move || {
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset[0], GPIOSIM_PULL_UP as i32).unwrap();
+
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset[1], GPIOSIM_PULL_UP as i32).unwrap();
+            });
+        }
+
+        fn trigger_multiple_events(sim: Arc<Sim>, offset: u32) {
+            sim.set_pull(offset, GPIOSIM_PULL_UP as i32).unwrap();
+            sleep(Duration::from_millis(10));
+
+            sim.set_pull(offset, GPIOSIM_PULL_DOWN as i32).unwrap();
+            sleep(Duration::from_millis(10));
+
+            sim.set_pull(offset, GPIOSIM_PULL_UP as i32).unwrap();
+            sleep(Duration::from_millis(10));
+        }
+
+        #[test]
+        fn both_edges() {
+            const GPIO: u32 = 2;
+            let buf = EdgeEventBuffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[GPIO]));
+            config.lconfig_edge(Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_falling_and_rising_edge(config.sim(), GPIO);
+
+            // Rising event
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                1
+            );
+            assert_eq!(buf.get_num_events(), 1);
+
+            let event = buf.get_event(0).unwrap();
+            let ts_rising = event.get_timestamp();
+            assert_eq!(event.get_event_type().unwrap(), LineEdgeEvent::Rising);
+            assert_eq!(event.get_line_offset(), GPIO);
+
+            // Falling event
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                1
+            );
+            assert_eq!(buf.get_num_events(), 1);
+
+            let event = buf.get_event(0).unwrap();
+            let ts_falling = event.get_timestamp();
+            assert_eq!(event.get_event_type().unwrap(), LineEdgeEvent::Falling);
+            assert_eq!(event.get_line_offset(), GPIO);
+
+            // No events available
+            assert_eq!(
+                config
+                    .request()
+                    .wait_edge_event(Duration::from_millis(100))
+                    .unwrap_err(),
+                ChipError::OperationTimedOut
+            );
+
+            assert!(ts_falling > ts_rising);
+        }
+
+        #[test]
+        fn rising_edge() {
+            const GPIO: u32 = 6;
+            let buf = EdgeEventBuffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[GPIO]));
+            config.lconfig_edge(Some(Edge::Rising));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_falling_and_rising_edge(config.sim(), GPIO);
+
+            // Rising event
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                1
+            );
+            assert_eq!(buf.get_num_events(), 1);
+
+            let event = buf.get_event(0).unwrap();
+            assert_eq!(event.get_event_type().unwrap(), LineEdgeEvent::Rising);
+            assert_eq!(event.get_line_offset(), GPIO);
+
+            // No events available
+            assert_eq!(
+                config
+                    .request()
+                    .wait_edge_event(Duration::from_millis(100))
+                    .unwrap_err(),
+                ChipError::OperationTimedOut
+            );
+        }
+
+        #[test]
+        fn falling_edge() {
+            const GPIO: u32 = 7;
+            let buf = EdgeEventBuffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[GPIO]));
+            config.lconfig_edge(Some(Edge::Falling));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_falling_and_rising_edge(config.sim(), GPIO);
+
+            // Falling event
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                1
+            );
+            assert_eq!(buf.get_num_events(), 1);
+
+            let event = buf.get_event(0).unwrap();
+            assert_eq!(event.get_event_type().unwrap(), LineEdgeEvent::Falling);
+            assert_eq!(event.get_line_offset(), GPIO);
+
+            // No events available
+            assert_eq!(
+                config
+                    .request()
+                    .wait_edge_event(Duration::from_millis(100))
+                    .unwrap_err(),
+                ChipError::OperationTimedOut
+            );
+        }
+
+        #[test]
+        fn edge_sequence() {
+            const GPIO: [u32; 2] = [0, 1];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&GPIO));
+            config.lconfig_edge(Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_rising_edge_events_on_two_offsets(config.sim(), GPIO);
+
+            // Rising event GPIO 0
+            let buf = EdgeEventBuffer::new(0).unwrap();
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                1
+            );
+            assert_eq!(buf.get_num_events(), 1);
+
+            let event = buf.get_event(0).unwrap();
+            assert_eq!(event.get_event_type().unwrap(), LineEdgeEvent::Rising);
+            assert_eq!(event.get_line_offset(), GPIO[0]);
+            assert_eq!(event.get_global_seqno(), 1);
+            assert_eq!(event.get_line_seqno(), 1);
+
+            // Rising event GPIO 1
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                1
+            );
+            assert_eq!(buf.get_num_events(), 1);
+
+            let event = buf.get_event(0).unwrap();
+            assert_eq!(event.get_event_type().unwrap(), LineEdgeEvent::Rising);
+            assert_eq!(event.get_line_offset(), GPIO[1]);
+            assert_eq!(event.get_global_seqno(), 2);
+            assert_eq!(event.get_line_seqno(), 1);
+
+            // No events available
+            assert_eq!(
+                config
+                    .request()
+                    .wait_edge_event(Duration::from_millis(100))
+                    .unwrap_err(),
+                ChipError::OperationTimedOut
+            );
+        }
+
+        #[test]
+        fn multiple_events() {
+            const GPIO: u32 = 1;
+            let buf = EdgeEventBuffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[GPIO]));
+            config.lconfig_edge(Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_multiple_events(config.sim(), GPIO);
+
+            // Read multiple events
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                3
+            );
+            assert_eq!(buf.get_num_events(), 3);
+
+            let mut global_seqno = 1;
+            let mut line_seqno = 1;
+
+            // Verify sequence number of events
+            for i in 0..3 {
+                let event = buf.get_event(i).unwrap();
+                assert_eq!(event.get_line_offset(), GPIO);
+                assert_eq!(event.get_global_seqno(), global_seqno);
+                assert_eq!(event.get_line_seqno(), line_seqno);
+
+                global_seqno += 1;
+                line_seqno += 1;
+            }
+        }
+
+        #[test]
+        fn over_capacity() {
+            const GPIO: u32 = 2;
+            let buf = EdgeEventBuffer::new(2).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[GPIO]));
+            config.lconfig_edge(Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_multiple_events(config.sim(), GPIO);
+
+            // Read multiple events
+            config
+                .request()
+                .wait_edge_event(Duration::from_secs(1))
+                .unwrap();
+
+            assert_eq!(
+                config
+                    .request()
+                    .read_edge_event(&buf, buf.get_capacity())
+                    .unwrap(),
+                2
+            );
+            assert_eq!(buf.get_num_events(), 2);
+        }
+    }
+}
diff --git a/bindings/rust/tests/info_event.rs b/bindings/rust/tests/info_event.rs
new file mode 100644
index 000000000000..96d8385deadf
--- /dev/null
+++ b/bindings/rust/tests/info_event.rs
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod info_event {
+    use libc::EINVAL;
+    use std::sync::Arc;
+    use std::thread::{sleep, spawn};
+    use std::time::Duration;
+
+    use vmm_sys_util::errno::Error as IoError;
+
+    use crate::common::*;
+    use libgpiod::{Chip, Direction, Error as ChipError, Event, LineConfig, RequestConfig};
+
+    fn request_reconfigure_line(chip: Arc<Chip>) {
+        spawn(move || {
+            sleep(Duration::from_millis(10));
+
+            let lconfig1 = LineConfig::new().unwrap();
+            let rconfig = RequestConfig::new().unwrap();
+            rconfig.set_offsets(&[7]);
+
+            let request = chip.request_lines(&rconfig, &lconfig1).unwrap();
+
+            sleep(Duration::from_millis(10));
+
+            let mut lconfig2 = LineConfig::new().unwrap();
+            lconfig2.set_direction_default(Direction::Output);
+
+            request.reconfigure_lines(&lconfig2).unwrap();
+
+            sleep(Duration::from_millis(10));
+        });
+    }
+
+    mod watch {
+        use super::*;
+        const NGPIO: u64 = 8;
+        const GPIO: u32 = 7;
+
+        #[test]
+        fn failure() {
+            let sim = Sim::new(Some(NGPIO), None, true).unwrap();
+            let chip = Chip::open(sim.dev_path()).unwrap();
+
+            assert_eq!(
+                chip.watch_line_info(NGPIO as u32).unwrap_err(),
+                ChipError::OperationFailed("Gpio LineInfo line-info", IoError::new(EINVAL))
+            );
+
+            chip.watch_line_info(3).unwrap();
+
+            // No events available
+            assert_eq!(
+                chip.wait_info_event(Duration::from_millis(100))
+                    .unwrap_err(),
+                ChipError::OperationTimedOut
+            );
+        }
+
+        #[test]
+        fn verify() {
+            let sim = Sim::new(Some(NGPIO), None, true).unwrap();
+            let chip = Chip::open(sim.dev_path()).unwrap();
+            let info = chip.watch_line_info(GPIO).unwrap();
+
+            assert_eq!(info.get_offset(), GPIO);
+        }
+
+        #[test]
+        fn reconfigure() {
+            let sim = Sim::new(Some(NGPIO), None, true).unwrap();
+            let chip = Arc::new(Chip::open(sim.dev_path()).unwrap());
+            let info = chip.watch_line_info(GPIO).unwrap();
+
+            assert_eq!(info.get_direction().unwrap(), Direction::Input);
+
+            // Generate events
+            request_reconfigure_line(chip.clone());
+
+            // Line requested event
+            chip.wait_info_event(Duration::from_secs(1)).unwrap();
+            let event = chip.read_info_event().unwrap();
+            let ts_req = event.get_timestamp();
+
+            assert_eq!(event.get_event_type().unwrap(), Event::LineRequested);
+            assert_eq!(
+                event.line_info().unwrap().get_direction().unwrap(),
+                Direction::Input
+            );
+
+            // Line changed event
+            chip.wait_info_event(Duration::from_secs(1)).unwrap();
+            let event = chip.read_info_event().unwrap();
+            let ts_rec = event.get_timestamp();
+
+            assert_eq!(event.get_event_type().unwrap(), Event::LineConfigChanged);
+            assert_eq!(
+                event.line_info().unwrap().get_direction().unwrap(),
+                Direction::Output
+            );
+
+            // Line released event
+            chip.wait_info_event(Duration::from_secs(1)).unwrap();
+            let event = chip.read_info_event().unwrap();
+            let ts_rel = event.get_timestamp();
+
+            assert_eq!(event.get_event_type().unwrap(), Event::LineReleased);
+
+            // No events available
+            assert_eq!(
+                chip.wait_info_event(Duration::from_millis(100))
+                    .unwrap_err(),
+                ChipError::OperationTimedOut
+            );
+
+            // Check timestamps are really monotonic.
+            assert!(ts_rel > ts_rec);
+            assert!(ts_rec > ts_req);
+        }
+    }
+}
diff --git a/bindings/rust/tests/line_config.rs b/bindings/rust/tests/line_config.rs
new file mode 100644
index 000000000000..82879324a7f0
--- /dev/null
+++ b/bindings/rust/tests/line_config.rs
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_config {
+    use std::time::Duration;
+
+    use libgpiod::{Bias, Direction, Drive, Edge, EventClock, LineConfig};
+
+    mod default {
+        use super::*;
+
+        #[test]
+        fn verify() {
+            let lconfig = LineConfig::new().unwrap();
+
+            assert_eq!(lconfig.get_direction_default().unwrap(), Direction::AsIs);
+            assert_eq!(lconfig.get_edge_detection_default().unwrap(), Edge::None);
+            assert_eq!(lconfig.get_bias_default().unwrap(), Bias::AsIs);
+            assert_eq!(lconfig.get_drive_default().unwrap(), Drive::PushPull);
+            assert_eq!(lconfig.get_active_low_default(), false);
+            assert_eq!(
+                lconfig.get_debounce_period_default().unwrap(),
+                Duration::from_millis(0)
+            );
+            assert_eq!(
+                lconfig.get_event_clock_default().unwrap(),
+                EventClock::Monotonic
+            );
+            assert_eq!(lconfig.get_output_value_default().unwrap(), 0);
+            assert_eq!(lconfig.get_overrides().unwrap().len(), 0);
+        }
+    }
+
+    mod overrides {
+        use super::*;
+
+        #[test]
+        fn direction() {
+            const GPIO: u32 = 0;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_direction_default(Direction::AsIs);
+            lconfig.set_direction_override(Direction::Input, GPIO);
+
+            assert_eq!(lconfig.direction_is_overridden(GPIO), true);
+            assert_eq!(
+                lconfig.get_direction_offset(GPIO).unwrap(),
+                Direction::Input
+            );
+
+            lconfig.clear_direction_override(GPIO);
+            assert_eq!(lconfig.direction_is_overridden(GPIO), false);
+            assert_eq!(lconfig.get_direction_offset(GPIO).unwrap(), Direction::AsIs);
+        }
+
+        #[test]
+        fn edge_detection() {
+            const GPIO: u32 = 1;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_edge_detection_default(Edge::None);
+            lconfig.set_edge_detection_override(Edge::Both, GPIO);
+
+            assert_eq!(lconfig.edge_detection_is_overridden(GPIO), true);
+            assert_eq!(lconfig.get_edge_detection_offset(GPIO).unwrap(), Edge::Both);
+
+            lconfig.clear_edge_detection_override(GPIO);
+            assert_eq!(lconfig.edge_detection_is_overridden(GPIO), false);
+            assert_eq!(lconfig.get_edge_detection_offset(GPIO).unwrap(), Edge::None);
+        }
+
+        #[test]
+        fn bias() {
+            const GPIO: u32 = 2;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_bias_default(Bias::AsIs);
+            lconfig.set_bias_override(Bias::PullDown, GPIO);
+
+            assert_eq!(lconfig.bias_is_overridden(GPIO), true);
+            assert_eq!(lconfig.get_bias_offset(GPIO).unwrap(), Bias::PullDown);
+
+            lconfig.clear_bias_override(GPIO);
+            assert_eq!(lconfig.bias_is_overridden(GPIO), false);
+            assert_eq!(lconfig.get_bias_offset(GPIO).unwrap(), Bias::AsIs);
+        }
+
+        #[test]
+        fn drive() {
+            const GPIO: u32 = 3;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_drive_default(Drive::PushPull);
+            lconfig.set_drive_override(Drive::OpenDrain, GPIO);
+
+            assert_eq!(lconfig.drive_is_overridden(GPIO), true);
+            assert_eq!(lconfig.get_drive_offset(GPIO).unwrap(), Drive::OpenDrain);
+
+            lconfig.clear_drive_override(GPIO);
+            assert_eq!(lconfig.drive_is_overridden(GPIO), false);
+            assert_eq!(lconfig.get_drive_offset(GPIO).unwrap(), Drive::PushPull);
+        }
+
+        #[test]
+        fn active_low() {
+            const GPIO: u32 = 4;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_active_low_default(false);
+            lconfig.set_active_low_override(true, GPIO);
+
+            assert_eq!(lconfig.active_low_is_overridden(GPIO), true);
+            assert_eq!(lconfig.get_active_low_offset(GPIO), true);
+
+            lconfig.clear_active_low_override(GPIO);
+            assert_eq!(lconfig.active_low_is_overridden(GPIO), false);
+            assert_eq!(lconfig.get_active_low_offset(GPIO), false);
+        }
+
+        #[test]
+        fn debounce_period() {
+            const GPIO: u32 = 5;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_debounce_period_default(Duration::from_millis(5));
+            lconfig.set_debounce_period_override(Duration::from_millis(3), GPIO);
+
+            assert_eq!(lconfig.debounce_period_is_overridden(GPIO), true);
+            assert_eq!(
+                lconfig.get_debounce_period_offset(GPIO).unwrap(),
+                Duration::from_millis(3)
+            );
+
+            lconfig.clear_debounce_period_override(GPIO);
+            assert_eq!(lconfig.debounce_period_is_overridden(GPIO), false);
+            assert_eq!(
+                lconfig.get_debounce_period_offset(GPIO).unwrap(),
+                Duration::from_millis(5)
+            );
+        }
+
+        #[test]
+        fn event_clock() {
+            const GPIO: u32 = 6;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_event_clock_default(EventClock::Monotonic);
+            lconfig.set_event_clock_override(EventClock::Realtime, GPIO);
+
+            assert_eq!(lconfig.event_clock_is_overridden(GPIO), true);
+            assert_eq!(
+                lconfig.get_event_clock_offset(GPIO).unwrap(),
+                EventClock::Realtime
+            );
+
+            lconfig.clear_event_clock_override(GPIO);
+            assert_eq!(lconfig.event_clock_is_overridden(GPIO), false);
+            assert_eq!(
+                lconfig.get_event_clock_offset(GPIO).unwrap(),
+                EventClock::Monotonic
+            );
+        }
+
+        #[test]
+        fn output_value() {
+            const GPIO: u32 = 0;
+            let mut lconfig = LineConfig::new().unwrap();
+
+            lconfig.set_output_value_default(0);
+            lconfig.set_output_value_override(1, GPIO);
+            lconfig.set_output_values(&[1, 2, 8], &[1, 1, 1]).unwrap();
+
+            for line in [0, 1, 2, 8] {
+                assert_eq!(lconfig.output_value_is_overridden(line), true);
+                assert_eq!(lconfig.get_output_value_offset(line).unwrap(), 1);
+
+                lconfig.clear_output_value_override(line);
+                assert_eq!(lconfig.output_value_is_overridden(line), false);
+                assert_eq!(lconfig.get_output_value_offset(line).unwrap(), 0);
+            }
+        }
+    }
+}
diff --git a/bindings/rust/tests/line_info.rs b/bindings/rust/tests/line_info.rs
new file mode 100644
index 000000000000..f6f8f592cc85
--- /dev/null
+++ b/bindings/rust/tests/line_info.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_info {
+    use libc::EINVAL;
+    use std::time::Duration;
+
+    use vmm_sys_util::errno::Error as IoError;
+
+    use crate::common::*;
+    use libgpiod::{Bias, Chip, Direction, Drive, Edge, Error as ChipError, EventClock};
+    use libgpiod_sys::{GPIOSIM_HOG_DIR_OUTPUT_HIGH, GPIOSIM_HOG_DIR_OUTPUT_LOW};
+
+    const NGPIO: u64 = 8;
+
+    mod basic {
+        use super::*;
+
+        #[test]
+        fn verify() {
+            const GPIO: u32 = 0;
+            const LABEL: &str = "foobar";
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.set_line_name(GPIO, LABEL).unwrap();
+            sim.hog_line(GPIO, "hog", GPIOSIM_HOG_DIR_OUTPUT_HIGH as i32)
+                .unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(sim.dev_path()).unwrap();
+            let info = chip.line_info(GPIO).unwrap();
+
+            assert_eq!(info.get_offset(), GPIO);
+            assert_eq!(info.get_name().unwrap(), LABEL);
+            assert_eq!(info.is_used(), true);
+            assert_eq!(info.get_consumer().unwrap(), "hog");
+            assert_eq!(info.get_direction().unwrap(), Direction::Output);
+            assert_eq!(info.is_active_low(), false);
+            assert_eq!(info.get_bias().unwrap(), Bias::Unknown);
+            assert_eq!(info.get_drive().unwrap(), Drive::PushPull);
+            assert_eq!(info.get_edge_detection().unwrap(), Edge::None);
+            assert_eq!(info.get_event_clock().unwrap(), EventClock::Monotonic);
+            assert_eq!(info.is_debounced(), false);
+            assert_eq!(info.get_debounce_period(), Duration::from_millis(0));
+
+            assert_eq!(
+                chip.line_info(NGPIO as u32).unwrap_err(),
+                ChipError::OperationFailed("Gpio LineInfo line-info", IoError::new(EINVAL))
+            );
+        }
+    }
+
+    mod properties {
+        use super::*;
+
+        #[test]
+        fn verify() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.set_line_name(1, "one").unwrap();
+            sim.set_line_name(2, "two").unwrap();
+            sim.set_line_name(4, "four").unwrap();
+            sim.set_line_name(5, "five").unwrap();
+            sim.hog_line(3, "hog3", GPIOSIM_HOG_DIR_OUTPUT_HIGH as i32)
+                .unwrap();
+            sim.hog_line(4, "hog4", GPIOSIM_HOG_DIR_OUTPUT_LOW as i32)
+                .unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(sim.dev_path()).unwrap();
+            chip.line_info(6).unwrap();
+
+            let info4 = chip.line_info(4).unwrap();
+            assert_eq!(info4.get_offset(), 4);
+            assert_eq!(info4.get_name().unwrap(), "four");
+            assert_eq!(info4.is_used(), true);
+            assert_eq!(info4.get_consumer().unwrap(), "hog4");
+            assert_eq!(info4.get_direction().unwrap(), Direction::Output);
+            assert_eq!(info4.is_active_low(), false);
+            assert_eq!(info4.get_bias().unwrap(), Bias::Unknown);
+            assert_eq!(info4.get_drive().unwrap(), Drive::PushPull);
+            assert_eq!(info4.get_edge_detection().unwrap(), Edge::None);
+            assert_eq!(info4.get_event_clock().unwrap(), EventClock::Monotonic);
+            assert_eq!(info4.is_debounced(), false);
+            assert_eq!(info4.get_debounce_period(), Duration::from_millis(0));
+        }
+    }
+}
diff --git a/bindings/rust/tests/line_request.rs b/bindings/rust/tests/line_request.rs
new file mode 100644
index 000000000000..361ee6318d2e
--- /dev/null
+++ b/bindings/rust/tests/line_request.rs
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_request {
+    use libc::{EBUSY, EINVAL};
+
+    use vmm_sys_util::errno::Error as IoError;
+
+    use crate::common::*;
+    use libgpiod::{Bias, Direction, Error as ChipError, LineConfig};
+    use libgpiod_sys::{
+        GPIOSIM_PULL_DOWN, GPIOSIM_PULL_UP, GPIOSIM_VALUE_ACTIVE, GPIOSIM_VALUE_INACTIVE,
+    };
+
+    const NGPIO: u64 = 8;
+
+    mod invalid_arguments {
+        use super::*;
+
+        #[test]
+        fn no_offsets() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(None);
+            config.lconfig_raw();
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed("Gpio LineRequest request-lines", IoError::new(EINVAL))
+            );
+        }
+
+        #[test]
+        fn duplicate_offsets() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[2, 0, 0, 4]));
+            config.lconfig_raw();
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed("Gpio LineRequest request-lines", IoError::new(EBUSY))
+            );
+        }
+
+        #[test]
+        fn out_of_bound_offsets() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[2, 0, 8, 4]));
+            config.lconfig_raw();
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed("Gpio LineRequest request-lines", IoError::new(EINVAL))
+            );
+        }
+    }
+
+    mod verify {
+        use super::*;
+
+        #[test]
+        fn custom_consumer() {
+            const GPIO: u32 = 2;
+            const CONSUMER: &str = "foobar";
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_consumer(Some(&[GPIO]), Some(CONSUMER));
+            config.lconfig_raw();
+            config.request_lines().unwrap();
+
+            let info = config.chip().line_info(GPIO).unwrap();
+
+            assert_eq!(info.is_used(), true);
+            assert_eq!(info.get_consumer().unwrap(), CONSUMER);
+        }
+
+        #[test]
+        fn empty_consumer() {
+            const GPIO: u32 = 2;
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&[GPIO]));
+            config.lconfig_raw();
+            config.request_lines().unwrap();
+
+            let info = config.chip().line_info(GPIO).unwrap();
+
+            assert_eq!(info.is_used(), true);
+            assert_eq!(info.get_consumer().unwrap(), "?");
+        }
+
+        #[test]
+        fn read_values() {
+            let offsets = [7, 1, 0, 6, 2];
+            let pulls = [
+                GPIOSIM_PULL_UP,
+                GPIOSIM_PULL_UP,
+                GPIOSIM_PULL_DOWN,
+                GPIOSIM_PULL_UP,
+                GPIOSIM_PULL_DOWN,
+            ];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.set_pull(&offsets, &pulls);
+            config.rconfig(Some(&offsets));
+            config.lconfig(Some(Direction::Input), None, None, None, None);
+            config.request_lines().unwrap();
+
+            let request = config.request();
+
+            // Buffer is smaller
+            let mut values: Vec<i32> = vec![0; 4];
+            assert_eq!(
+                request.get_values(&mut values).unwrap_err(),
+                ChipError::OperationFailed(
+                    "Gpio LineRequest array size mismatch",
+                    IoError::new(EINVAL),
+                )
+            );
+
+            // Buffer is larger
+            let mut values: Vec<i32> = vec![0; 6];
+            assert_eq!(
+                request.get_values(&mut values).unwrap_err(),
+                ChipError::OperationFailed(
+                    "Gpio LineRequest array size mismatch",
+                    IoError::new(EINVAL),
+                )
+            );
+
+            // Single values read properly
+            assert_eq!(request.get_value(7).unwrap(), 1);
+
+            // Values read properly
+            let mut values: Vec<i32> = vec![0; 5];
+            request.get_values(&mut values).unwrap();
+            for i in 0..values.len() {
+                assert_eq!(
+                    values[i],
+                    match pulls[i] {
+                        GPIOSIM_PULL_DOWN => 0,
+                        _ => 1,
+                    }
+                );
+            }
+
+            // Subset of values read properly
+            let mut values: Vec<i32> = vec![0; 3];
+            request.get_values_subset(&[2, 0, 6], &mut values).unwrap();
+            assert_eq!(values[0], 0);
+            assert_eq!(values[1], 0);
+            assert_eq!(values[2], 1);
+
+            // Value read properly after reconfigure
+            let mut lconfig = LineConfig::new().unwrap();
+            lconfig.set_active_low_default(true);
+            request.reconfigure_lines(&lconfig).unwrap();
+            assert_eq!(request.get_value(7).unwrap(), 0);
+        }
+
+        #[test]
+        fn set_output_values() {
+            let offsets = [0, 1, 3, 4];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&offsets));
+            config.lconfig(Some(Direction::Output), Some(1), Some((4, 0)), None, None);
+            config.request_lines().unwrap();
+
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+
+            // Overriden
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+
+            // Default
+            assert_eq!(config.sim().val(2).unwrap(), GPIOSIM_VALUE_INACTIVE);
+        }
+
+        #[test]
+        fn reconfigure_output_values() {
+            let offsets = [0, 1, 3, 4];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&offsets));
+            config.lconfig(Some(Direction::Output), Some(0), None, None, None);
+            config.request_lines().unwrap();
+            let request = config.request();
+
+            // Set single value
+            request.set_value(1, 1).unwrap();
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            request.set_value(1, 0).unwrap();
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_INACTIVE);
+
+            // Set values of subset
+            request.set_values_subset(&[4, 3], &[1, 1]).unwrap();
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            request.set_values_subset(&[4, 3], &[0, 0]).unwrap();
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+
+            // Set all values
+            request.set_values(&[1, 0, 1, 0]).unwrap();
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            request.set_values(&[0, 0, 0, 0]).unwrap();
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+        }
+
+        #[test]
+        fn set_bias() {
+            let offsets = [3];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig(Some(&offsets));
+            config.lconfig(Some(Direction::Input), None, None, None, Some(Bias::PullUp));
+            config.request_lines().unwrap();
+            config.request();
+
+            // Set single value
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+        }
+    }
+}
diff --git a/bindings/rust/tests/request_config.rs b/bindings/rust/tests/request_config.rs
new file mode 100644
index 000000000000..e914ca8ec887
--- /dev/null
+++ b/bindings/rust/tests/request_config.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod request_config {
+    use vmm_sys_util::errno::Error as IoError;
+
+    use libgpiod::{Error as ChipError, RequestConfig};
+
+    mod verify {
+        use super::*;
+
+        #[test]
+        fn default() {
+            let rconfig = RequestConfig::new().unwrap();
+
+            assert_eq!(rconfig.get_offsets().len(), 0);
+            assert_eq!(rconfig.get_event_buffer_size(), 0);
+            assert_eq!(
+                rconfig.get_consumer().unwrap_err(),
+                ChipError::OperationFailed("Gpio RequestConfig get-consumer", IoError::new(0))
+            );
+        }
+
+        #[test]
+        fn initialized() {
+            let offsets = [0, 1, 2, 3];
+            const CONSUMER: &str = "foobar";
+            let rconfig = RequestConfig::new().unwrap();
+            rconfig.set_consumer(CONSUMER);
+            rconfig.set_offsets(&offsets);
+            rconfig.set_event_buffer_size(64);
+
+            assert_eq!(rconfig.get_offsets(), offsets);
+            assert_eq!(rconfig.get_event_buffer_size(), 64);
+            assert_eq!(rconfig.get_consumer().unwrap(), CONSUMER);
+        }
+    }
+}
-- 
2.31.1.272.g89b43f80a514

