Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702C2587C43
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 14:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236962AbiHBMS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 08:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236947AbiHBMSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 08:18:42 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F3B4F6B7
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 05:18:39 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id t2so13287956ply.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WcZJ/3LzE4uWF3RLXm/rKTMUdh1IFdgd8CiEFRrENFg=;
        b=dDQHn3Xo4t7yK3mv0v5nkVp1JeqCEQ9/LZYlB9X69j1aypn8sDQnMX+aTft1yqNWxv
         DUH7ToyYykqYtMfAY8rGreiaTCiA0jZAnzGLqzq9rB6LB623D8/yrLFY5fvDNDkh1VDk
         5eWiXfozlcO9C/xoknsglOs62vcvBF051UWh5jn9WNJ1rIS+8ilGzy81g7ErZ9yV5sHL
         IzCoalVIY3GbJq6+s/a1R74rX54Bi+arOxGnE44ysOM7ApmUOntfFPa8OIh0ig7+TaoU
         Zgrnj65dSgK+NDTejxOcCpKv44GJPpSsBMn+JRngcVqinG2yufAgwUkGnOF7hfvSHsQ1
         RJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WcZJ/3LzE4uWF3RLXm/rKTMUdh1IFdgd8CiEFRrENFg=;
        b=oVDJaDL2193YR3eyU5A2YJNUsNOaM7I5YBAw9ZORtqatoTRRhL6GK6inrruj9D91wj
         ydWxplc3Gx3Y+u/CSyX1nmUyIwBsHSFSznIFSYO2M37/BxE4tzVLAYLJu1ZG0lIDNDqN
         3nxeSTrinrbvv6PUWteQqb+de4cXM9tiQg9hGzEbY/os0kCUUKddxU2V/nACKkfgv9Em
         CBUZcjZ9UUQ4p6nKobOj5zBYsuqvpZ9V5Zy4RVutRYxs4/i7ix8ER6m4avbkT0MRvE3C
         FVBUd0HoAuFQMft8nf83CxefOE7IjZDJpPiv8zQC6/QID4vrfcrS7rkW66YzaCZgO8e3
         c+kg==
X-Gm-Message-State: ACgBeo1kULAWmL6T9CyHBgWnNqrLTmPm4reci1kXBkK6DeB7o+uMFkYX
        oy06upI/ErGqKOvZC6JOGYrV1A==
X-Google-Smtp-Source: AA6agR5rlrzopFX4w5EYwCp6C7JtGTcwAHwqDtawVVOVn/ID2uJEBPztMuvkQxn2Fe0REpYePL5eyQ==
X-Received: by 2002:a17:902:ce09:b0:16c:c7b6:8b63 with SMTP id k9-20020a170902ce0900b0016cc7b68b63mr21310267plg.35.1659442718210;
        Tue, 02 Aug 2022 05:18:38 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id e23-20020a17090a9a9700b001f4e0c71af4sm6557470pjp.28.2022.08.02.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 05:18:37 -0700 (PDT)
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
Subject: [PATCH V5 7/8] libgpiod: Add rust tests
Date:   Tue,  2 Aug 2022 17:48:11 +0530
Message-Id: <709c1000929da4546e0598af930e27b4e437fc86.1659442066.git.viresh.kumar@linaro.org>
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

Add tests for the rust bindings, quite similar to the ones in cxx
bindings.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml             |   3 +
 bindings/rust/libgpiod/tests/chip.rs          |  97 ++++
 bindings/rust/libgpiod/tests/common/config.rs | 142 ++++++
 bindings/rust/libgpiod/tests/common/mod.rs    |  10 +
 bindings/rust/libgpiod/tests/edge_event.rs    | 294 +++++++++++
 bindings/rust/libgpiod/tests/info_event.rs    | 120 +++++
 bindings/rust/libgpiod/tests/line_config.rs   | 293 +++++++++++
 bindings/rust/libgpiod/tests/line_info.rs     | 272 ++++++++++
 bindings/rust/libgpiod/tests/line_request.rs  | 473 ++++++++++++++++++
 .../rust/libgpiod/tests/request_config.rs     |  42 ++
 10 files changed, 1746 insertions(+)
 create mode 100644 bindings/rust/libgpiod/tests/chip.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/config.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/mod.rs
 create mode 100644 bindings/rust/libgpiod/tests/edge_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/info_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_config.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_info.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_request.rs
 create mode 100644 bindings/rust/libgpiod/tests/request_config.rs

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index f25242abb153..8abcaacdee67 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -11,3 +11,6 @@ libc = ">=0.2.39"
 libgpiod-sys = { path = "../libgpiod-sys" }
 thiserror = "1.0"
 vmm-sys-util = "=0.10.0"
+
+[dev-dependencies]
+gpiosim = { path = "../gpiosim" }
diff --git a/bindings/rust/libgpiod/tests/chip.rs b/bindings/rust/libgpiod/tests/chip.rs
new file mode 100644
index 000000000000..ce592331b5e8
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/chip.rs
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod chip {
+    use libc::{ENODEV, ENOENT, ENOTTY};
+    use std::path::PathBuf;
+
+    use vmm_sys_util::errno::Error as Errno;
+
+    use gpiosim::Sim;
+    use libgpiod::{chip::Chip, Error as ChipError, OperationType};
+
+    mod open {
+        use super::*;
+
+        #[test]
+        fn nonexistent_file() {
+            assert_eq!(
+                Chip::open(&PathBuf::from("/dev/nonexistent")).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipOpen, Errno::new(ENOENT))
+            );
+        }
+
+        #[test]
+        fn no_dev_file() {
+            assert_eq!(
+                Chip::open(&PathBuf::from("/tmp")).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipOpen, Errno::new(ENOTTY))
+            );
+        }
+
+        #[test]
+        fn non_gpio_char_dev_file() {
+            assert_eq!(
+                Chip::open(&PathBuf::from("/dev/null")).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipOpen, Errno::new(ENODEV))
+            );
+        }
+
+        #[test]
+        fn gpiosim_file() {
+            let sim = Sim::new(None, None, true).unwrap();
+            assert!(Chip::open(&sim.dev_path()).is_ok());
+        }
+    }
+
+    mod verify {
+        use super::*;
+        const NGPIO: u64 = 16;
+        const LABEL: &str = "foobar";
+
+        #[test]
+        fn basic_helpers() {
+            let sim = Sim::new(Some(NGPIO), Some(LABEL), true).unwrap();
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            assert_eq!(chip.label().unwrap(), LABEL);
+            assert_eq!(chip.name().unwrap(), sim.chip_name());
+            assert_eq!(chip.path().unwrap(), sim.dev_path().to_str().unwrap());
+            assert_eq!(chip.num_lines(), NGPIO as usize);
+            assert!(chip.fd().is_ok());
+        }
+
+        #[test]
+        fn find_line() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.set_line_name(0, "zero").unwrap();
+            sim.set_line_name(2, "two").unwrap();
+            sim.set_line_name(3, "three").unwrap();
+            sim.set_line_name(5, "five").unwrap();
+            sim.set_line_name(10, "ten").unwrap();
+            sim.set_line_name(11, "ten").unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            // Success case
+            assert_eq!(chip.line_offset_from_name("zero").unwrap(), 0);
+            assert_eq!(chip.line_offset_from_name("two").unwrap(), 2);
+            assert_eq!(chip.line_offset_from_name("three").unwrap(), 3);
+            assert_eq!(chip.line_offset_from_name("five").unwrap(), 5);
+
+            // Success with duplicate names, should return first entry
+            assert_eq!(chip.line_offset_from_name("ten").unwrap(), 10);
+
+            // Failure
+            assert_eq!(
+                chip.line_offset_from_name("nonexistent").unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipGetLine, Errno::new(ENOENT))
+            );
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/common/config.rs b/bindings/rust/libgpiod/tests/common/config.rs
new file mode 100644
index 000000000000..cffc8830ea03
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/common/config.rs
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::sync::Arc;
+use std::time::Duration;
+
+use gpiosim::Sim;
+use libgpiod::{
+    chip::Chip, line, request, Bias, Direction, Drive, Edge, EventClock, Offset, Result, Setting,
+    SettingMap, Value,
+};
+
+pub(crate) struct TestConfig {
+    sim: Arc<Sim>,
+    chip: Option<Chip>,
+    request: Option<line::Request>,
+    rconfig: request::Config,
+    lconfig: line::Config,
+}
+
+impl TestConfig {
+    pub(crate) fn new(ngpio: u64) -> Result<Self> {
+        Ok(Self {
+            sim: Arc::new(Sim::new(Some(ngpio), None, true)?),
+            chip: None,
+            request: None,
+            rconfig: request::Config::new().unwrap(),
+            lconfig: line::Config::new().unwrap(),
+        })
+    }
+
+    pub(crate) fn set_pull(&self, offsets: &[Offset], pulls: &[u32]) {
+        for i in 0..pulls.len() {
+            self.sim.set_pull(offsets[i], pulls[i] as i32).unwrap();
+        }
+    }
+
+    pub(crate) fn rconfig_set_consumer(&self, consumer: &str) {
+        self.rconfig.set_consumer(consumer);
+    }
+
+    pub(crate) fn rconfig_set_offsets(&self, offsets: &[Offset]) {
+        self.rconfig.set_offsets(offsets);
+    }
+
+    pub(crate) fn lconfig_val(
+        &mut self,
+        dir: Option<Direction>,
+        val: Option<Value>,
+        val_override: Option<(u32, Value)>,
+    ) {
+        let mut settings = Vec::new();
+
+        if let Some(dir) = dir {
+            settings.push(Setting::Direction(dir));
+        }
+
+        if let Some(val) = val {
+            settings.push(Setting::OutputValue(val));
+        }
+
+        if !settings.is_empty() {
+            self.lconfig.set_prop_default(&settings);
+        }
+
+        if let Some((offset, val)) = val_override {
+            let mut map = SettingMap::new();
+            map.insert(offset.into(), Setting::OutputValue(val));
+
+            self.lconfig.set_prop_override(map);
+        }
+    }
+
+    pub(crate) fn lconfig_bias(&mut self, dir: Direction, bias: Option<Bias>) {
+        let settings = vec![Setting::Direction(dir), Setting::Bias(bias)];
+        self.lconfig.set_prop_default(&settings);
+    }
+
+    pub(crate) fn lconfig_clock(&mut self, clock: EventClock) {
+        let settings = vec![Setting::EventClock(clock)];
+        self.lconfig.set_prop_default(&settings);
+    }
+
+    pub(crate) fn lconfig_debounce(&mut self, duration: Duration) {
+        let settings = vec![
+            Setting::Direction(Direction::Input),
+            Setting::DebouncePeriod(duration),
+        ];
+        self.lconfig.set_prop_default(&settings);
+    }
+
+    pub(crate) fn lconfig_drive(&mut self, dir: Direction, drive: Drive) {
+        let settings = vec![Setting::Direction(dir), Setting::Drive(drive)];
+        self.lconfig.set_prop_default(&settings);
+    }
+
+    pub(crate) fn lconfig_edge(&mut self, dir: Option<Direction>, edge: Option<Edge>) {
+        let mut settings = Vec::new();
+
+        if let Some(dir) = dir {
+            settings.push(Setting::Direction(dir));
+        }
+
+        settings.push(Setting::EdgeDetection(edge));
+        self.lconfig.set_prop_default(&settings);
+    }
+
+    pub(crate) fn lconfig_val_raw(&mut self) {
+        self.lconfig_val(None, None, None);
+    }
+
+    pub(crate) fn request_lines(&mut self) -> Result<()> {
+        let chip = Chip::open(&self.sim.dev_path())?;
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
+        self.chip.as_ref().unwrap()
+    }
+
+    pub(crate) fn request(&self) -> &line::Request {
+        self.request.as_ref().unwrap()
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
diff --git a/bindings/rust/libgpiod/tests/common/mod.rs b/bindings/rust/libgpiod/tests/common/mod.rs
new file mode 100644
index 000000000000..8904f7121b4c
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/common/mod.rs
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+#[allow(dead_code)]
+mod config;
+
+#[allow(unused_imports)]
+pub(crate) use config::*;
diff --git a/bindings/rust/libgpiod/tests/edge_event.rs b/bindings/rust/libgpiod/tests/edge_event.rs
new file mode 100644
index 000000000000..b903969b25ae
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/edge_event.rs
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod edge_event {
+    use std::sync::Arc;
+    use std::thread::{sleep, spawn};
+    use std::time::Duration;
+
+    use crate::common::*;
+    use gpiosim::Sim;
+    use gpiosim::{GPIOSIM_PULL_DOWN, GPIOSIM_PULL_UP};
+    use libgpiod::{edge, Edge, EdgeKind, Offset};
+
+    const NGPIO: u64 = 8;
+
+    mod buffer_capacity {
+        use super::*;
+
+        #[test]
+        fn default_capacity() {
+            assert_eq!(edge::event::Buffer::new(0).unwrap().capacity(), 64);
+        }
+
+        #[test]
+        fn user_defined_capacity() {
+            assert_eq!(edge::event::Buffer::new(123).unwrap().capacity(), 123);
+        }
+
+        #[test]
+        fn max_capacity() {
+            assert_eq!(edge::event::Buffer::new(1024 * 2).unwrap().capacity(), 1024);
+        }
+    }
+
+    mod trigger {
+        use super::*;
+
+        // Helpers to generate events
+        fn trigger_falling_and_rising_edge(sim: Arc<Sim>, offset: Offset) {
+            spawn(move || {
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset, GPIOSIM_PULL_UP as i32).unwrap();
+
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset, GPIOSIM_PULL_DOWN as i32).unwrap();
+            });
+        }
+
+        fn trigger_rising_edge_events_on_two_offsets(sim: Arc<Sim>, offset: [Offset; 2]) {
+            spawn(move || {
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset[0], GPIOSIM_PULL_UP as i32).unwrap();
+
+                sleep(Duration::from_millis(30));
+                sim.set_pull(offset[1], GPIOSIM_PULL_UP as i32).unwrap();
+            });
+        }
+
+        fn trigger_multiple_events(sim: Arc<Sim>, offset: Offset) {
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
+            const GPIO: Offset = 2;
+            let buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[GPIO]);
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_falling_and_rising_edge(config.sim(), GPIO);
+
+            // Rising event
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            let ts_rising = event.timestamp();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
+            assert_eq!(event.line_offset(), GPIO);
+
+            // Falling event
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            let ts_falling = event.timestamp();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Falling);
+            assert_eq!(event.line_offset(), GPIO);
+
+            // No events available
+            assert!(!config
+                .request()
+                .wait_edge_event(Some(Duration::from_millis(100)))
+                .unwrap());
+
+            assert!(ts_falling > ts_rising);
+        }
+
+        #[test]
+        fn rising_edge() {
+            const GPIO: Offset = 6;
+            let buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[GPIO]);
+            config.lconfig_edge(None, Some(Edge::Rising));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_falling_and_rising_edge(config.sim(), GPIO);
+
+            // Rising event
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
+            assert_eq!(event.line_offset(), GPIO);
+
+            // No events available
+            assert!(!config
+                .request()
+                .wait_edge_event(Some(Duration::from_millis(100)))
+                .unwrap());
+        }
+
+        #[test]
+        fn falling_edge() {
+            const GPIO: Offset = 7;
+            let buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[GPIO]);
+            config.lconfig_edge(None, Some(Edge::Falling));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_falling_and_rising_edge(config.sim(), GPIO);
+
+            // Falling event
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Falling);
+            assert_eq!(event.line_offset(), GPIO);
+
+            // No events available
+            assert!(!config
+                .request()
+                .wait_edge_event(Some(Duration::from_millis(100)))
+                .unwrap());
+        }
+
+        #[test]
+        fn edge_sequence() {
+            const GPIO: [u32; 2] = [0, 1];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&GPIO);
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_rising_edge_events_on_two_offsets(config.sim(), GPIO);
+
+            // Rising event GPIO 0
+            let buf = edge::event::Buffer::new(0).unwrap();
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
+            assert_eq!(event.line_offset(), GPIO[0]);
+            assert_eq!(event.global_seqno(), 1);
+            assert_eq!(event.line_seqno(), 1);
+
+            // Rising event GPIO 1
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
+            assert_eq!(event.line_offset(), GPIO[1]);
+            assert_eq!(event.global_seqno(), 2);
+            assert_eq!(event.line_seqno(), 1);
+
+            // No events available
+            assert!(!config
+                .request()
+                .wait_edge_event(Some(Duration::from_millis(100)))
+                .unwrap());
+        }
+
+        #[test]
+        fn multiple_events() {
+            const GPIO: Offset = 1;
+            let buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[GPIO]);
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_multiple_events(config.sim(), GPIO);
+
+            // Read multiple events
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 3);
+            assert_eq!(buf.len(), 3);
+
+            let mut global_seqno = 1;
+            let mut line_seqno = 1;
+
+            // Verify sequence number of events
+            for i in 0..3 {
+                let event = buf.event(i).unwrap();
+                assert_eq!(event.line_offset(), GPIO);
+                assert_eq!(event.global_seqno(), global_seqno);
+                assert_eq!(event.line_seqno(), line_seqno);
+
+                global_seqno += 1;
+                line_seqno += 1;
+            }
+        }
+
+        #[test]
+        fn over_capacity() {
+            const GPIO: Offset = 2;
+            let buf = edge::event::Buffer::new(2).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[GPIO]);
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_multiple_events(config.sim(), GPIO);
+
+            // Read multiple events
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&buf).unwrap(), 2);
+            assert_eq!(buf.len(), 2);
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/info_event.rs b/bindings/rust/libgpiod/tests/info_event.rs
new file mode 100644
index 000000000000..230b0a0352df
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/info_event.rs
@@ -0,0 +1,120 @@
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
+    use vmm_sys_util::errno::Error as Errno;
+
+    use gpiosim::Sim;
+    use libgpiod::{
+        chip::Chip, line, request, Direction, Error as ChipError, InfoChangeKind, Offset,
+        OperationType, Setting,
+    };
+
+    fn request_reconfigure_line(chip: Arc<Chip>) {
+        spawn(move || {
+            sleep(Duration::from_millis(10));
+
+            let lconfig1 = line::Config::new().unwrap();
+            let rconfig = request::Config::new().unwrap();
+            rconfig.set_offsets(&[7]);
+
+            let request = chip.request_lines(&rconfig, &lconfig1).unwrap();
+
+            sleep(Duration::from_millis(10));
+
+            let mut lconfig2 = line::Config::new().unwrap();
+            lconfig2.set_prop_default(&[Setting::Direction(Direction::Output)]);
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
+        const GPIO: Offset = 7;
+
+        #[test]
+        fn line_info() {
+            let sim = Sim::new(Some(NGPIO), None, true).unwrap();
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            assert_eq!(
+                chip.watch_line_info(NGPIO as u32).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipWatchLineInfo, Errno::new(EINVAL))
+            );
+
+            let info = chip.watch_line_info(GPIO).unwrap();
+            assert_eq!(info.offset(), GPIO);
+
+            // No events available
+            assert!(!chip
+                .wait_info_event(Some(Duration::from_millis(100)))
+                .unwrap());
+        }
+
+        #[test]
+        fn reconfigure() {
+            let sim = Sim::new(Some(NGPIO), None, true).unwrap();
+            let chip = Arc::new(Chip::open(&sim.dev_path()).unwrap());
+            let info = chip.watch_line_info(GPIO).unwrap();
+
+            assert_eq!(info.direction().unwrap(), Direction::Input);
+
+            // Generate events
+            request_reconfigure_line(chip.clone());
+
+            // Line requested event
+            assert!(chip.wait_info_event(Some(Duration::from_secs(1))).unwrap());
+            let event = chip.read_info_event().unwrap();
+            let ts_req = event.timestamp();
+
+            assert_eq!(event.event_type().unwrap(), InfoChangeKind::LineRequested);
+            assert_eq!(
+                event.line_info().unwrap().direction().unwrap(),
+                Direction::Input
+            );
+
+            // Line changed event
+            assert!(chip.wait_info_event(Some(Duration::from_secs(1))).unwrap());
+            let event = chip.read_info_event().unwrap();
+            let ts_rec = event.timestamp();
+
+            assert_eq!(
+                event.event_type().unwrap(),
+                InfoChangeKind::LineConfigChanged
+            );
+            assert_eq!(
+                event.line_info().unwrap().direction().unwrap(),
+                Direction::Output
+            );
+
+            // Line released event
+            assert!(chip.wait_info_event(Some(Duration::from_secs(1))).unwrap());
+            let event = chip.read_info_event().unwrap();
+            let ts_rel = event.timestamp();
+
+            assert_eq!(event.event_type().unwrap(), InfoChangeKind::LineReleased);
+
+            // No events available
+            assert!(!chip
+                .wait_info_event(Some(Duration::from_millis(100)))
+                .unwrap());
+
+            // Check timestamps are really monotonic.
+            assert!(ts_rel > ts_rec);
+            assert!(ts_rec > ts_req);
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/line_config.rs b/bindings/rust/libgpiod/tests/line_config.rs
new file mode 100644
index 000000000000..0d1a5ca7a0a8
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_config.rs
@@ -0,0 +1,293 @@
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
+    use libgpiod::{
+        line, Bias, Direction, Drive, Edge, EventClock, Offset, Setting, SettingKind,
+        SettingKindMap, SettingMap, Value, ValueMap,
+    };
+
+    #[test]
+    fn default() {
+        let lconfig = line::Config::new().unwrap();
+
+        assert_eq!(
+            lconfig.prop_default(SettingKind::Direction).unwrap(),
+            Setting::Direction(Direction::AsIs)
+        );
+        assert_eq!(
+            lconfig.prop_default(SettingKind::EdgeDetection).unwrap(),
+            Setting::EdgeDetection(None)
+        );
+        assert_eq!(
+            lconfig.prop_default(SettingKind::Bias).unwrap(),
+            Setting::Bias(None)
+        );
+        assert_eq!(
+            lconfig.prop_default(SettingKind::Drive).unwrap(),
+            Setting::Drive(Drive::PushPull)
+        );
+        assert_eq!(
+            lconfig.prop_default(SettingKind::ActiveLow).unwrap(),
+            Setting::ActiveLow(false)
+        );
+        assert_eq!(
+            lconfig.prop_default(SettingKind::DebouncePeriod).unwrap(),
+            Setting::DebouncePeriod(Duration::from_millis(0))
+        );
+        assert_eq!(
+            lconfig.prop_default(SettingKind::EventClock).unwrap(),
+            Setting::EventClock(EventClock::Monotonic)
+        );
+        assert_eq!(
+            lconfig.prop_default(SettingKind::OutputValue).unwrap(),
+            Setting::OutputValue(Value::InActive)
+        );
+        assert_eq!(lconfig.overrides().unwrap().len(), 0);
+    }
+
+    mod overrides {
+        use super::*;
+
+        #[test]
+        fn direction() {
+            const GPIO: Offset = 0;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::Direction(Direction::AsIs)]);
+
+            let mut map = SettingMap::new();
+            map.insert(GPIO.into(), Setting::Direction(Direction::Input));
+            lconfig.set_prop_override(map);
+
+            assert!(lconfig.prop_is_overridden(SettingKind::Direction, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::Direction, GPIO).unwrap(),
+                Setting::Direction(Direction::Input)
+            );
+
+            let mut map = SettingKindMap::new();
+            map.insert(GPIO.into(), SettingKind::Direction);
+            lconfig.clear_prop_override(map);
+            assert!(!lconfig.prop_is_overridden(SettingKind::Direction, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::Direction, GPIO).unwrap(),
+                Setting::Direction(Direction::AsIs)
+            );
+        }
+
+        #[test]
+        fn edge_detection() {
+            const GPIO: Offset = 1;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::EdgeDetection(None)]);
+
+            let mut map = SettingMap::new();
+            map.insert(GPIO.into(), Setting::EdgeDetection(Some(Edge::Both)));
+            lconfig.set_prop_override(map);
+
+            assert!(lconfig.prop_is_overridden(SettingKind::EdgeDetection, GPIO));
+            assert_eq!(
+                lconfig
+                    .prop_offset(SettingKind::EdgeDetection, GPIO)
+                    .unwrap(),
+                Setting::EdgeDetection(Some(Edge::Both))
+            );
+
+            let mut map = SettingKindMap::new();
+            map.insert(GPIO.into(), SettingKind::EdgeDetection);
+            lconfig.clear_prop_override(map);
+            assert!(!lconfig.prop_is_overridden(SettingKind::EdgeDetection, GPIO));
+            assert_eq!(
+                lconfig
+                    .prop_offset(SettingKind::EdgeDetection, GPIO)
+                    .unwrap(),
+                Setting::EdgeDetection(None)
+            );
+        }
+
+        #[test]
+        fn bias() {
+            const GPIO: Offset = 2;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::Bias(None)]);
+
+            let mut map = SettingMap::new();
+            map.insert(GPIO.into(), Setting::Bias(Some(Bias::PullDown)));
+            lconfig.set_prop_override(map);
+
+            assert!(lconfig.prop_is_overridden(SettingKind::Bias, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::Bias, GPIO).unwrap(),
+                Setting::Bias(Some(Bias::PullDown))
+            );
+
+            let mut map = SettingKindMap::new();
+            map.insert(GPIO.into(), SettingKind::Bias);
+            lconfig.clear_prop_override(map);
+            assert!(!lconfig.prop_is_overridden(SettingKind::Bias, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::Bias, GPIO).unwrap(),
+                Setting::Bias(None)
+            );
+        }
+
+        #[test]
+        fn drive() {
+            const GPIO: Offset = 3;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::Drive(Drive::PushPull)]);
+
+            let mut map = SettingMap::new();
+            map.insert(GPIO.into(), Setting::Drive(Drive::OpenDrain));
+            lconfig.set_prop_override(map);
+
+            assert!(lconfig.prop_is_overridden(SettingKind::Drive, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::Drive, GPIO).unwrap(),
+                Setting::Drive(Drive::OpenDrain)
+            );
+
+            let mut map = SettingKindMap::new();
+            map.insert(GPIO.into(), SettingKind::Drive);
+            lconfig.clear_prop_override(map);
+            assert!(!lconfig.prop_is_overridden(SettingKind::Drive, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::Drive, GPIO).unwrap(),
+                Setting::Drive(Drive::PushPull)
+            );
+        }
+
+        #[test]
+        fn active_low() {
+            const GPIO: Offset = 4;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::ActiveLow(false)]);
+
+            let mut map = SettingMap::new();
+            map.insert(GPIO.into(), Setting::ActiveLow(true));
+            lconfig.set_prop_override(map);
+
+            assert!(lconfig.prop_is_overridden(SettingKind::ActiveLow, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::ActiveLow, GPIO).unwrap(),
+                Setting::ActiveLow(true)
+            );
+
+            let mut map = SettingKindMap::new();
+            map.insert(GPIO.into(), SettingKind::ActiveLow);
+            lconfig.clear_prop_override(map);
+            assert!(!lconfig.prop_is_overridden(SettingKind::ActiveLow, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::ActiveLow, GPIO).unwrap(),
+                Setting::ActiveLow(false)
+            );
+        }
+
+        #[test]
+        fn debounce_period() {
+            const GPIO: Offset = 5;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::DebouncePeriod(Duration::from_millis(5))]);
+
+            let mut map = SettingMap::new();
+            map.insert(
+                GPIO.into(),
+                Setting::DebouncePeriod(Duration::from_millis(3)),
+            );
+            lconfig.set_prop_override(map);
+
+            assert!(lconfig.prop_is_overridden(SettingKind::DebouncePeriod, GPIO));
+            assert_eq!(
+                lconfig
+                    .prop_offset(SettingKind::DebouncePeriod, GPIO)
+                    .unwrap(),
+                Setting::DebouncePeriod(Duration::from_millis(3))
+            );
+
+            let mut map = SettingKindMap::new();
+            map.insert(GPIO.into(), SettingKind::DebouncePeriod);
+            lconfig.clear_prop_override(map);
+            assert!(!lconfig.prop_is_overridden(SettingKind::DebouncePeriod, GPIO));
+            assert_eq!(
+                lconfig
+                    .prop_offset(SettingKind::DebouncePeriod, GPIO)
+                    .unwrap(),
+                Setting::DebouncePeriod(Duration::from_millis(5))
+            );
+        }
+
+        #[test]
+        fn event_clock() {
+            const GPIO: Offset = 6;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::EventClock(EventClock::Monotonic)]);
+
+            let mut map = SettingMap::new();
+            map.insert(GPIO.into(), Setting::EventClock(EventClock::Realtime));
+            lconfig.set_prop_override(map);
+
+            assert!(lconfig.prop_is_overridden(SettingKind::EventClock, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::EventClock, GPIO).unwrap(),
+                Setting::EventClock(EventClock::Realtime)
+            );
+
+            let mut map = SettingKindMap::new();
+            map.insert(GPIO.into(), SettingKind::EventClock);
+            lconfig.clear_prop_override(map);
+            assert!(!lconfig.prop_is_overridden(SettingKind::EventClock, GPIO));
+            assert_eq!(
+                lconfig.prop_offset(SettingKind::EventClock, GPIO).unwrap(),
+                Setting::EventClock(EventClock::Monotonic)
+            );
+        }
+
+        #[test]
+        fn output_value() {
+            const GPIO: Offset = 0;
+            let mut lconfig = line::Config::new().unwrap();
+
+            lconfig.set_prop_default(&[Setting::OutputValue(Value::InActive)]);
+
+            let mut map = SettingMap::new();
+            map.insert(GPIO.into(), Setting::OutputValue(Value::Active));
+            lconfig.set_prop_override(map);
+
+            let mut map = ValueMap::new();
+            map.insert(1, Value::Active);
+            map.insert(2, Value::Active);
+            map.insert(8, Value::Active);
+            lconfig.set_output_values(map).unwrap();
+
+            for line in [0, 1, 2, 8] {
+                assert!(lconfig.prop_is_overridden(SettingKind::OutputValue, line));
+                assert_eq!(
+                    lconfig.prop_offset(SettingKind::OutputValue, line).unwrap(),
+                    Setting::OutputValue(Value::Active)
+                );
+
+                let mut map = SettingKindMap::new();
+                map.insert(line.into(), SettingKind::OutputValue);
+                lconfig.clear_prop_override(map);
+                assert!(!lconfig.prop_is_overridden(SettingKind::OutputValue, line));
+                assert_eq!(
+                    lconfig.prop_offset(SettingKind::OutputValue, GPIO).unwrap(),
+                    Setting::OutputValue(Value::InActive)
+                );
+            }
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/line_info.rs b/bindings/rust/libgpiod/tests/line_info.rs
new file mode 100644
index 000000000000..54a8a1133e89
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_info.rs
@@ -0,0 +1,272 @@
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
+    use vmm_sys_util::errno::Error as Errno;
+
+    use crate::common::*;
+    use gpiosim::Sim;
+    use gpiosim::{GPIOSIM_HOG_DIR_INPUT, GPIOSIM_HOG_DIR_OUTPUT_HIGH, GPIOSIM_HOG_DIR_OUTPUT_LOW};
+    use libgpiod::{
+        chip::Chip, Bias, Direction, Drive, Edge, Error as ChipError, EventClock, OperationType,
+    };
+
+    const NGPIO: u64 = 8;
+
+    mod properties {
+        use super::*;
+
+        #[test]
+        fn default() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.set_line_name(4, "four").unwrap();
+            sim.hog_line(4, "hog4", GPIOSIM_HOG_DIR_OUTPUT_LOW as i32)
+                .unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            let info4 = chip.line_info(4).unwrap();
+            assert_eq!(info4.offset(), 4);
+            assert_eq!(info4.name().unwrap(), "four");
+            assert!(info4.is_used());
+            assert_eq!(info4.consumer().unwrap(), "hog4");
+            assert_eq!(info4.direction().unwrap(), Direction::Output);
+            assert!(!info4.is_active_low());
+            assert_eq!(info4.bias().unwrap(), None);
+            assert_eq!(info4.drive().unwrap(), Drive::PushPull);
+            assert_eq!(info4.edge_detection().unwrap(), None);
+            assert_eq!(info4.event_clock().unwrap(), EventClock::Monotonic);
+            assert!(!info4.is_debounced());
+            assert_eq!(info4.debounce_period(), Duration::from_millis(0));
+
+            assert_eq!(
+                chip.line_info(NGPIO as u32).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipGetLineInfo, Errno::new(EINVAL))
+            );
+        }
+
+        #[test]
+        fn name_and_offset() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+
+            // Line 0 has no name
+            for i in 1..NGPIO {
+                sim.set_line_name(i as u32, &i.to_string()).unwrap();
+            }
+            sim.enable().unwrap();
+
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+            let info = chip.line_info(0).unwrap();
+
+            assert_eq!(info.offset(), 0);
+            assert_eq!(
+                info.name().unwrap_err(),
+                ChipError::NullString("GPIO line's name")
+            );
+
+            for i in 1..NGPIO {
+                let info = chip.line_info(i as u32).unwrap();
+
+                assert_eq!(info.offset(), i as u32);
+                assert_eq!(info.name().unwrap(), &i.to_string());
+            }
+        }
+
+        #[test]
+        fn is_used() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.hog_line(0, "hog", GPIOSIM_HOG_DIR_OUTPUT_HIGH as i32)
+                .unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            let info = chip.line_info(0).unwrap();
+            assert!(info.is_used());
+
+            let info = chip.line_info(1).unwrap();
+            assert!(!info.is_used());
+        }
+
+        #[test]
+        fn consumer() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.hog_line(0, "hog", GPIOSIM_HOG_DIR_OUTPUT_HIGH as i32)
+                .unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            let info = chip.line_info(0).unwrap();
+            assert_eq!(info.consumer().unwrap(), "hog");
+
+            let info = chip.line_info(1).unwrap();
+            assert_eq!(
+                info.consumer().unwrap_err(),
+                ChipError::NullString("GPIO line's consumer name")
+            );
+        }
+
+        #[test]
+        fn direction() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.hog_line(0, "hog", GPIOSIM_HOG_DIR_INPUT as i32)
+                .unwrap();
+            sim.hog_line(1, "hog", GPIOSIM_HOG_DIR_OUTPUT_HIGH as i32)
+                .unwrap();
+            sim.hog_line(2, "hog", GPIOSIM_HOG_DIR_OUTPUT_LOW as i32)
+                .unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            let info = chip.line_info(0).unwrap();
+            assert_eq!(info.direction().unwrap(), Direction::Input);
+
+            let info = chip.line_info(1).unwrap();
+            assert_eq!(info.direction().unwrap(), Direction::Output);
+
+            let info = chip.line_info(2).unwrap();
+            assert_eq!(info.direction().unwrap(), Direction::Output);
+        }
+
+        #[test]
+        fn bias() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), None);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_bias(Direction::Input, Some(Bias::PullUp));
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullUp));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_bias(Direction::Input, Some(Bias::PullDown));
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullDown));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_bias(Direction::Input, Some(Bias::Disabled));
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::Disabled));
+        }
+
+        #[test]
+        fn drive() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_drive(Direction::Input, Drive::PushPull);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_drive(Direction::Output, Drive::OpenDrain);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenDrain);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_drive(Direction::Output, Drive::OpenSource);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenSource);
+        }
+
+        #[test]
+        fn edge() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), None);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_edge(Some(Direction::Input), Some(Edge::Both));
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Both));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_edge(Some(Direction::Input), Some(Edge::Rising));
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Rising));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_edge(Some(Direction::Input), Some(Edge::Falling));
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Falling));
+        }
+
+        #[test]
+        fn clock() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_clock(EventClock::Monotonic);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_clock(EventClock::Realtime);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
+        }
+
+        #[test]
+        fn debounce() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(!info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(0));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_debounce(Duration::from_millis(100));
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(100));
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
new file mode 100644
index 000000000000..bcbc4fb5b711
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_request {
+    use libc::{E2BIG, EBUSY, EINVAL};
+    use std::time::Duration;
+
+    use vmm_sys_util::errno::Error as Errno;
+
+    use crate::common::*;
+    use gpiosim::{
+        GPIOSIM_PULL_DOWN, GPIOSIM_PULL_UP, GPIOSIM_VALUE_ACTIVE, GPIOSIM_VALUE_INACTIVE,
+    };
+    use libgpiod::{
+        line, Bias, Direction, Drive, Edge, Error as ChipError, EventClock, Offset, OperationType,
+        Setting, SettingMap, Value, ValueMap,
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
+            config.lconfig_val_raw();
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed(OperationType::LineRequest, Errno::new(EINVAL))
+            );
+        }
+
+        #[test]
+        fn duplicate_offsets() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[2, 0, 0, 4]);
+            config.lconfig_val_raw();
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed(OperationType::LineRequest, Errno::new(EBUSY))
+            );
+        }
+
+        #[test]
+        fn out_of_bound_offsets() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[2, 0, 8, 4]);
+            config.lconfig_val_raw();
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed(OperationType::LineRequest, Errno::new(EINVAL))
+            );
+        }
+
+        #[test]
+        fn dir_out_edge_failure() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_edge(Some(Direction::Output), Some(Edge::Both));
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed(OperationType::LineRequest, Errno::new(EINVAL))
+            );
+        }
+    }
+
+    mod verify {
+        use super::*;
+
+        #[test]
+        fn custom_consumer() {
+            const GPIO: Offset = 2;
+            const CONSUMER: &str = "foobar";
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[GPIO]);
+            config.rconfig_set_consumer(CONSUMER);
+            config.lconfig_val_raw();
+            config.request_lines().unwrap();
+
+            let info = config.chip().line_info(GPIO).unwrap();
+
+            assert!(info.is_used());
+            assert_eq!(info.consumer().unwrap(), CONSUMER);
+        }
+
+        #[test]
+        fn empty_consumer() {
+            const GPIO: Offset = 2;
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[GPIO]);
+            config.lconfig_val_raw();
+            config.request_lines().unwrap();
+
+            let info = config.chip().line_info(GPIO).unwrap();
+
+            assert!(info.is_used());
+            assert_eq!(info.consumer().unwrap(), "?");
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
+            config.rconfig_set_offsets(&offsets);
+            config.lconfig_val(Some(Direction::Input), None, None);
+            config.request_lines().unwrap();
+
+            let request = config.request();
+
+            // Single values read properly
+            assert_eq!(request.value(7).unwrap(), Value::Active);
+
+            // Values read properly
+            let map = request.values().unwrap();
+            for i in 0..offsets.len() {
+                assert_eq!(
+                    *map.get(offsets[i].into()).unwrap(),
+                    match pulls[i] {
+                        GPIOSIM_PULL_DOWN => Value::InActive,
+                        _ => Value::Active,
+                    }
+                );
+            }
+
+            // Subset of values read properly
+            let map = request.values_subset(&[2, 0, 6]).unwrap();
+            assert_eq!(*map.get(2).unwrap(), Value::InActive);
+            assert_eq!(*map.get(0).unwrap(), Value::InActive);
+            assert_eq!(*map.get(6).unwrap(), Value::Active);
+
+            // Value read properly after reconfigure
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[Setting::ActiveLow(true)]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            assert_eq!(request.value(7).unwrap(), Value::InActive);
+        }
+
+        #[test]
+        fn set_output_values() {
+            let offsets = [0, 1, 3, 4];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&offsets);
+            config.lconfig_val(
+                Some(Direction::Output),
+                Some(Value::Active),
+                Some((4, Value::InActive)),
+            );
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
+        fn update_output_values() {
+            let offsets = [0, 1, 3, 4];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&offsets);
+            config.lconfig_val(Some(Direction::Output), Some(Value::InActive), None);
+            config.request_lines().unwrap();
+            let request = config.request();
+
+            // Set single value
+            request.set_value(1, Value::Active).unwrap();
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            request.set_value(1, Value::InActive).unwrap();
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_INACTIVE);
+
+            // Set values of subset
+            let mut map = ValueMap::new();
+            map.insert(4, Value::Active);
+            map.insert(3, Value::Active);
+            request.set_values_subset(map).unwrap();
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_ACTIVE);
+
+            let mut map = ValueMap::new();
+            map.insert(4, Value::InActive);
+            map.insert(3, Value::InActive);
+            request.set_values_subset(map).unwrap();
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+
+            // Set all values
+            request
+                .set_values(&[
+                    Value::Active,
+                    Value::InActive,
+                    Value::Active,
+                    Value::InActive,
+                ])
+                .unwrap();
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_INACTIVE);
+            request
+                .set_values(&[
+                    Value::InActive,
+                    Value::InActive,
+                    Value::InActive,
+                    Value::InActive,
+                ])
+                .unwrap();
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
+            config.rconfig_set_offsets(&offsets);
+            config.lconfig_bias(Direction::Input, Some(Bias::PullUp));
+            config.request_lines().unwrap();
+            config.request();
+
+            // Set single value
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+        }
+
+        #[test]
+        fn no_events() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.request_lines().unwrap();
+
+            // No events available
+            assert!(!config
+                .request()
+                .wait_edge_event(Some(Duration::from_millis(100)))
+                .unwrap());
+        }
+    }
+
+    mod reconfigure {
+        use super::*;
+
+        #[test]
+        fn e2big() {
+            let mut config = TestConfig::new(16).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+
+            let request = config.request();
+
+            // Reconfigure
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[Setting::Direction(Direction::Input)]);
+
+            let mut map = SettingMap::new();
+
+            // The uAPI config has only 10 attribute slots, this should pass.
+            for offset in 0..10 {
+                map.insert(
+                    offset,
+                    Setting::DebouncePeriod(Duration::from_millis(100 + offset)),
+                );
+            }
+
+            lconfig.set_prop_override(map.clone());
+            assert!(request.reconfigure_lines(&lconfig).is_ok());
+
+            // The uAPI config has only 10 attribute slots, and this is the 11th entry.
+            // This should fail with E2BIG.
+            map.insert(11, Setting::DebouncePeriod(Duration::from_millis(100 + 11)));
+            lconfig.set_prop_override(map.clone());
+            assert_eq!(
+                request.reconfigure_lines(&lconfig).unwrap_err(),
+                ChipError::OperationFailed(
+                    OperationType::LineRequestReconfigLines,
+                    Errno::new(E2BIG),
+                )
+            );
+        }
+
+        #[test]
+        fn bias() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), None);
+
+            let request = config.request();
+
+            // Reconfigure
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::Bias(Some(Bias::PullUp)),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullUp));
+
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::Bias(Some(Bias::PullDown)),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullDown));
+
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::Bias(Some(Bias::Disabled)),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::Disabled));
+        }
+
+        #[test]
+        fn drive() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let request = config.request();
+
+            // Reconfigure
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::Drive(Drive::PushPull),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Output),
+                Setting::Drive(Drive::OpenDrain),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenDrain);
+
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Output),
+                Setting::Drive(Drive::OpenSource),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenSource);
+        }
+
+        #[test]
+        fn edge() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), None);
+
+            let request = config.request();
+
+            // Reconfigure
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::EdgeDetection(Some(Edge::Both)),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Both));
+
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::EdgeDetection(Some(Edge::Rising)),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Rising));
+
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::EdgeDetection(Some(Edge::Falling)),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Falling));
+        }
+
+        #[test]
+        fn event_clock() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let request = config.request();
+
+            // Reconfigure
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[Setting::EventClock(EventClock::Monotonic)]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[Setting::EventClock(EventClock::Realtime)]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
+        }
+
+        #[test]
+        fn debounce() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.rconfig_set_offsets(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(!info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(0));
+
+            let request = config.request();
+
+            // Reconfigure
+            let mut lconfig = line::Config::new().unwrap();
+            lconfig.set_prop_default(&[
+                Setting::Direction(Direction::Input),
+                Setting::DebouncePeriod(Duration::from_millis(100)),
+            ]);
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(100));
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/request_config.rs b/bindings/rust/libgpiod/tests/request_config.rs
new file mode 100644
index 000000000000..1d2f9468ca4c
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/request_config.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod request_config {
+    use vmm_sys_util::errno::Error as Errno;
+
+    use libgpiod::{request, Error as ChipError, OperationType};
+
+    mod verify {
+        use super::*;
+
+        #[test]
+        fn default() {
+            let rconfig = request::Config::new().unwrap();
+
+            assert_eq!(rconfig.offsets().len(), 0);
+            assert_eq!(rconfig.event_buffer_size(), 0);
+            assert_eq!(
+                rconfig.consumer().unwrap_err(),
+                ChipError::OperationFailed(OperationType::RequestConfigGetConsumer, Errno::new(0))
+            );
+        }
+
+        #[test]
+        fn initialized() {
+            let offsets = [0, 1, 2, 3];
+            const CONSUMER: &str = "foobar";
+            let rconfig = request::Config::new().unwrap();
+            rconfig.set_consumer(CONSUMER);
+            rconfig.set_offsets(&offsets);
+            rconfig.set_event_buffer_size(64);
+
+            assert_eq!(rconfig.offsets(), offsets);
+            assert_eq!(rconfig.event_buffer_size(), 64);
+            assert_eq!(rconfig.consumer().unwrap(), CONSUMER);
+        }
+    }
+}
-- 
2.31.1.272.g89b43f80a514

