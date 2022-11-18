Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628E462F2E4
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 11:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241053AbiKRKqL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 05:46:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241720AbiKRKpw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 05:45:52 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA5499E9F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:21 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so4271921pjb.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+UBAzg3xIzDsNbZZn3du7a1aLnhNNUqO6Og7qPm99U=;
        b=wzocFElOFWF58dKf0XtC176wfDcz4z8lFC7mGDI4EbIcxel4TQllEvuQyRtQ8htLSp
         d0wrYUSCJ90IkPOCFh6HzbXbDJa01CBmeCPSlbXK92G0sSdF0idAkUYD/GTctAr2uIIX
         QMzkNtpgCPAgO65+a6jRCzGscpvdyFHFzCh5YYD3sIKs/RE/4bGV2K8qubnlHk0PdFmD
         0CUsNTkmXDJuzkAQuhdb+F9yanA6VHzH/x8kkFh2VCmSjOXnQ7ouzNDsSqK2wRBOoUlI
         x3H/MQFeYou4ef3XKlzMIroVWYniiJsX9eSQu4y2ovldC4BdUGSohyMg8MABnbFURvsE
         yWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+UBAzg3xIzDsNbZZn3du7a1aLnhNNUqO6Og7qPm99U=;
        b=yqhvC9doRpY9gRnBi9DwpUbG5I3PXjjukxfSQ2jclA8MhP2hU1v9ptDKmkJfBAq2iz
         v+1pbC2rvIAEKtooEeItkOrO8jvmclU22HuaKAa+NBNxg18azXnIpPoS8CB8X1zbzW9q
         V5s1fVTl+ANUzDRj26M+E57wyNKATqP3UadUeOOB3O3GozgPQYAdppnSL+Kw/9YgVLrP
         CAGYNMbOJAvaW3lpmS6IDObNv9W3QR1llap9anBYFK+Ba73xttZeN4b8Hb6/LOIFwjU0
         Vf8FiOwR15I6aI8zSRSBoEEyaVhXabzjt3yhwb7hjjOegrd+CxbNt2JVw9x38D2sHwUf
         LOIg==
X-Gm-Message-State: ANoB5pmM/jjWAKHpki+gFok7IzHHCGdgvXOaxW6xsgbvJmfv8lpAFj1t
        uUIUORuOArxma+sl9W9i7O3J+A==
X-Google-Smtp-Source: AA0mqf5PZyZmYAOIymbz31l1oEEY6DAbiA5BFtZCTyBVy+4frH96Qt37Bn3cIgrpq0kTbLrUjn0vHg==
X-Received: by 2002:a17:90a:7183:b0:212:ede4:3c19 with SMTP id i3-20020a17090a718300b00212ede43c19mr7309344pjk.151.1668768320284;
        Fri, 18 Nov 2022 02:45:20 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902b20f00b00188ef2314b0sm3245940plr.39.2022.11.18.02.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 02:45:19 -0800 (PST)
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
Subject: [libgpiod][PATCH V10 5/6] bindings: rust: Add tests for libgpiod crate
Date:   Fri, 18 Nov 2022 16:14:41 +0530
Message-Id: <b0602a43f761cd07b8c41e262aa04c6cc02e1b2a.1668768040.git.viresh.kumar@linaro.org>
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

Add tests for the rust bindings, quite similar to the ones in cxx
bindings.

Reviewed-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml             |   3 +
 bindings/rust/libgpiod/tests/chip.rs          |  97 ++++
 bindings/rust/libgpiod/tests/common/config.rs | 142 +++++
 bindings/rust/libgpiod/tests/common/mod.rs    |   9 +
 bindings/rust/libgpiod/tests/edge_event.rs    | 297 ++++++++++
 bindings/rust/libgpiod/tests/info_event.rs    | 166 ++++++
 bindings/rust/libgpiod/tests/line_config.rs   |  95 ++++
 bindings/rust/libgpiod/tests/line_info.rs     | 275 ++++++++++
 bindings/rust/libgpiod/tests/line_request.rs  | 509 ++++++++++++++++++
 bindings/rust/libgpiod/tests/line_settings.rs | 203 +++++++
 .../rust/libgpiod/tests/request_config.rs     |  38 ++
 11 files changed, 1834 insertions(+)
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
index a38df1c0b10d..655e7a2ce107 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -20,3 +20,6 @@ intmap = "2.0.0"
 libc = "0.2.39"
 libgpiod-sys = { path = "../libgpiod-sys" }
 thiserror = "1.0"
+
+[dev-dependencies]
+gpiosim-sys = { path = "../gpiosim-sys" }
diff --git a/bindings/rust/libgpiod/tests/chip.rs b/bindings/rust/libgpiod/tests/chip.rs
new file mode 100644
index 000000000000..702af93e5f2c
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/chip.rs
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod chip {
+    use libc::{ENODEV, ENOENT, ENOTTY};
+    use std::path::PathBuf;
+
+    use gpiosim_sys::Sim;
+    use libgpiod::{chip::Chip, Error as ChipError, OperationType};
+
+    mod open {
+        use super::*;
+
+        #[test]
+        fn nonexistent_file() {
+            assert_eq!(
+                Chip::open(&PathBuf::from("/dev/nonexistent")).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipOpen, errno::Errno(ENOENT))
+            );
+        }
+
+        #[test]
+        fn no_dev_file() {
+            assert_eq!(
+                Chip::open(&PathBuf::from("/tmp")).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipOpen, errno::Errno(ENOTTY))
+            );
+        }
+
+        #[test]
+        fn non_gpio_char_dev_file() {
+            assert_eq!(
+                Chip::open(&PathBuf::from("/dev/null")).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipOpen, errno::Errno(ENODEV))
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
+        const NGPIO: usize = 16;
+        const LABEL: &str = "foobar";
+
+        #[test]
+        fn basic_helpers() {
+            let sim = Sim::new(Some(NGPIO), Some(LABEL), true).unwrap();
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+            let info = chip.info().unwrap();
+
+            assert_eq!(info.label().unwrap(), LABEL);
+            assert_eq!(info.name().unwrap(), sim.chip_name());
+            assert_eq!(chip.path().unwrap(), sim.dev_path().to_str().unwrap());
+            assert_eq!(info.num_lines(), NGPIO as usize);
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
+                ChipError::OperationFailed(
+                    OperationType::ChipGetLineOffsetFromName,
+                    errno::Errno(ENOENT),
+                )
+            );
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/common/config.rs b/bindings/rust/libgpiod/tests/common/config.rs
new file mode 100644
index 000000000000..842a70a9d70e
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/common/config.rs
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::sync::{Arc, Mutex};
+use std::time::Duration;
+
+use gpiosim_sys::{Pull, Sim, Value as SimValue};
+use libgpiod::{
+    chip::Chip,
+    line::{self, Bias, Direction, Drive, Edge, EventClock, Offset, SettingVal, Value},
+    request, Result,
+};
+
+pub(crate) struct TestConfig {
+    sim: Arc<Mutex<Sim>>,
+    chip: Option<Chip>,
+    request: Option<request::Request>,
+    rconfig: request::Config,
+    lconfig: line::Config,
+    lsettings: Option<line::Settings>,
+}
+
+impl TestConfig {
+    pub(crate) fn new(ngpio: usize) -> Result<Self> {
+        Ok(Self {
+            sim: Arc::new(Mutex::new(Sim::new(Some(ngpio), None, true)?)),
+            chip: None,
+            request: None,
+            rconfig: request::Config::new().unwrap(),
+            lconfig: line::Config::new().unwrap(),
+            lsettings: Some(line::Settings::new().unwrap()),
+        })
+    }
+
+    pub(crate) fn set_pull(&self, offsets: &[Offset], pulls: &[Pull]) {
+        for i in 0..pulls.len() {
+            self.sim
+                .lock()
+                .unwrap()
+                .set_pull(offsets[i], pulls[i])
+                .unwrap();
+        }
+    }
+
+    pub(crate) fn rconfig_set_consumer(&self, consumer: &str) {
+        self.rconfig.set_consumer(consumer).unwrap();
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
+        let chip = Chip::open(&self.sim.lock().unwrap().dev_path())?;
+
+        self.request = Some(chip.request_lines(&self.rconfig, &self.lconfig)?);
+        self.chip = Some(chip);
+
+        Ok(())
+    }
+
+    pub(crate) fn sim(&self) -> Arc<Mutex<Sim>> {
+        self.sim.clone()
+    }
+
+    pub(crate) fn sim_val(&self, offset: Offset) -> Result<SimValue> {
+        self.sim.lock().unwrap().val(offset)
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
+    pub(crate) fn request(&self) -> &request::Request {
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
index 000000000000..5f725c61f905
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/common/mod.rs
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+#[allow(dead_code)]
+mod config;
+
+#[allow(unused_imports)]
+pub(crate) use config::*;
diff --git a/bindings/rust/libgpiod/tests/edge_event.rs b/bindings/rust/libgpiod/tests/edge_event.rs
new file mode 100644
index 000000000000..571e574fa15e
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/edge_event.rs
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod edge_event {
+    use std::time::Duration;
+
+    use crate::common::*;
+    use gpiosim_sys::{Pull, Sim};
+    use libgpiod::{
+        line::{Edge, EdgeKind, Offset},
+        request,
+    };
+
+    const NGPIO: usize = 8;
+
+    mod buffer_capacity {
+        use super::*;
+
+        #[test]
+        fn default_capacity() {
+            assert_eq!(request::Buffer::new(0).unwrap().capacity(), 64);
+        }
+
+        #[test]
+        fn user_defined_capacity() {
+            assert_eq!(request::Buffer::new(123).unwrap().capacity(), 123);
+        }
+
+        #[test]
+        fn max_capacity() {
+            assert_eq!(request::Buffer::new(1024 * 2).unwrap().capacity(), 1024);
+        }
+    }
+
+    mod trigger {
+        use super::*;
+        use std::{
+            sync::{Arc, Mutex},
+            thread,
+        };
+
+        // Helpers to generate events
+        fn trigger_falling_and_rising_edge(sim: Arc<Mutex<Sim>>, offset: Offset) {
+            thread::spawn(move || {
+                thread::sleep(Duration::from_millis(30));
+                sim.lock().unwrap().set_pull(offset, Pull::Up).unwrap();
+
+                thread::sleep(Duration::from_millis(30));
+                sim.lock().unwrap().set_pull(offset, Pull::Down).unwrap();
+            });
+        }
+
+        fn trigger_rising_edge_events_on_two_offsets(sim: Arc<Mutex<Sim>>, offset: [Offset; 2]) {
+            thread::spawn(move || {
+                thread::sleep(Duration::from_millis(30));
+                sim.lock().unwrap().set_pull(offset[0], Pull::Up).unwrap();
+
+                thread::sleep(Duration::from_millis(30));
+                sim.lock().unwrap().set_pull(offset[1], Pull::Up).unwrap();
+            });
+        }
+
+        fn trigger_multiple_events(sim: Arc<Mutex<Sim>>, offset: Offset) {
+            sim.lock().unwrap().set_pull(offset, Pull::Up).unwrap();
+            thread::sleep(Duration::from_millis(10));
+
+            sim.lock().unwrap().set_pull(offset, Pull::Down).unwrap();
+            thread::sleep(Duration::from_millis(10));
+
+            sim.lock().unwrap().set_pull(offset, Pull::Up).unwrap();
+            thread::sleep(Duration::from_millis(10));
+        }
+
+        #[test]
+        fn both_edges() {
+            const GPIO: Offset = 2;
+            let mut buf = request::Buffer::new(0).unwrap();
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
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
+
+            let event = events.next().unwrap().unwrap();
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
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
+
+            let event = events.next().unwrap().unwrap();
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
+            let mut buf = request::Buffer::new(0).unwrap();
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
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
+
+            let event = events.next().unwrap().unwrap();
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
+            let mut buf = request::Buffer::new(0).unwrap();
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
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
+
+            let event = events.next().unwrap().unwrap();
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
+            let mut buf = request::Buffer::new(0).unwrap();
+            assert!(config
+                .request()
+                .wait_edge_event(Some(Duration::from_secs(1)))
+                .unwrap());
+
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
+
+            let event = events.next().unwrap().unwrap();
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
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
+
+            let event = events.next().unwrap().unwrap();
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
+            let mut buf = request::Buffer::new(0).unwrap();
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
+            let events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 3);
+
+            let mut global_seqno = 1;
+            let mut line_seqno = 1;
+
+            // Verify sequence number of events
+            for event in events {
+                let event = event.unwrap();
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
+            let mut buf = request::Buffer::new(2).unwrap();
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
+            let events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 2);
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/info_event.rs b/bindings/rust/libgpiod/tests/info_event.rs
new file mode 100644
index 000000000000..bfa0058e313e
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/info_event.rs
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod info_event {
+    use libc::EINVAL;
+    use std::{
+        sync::{
+            mpsc::{self, Receiver, Sender},
+            Arc, Mutex,
+        },
+        thread,
+        time::Duration,
+    };
+
+    use gpiosim_sys::Sim;
+    use libgpiod::{
+        chip::Chip,
+        line::{self, Direction, InfoChangeKind, Offset},
+        request, Error as ChipError, OperationType,
+    };
+
+    fn request_reconfigure_line(chip: Arc<Mutex<Chip>>, tx: Sender<()>, rx: Receiver<()>) {
+        thread::spawn(move || {
+            let lconfig1 = line::Config::new().unwrap();
+            let lsettings = line::Settings::new().unwrap();
+            lconfig1.add_line_settings(&[7], lsettings).unwrap();
+            let rconfig = request::Config::new().unwrap();
+
+            let request = chip
+                .lock()
+                .unwrap()
+                .request_lines(&rconfig, &lconfig1)
+                .unwrap();
+
+            // Signal the parent to continue
+            tx.send(()).expect("Could not send signal on channel");
+
+            // Wait for parent to signal
+            rx.recv().expect("Could not receive from channel");
+
+            let lconfig2 = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings.set_direction(Direction::Output).unwrap();
+            lconfig2.add_line_settings(&[7], lsettings).unwrap();
+
+            request.reconfigure_lines(&lconfig2).unwrap();
+
+            // Signal the parent to continue
+            tx.send(()).expect("Could not send signal on channel");
+
+            // Wait for parent to signal
+            rx.recv().expect("Could not receive from channel");
+        });
+    }
+
+    mod watch {
+        use super::*;
+        const NGPIO: usize = 8;
+        const GPIO: Offset = 7;
+
+        #[test]
+        fn line_info() {
+            let sim = Sim::new(Some(NGPIO), None, true).unwrap();
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            assert_eq!(
+                chip.watch_line_info(NGPIO as u32).unwrap_err(),
+                ChipError::OperationFailed(OperationType::ChipWatchLineInfo, errno::Errno(EINVAL))
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
+            let chip = Arc::new(Mutex::new(Chip::open(&sim.dev_path()).unwrap()));
+            let info = chip.lock().unwrap().watch_line_info(GPIO).unwrap();
+
+            assert_eq!(info.direction().unwrap(), Direction::Input);
+
+            // Thread synchronizing mechanism
+            let (tx_main, rx_thread) = mpsc::channel();
+            let (tx_thread, rx_main) = mpsc::channel();
+
+            // Generate events
+            request_reconfigure_line(chip.clone(), tx_thread, rx_thread);
+
+            // Wait for thread to signal
+            rx_main.recv().expect("Could not receive from channel");
+
+            // Line requested event
+            assert!(chip
+                .lock()
+                .unwrap()
+                .wait_info_event(Some(Duration::from_secs(1)))
+                .unwrap());
+            let event = chip.lock().unwrap().read_info_event().unwrap();
+            let ts_req = event.timestamp();
+
+            assert_eq!(event.event_type().unwrap(), InfoChangeKind::LineRequested);
+            assert_eq!(
+                event.line_info().unwrap().direction().unwrap(),
+                Direction::Input
+            );
+
+            // Signal the thread to continue
+            tx_main.send(()).expect("Could not send signal on channel");
+
+            // Wait for thread to signal
+            rx_main.recv().expect("Could not receive from channel");
+
+            // Line changed event
+            assert!(chip
+                .lock()
+                .unwrap()
+                .wait_info_event(Some(Duration::from_secs(1)))
+                .unwrap());
+            let event = chip.lock().unwrap().read_info_event().unwrap();
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
+            // Signal the thread to continue
+            tx_main.send(()).expect("Could not send signal on channel");
+
+            // Line released event
+            assert!(chip
+                .lock()
+                .unwrap()
+                .wait_info_event(Some(Duration::from_secs(1)))
+                .unwrap());
+            let event = chip.lock().unwrap().read_info_event().unwrap();
+            let ts_rel = event.timestamp();
+
+            assert_eq!(event.event_type().unwrap(), InfoChangeKind::LineReleased);
+
+            // No events available
+            assert!(!chip
+                .lock()
+                .unwrap()
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
index 000000000000..bebf106f3f8b
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_config.rs
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_config {
+    use libgpiod::line::{
+        self, Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value,
+    };
+
+    #[test]
+    fn settings() {
+        let mut lsettings1 = line::Settings::new().unwrap();
+        lsettings1
+            .set_direction(Direction::Input)
+            .unwrap()
+            .set_edge_detection(Some(Edge::Both))
+            .unwrap()
+            .set_bias(Some(Bias::PullDown))
+            .unwrap()
+            .set_drive(Drive::PushPull)
+            .unwrap();
+
+        let mut lsettings2 = line::Settings::new().unwrap();
+        lsettings2
+            .set_direction(Direction::Output)
+            .unwrap()
+            .set_active_low(true)
+            .set_event_clock(EventClock::Realtime)
+            .unwrap()
+            .set_output_value(Value::Active)
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
+        lsettings1.set_direction(Direction::Input).unwrap();
+
+        let mut lsettings2 = line::Settings::new().unwrap();
+        lsettings2.set_event_clock(EventClock::Realtime).unwrap();
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
index 000000000000..9e4928b49682
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_info.rs
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_info {
+    use libc::EINVAL;
+    use std::time::Duration;
+
+    use crate::common::*;
+    use gpiosim_sys::{Direction as SimDirection, Sim};
+    use libgpiod::{
+        chip::Chip,
+        line::{Bias, Direction, Drive, Edge, EventClock},
+        Error as ChipError, OperationType,
+    };
+
+    const NGPIO: usize = 8;
+
+    mod properties {
+        use super::*;
+
+        #[test]
+        fn default() {
+            let sim = Sim::new(Some(NGPIO), None, false).unwrap();
+            sim.set_line_name(4, "four").unwrap();
+            sim.hog_line(4, "hog4", SimDirection::OutputLow).unwrap();
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
+                ChipError::OperationFailed(OperationType::ChipGetLineInfo, errno::Errno(EINVAL))
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
+            sim.hog_line(0, "hog", SimDirection::OutputHigh).unwrap();
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
+            sim.hog_line(0, "hog", SimDirection::OutputHigh).unwrap();
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
+            sim.hog_line(0, "hog", SimDirection::Input).unwrap();
+            sim.hog_line(1, "hog", SimDirection::OutputHigh).unwrap();
+            sim.hog_line(2, "hog", SimDirection::OutputLow).unwrap();
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
+        fn event_clock() {
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
+        }
+
+        #[test]
+        #[ignore]
+        fn event_clock_hte() {
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
index 000000000000..286cd6ca6722
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_request {
+    use libc::{E2BIG, EINVAL};
+    use std::time::Duration;
+
+    use crate::common::*;
+    use gpiosim_sys::{Pull, Value as SimValue};
+    use libgpiod::{
+        line::{
+            self, Bias, Direction, Drive, Edge, EventClock, Offset, SettingVal, Value, ValueMap,
+        },
+        Error as ChipError, OperationType,
+    };
+
+    const NGPIO: usize = 8;
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
+                ChipError::OperationFailed(OperationType::ChipRequestLines, errno::Errno(EINVAL))
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
+                ChipError::OperationFailed(OperationType::ChipRequestLines, errno::Errno(EINVAL))
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
+                ChipError::OperationFailed(OperationType::ChipRequestLines, errno::Errno(EINVAL))
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
+            let pulls = [Pull::Up, Pull::Up, Pull::Down, Pull::Up, Pull::Down];
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
+                        Pull::Down => Value::InActive,
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
+            lsettings.set_active_low(true);
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
+            assert_eq!(config.sim_val(0).unwrap(), SimValue::Active);
+            assert_eq!(config.sim_val(1).unwrap(), SimValue::Active);
+            assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
+            assert_eq!(config.sim_val(4).unwrap(), SimValue::Active);
+
+            // Default
+            assert_eq!(config.sim_val(2).unwrap(), SimValue::InActive);
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
+            assert_eq!(config.sim_val(0).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(1).unwrap(), SimValue::Active);
+            assert_eq!(config.sim_val(3).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
+            request.set_value(1, Value::InActive).unwrap();
+            assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
+
+            // Set values of subset
+            let mut map = ValueMap::new();
+            map.insert(4, Value::Active);
+            map.insert(3, Value::Active);
+            request.set_values_subset(map).unwrap();
+            assert_eq!(config.sim_val(0).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
+            assert_eq!(config.sim_val(4).unwrap(), SimValue::Active);
+
+            let mut map = ValueMap::new();
+            map.insert(4, Value::InActive);
+            map.insert(3, Value::InActive);
+            request.set_values_subset(map).unwrap();
+            assert_eq!(config.sim_val(3).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
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
+            assert_eq!(config.sim_val(0).unwrap(), SimValue::Active);
+            assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
+            assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
+            request
+                .set_values(&[
+                    Value::InActive,
+                    Value::InActive,
+                    Value::InActive,
+                    Value::InActive,
+                ])
+                .unwrap();
+            assert_eq!(config.sim_val(0).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(3).unwrap(), SimValue::InActive);
+            assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
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
+            assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
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
+            lsettings.set_direction(Direction::Input).unwrap();
+            let lconfig = line::Config::new().unwrap();
+
+            // The uAPI config has only 10 attribute slots, this should pass.
+            for offset in offsets {
+                lsettings.set_debounce_period(Duration::from_millis((100 + offset).into()));
+                lconfig
+                    .add_line_settings(&[offset as Offset], lsettings.settings_clone().unwrap())
+                    .unwrap();
+            }
+
+            assert!(request.reconfigure_lines(&lconfig).is_ok());
+
+            // The uAPI config has only 10 attribute slots, and this is the 11th entry.
+            // This should fail with E2BIG.
+            lsettings.set_debounce_period(Duration::from_millis(100 + 11));
+            lconfig.add_line_settings(&[11], lsettings).unwrap();
+
+            assert_eq!(
+                request.reconfigure_lines(&lconfig).unwrap_err(),
+                ChipError::OperationFailed(
+                    OperationType::LineRequestReconfigLines,
+                    errno::Errno(E2BIG),
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
+            lsettings.set_event_clock(EventClock::Monotonic).unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
+
+            let lconfig = line::Config::new().unwrap();
+            let mut lsettings = line::Settings::new().unwrap();
+            lsettings.set_event_clock(EventClock::Realtime).unwrap();
+            lconfig.add_line_settings(&[0], lsettings).unwrap();
+            request.reconfigure_lines(&lconfig).unwrap();
+            let info = config.chip().line_info(0).unwrap();
+            assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
+        }
+
+        #[test]
+        #[ignore]
+        fn event_clock_hte() {
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
+            lsettings.set_event_clock(EventClock::HTE).unwrap();
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
index 000000000000..de2148ee6018
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/line_settings.rs
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod line_settings {
+    use std::time::Duration;
+
+    use libgpiod::line::{
+        self, Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value,
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
+        lsettings.set_direction(Direction::Input).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Direction).unwrap(),
+            SettingVal::Direction(Direction::Input)
+        );
+
+        lsettings.set_direction(Direction::Output).unwrap();
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
+        lsettings.set_edge_detection(Some(Edge::Both)).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EdgeDetection).unwrap(),
+            SettingVal::EdgeDetection(Some(Edge::Both))
+        );
+
+        lsettings.set_edge_detection(Some(Edge::Rising)).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EdgeDetection).unwrap(),
+            SettingVal::EdgeDetection(Some(Edge::Rising))
+        );
+
+        lsettings.set_edge_detection(Some(Edge::Falling)).unwrap();
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
+        lsettings.set_bias(Some(Bias::PullDown)).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Bias).unwrap(),
+            SettingVal::Bias(Some(Bias::PullDown))
+        );
+
+        lsettings.set_bias(Some(Bias::PullUp)).unwrap();
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
+        lsettings.set_drive(Drive::PushPull).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Drive).unwrap(),
+            SettingVal::Drive(Drive::PushPull)
+        );
+
+        lsettings.set_drive(Drive::OpenDrain).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::Drive).unwrap(),
+            SettingVal::Drive(Drive::OpenDrain)
+        );
+
+        lsettings.set_drive(Drive::OpenSource).unwrap();
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
+        lsettings.set_active_low(true);
+        assert_eq!(
+            lsettings.prop(SettingKind::ActiveLow).unwrap(),
+            SettingVal::ActiveLow(true)
+        );
+
+        lsettings.set_active_low(false);
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
+        lsettings.set_debounce_period(Duration::from_millis(5));
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
+        lsettings.set_event_clock(EventClock::Realtime).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::Realtime)
+        );
+
+        lsettings.set_event_clock(EventClock::Monotonic).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::Monotonic)
+        );
+    }
+
+    #[test]
+    #[ignore]
+    fn event_clock_hte() {
+        let mut lsettings = line::Settings::new().unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::Monotonic)
+        );
+
+        lsettings.set_event_clock(EventClock::HTE).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::EventClock).unwrap(),
+            SettingVal::EventClock(EventClock::HTE)
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
+        lsettings.set_output_value(Value::Active).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::OutputValue).unwrap(),
+            SettingVal::OutputValue(Value::Active)
+        );
+
+        lsettings.set_output_value(Value::InActive).unwrap();
+        assert_eq!(
+            lsettings.prop(SettingKind::OutputValue).unwrap(),
+            SettingVal::OutputValue(Value::InActive)
+        );
+    }
+}
diff --git a/bindings/rust/libgpiod/tests/request_config.rs b/bindings/rust/libgpiod/tests/request_config.rs
new file mode 100644
index 000000000000..8c676384b7c3
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/request_config.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+mod common;
+
+mod request_config {
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
+                ChipError::OperationFailed(
+                    OperationType::RequestConfigGetConsumer,
+                    errno::Errno(0),
+                )
+            );
+        }
+
+        #[test]
+        fn initialized() {
+            const CONSUMER: &str = "foobar";
+            let rconfig = request::Config::new().unwrap();
+            rconfig.set_consumer(CONSUMER).unwrap();
+            rconfig.set_event_buffer_size(64);
+
+            assert_eq!(rconfig.event_buffer_size(), 64);
+            assert_eq!(rconfig.consumer().unwrap(), CONSUMER);
+        }
+    }
+}
-- 
2.31.1.272.g89b43f80a514

