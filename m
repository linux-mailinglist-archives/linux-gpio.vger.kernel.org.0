Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E85F5FECB5
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 12:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJNKr4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 06:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiJNKr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 06:47:56 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EDD017C571
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:53 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fw14so4584826pjb.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PqqC7ow9t7jrTBJVzrcMldISkd15Fbtqq81Nn4JxIE=;
        b=wXDFLlnhemmmEJPZRluOyRD7nhTYJibLFZmalIy7PVlTw1nEab0NkPvBuy815P3fc/
         7zJLjE1i+4/0zXnESQcx7FSUJcwbQhONMaG/TZfgPIR1vCK5odU/kjBIAQwJX93mY6XR
         YetHVyTyCZLWpCkefjGkTF10u1di+Vl/dPWEvXJ6zSBcVXxMtBL9jq+h2ZjIUsaaj+sa
         3qkiEgsvLAKf4Nw8rSo9Beap/ZPARmoypz8MJBEJmGplQmImJAS/i6RBNkdc6jgK+i7W
         t7TeGn+8kgUgfIe3w3XfmZy6sYdX5nKzef7kQDS/4D64bOaJWsOXYEpzTsnYfzXbwRzD
         yh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PqqC7ow9t7jrTBJVzrcMldISkd15Fbtqq81Nn4JxIE=;
        b=bJRuYJXdmEe3rTHJt+cS72Io5NvNxcCfkQVScMiTgRDCT3gEy4ybresDQpSfbx12QU
         8GHKLOdRs4QGMig6DSUcWQ/1TMCkDJqZ+3rfli7+oV/RAhF4ZVRWMZx1mh/8MlZdww4l
         m3TWcO3vqEyu4fXTsSFZVjBHplHBIoAzzQ87nY5ncNRdHN4PRzkQqbJ2/0Un6rXLk9P/
         5Yb1tt0WjIEhz8Zjx5q7Znga3l2eylzuxD64rNzC4Kvz07Nw8BIp7Nv8jZNzYAC62nh3
         xGlMcodE18XJAdpUCN9Csj4RJpZOHT9SfFsjL2pzS0jtibDRwjEN6Gbg8bIPuqvc4fw+
         zE2g==
X-Gm-Message-State: ACrzQf3KeVMK3l87dmL7R4CaXuH9s8Ke7GeqN549l1fce4TQVk8JN198
        7zuhq8na8WW6oJ5/U2cwo538iXOa7HEm4A==
X-Google-Smtp-Source: AMsMyM6cWrastWgPe/lWUIgA88gAa0m13AkYrnvq/eln+nb2SLDHJ7OHf2vgGoH7UXFTTIvMG3+RCQ==
X-Received: by 2002:a17:90a:bb06:b0:20d:9ac5:c227 with SMTP id u6-20020a17090abb0600b0020d9ac5c227mr5147674pjr.4.1665744472541;
        Fri, 14 Oct 2022 03:47:52 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0053e6d352ae4sm1398624pfg.24.2022.10.14.03.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 03:47:51 -0700 (PDT)
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
Subject: [PATCH V7 7/8] libgpiod: Add rust tests
Date:   Fri, 14 Oct 2022 16:17:24 +0530
Message-Id: <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1665744170.git.viresh.kumar@linaro.org>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
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
 bindings/rust/libgpiod/tests/common/config.rs | 134 +++++
 bindings/rust/libgpiod/tests/common/mod.rs    |  10 +
 bindings/rust/libgpiod/tests/edge_event.rs    | 296 ++++++++++
 bindings/rust/libgpiod/tests/info_event.rs    | 125 +++++
 bindings/rust/libgpiod/tests/line_config.rs   | 105 ++++
 bindings/rust/libgpiod/tests/line_info.rs     | 279 ++++++++++
 bindings/rust/libgpiod/tests/line_request.rs  | 519 ++++++++++++++++++
 bindings/rust/libgpiod/tests/line_settings.rs | 226 ++++++++
 .../rust/libgpiod/tests/request_config.rs     |  38 ++
 11 files changed, 1832 insertions(+)
 create mode 100644 bindings/rust/libgpiod/tests/chip.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/config.rs
 create mode 100644 bindings/rust/libgpiod/tests/common/mod.rs
 create mode 100644 bindings/rust/libgpiod/tests/edge_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/info_event.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_config.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_info.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_request.rs
 create mode 100644 bindings/rust/libgpiod/tests/line_settings.rs
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
index 000000000000..ef4285067ebf
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/common/config.rs
@@ -0,0 +1,134 @@
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
+    chip::Chip, line, request, Bias, Direction, Drive, Edge, EventClock, Offset, Result,
+    SettingVal, Value,
+};
+
+pub(crate) struct TestConfig {
+    sim: Arc<Sim>,
+    chip: Option<Chip>,
+    request: Option<line::Request>,
+    rconfig: request::Config,
+    lconfig: line::Config,
+    lsettings: Option<line::Settings>,
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
+            lsettings: Some(line::Settings::new().unwrap()),
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
+    pub(crate) fn lconfig_val(&mut self, dir: Option<Direction>, val: Option<Value>) {
+        let mut settings = Vec::new();
+
+        if let Some(dir) = dir {
+            settings.push(SettingVal::Direction(dir));
+        }
+
+        if let Some(val) = val {
+            settings.push(SettingVal::OutputValue(val));
+        }
+
+        if !settings.is_empty() {
+            self.lsettings().set_prop(&settings).unwrap();
+        }
+    }
+
+    pub(crate) fn lconfig_bias(&mut self, dir: Direction, bias: Option<Bias>) {
+        let settings = vec![SettingVal::Direction(dir), SettingVal::Bias(bias)];
+        self.lsettings().set_prop(&settings).unwrap();
+    }
+
+    pub(crate) fn lconfig_clock(&mut self, clock: EventClock) {
+        let settings = vec![SettingVal::EventClock(clock)];
+        self.lsettings().set_prop(&settings).unwrap();
+    }
+
+    pub(crate) fn lconfig_debounce(&mut self, duration: Duration) {
+        let settings = vec![
+            SettingVal::Direction(Direction::Input),
+            SettingVal::DebouncePeriod(duration),
+        ];
+        self.lsettings().set_prop(&settings).unwrap();
+    }
+
+    pub(crate) fn lconfig_drive(&mut self, dir: Direction, drive: Drive) {
+        let settings = vec![SettingVal::Direction(dir), SettingVal::Drive(drive)];
+        self.lsettings().set_prop(&settings).unwrap();
+    }
+
+    pub(crate) fn lconfig_edge(&mut self, dir: Option<Direction>, edge: Option<Edge>) {
+        let mut settings = Vec::new();
+
+        if let Some(dir) = dir {
+            settings.push(SettingVal::Direction(dir));
+        }
+
+        settings.push(SettingVal::EdgeDetection(edge));
+        self.lsettings().set_prop(&settings).unwrap();
+    }
+
+    pub(crate) fn lconfig_add_settings(&mut self, offsets: &[Offset]) {
+        self.lconfig
+            .add_line_settings(offsets, self.lsettings.take().unwrap())
+            .unwrap()
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
+    pub(crate) fn lsettings(&mut self) -> &mut line::Settings {
+        self.lsettings.as_mut().unwrap()
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
index 000000000000..7dc4b489103b
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/edge_event.rs
@@ -0,0 +1,296 @@
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
+            let mut buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.lconfig_add_settings(&[GPIO]);
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
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            let ts_rising = event.timestamp();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
+            assert_eq!(event.line_offset(), GPIO);
+            drop(event);
+
+            // Falling event
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
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
+            let mut buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(None, Some(Edge::Rising));
+            config.lconfig_add_settings(&[GPIO]);
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
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
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
+            let mut buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(None, Some(Edge::Falling));
+            config.lconfig_add_settings(&[GPIO]);
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
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
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
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.lconfig_add_settings(&GPIO);
+            config.request_lines().unwrap();
+
+            // Generate events
+            trigger_rising_edge_events_on_two_offsets(config.sim(), GPIO);
+
+            // Rising event GPIO 0
+            let mut buf = edge::event::Buffer::new(0).unwrap();
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
+            assert_eq!(buf.len(), 1);
+
+            let event = buf.event(0).unwrap();
+            assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
+            assert_eq!(event.line_offset(), GPIO[0]);
+            assert_eq!(event.global_seqno(), 1);
+            assert_eq!(event.line_seqno(), 1);
+            drop(event);
+
+            // Rising event GPIO 1
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
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
+            let mut buf = edge::event::Buffer::new(0).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.lconfig_add_settings(&[GPIO]);
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
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 3);
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
+            let mut buf = edge::event::Buffer::new(2).unwrap();
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.lconfig_add_settings(&[GPIO]);
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
+            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 2);
+            assert_eq!(buf.len(), 2);
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/info_event.rs b/bindings/rust/libgpiod/tests/info_event.rs
new file mode 100644
index 000000000000..8c342992d74e
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/info_event.rs
@@ -0,0 +1,125 @@
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
+        OperationType, SettingVal,
+    };
+
+    fn request_reconfigure_line(chip: Arc<Chip>) {
+        spawn(move || {
+            sleep(Duration::from_millis(10));
+
+            let lconfig1 = line::Config::new().unwrap();
+            let lsettings = line::Settings::new().unwrap();
+            lconfig1.add_line_settings(&[7], lsettings).unwrap();
+            let rconfig = request::Config::new().unwrap();
+
+            let request = chip.request_lines(&rconfig, &lconfig1).unwrap();
+
+            sleep(Duration::from_millis(10));
+
+            let lconfig2 = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[SettingVal::Direction(Direction::Output)])
+                .unwrap();
+            lconfig2.add_line_settings(&[7], lsettings).unwrap();
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
index 000000000000..e65cd1d23f9b
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_config.rs
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_config {
+    use libgpiod::{
+        line, Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value,
+    };
+
+    #[test]
+    fn settings() {
+        let mut lsettings1 = line::Settings::new().unwrap();
+        lsettings1
+            .set_prop(&[SettingVal::Direction(Direction::Input)])
+            .unwrap();
+        lsettings1
+            .set_prop(&[SettingVal::EdgeDetection(Some(Edge::Both))])
+            .unwrap();
+        lsettings1
+            .set_prop(&[SettingVal::Bias(Some(Bias::PullDown))])
+            .unwrap();
+        lsettings1
+            .set_prop(&[SettingVal::Drive(Drive::PushPull)])
+            .unwrap();
+
+        let mut lsettings2 = line::Settings::new().unwrap();
+        lsettings2
+            .set_prop(&[SettingVal::Direction(Direction::Output)])
+            .unwrap();
+        lsettings2.set_prop(&[SettingVal::ActiveLow(true)]).unwrap();
+        lsettings2
+            .set_prop(&[SettingVal::EventClock(EventClock::Realtime)])
+            .unwrap();
+        lsettings2
+            .set_prop(&[SettingVal::OutputValue(Value::Active)])
+            .unwrap();
+
+        // Add settings for multiple lines
+        let lconfig = line::Config::new().unwrap();
+        lconfig.add_line_settings(&[0, 1, 2], lsettings1).unwrap();
+        lconfig.add_line_settings(&[4, 5], lsettings2).unwrap();
+
+        // Retrieve settings
+        let lsettings = lconfig.line_settings(1).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Direction).unwrap(),
+            SettingVal::Direction(Direction::Input)
+        );
+        assert_eq!(
+            lsettings.prop(SettingKind::EdgeDetection).unwrap(),
+            SettingVal::EdgeDetection(Some(Edge::Both))
+        );
+        assert_eq!(
+            lsettings.prop(SettingKind::Bias).unwrap(),
+            SettingVal::Bias(Some(Bias::PullDown))
+        );
+        assert_eq!(
+            lsettings.prop(SettingKind::Drive).unwrap(),
+            SettingVal::Drive(Drive::PushPull)
+        );
+
+        let lsettings = lconfig.line_settings(5).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Direction).unwrap(),
+            SettingVal::Direction(Direction::Output)
+        );
+        assert_eq!(
+            lsettings.prop(SettingKind::ActiveLow).unwrap(),
+            SettingVal::ActiveLow(true)
+        );
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::Realtime)
+        );
+        assert_eq!(
+            lsettings.prop(SettingKind::OutputValue).unwrap(),
+            SettingVal::OutputValue(Value::Active)
+        );
+    }
+
+    #[test]
+    fn offsets() {
+        let mut lsettings1 = line::Settings::new().unwrap();
+        lsettings1
+            .set_prop(&[SettingVal::Direction(Direction::Input)])
+            .unwrap();
+
+        let mut lsettings2 = line::Settings::new().unwrap();
+        lsettings2
+            .set_prop(&[SettingVal::EventClock(EventClock::Realtime)])
+            .unwrap();
+
+        // Add settings for multiple lines
+        let lconfig = line::Config::new().unwrap();
+        lconfig.add_line_settings(&[0, 1, 2], lsettings1).unwrap();
+        lconfig.add_line_settings(&[4, 5], lsettings2).unwrap();
+
+        // Verify offsets
+        let offsets = lconfig.offsets().unwrap();
+        assert_eq!(offsets, [0, 1, 2, 4, 5]);
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/line_info.rs b/bindings/rust/libgpiod/tests/line_info.rs
new file mode 100644
index 000000000000..22edeb4da263
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_info.rs
@@ -0,0 +1,279 @@
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
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), None);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_bias(Direction::Input, Some(Bias::PullUp));
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullUp));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_bias(Direction::Input, Some(Bias::PullDown));
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullDown));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_bias(Direction::Input, Some(Bias::Disabled));
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::Disabled));
+        }
+
+        #[test]
+        fn drive() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_drive(Direction::Input, Drive::PushPull);
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_drive(Direction::Output, Drive::OpenDrain);
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenDrain);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_drive(Direction::Output, Drive::OpenSource);
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenSource);
+        }
+
+        #[test]
+        fn edge() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), None);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(Some(Direction::Input), Some(Edge::Both));
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Both));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(Some(Direction::Input), Some(Edge::Rising));
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Rising));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_edge(Some(Direction::Input), Some(Edge::Falling));
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Falling));
+        }
+
+        #[test]
+        fn clock() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_clock(EventClock::Monotonic);
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_clock(EventClock::Realtime);
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_clock(EventClock::HTE);
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::HTE);
+        }
+
+        #[test]
+        fn debounce() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(!info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(0));
+
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_debounce(Duration::from_millis(100));
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(100));
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
new file mode 100644
index 000000000000..e933fe7cb74a
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -0,0 +1,519 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_request {
+    use libc::{E2BIG, EINVAL};
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
+        SettingVal, Value, ValueMap,
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
+
+            assert_eq!(
+                config.request_lines().unwrap_err(),
+                ChipError::OperationFailed(OperationType::LineRequest, Errno::new(EINVAL))
+            );
+        }
+
+        #[test]
+        fn out_of_bound_offsets() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[2, 0, 8, 4]);
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
+            config.lconfig_edge(Some(Direction::Output), Some(Edge::Both));
+            config.lconfig_add_settings(&[0]);
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
+            config.rconfig_set_consumer(CONSUMER);
+            config.lconfig_add_settings(&[GPIO]);
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
+            config.lconfig_add_settings(&[GPIO]);
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
+            config.lconfig_val(Some(Direction::Input), None);
+            config.lconfig_add_settings(&offsets);
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
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings.set_prop(&[SettingVal::ActiveLow(true)]).unwrap();
+            let lconfig = line::Config::new().unwrap();
+            lconfig.add_line_settings(&offsets, lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            assert_eq!(request.value(7).unwrap(), Value::InActive);
+        }
+
+        #[test]
+        fn set_output_values() {
+            let offsets = [0, 1, 3, 4];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_val(Some(Direction::Output), Some(Value::Active));
+            config.lconfig_add_settings(&offsets);
+            config.request_lines().unwrap();
+
+            assert_eq!(config.sim().val(0).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(1).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
+            assert_eq!(config.sim().val(4).unwrap(), GPIOSIM_VALUE_ACTIVE);
+
+            // Default
+            assert_eq!(config.sim().val(2).unwrap(), GPIOSIM_VALUE_INACTIVE);
+        }
+
+        #[test]
+        fn update_output_values() {
+            let offsets = [0, 1, 3, 4];
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_val(Some(Direction::Output), Some(Value::InActive));
+            config.lconfig_add_settings(&offsets);
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
+            config.lconfig_bias(Direction::Input, Some(Bias::PullUp));
+            config.lconfig_add_settings(&offsets);
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
+            config.lconfig_edge(None, Some(Edge::Both));
+            config.lconfig_add_settings(&[0]);
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
+            let offsets = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
+            let mut config = TestConfig::new(16).unwrap();
+            config.lconfig_add_settings(&offsets);
+            config.request_lines().unwrap();
+
+            let request = config.request();
+
+            // Reconfigure
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[SettingVal::Direction(Direction::Input)])
+                .unwrap();
+            let lconfig = line::Config::new().unwrap();
+
+            // The uAPI config has only 10 attribute slots, this should pass.
+            for offset in offsets {
+                lsettings
+                    .set_prop(&[SettingVal::DebouncePeriod(Duration::from_millis(
+                        (100 + offset).into(),
+                    ))])
+                    .unwrap();
+                lconfig
+                    .add_line_settings(&[offset as Offset], lsettings.settings_clone().unwrap())
+                    .unwrap();
+            }
+
+            assert!(request.reconfigure_lines(&lconfig).is_ok());
+
+            // The uAPI config has only 10 attribute slots, and this is the 11th entry.
+            // This should fail with E2BIG.
+            lsettings
+                .set_prop(&[SettingVal::DebouncePeriod(Duration::from_millis(100 + 11))])
+                .unwrap();
+            lconfig.add_line_settings(&[11], lsettings).unwrap();
+
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
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), None);
+
+            let request = config.request();
+
+            // Reconfigure
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::Bias(Some(Bias::PullUp)),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullUp));
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::Bias(Some(Bias::PullDown)),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::PullDown));
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::Bias(Some(Bias::Disabled)),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.bias().unwrap(), Some(Bias::Disabled));
+        }
+
+        #[test]
+        fn drive() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let request = config.request();
+
+            // Reconfigure
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::Drive(Drive::PushPull),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::PushPull);
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Output),
+                    SettingVal::Drive(Drive::OpenDrain),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenDrain);
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Output),
+                    SettingVal::Drive(Drive::OpenSource),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.drive().unwrap(), Drive::OpenSource);
+        }
+
+        #[test]
+        fn edge() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), None);
+
+            let request = config.request();
+
+            // Reconfigure
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::EdgeDetection(Some(Edge::Both)),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Both));
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::EdgeDetection(Some(Edge::Rising)),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Rising));
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::EdgeDetection(Some(Edge::Falling)),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.edge_detection().unwrap(), Some(Edge::Falling));
+        }
+
+        #[test]
+        fn event_clock() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let request = config.request();
+
+            // Reconfigure
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[SettingVal::EventClock(EventClock::Monotonic)])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[SettingVal::EventClock(EventClock::Realtime)])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[SettingVal::EventClock(EventClock::HTE)])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::HTE);
+        }
+
+        #[test]
+        fn debounce() {
+            let mut config = TestConfig::new(NGPIO).unwrap();
+            config.lconfig_add_settings(&[0]);
+            config.request_lines().unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(!info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(0));
+
+            let request = config.request();
+
+            // Reconfigure
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings
+                .set_prop(&[
+                    SettingVal::Direction(Direction::Input),
+                    SettingVal::DebouncePeriod(Duration::from_millis(100)),
+                ])
+                .unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert!(info.is_debounced());
+            assert_eq!(info.debounce_period(), Duration::from_millis(100));
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/line_settings.rs b/bindings/rust/libgpiod/tests/line_settings.rs
new file mode 100644
index 000000000000..3f84bf328ab7
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_settings.rs
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_settings {
+    use std::time::Duration;
+
+    use libgpiod::{
+        line, Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value,
+    };
+
+    #[test]
+    fn direction() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Direction).unwrap(),
+            SettingVal::Direction(Direction::AsIs)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::Direction(Direction::Input)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Direction).unwrap(),
+            SettingVal::Direction(Direction::Input)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::Direction(Direction::Output)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Direction).unwrap(),
+            SettingVal::Direction(Direction::Output)
+        );
+    }
+
+    #[test]
+    fn edge_detection() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EdgeDetection).unwrap(),
+            SettingVal::EdgeDetection(None)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::EdgeDetection(Some(Edge::Both))])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EdgeDetection).unwrap(),
+            SettingVal::EdgeDetection(Some(Edge::Both))
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::EdgeDetection(Some(Edge::Rising))])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EdgeDetection).unwrap(),
+            SettingVal::EdgeDetection(Some(Edge::Rising))
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::EdgeDetection(Some(Edge::Falling))])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EdgeDetection).unwrap(),
+            SettingVal::EdgeDetection(Some(Edge::Falling))
+        );
+    }
+
+    #[test]
+    fn bias() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Bias).unwrap(),
+            SettingVal::Bias(None)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::Bias(Some(Bias::PullDown))])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Bias).unwrap(),
+            SettingVal::Bias(Some(Bias::PullDown))
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::Bias(Some(Bias::PullUp))])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Bias).unwrap(),
+            SettingVal::Bias(Some(Bias::PullUp))
+        );
+    }
+
+    #[test]
+    fn drive() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Drive).unwrap(),
+            SettingVal::Drive(Drive::PushPull)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::Drive(Drive::PushPull)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Drive).unwrap(),
+            SettingVal::Drive(Drive::PushPull)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::Drive(Drive::OpenDrain)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Drive).unwrap(),
+            SettingVal::Drive(Drive::OpenDrain)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::Drive(Drive::OpenSource)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Drive).unwrap(),
+            SettingVal::Drive(Drive::OpenSource)
+        );
+    }
+
+    #[test]
+    fn active_low() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::ActiveLow).unwrap(),
+            SettingVal::ActiveLow(false)
+        );
+
+        lsettings.set_prop(&[SettingVal::ActiveLow(true)]).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::ActiveLow).unwrap(),
+            SettingVal::ActiveLow(true)
+        );
+
+        lsettings.set_prop(&[SettingVal::ActiveLow(false)]).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::ActiveLow).unwrap(),
+            SettingVal::ActiveLow(false)
+        );
+    }
+
+    #[test]
+    fn debounce_period() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::DebouncePeriod).unwrap(),
+            SettingVal::DebouncePeriod(Duration::from_millis(0))
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::DebouncePeriod(Duration::from_millis(5))])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::DebouncePeriod).unwrap(),
+            SettingVal::DebouncePeriod(Duration::from_millis(5))
+        );
+    }
+
+    #[test]
+    fn event_clock() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::Monotonic)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::EventClock(EventClock::Realtime)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::Realtime)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::EventClock(EventClock::HTE)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::HTE)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::EventClock(EventClock::Monotonic)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::Monotonic)
+        );
+    }
+
+    #[test]
+    fn output_value() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::OutputValue).unwrap(),
+            SettingVal::OutputValue(Value::InActive)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::OutputValue(Value::Active)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::OutputValue).unwrap(),
+            SettingVal::OutputValue(Value::Active)
+        );
+
+        lsettings
+            .set_prop(&[SettingVal::OutputValue(Value::InActive)])
+            .unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::OutputValue).unwrap(),
+            SettingVal::OutputValue(Value::InActive)
+        );
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/request_config.rs b/bindings/rust/libgpiod/tests/request_config.rs
new file mode 100644
index 000000000000..d9892ee99101
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/request_config.rs
@@ -0,0 +1,38 @@
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
+            assert_eq!(rconfig.event_buffer_size(), 0);
+            assert_eq!(
+                rconfig.consumer().unwrap_err(),
+                ChipError::OperationFailed(OperationType::RequestConfigGetConsumer, Errno::new(0))
+            );
+        }
+
+        #[test]
+        fn initialized() {
+            const CONSUMER: &str = "foobar";
+            let rconfig = request::Config::new().unwrap();
+            rconfig.set_consumer(CONSUMER);
+            rconfig.set_event_buffer_size(64);
+
+            assert_eq!(rconfig.event_buffer_size(), 64);
+            assert_eq!(rconfig.consumer().unwrap(), CONSUMER);
+        }
+    }
+}
-- 
2.31.1.272.g89b43f80a514

