Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8B6587C37
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 14:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbiHBMSg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 08:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236338AbiHBMSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 08:18:34 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53154F689
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 05:18:29 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 12so12220992pga.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jT1QL/TYC6skFF8+F2Bp2JWBcAE5kwJOkiRecwRtsPI=;
        b=So1d2ZHqiikUUyVL2NvOq6yQBcXtEsjAxxt7mWTdLjBq3bMY4ggpprezqz7K7lud24
         WE1P68d5BZskSI+HGgNX6AsY2/A4qmN3gYxBUO0aNHcEEAN1Wr1azqw6FwLIr/iFSP+S
         ZgwIkB48xIdT0mnJ3J2xUECU6oDsOAvLV4wGgLKXvzbJgkwA30cAszQjOfFM7c6FRZE+
         ocJOd2G+vsCbSN48s4MNJrkmw/QYI8u4iamhAvseoyodqBQe3EKnVu7iB5bjylDrLA9n
         BGZgKcoOQgS+0BoJ67+UyjP9mNmerNzmIbybYnS8mNMHcsTvAx0TmI3a/aM5RY6AKPJz
         1cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jT1QL/TYC6skFF8+F2Bp2JWBcAE5kwJOkiRecwRtsPI=;
        b=6Gdtz1RvZ+5utQli0CXPVJQc0ni15y1kGl8cKA9xTfgheMJcHCvP2c/zwBNIhIx6VN
         Pz0hAHUo89ldAUYlfcjQY49OifOESpP5WtS+CIZNIY0q/xUrP7KLWMLRoBOV9K7BkwZL
         3kVYUAfQ1M2q5StmVl4lOTT0W3ttIAV+/xVv/ZLspexFXUDe4ZEVc25jCS+LQ8YI6tp7
         fo0U1YEq2mxPULQlX+bs5/i3AiuaMlxOzx5epu45QdPqQEa3C6Yhfw0ggPDuQOqRFtIz
         mWoAOeSthSOrpR8/RKOQsdoSwR52j3HZCNnmQ6k6mGVN7kjerZv2Xjn3KJHFK0LmsvdE
         SNxA==
X-Gm-Message-State: ACgBeo1WoI65X9PL7THYJHnxu0fjXti7E6++RpzPXZSZq0iow4EWQHJT
        bvN8/IeJB1NqpV0yBU3gE2ICzg==
X-Google-Smtp-Source: AA6agR4wFhu3BF06lqG3GBFNCS0THOvSFIHugJCB6icLC0tPg1OKN3cn7lczEylnLUWZU2mqDExBYg==
X-Received: by 2002:a05:6a00:2d1:b0:52d:36bb:14d7 with SMTP id b17-20020a056a0002d100b0052d36bb14d7mr12924368pft.22.1659442707792;
        Tue, 02 Aug 2022 05:18:27 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id g31-20020a63201f000000b0041ae78c3493sm9065214pgg.52.2022.08.02.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 05:18:27 -0700 (PDT)
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
Subject: [PATCH V5 3/8] libgpiod: Add rust wrapper crate
Date:   Tue,  2 Aug 2022 17:48:07 +0530
Message-Id: <802b554ebdae1a389f56bfc21e6ec7ad8677f9ff.1659442066.git.viresh.kumar@linaro.org>
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

Add rust wrapper crate, around the libpiod-sys crate added earlier, to
provide a convenient interface for the users.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/Cargo.toml                     |   1 +
 bindings/rust/libgpiod/Cargo.toml            |  13 +
 bindings/rust/libgpiod/src/chip.rs           | 253 ++++++++
 bindings/rust/libgpiod/src/edge_event.rs     | 102 ++++
 bindings/rust/libgpiod/src/event_buffer.rs   |  90 +++
 bindings/rust/libgpiod/src/info_event.rs     |  68 +++
 bindings/rust/libgpiod/src/lib.rs            | 477 +++++++++++++++
 bindings/rust/libgpiod/src/line_config.rs    | 586 +++++++++++++++++++
 bindings/rust/libgpiod/src/line_info.rs      | 180 ++++++
 bindings/rust/libgpiod/src/line_request.rs   | 246 ++++++++
 bindings/rust/libgpiod/src/request_config.rs | 119 ++++
 11 files changed, 2135 insertions(+)
 create mode 100644 bindings/rust/libgpiod/Cargo.toml
 create mode 100644 bindings/rust/libgpiod/src/chip.rs
 create mode 100644 bindings/rust/libgpiod/src/edge_event.rs
 create mode 100644 bindings/rust/libgpiod/src/event_buffer.rs
 create mode 100644 bindings/rust/libgpiod/src/info_event.rs
 create mode 100644 bindings/rust/libgpiod/src/lib.rs
 create mode 100644 bindings/rust/libgpiod/src/line_config.rs
 create mode 100644 bindings/rust/libgpiod/src/line_info.rs
 create mode 100644 bindings/rust/libgpiod/src/line_request.rs
 create mode 100644 bindings/rust/libgpiod/src/request_config.rs

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index d0b3a3c88ff1..1e57ef2c0002 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -2,4 +2,5 @@
 
 members = [
     "libgpiod-sys",
+    "libgpiod"
 ]
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
new file mode 100644
index 000000000000..f25242abb153
--- /dev/null
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -0,0 +1,13 @@
+[package]
+name = "libgpiod"
+version = "0.1.0"
+edition = "2018"
+
+# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
+
+[dependencies]
+intmap = "2.0.0"
+libc = ">=0.2.39"
+libgpiod-sys = { path = "../libgpiod-sys" }
+thiserror = "1.0"
+vmm-sys-util = "=0.10.0"
diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
new file mode 100644
index 000000000000..4f52c3f141f4
--- /dev/null
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use libc::strlen;
+use std::os::raw::c_char;
+use std::path::Path;
+use std::sync::Arc;
+use std::time::Duration;
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{gpiod, info, line, request, Error, Offset, OperationType, Result};
+
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub(crate) struct Internal {
+    chip: *mut gpiod::gpiod_chip,
+}
+
+impl Internal {
+    /// Find a chip by path.
+    pub(crate) fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
+        // Null-terminate the string
+        let path = path.as_ref().to_string_lossy() + "\0";
+
+        let chip = unsafe { gpiod::gpiod_chip_open(path.as_ptr() as *const c_char) };
+        if chip.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipOpen,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { chip })
+    }
+
+    /// Private helper, Returns gpiod_chip
+    pub(crate) fn chip(&self) -> *mut gpiod::gpiod_chip {
+        self.chip
+    }
+}
+
+impl Drop for Internal {
+    /// Close the chip and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_chip_close(self.chip) }
+    }
+}
+
+/// GPIO chip
+///
+/// A GPIO chip object is associated with an open file descriptor to the GPIO
+/// character device. It exposes basic information about the chip and allows
+/// callers to retrieve information about each line, watch lines for state
+/// changes and make line requests.
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Chip {
+    ichip: Arc<Internal>,
+    info: Info,
+}
+
+unsafe impl Send for Chip {}
+unsafe impl Sync for Chip {}
+
+impl Chip {
+    /// Find a chip by path.
+    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
+        let ichip = Arc::new(Internal::open(path)?);
+        let info = Info::new(ichip.clone())?;
+
+        Ok(Self { ichip, info })
+    }
+
+    /// Get the chip name as represented in the kernel.
+    pub fn name(&self) -> Result<&str> {
+        self.info.name()
+    }
+
+    /// Get the chip label as represented in the kernel.
+    pub fn label(&self) -> Result<&str> {
+        self.info.label()
+    }
+
+    /// Get the number of GPIO lines exposed by the chip.
+    pub fn num_lines(&self) -> usize {
+        self.info.num_lines()
+    }
+
+    /// Get the path used to find the chip.
+    pub fn path(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Chip`.
+        let path = unsafe { gpiod::gpiod_chip_get_path(self.ichip.chip()) };
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        str::from_utf8(unsafe { slice::from_raw_parts(path as *const u8, strlen(path) as usize) })
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get information about the chip.
+    pub fn info(&self) -> Result<Info> {
+        Info::new(self.ichip.clone())
+    }
+
+    /// Get a snapshot of information about the line.
+    pub fn line_info(&self, offset: Offset) -> Result<line::Info> {
+        line::Info::new(self.ichip.clone(), offset)
+    }
+
+    /// Get the current snapshot of information about the line at given offset and start watching
+    /// it for future changes.
+    pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info> {
+        line::Info::new_watch(self.ichip.clone(), offset)
+    }
+
+    /// Stop watching a line
+    pub fn unwatch(&self, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_chip_unwatch_line_info(self.ichip.chip(), offset);
+        }
+    }
+
+    /// Get the file descriptor associated with the chip.
+    ///
+    /// The returned file descriptor must not be closed by the caller, else other methods for the
+    /// `struct Chip` may fail.
+    pub fn fd(&self) -> Result<u32> {
+        let fd = unsafe { gpiod::gpiod_chip_get_fd(self.ichip.chip()) };
+
+        if fd < 0 {
+            Err(Error::OperationFailed(
+                OperationType::ChipGetFd,
+                Errno::last(),
+            ))
+        } else {
+            Ok(fd as u32)
+        }
+    }
+
+    /// Wait for line status events on any of the watched lines on the chip.
+    pub fn wait_info_event(&self, timeout: Option<Duration>) -> Result<bool> {
+        let timeout = match timeout {
+            Some(x) => x.as_nanos() as i64,
+            // Block indefinitely
+            None => -1,
+        };
+
+        let ret = unsafe { gpiod::gpiod_chip_wait_info_event(self.ichip.chip(), timeout) };
+
+        match ret {
+            -1 => Err(Error::OperationFailed(
+                OperationType::ChipWaitInfoEvent,
+                Errno::last(),
+            )),
+            0 => Ok(false),
+            _ => Ok(true),
+        }
+    }
+
+    /// Read a single line status change event from the chip. If no events are
+    /// pending, this function will block.
+    pub fn read_info_event(&self) -> Result<info::Event> {
+        info::Event::new(&self.ichip)
+    }
+
+    /// Map a GPIO line's name to its offset within the chip.
+    pub fn line_offset_from_name(&self, name: &str) -> Result<Offset> {
+        // Null-terminate the string
+        let name = name.to_owned() + "\0";
+
+        let ret = unsafe {
+            gpiod::gpiod_chip_get_line_offset_from_name(
+                self.ichip.chip(),
+                name.as_ptr() as *const c_char,
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::ChipGetLine,
+                Errno::last(),
+            ))
+        } else {
+            Ok(ret as u32)
+        }
+    }
+
+    /// Request a set of lines for exclusive usage.
+    pub fn request_lines(
+        &self,
+        rconfig: &request::Config,
+        lconfig: &line::Config,
+    ) -> Result<line::Request> {
+        line::Request::new(&self.ichip, rconfig, lconfig)
+    }
+}
+
+/// GPIO chip Information
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Info {
+    info: *mut gpiod::gpiod_chip_info,
+}
+
+impl Info {
+    /// Find a GPIO chip by path.
+    pub(crate) fn new(chip: Arc<Internal>) -> Result<Self> {
+        let info = unsafe { gpiod::gpiod_chip_get_info(chip.chip()) };
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipInfoGet,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { info })
+    }
+
+    /// Get the GPIO chip name as represented in the kernel.
+    pub(crate) fn name(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Chip`.
+        let name = unsafe { gpiod::gpiod_chip_info_get_name(self.info) };
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        str::from_utf8(unsafe { slice::from_raw_parts(name as *const u8, strlen(name) as usize) })
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get the GPIO chip label as represented in the kernel.
+    pub(crate) fn label(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Chip`.
+        let label = unsafe { gpiod::gpiod_chip_info_get_label(self.info) };
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        str::from_utf8(unsafe { slice::from_raw_parts(label as *const u8, strlen(label) as usize) })
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get the number of GPIO lines exposed by the chip.
+    pub(crate) fn num_lines(&self) -> usize {
+        unsafe { gpiod::gpiod_chip_info_get_num_lines(self.info) as usize }
+    }
+}
+
+impl Drop for Info {
+    /// Close the GPIO chip info and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_chip_info_free(self.info) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
new file mode 100644
index 000000000000..ce583916a2e3
--- /dev/null
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::sync::Arc;
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{edge::event::BufferInternal, gpiod, EdgeKind, Error, Offset, OperationType, Result};
+
+/// Line edge events handling
+///
+/// An edge event object contains information about a single line edge event.
+/// It contains the event type, timestamp and the offset of the line on which
+/// the event occurred as well as two sequence numbers (global for all lines
+/// in the associated request and local for this line only).
+///
+/// Edge events are stored into an edge-event buffer object to improve
+/// performance and to limit the number of memory allocations when a large
+/// number of events are being read.
+
+#[derive(Debug, Eq, PartialEq)]
+pub struct Event {
+    ibuffer: Option<Arc<BufferInternal>>,
+    event: *mut gpiod::gpiod_edge_event,
+}
+
+impl Event {
+    /// Get an event stored in the buffer.
+    pub(crate) fn new(ibuffer: &Arc<BufferInternal>, index: u64) -> Result<Self> {
+        let event = unsafe { gpiod::gpiod_edge_event_buffer_get_event(ibuffer.buffer(), index) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::EdgeEventBufferGetEvent,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self {
+            ibuffer: Some(ibuffer.clone()),
+            event,
+        })
+    }
+
+    pub fn event_clone(&self) -> Result<Self> {
+        let event = unsafe { gpiod::gpiod_edge_event_copy(self.event) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::EdgeEventCopy,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self {
+            ibuffer: None,
+            event,
+        })
+    }
+
+    /// Get the event type.
+    pub fn event_type(&self) -> Result<EdgeKind> {
+        EdgeKind::new(unsafe { gpiod::gpiod_edge_event_get_event_type(self.event) } as u32)
+    }
+
+    /// Get the timestamp of the event.
+    pub fn timestamp(&self) -> Duration {
+        Duration::from_nanos(unsafe { gpiod::gpiod_edge_event_get_timestamp_ns(self.event) })
+    }
+
+    /// Get the offset of the line on which the event was triggered.
+    pub fn line_offset(&self) -> Offset {
+        unsafe { gpiod::gpiod_edge_event_get_line_offset(self.event) }
+    }
+
+    /// Get the global sequence number of the event.
+    ///
+    /// Returns sequence number of the event relative to all lines in the
+    /// associated line request.
+    pub fn global_seqno(&self) -> u64 {
+        unsafe { gpiod::gpiod_edge_event_get_global_seqno(self.event) }
+    }
+
+    /// Get the event sequence number specific to concerned line.
+    ///
+    /// Returns sequence number of the event relative to the line within the
+    /// lifetime of the associated line request.
+    pub fn line_seqno(&self) -> u64 {
+        unsafe { gpiod::gpiod_edge_event_get_line_seqno(self.event) }
+    }
+}
+
+impl Drop for Event {
+    /// Free the edge event.
+    fn drop(&mut self) {
+        // Free the event only if a copy is made
+        if self.ibuffer.is_none() {
+            unsafe { gpiod::gpiod_edge_event_free(self.event) };
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
new file mode 100644
index 000000000000..e272e7aa9e9d
--- /dev/null
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::raw::c_ulong;
+use std::sync::Arc;
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{edge, gpiod, Error, OperationType, Result};
+
+/// Line edge events buffer
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub(crate) struct BufferInternal {
+    buffer: *mut gpiod::gpiod_edge_event_buffer,
+}
+
+impl BufferInternal {
+    /// Create a new edge event buffer.
+    ///
+    /// If capacity equals 0, it will be set to a default value of 64. If
+    /// capacity is larger than 1024, it will be limited to 1024.
+    pub fn new(capacity: usize) -> Result<Self> {
+        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
+        if buffer.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::EdgeEventBufferNew,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { buffer })
+    }
+
+    /// Private helper, Returns gpiod_edge_event_buffer
+    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
+        self.buffer
+    }
+}
+
+impl Drop for BufferInternal {
+    /// Free the edge event buffer and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_edge_event_buffer_free(self.buffer) };
+    }
+}
+
+/// Line edge events buffer
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Buffer {
+    ibuffer: Arc<BufferInternal>,
+}
+
+impl Buffer {
+    /// Create a new edge event buffer.
+    ///
+    /// If capacity equals 0, it will be set to a default value of 64. If
+    /// capacity is larger than 1024, it will be limited to 1024.
+    pub fn new(capacity: usize) -> Result<Self> {
+        Ok(Self {
+            ibuffer: Arc::new(BufferInternal::new(capacity)?),
+        })
+    }
+
+    /// Private helper, Returns gpiod_edge_event_buffer
+    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
+        self.ibuffer.buffer()
+    }
+
+    /// Get the capacity of the event buffer.
+    pub fn capacity(&self) -> usize {
+        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer()) as usize }
+    }
+
+    /// Read an event stored in the buffer.
+    pub fn event(&self, index: u64) -> Result<edge::Event> {
+        edge::Event::new(&self.ibuffer, index)
+    }
+
+    /// Get the number of events the buffer contains.
+    pub fn len(&self) -> usize {
+        unsafe { gpiod::gpiod_edge_event_buffer_get_num_events(self.buffer()) as usize }
+    }
+
+    /// Check if buffer is empty.
+    pub fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+}
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
new file mode 100644
index 000000000000..d8be87df6679
--- /dev/null
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::sync::Arc;
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{chip, gpiod, line, Error, InfoChangeKind, OperationType, Result};
+
+/// Line status watch events
+///
+/// Accessors for the info event objects allowing to monitor changes in GPIO
+/// line state.
+///
+/// Callers can be notified about changes in line's state using the interfaces
+/// exposed by GPIO chips. Each info event contains information about the event
+/// itself (timestamp, type) as well as a snapshot of line's state in the form
+/// of a line-info object.
+
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Event {
+    event: *mut gpiod::gpiod_info_event,
+}
+
+impl Event {
+    /// Get a single chip's line's status change event.
+    pub(crate) fn new(ichip: &Arc<chip::Internal>) -> Result<Self> {
+        let event = unsafe { gpiod::gpiod_chip_read_info_event(ichip.chip()) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipReadInfoEvent,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { event })
+    }
+
+    /// Private helper, Returns gpiod_info_event
+    pub(crate) fn event(&self) -> *mut gpiod::gpiod_info_event {
+        self.event
+    }
+
+    /// Get the event type of the status change event.
+    pub fn event_type(&self) -> Result<InfoChangeKind> {
+        InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) } as u32)
+    }
+
+    /// Get the timestamp of the event, read from the monotonic clock.
+    pub fn timestamp(&self) -> Duration {
+        Duration::from_nanos(unsafe { gpiod::gpiod_info_event_get_timestamp_ns(self.event) })
+    }
+
+    /// Get the line-info object associated with the event.
+    pub fn line_info(&self) -> Result<line::Info> {
+        line::Info::new_from_event(self)
+    }
+}
+
+impl Drop for Event {
+    /// Free the info event object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_info_event_free(self.event) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
new file mode 100644
index 000000000000..4d49384c60f1
--- /dev/null
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -0,0 +1,477 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Rust wrappers for GPIOD APIs
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+//! libgpiod public API
+//!
+//! This is the complete documentation of the public Rust API made available to
+//! users of libgpiod.
+//!
+//! The API is logically split into several parts such as: GPIO chip & line
+//! operators, GPIO events handling etc.
+
+/// GPIO chip related definitions.
+pub mod chip;
+
+mod edge_event;
+mod event_buffer;
+
+/// GPIO chip edge event related definitions.
+pub mod edge {
+    pub use crate::edge_event::*;
+
+    /// GPIO chip edge event buffer related definitions.
+    pub mod event {
+        pub use crate::event_buffer::*;
+    }
+}
+
+mod info_event;
+
+/// GPIO chip info event related definitions.
+pub mod info {
+    pub use crate::info_event::*;
+}
+
+mod line_config;
+mod line_info;
+mod line_request;
+
+/// GPIO chip line related definitions.
+pub mod line {
+    pub use crate::line_config::*;
+    pub use crate::line_info::*;
+    pub use crate::line_request::*;
+}
+
+mod request_config;
+
+/// GPIO chip request related definitions.
+pub mod request {
+    pub use crate::request_config::*;
+}
+
+use libgpiod_sys as gpiod;
+
+use intmap::IntMap;
+use libc::strlen;
+use std::fs;
+use std::os::raw::c_char;
+use std::path::Path;
+use std::time::Duration;
+use std::{fmt, slice, str};
+
+use thiserror::Error as ThisError;
+use vmm_sys_util::errno::Error as Errno;
+
+/// Operation types, used with OperationFailed() Error.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum OperationType {
+    ChipOpen,
+    ChipGetFd,
+    ChipWaitInfoEvent,
+    ChipGetLine,
+    ChipGetLineInfo,
+    ChipInfoGet,
+    ChipReadInfoEvent,
+    ChipWatchLineInfo,
+    EdgeEventBufferGetEvent,
+    EdgeEventCopy,
+    EdgeEventBufferNew,
+    InfoEventGetLineInfo,
+    LineConfigNew,
+    LineConfigGetOutValDefault,
+    LineConfigGetOutValOffset,
+    LineRequest,
+    LineRequestReconfigLines,
+    LineRequestGetVal,
+    LineRequestGetValSubset,
+    LineRequestSetVal,
+    LineRequestSetValSubset,
+    LineRequestReadEdgeEvent,
+    LineRequestWaitEdgeEvent,
+    RequestConfigNew,
+    RequestConfigGetConsumer,
+    SimBankGetVal,
+    SimBankNew,
+    SimBankSetLabel,
+    SimBankSetNumLines,
+    SimBankSetLineName,
+    SimBankSetPull,
+    SimBankHogLine,
+    SimCtxNew,
+    SimDevNew,
+    SimDevEnable,
+    SimDevDisable,
+}
+
+impl fmt::Display for OperationType {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{:?}", self)
+    }
+}
+
+/// Result of libgpiod operations.
+pub type Result<T> = std::result::Result<T, Error>;
+
+/// Error codes for libgpiod operations.
+#[derive(Copy, Clone, Debug, PartialEq, ThisError)]
+pub enum Error {
+    #[error("Failed to get {0}")]
+    NullString(&'static str),
+    #[error("String not utf8: {0:?}")]
+    StringNotUtf8(str::Utf8Error),
+    #[error("Invalid enum {0} value: {1}")]
+    InvalidEnumValue(&'static str, u32),
+    #[error("Operation {0} Failed: {1}")]
+    OperationFailed(OperationType, Errno),
+    #[error("Setting mismatch, expected {0} found: {1}")]
+    SettingMismatch(Setting, Setting),
+    #[error("Invalid Arguments")]
+    InvalidArguments,
+    #[error("Std Io Error")]
+    IoError,
+}
+
+/// Value settings.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum Value {
+    /// Active
+    Active,
+    /// Inactive
+    InActive,
+}
+
+/// Maps offset to Value.
+pub type ValueMap = IntMap<Value>;
+
+impl Value {
+    pub fn new(val: i32) -> Result<Self> {
+        match val {
+            0 => Ok(Value::InActive),
+            1 => Ok(Value::Active),
+            _ => Err(Error::InvalidEnumValue("Value", val as u32)),
+        }
+    }
+
+    fn value(&self) -> i32 {
+        match self {
+            Value::Active => 1,
+            Value::InActive => 0,
+        }
+    }
+}
+
+/// Offset type.
+pub type Offset = u32;
+
+/// Direction settings.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum Direction {
+    /// Request the line(s), but don't change direction.
+    AsIs,
+    /// Direction is input - for reading the value of an externally driven GPIO line.
+    Input,
+    /// Direction is output - for driving the GPIO line.
+    Output,
+}
+
+impl Direction {
+    fn new(dir: u32) -> Result<Self> {
+        match dir {
+            gpiod::GPIOD_LINE_DIRECTION_AS_IS => Ok(Direction::AsIs),
+            gpiod::GPIOD_LINE_DIRECTION_INPUT => Ok(Direction::Input),
+            gpiod::GPIOD_LINE_DIRECTION_OUTPUT => Ok(Direction::Output),
+            _ => Err(Error::InvalidEnumValue("Direction", dir)),
+        }
+    }
+
+    fn gpiod_direction(&self) -> u32 {
+        match self {
+            Direction::AsIs => gpiod::GPIOD_LINE_DIRECTION_AS_IS,
+            Direction::Input => gpiod::GPIOD_LINE_DIRECTION_INPUT,
+            Direction::Output => gpiod::GPIOD_LINE_DIRECTION_OUTPUT,
+        }
+    }
+}
+
+/// Internal bias settings.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum Bias {
+    /// The internal bias is disabled.
+    Disabled,
+    /// The internal pull-up bias is enabled.
+    PullUp,
+    /// The internal pull-down bias is enabled.
+    PullDown,
+}
+
+impl Bias {
+    fn new(bias: u32) -> Result<Option<Self>> {
+        match bias {
+            gpiod::GPIOD_LINE_BIAS_UNKNOWN => Ok(None),
+            gpiod::GPIOD_LINE_BIAS_AS_IS => Ok(None),
+            gpiod::GPIOD_LINE_BIAS_DISABLED => Ok(Some(Bias::Disabled)),
+            gpiod::GPIOD_LINE_BIAS_PULL_UP => Ok(Some(Bias::PullUp)),
+            gpiod::GPIOD_LINE_BIAS_PULL_DOWN => Ok(Some(Bias::PullDown)),
+            _ => Err(Error::InvalidEnumValue("Bias", bias)),
+        }
+    }
+
+    fn gpiod_bias(bias: Option<Bias>) -> u32 {
+        match bias {
+            None => gpiod::GPIOD_LINE_BIAS_AS_IS,
+            Some(bias) => match bias {
+                Bias::Disabled => gpiod::GPIOD_LINE_BIAS_DISABLED,
+                Bias::PullUp => gpiod::GPIOD_LINE_BIAS_PULL_UP,
+                Bias::PullDown => gpiod::GPIOD_LINE_BIAS_PULL_DOWN,
+            },
+        }
+    }
+}
+
+/// Drive settings.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum Drive {
+    /// Drive setting is push-pull.
+    PushPull,
+    /// Line output is open-drain.
+    OpenDrain,
+    /// Line output is open-source.
+    OpenSource,
+}
+
+impl Drive {
+    fn new(drive: u32) -> Result<Self> {
+        match drive {
+            gpiod::GPIOD_LINE_DRIVE_PUSH_PULL => Ok(Drive::PushPull),
+            gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN => Ok(Drive::OpenDrain),
+            gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE => Ok(Drive::OpenSource),
+            _ => Err(Error::InvalidEnumValue("Drive", drive)),
+        }
+    }
+
+    fn gpiod_drive(&self) -> u32 {
+        match self {
+            Drive::PushPull => gpiod::GPIOD_LINE_DRIVE_PUSH_PULL,
+            Drive::OpenDrain => gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN,
+            Drive::OpenSource => gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE,
+        }
+    }
+}
+
+/// Edge detection settings.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum Edge {
+    /// Line detects rising edge events.
+    Rising,
+    /// Line detects falling edge events.
+    Falling,
+    /// Line detects both rising and falling edge events.
+    Both,
+}
+
+impl Edge {
+    fn new(edge: u32) -> Result<Option<Self>> {
+        match edge {
+            gpiod::GPIOD_LINE_EDGE_NONE => Ok(None),
+            gpiod::GPIOD_LINE_EDGE_RISING => Ok(Some(Edge::Rising)),
+            gpiod::GPIOD_LINE_EDGE_FALLING => Ok(Some(Edge::Falling)),
+            gpiod::GPIOD_LINE_EDGE_BOTH => Ok(Some(Edge::Both)),
+            _ => Err(Error::InvalidEnumValue("Edge", edge)),
+        }
+    }
+
+    fn gpiod_edge(edge: Option<Edge>) -> u32 {
+        match edge {
+            None => gpiod::GPIOD_LINE_EDGE_NONE,
+            Some(edge) => match edge {
+                Edge::Rising => gpiod::GPIOD_LINE_EDGE_RISING,
+                Edge::Falling => gpiod::GPIOD_LINE_EDGE_FALLING,
+                Edge::Both => gpiod::GPIOD_LINE_EDGE_BOTH,
+            },
+        }
+    }
+}
+
+/// Line setting kind.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum SettingKind {
+    /// Line direction.
+    Direction,
+    /// Bias.
+    Bias,
+    /// Drive.
+    Drive,
+    /// Edge detection.
+    EdgeDetection,
+    /// Active-low setting.
+    ActiveLow,
+    /// Debounce period.
+    DebouncePeriod,
+    /// Event clock type.
+    EventClock,
+    /// Output value.
+    OutputValue,
+}
+
+/// Maps offset to SettingKind.
+pub type SettingKindMap = IntMap<SettingKind>;
+
+impl SettingKind {
+    fn new(kind: u32) -> Result<Self> {
+        match kind {
+            gpiod::GPIOD_LINE_CONFIG_PROP_DIRECTION => Ok(SettingKind::Direction),
+            gpiod::GPIOD_LINE_CONFIG_PROP_EDGE_DETECTION => Ok(SettingKind::EdgeDetection),
+            gpiod::GPIOD_LINE_CONFIG_PROP_BIAS => Ok(SettingKind::Bias),
+            gpiod::GPIOD_LINE_CONFIG_PROP_DRIVE => Ok(SettingKind::Drive),
+            gpiod::GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW => Ok(SettingKind::ActiveLow),
+            gpiod::GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD_US => Ok(SettingKind::DebouncePeriod),
+            gpiod::GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK => Ok(SettingKind::EventClock),
+            gpiod::GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE => Ok(SettingKind::OutputValue),
+            _ => Err(Error::InvalidEnumValue("SettingKind", kind)),
+        }
+    }
+}
+
+/// Line settings.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum Setting {
+    /// Line direction.
+    Direction(Direction),
+    /// Bias.
+    Bias(Option<Bias>),
+    /// Drive.
+    Drive(Drive),
+    /// Edge detection.
+    EdgeDetection(Option<Edge>),
+    /// Active-low setting.
+    ActiveLow(bool),
+    /// Debounce period.
+    DebouncePeriod(Duration),
+    /// Event clock type.
+    EventClock(EventClock),
+    /// Output value.
+    OutputValue(Value),
+}
+
+/// Maps offset to Setting.
+pub type SettingMap = IntMap<Setting>;
+
+impl fmt::Display for Setting {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{:?}", self)
+    }
+}
+
+/// Event clock settings.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum EventClock {
+    /// Line uses the monotonic clock for edge event timestamps.
+    Monotonic,
+    /// Line uses the realtime clock for edge event timestamps.
+    Realtime,
+}
+
+impl EventClock {
+    fn new(clock: u32) -> Result<Self> {
+        match clock {
+            gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC => Ok(EventClock::Monotonic),
+            gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME => Ok(EventClock::Realtime),
+            _ => Err(Error::InvalidEnumValue("Eventclock", clock)),
+        }
+    }
+
+    fn gpiod_clock(&self) -> u32 {
+        match self {
+            EventClock::Monotonic => gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+            EventClock::Realtime => gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME,
+        }
+    }
+}
+
+/// Line status change event types.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum InfoChangeKind {
+    /// Line has been requested.
+    LineRequested,
+    /// Previously requested line has been released.
+    LineReleased,
+    /// Line configuration has changed.
+    LineConfigChanged,
+}
+
+impl InfoChangeKind {
+    fn new(kind: u32) -> Result<Self> {
+        match kind {
+            gpiod::GPIOD_INFO_EVENT_LINE_REQUESTED => Ok(InfoChangeKind::LineRequested),
+            gpiod::GPIOD_INFO_EVENT_LINE_RELEASED => Ok(InfoChangeKind::LineReleased),
+            gpiod::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => Ok(InfoChangeKind::LineConfigChanged),
+            _ => Err(Error::InvalidEnumValue("InfoChangeKind", kind)),
+        }
+    }
+}
+
+/// Edge event types.
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub enum EdgeKind {
+    /// Rising edge event.
+    Rising,
+    /// Falling edge event.
+    Falling,
+}
+
+impl EdgeKind {
+    fn new(kind: u32) -> Result<Self> {
+        match kind {
+            gpiod::GPIOD_EDGE_EVENT_RISING_EDGE => Ok(EdgeKind::Rising),
+            gpiod::GPIOD_EDGE_EVENT_FALLING_EDGE => Ok(EdgeKind::Falling),
+            _ => Err(Error::InvalidEnumValue("EdgeEvent", kind)),
+        }
+    }
+}
+
+/// Various libgpiod-related functions.
+
+/// Check if the file pointed to by path is a GPIO chip character device.
+///
+/// Returns true if the file exists and is a GPIO chip character device or a
+/// symbolic link to it.
+pub fn is_gpiochip_device<P: AsRef<Path>>(path: &P) -> bool {
+    // Null-terminate the string
+    let path = path.as_ref().to_string_lossy() + "\0";
+
+    unsafe { gpiod::gpiod_is_gpiochip_device(path.as_ptr() as *const c_char) }
+}
+
+/// Iterator for GPIO devices.
+pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
+    let mut chips = Vec::new();
+
+    for entry in fs::read_dir(path).map_err(|_| Error::IoError)?.flatten() {
+        let path = entry.path();
+
+        if is_gpiochip_device(&path) {
+            chips.push(chip::Chip::open(&path)?);
+        }
+    }
+
+    Ok(chips)
+}
+
+/// Get the API version of the library as a human-readable string.
+pub fn version_string() -> Result<&'static str> {
+    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
+    let version = unsafe { gpiod::gpiod_version_string() };
+
+    if version.is_null() {
+        return Err(Error::NullString("GPIO library version"));
+    }
+
+    // SAFETY: The string is guaranteed to be valid here by the C API.
+    str::from_utf8(unsafe { slice::from_raw_parts(version as *const u8, strlen(version) as usize) })
+        .map_err(Error::StringNotUtf8)
+}
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
new file mode 100644
index 000000000000..148039cafa33
--- /dev/null
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::raw::c_ulong;
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{
+    gpiod, Bias, Direction, Drive, Edge, Error, EventClock, Offset, OperationType, Result, Setting,
+    SettingKind, SettingKindMap, SettingMap, Value, ValueMap,
+};
+
+/// Line configuration objects.
+///
+/// The line-config object contains the configuration for lines that can be
+/// used in two cases:
+///  - when making a line request
+///  - when reconfiguring a set of already requested lines.
+///
+/// A new line-config object is instantiated with a set of sane defaults
+/// for all supported configuration settings. Those defaults can be modified by
+/// the caller. Default values can be overridden by applying different values
+/// for specific lines. When making a request or reconfiguring an existing one,
+/// the overridden settings for specific lines take precedence. For lines
+/// without an override the requested default settings are used.
+///
+/// For every setting there are two mutators (one setting the default and one
+/// for the per-line override), two getters (one for reading the global
+/// default and one for retrieving the effective value for the line),
+/// a function for testing if a setting is overridden for the line
+/// and finally a function for clearing the overrides (per line).
+///
+/// The mutators don't return errors. If the set of options is too complex to
+/// be translated into kernel uAPI structures then an error will be returned at
+/// the time of the request or reconfiguration. If an invalid value was passed
+/// to any of the mutators then the default value will be silently used instead.
+///
+/// Operating on lines in struct Config has no immediate effect on real
+/// GPIOs, it only manipulates the config object in memory.  Those changes are
+/// only applied to the hardware at the time of the request or reconfiguration.
+///
+/// Overrides for lines that don't end up being requested are silently ignored
+/// both in line::Request::new() as well as in line::Request::reconfigure_lines().
+///
+/// In cases where all requested lines are using the one configuration, the
+/// line overrides can be entirely ignored when preparing the configuration.
+
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Config {
+    config: *mut gpiod::gpiod_line_config,
+}
+
+impl Config {
+    /// Create a new line config object.
+    pub fn new() -> Result<Self> {
+        let config = unsafe { gpiod::gpiod_line_config_new() };
+
+        if config.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::LineConfigNew,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { config })
+    }
+
+    /// Private helper, Returns gpiod_line_config
+    pub(crate) fn config(&self) -> *mut gpiod::gpiod_line_config {
+        self.config
+    }
+
+    /// Resets the entire configuration stored in the object. This is useful if
+    /// the user wants to reuse the object without reallocating it.
+    pub fn reset(&mut self) {
+        unsafe { gpiod::gpiod_line_config_reset(self.config) }
+    }
+
+    /// Set the default for line property.
+    pub fn set_prop_default(&mut self, values: &[Setting]) {
+        for value in values {
+            match value {
+                Setting::Direction(val) => self.set_direction_default(*val),
+                Setting::EdgeDetection(val) => self.set_edge_detection_default(*val),
+                Setting::Bias(val) => self.set_bias_default(*val),
+                Setting::Drive(val) => self.set_drive_default(*val),
+                Setting::ActiveLow(val) => self.set_active_low_default(*val),
+                Setting::DebouncePeriod(val) => self.set_debounce_period_default(*val),
+                Setting::EventClock(val) => self.set_event_clock_default(*val),
+                Setting::OutputValue(val) => self.set_output_value_default(*val),
+            }
+        }
+    }
+
+    /// Set the override for line property.
+    pub fn set_prop_override(&mut self, map: SettingMap) {
+        for (offset, value) in map {
+            match value {
+                Setting::Direction(val) => self.set_direction_override(val, offset as u32),
+                Setting::EdgeDetection(val) => self.set_edge_detection_override(val, offset as u32),
+                Setting::Bias(val) => self.set_bias_override(val, offset as u32),
+                Setting::Drive(val) => self.set_drive_override(val, offset as u32),
+                Setting::ActiveLow(val) => self.set_active_low_override(val, offset as u32),
+                Setting::DebouncePeriod(val) => {
+                    self.set_debounce_period_override(val, offset as u32)
+                }
+                Setting::EventClock(val) => self.set_event_clock_override(val, offset as u32),
+                Setting::OutputValue(val) => self.set_output_value_override(val, offset as u32),
+            }
+        }
+    }
+
+    /// Clear the override for line property.
+    pub fn clear_prop_override(&mut self, map: SettingKindMap) {
+        for (offset, prop) in map {
+            match prop {
+                SettingKind::Direction => self.clear_direction_override(offset as u32),
+                SettingKind::EdgeDetection => self.clear_edge_detection_override(offset as u32),
+                SettingKind::Bias => self.clear_bias_override(offset as u32),
+                SettingKind::Drive => self.clear_drive_override(offset as u32),
+                SettingKind::ActiveLow => self.clear_active_low_override(offset as u32),
+                SettingKind::DebouncePeriod => self.clear_debounce_period_override(offset as u32),
+                SettingKind::EventClock => self.clear_event_clock_override(offset as u32),
+                SettingKind::OutputValue => self.clear_output_value_override(offset as u32),
+            }
+        }
+    }
+
+    /// Check if the prop is overridden for a line.
+    pub fn prop_is_overridden(&self, property: SettingKind, offset: Offset) -> bool {
+        match property {
+            SettingKind::Direction => self.direction_is_overridden(offset),
+            SettingKind::EdgeDetection => self.edge_detection_is_overridden(offset),
+            SettingKind::Bias => self.bias_is_overridden(offset),
+            SettingKind::Drive => self.drive_is_overridden(offset),
+            SettingKind::ActiveLow => self.active_low_is_overridden(offset),
+            SettingKind::DebouncePeriod => self.debounce_period_is_overridden(offset),
+            SettingKind::EventClock => self.event_clock_is_overridden(offset),
+            SettingKind::OutputValue => self.output_value_is_overridden(offset),
+        }
+    }
+
+    /// Get the default prop setting.
+    pub fn prop_default(&self, property: SettingKind) -> Result<Setting> {
+        Ok(match property {
+            SettingKind::Direction => Setting::Direction(self.direction_default()?),
+            SettingKind::EdgeDetection => Setting::EdgeDetection(self.edge_detection_default()?),
+            SettingKind::Bias => Setting::Bias(self.bias_default()?),
+            SettingKind::Drive => Setting::Drive(self.drive_default()?),
+            SettingKind::ActiveLow => Setting::ActiveLow(self.active_low_default()),
+            SettingKind::DebouncePeriod => Setting::DebouncePeriod(self.debounce_period_default()?),
+            SettingKind::EventClock => Setting::EventClock(self.event_clock_default()?),
+            SettingKind::OutputValue => Setting::OutputValue(self.output_value_default()?),
+        })
+    }
+
+    /// Get the prop setting for an offset.
+    pub fn prop_offset(&self, property: SettingKind, offset: Offset) -> Result<Setting> {
+        Ok(match property {
+            SettingKind::Direction => Setting::Direction(self.direction_offset(offset)?),
+            SettingKind::EdgeDetection => {
+                Setting::EdgeDetection(self.edge_detection_offset(offset)?)
+            }
+            SettingKind::Bias => Setting::Bias(self.bias_offset(offset)?),
+            SettingKind::Drive => Setting::Drive(self.drive_offset(offset)?),
+            SettingKind::ActiveLow => Setting::ActiveLow(self.active_low_offset(offset)),
+            SettingKind::DebouncePeriod => {
+                Setting::DebouncePeriod(self.debounce_period_offset(offset)?)
+            }
+            SettingKind::EventClock => Setting::EventClock(self.event_clock_offset(offset)?),
+            SettingKind::OutputValue => Setting::OutputValue(self.output_value_offset(offset)?),
+        })
+    }
+
+    /// Set the default line direction.
+    fn set_direction_default(&mut self, direction: Direction) {
+        unsafe {
+            gpiod::gpiod_line_config_set_direction_default(
+                self.config,
+                direction.gpiod_direction() as i32,
+            )
+        }
+    }
+
+    /// Set the direction for a line.
+    fn set_direction_override(&mut self, direction: Direction, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_line_config_set_direction_override(
+                self.config,
+                direction.gpiod_direction() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Clear the direction for a line.
+    fn clear_direction_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_direction_override(self.config, offset) }
+    }
+
+    /// Check if the direction is overridden for a line.
+    fn direction_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_direction_is_overridden(self.config, offset) }
+    }
+
+    /// Get the default direction setting.
+    fn direction_default(&self) -> Result<Direction> {
+        Direction::new(
+            unsafe { gpiod::gpiod_line_config_get_direction_default(self.config) } as u32,
+        )
+    }
+
+    /// Get the direction of a given line.
+    ///
+    /// Direction setting for the line if the config object were used in a request.
+    fn direction_offset(&self, offset: Offset) -> Result<Direction> {
+        Direction::new(
+            unsafe { gpiod::gpiod_line_config_get_direction_offset(self.config, offset) } as u32,
+        )
+    }
+
+    /// Set the default edge event detection setting.
+    fn set_edge_detection_default(&mut self, edge: Option<Edge>) {
+        unsafe {
+            gpiod::gpiod_line_config_set_edge_detection_default(
+                self.config,
+                Edge::gpiod_edge(edge) as i32,
+            )
+        }
+    }
+
+    /// Set the edge event detection for a single line.
+    fn set_edge_detection_override(&mut self, edge: Option<Edge>, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_line_config_set_edge_detection_override(
+                self.config,
+                Edge::gpiod_edge(edge) as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Clear the edge event detection for a single line.
+    fn clear_edge_detection_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_edge_detection_override(self.config, offset) }
+    }
+
+    /// Check if the edge event detection is overridden for a line.
+    fn edge_detection_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_edge_detection_is_overridden(self.config, offset) }
+    }
+
+    /// Get the default edge event detection setting.
+    fn edge_detection_default(&self) -> Result<Option<Edge>> {
+        Edge::new(
+            unsafe { gpiod::gpiod_line_config_get_edge_detection_default(self.config) } as u32,
+        )
+    }
+
+    /// Get the edge event detection setting for a given line.
+    ///
+    /// Edge event detection setting for the line if the config object were used in a request.
+    fn edge_detection_offset(&self, offset: Offset) -> Result<Option<Edge>> {
+        Edge::new(
+            unsafe { gpiod::gpiod_line_config_get_edge_detection_offset(self.config, offset) }
+                as u32,
+        )
+    }
+
+    /// Set the default bias setting.
+    fn set_bias_default(&mut self, bias: Option<Bias>) {
+        unsafe {
+            gpiod::gpiod_line_config_set_bias_default(self.config, Bias::gpiod_bias(bias) as i32)
+        }
+    }
+
+    /// Set the bias for a single line.
+    fn set_bias_override(&mut self, bias: Option<Bias>, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_line_config_set_bias_override(
+                self.config,
+                Bias::gpiod_bias(bias) as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Clear the bias for a single line.
+    fn clear_bias_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_bias_override(self.config, offset) }
+    }
+
+    /// Check if the bias is overridden for a line.
+    fn bias_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_bias_is_overridden(self.config, offset) }
+    }
+
+    /// Get the default bias setting.
+    fn bias_default(&self) -> Result<Option<Bias>> {
+        Bias::new(unsafe { gpiod::gpiod_line_config_get_bias_default(self.config) } as u32)
+    }
+
+    /// Get the bias setting for a given line.
+    ///
+    /// Bias setting used for the line if the config object were used in a request.
+    fn bias_offset(&self, offset: Offset) -> Result<Option<Bias>> {
+        Bias::new(unsafe { gpiod::gpiod_line_config_get_bias_offset(self.config, offset) } as u32)
+    }
+
+    /// Set the default drive setting.
+    fn set_drive_default(&mut self, drive: Drive) {
+        unsafe {
+            gpiod::gpiod_line_config_set_drive_default(self.config, drive.gpiod_drive() as i32)
+        }
+    }
+
+    /// Set the drive for a single line.
+    fn set_drive_override(&mut self, drive: Drive, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_line_config_set_drive_override(
+                self.config,
+                drive.gpiod_drive() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// clear the drive for a single line.
+    fn clear_drive_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_drive_override(self.config, offset) }
+    }
+
+    /// Check if the drive is overridden for a line.
+    fn drive_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_drive_is_overridden(self.config, offset) }
+    }
+
+    /// Get the default drive setting.
+    fn drive_default(&self) -> Result<Drive> {
+        Drive::new(unsafe { gpiod::gpiod_line_config_get_drive_default(self.config) } as u32)
+    }
+
+    /// Get the drive setting for a given line.
+    ///
+    /// The offset of the line for which to read the drive setting. Drive setting for the line if
+    /// the config object were used in a request.
+    fn drive_offset(&self, offset: Offset) -> Result<Drive> {
+        Drive::new(unsafe { gpiod::gpiod_line_config_get_drive_offset(self.config, offset) } as u32)
+    }
+
+    /// Set default active-low setting.
+    fn set_active_low_default(&mut self, active_low: bool) {
+        unsafe { gpiod::gpiod_line_config_set_active_low_default(self.config, active_low) }
+    }
+
+    /// Set active-low setting for a single line.
+    fn set_active_low_override(&mut self, active_low: bool, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_set_active_low_override(self.config, active_low, offset) }
+    }
+
+    /// Clear a single line's active-low setting.
+    fn clear_active_low_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_active_low_override(self.config, offset) }
+    }
+
+    /// Check if the active-low is overridden for a line.
+    fn active_low_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_active_low_is_overridden(self.config, offset) }
+    }
+
+    /// Check the default active-low setting.
+    fn active_low_default(&self) -> bool {
+        unsafe { gpiod::gpiod_line_config_get_active_low_default(self.config) }
+    }
+
+    /// Check the active-low setting of a line.
+    ///
+    /// Active-low setting for the line if the config object were used in a request.
+    fn active_low_offset(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_get_active_low_offset(self.config, offset) }
+    }
+
+    /// Set the default debounce period setting.
+    fn set_debounce_period_default(&mut self, period: Duration) {
+        unsafe {
+            gpiod::gpiod_line_config_set_debounce_period_us_default(
+                self.config,
+                period.as_micros() as u64,
+            )
+        }
+    }
+
+    /// Set the debounce period for a single line.
+    fn set_debounce_period_override(&mut self, period: Duration, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_line_config_set_debounce_period_us_override(
+                self.config,
+                period.as_micros() as u64,
+                offset,
+            )
+        }
+    }
+
+    /// Clear the debounce period for a single line.
+    fn clear_debounce_period_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_debounce_period_us_override(self.config, offset) }
+    }
+
+    /// Check if the debounce period setting is overridden.
+    fn debounce_period_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_debounce_period_us_is_overridden(self.config, offset) }
+    }
+
+    /// Get the default debounce period.
+    fn debounce_period_default(&self) -> Result<Duration> {
+        Ok(Duration::from_micros(unsafe {
+            gpiod::gpiod_line_config_get_debounce_period_us_default(self.config)
+        }))
+    }
+
+    /// Get the debounce period for a given line.
+    ///
+    /// Debounce period for the line if the config object were used in a request, 0 if debouncing
+    /// is disabled.
+    fn debounce_period_offset(&self, offset: Offset) -> Result<Duration> {
+        Ok(Duration::from_micros(unsafe {
+            gpiod::gpiod_line_config_get_debounce_period_us_offset(self.config, offset)
+        }))
+    }
+
+    /// Set the default event clock setting.
+    fn set_event_clock_default(&mut self, clock: EventClock) {
+        unsafe {
+            gpiod::gpiod_line_config_set_event_clock_default(
+                self.config,
+                clock.gpiod_clock() as i32,
+            )
+        }
+    }
+
+    /// Set the event clock for a single line.
+    fn set_event_clock_override(&mut self, clock: EventClock, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_line_config_set_event_clock_override(
+                self.config,
+                clock.gpiod_clock() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Clear the event clock for a single line.
+    fn clear_event_clock_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_event_clock_override(self.config, offset) }
+    }
+
+    /// Check if the event clock is overridden for a line.
+    fn event_clock_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_event_clock_is_overridden(self.config, offset) }
+    }
+
+    /// Get the default event clock setting.
+    fn event_clock_default(&self) -> Result<EventClock> {
+        EventClock::new(
+            unsafe { gpiod::gpiod_line_config_get_event_clock_default(self.config) } as u32,
+        )
+    }
+
+    /// Get the event clock setting for a given line.
+    ///
+    /// Event clock setting for the line if the config object were used in a request.
+    fn event_clock_offset(&self, offset: Offset) -> Result<EventClock> {
+        EventClock::new(unsafe {
+            gpiod::gpiod_line_config_get_event_clock_offset(self.config, offset)
+        } as u32)
+    }
+
+    /// Set the default output value setting.
+    fn set_output_value_default(&mut self, value: Value) {
+        unsafe { gpiod::gpiod_line_config_set_output_value_default(self.config, value.value()) }
+    }
+
+    /// Set the output value for a line.
+    fn set_output_value_override(&mut self, value: Value, offset: Offset) {
+        unsafe {
+            gpiod::gpiod_line_config_set_output_value_override(self.config, value.value(), offset)
+        }
+    }
+
+    /// Set the output values for a set of lines.
+    pub fn set_output_values(&mut self, map: ValueMap) -> Result<()> {
+        let mut offsets = Vec::new();
+        let mut values = Vec::new();
+
+        for (offset, value) in map {
+            offsets.push(offset as u32);
+            values.push(value.value());
+        }
+
+        unsafe {
+            gpiod::gpiod_line_config_set_output_values(
+                self.config,
+                values.len() as c_ulong,
+                offsets.as_ptr(),
+                values.as_ptr(),
+            );
+        }
+
+        Ok(())
+    }
+
+    /// Clear the output value for a line.
+    fn clear_output_value_override(&mut self, offset: Offset) {
+        unsafe { gpiod::gpiod_line_config_clear_output_value_override(self.config, offset) }
+    }
+
+    /// Check if the output value is overridden for a line.
+    fn output_value_is_overridden(&self, offset: Offset) -> bool {
+        unsafe { gpiod::gpiod_line_config_output_value_is_overridden(self.config, offset) }
+    }
+
+    /// Get the default output value, 0 or 1.
+    fn output_value_default(&self) -> Result<Value> {
+        let value = unsafe { gpiod::gpiod_line_config_get_output_value_default(self.config) };
+
+        if value != 0 && value != 1 {
+            Err(Error::OperationFailed(
+                OperationType::LineConfigGetOutValDefault,
+                Errno::last(),
+            ))
+        } else {
+            Value::new(value)
+        }
+    }
+
+    /// Get the output value configured for a given line, 0 or 1.
+    fn output_value_offset(&self, offset: Offset) -> Result<Value> {
+        let value =
+            unsafe { gpiod::gpiod_line_config_get_output_value_offset(self.config, offset) };
+
+        if value != 0 && value != 1 {
+            Err(Error::OperationFailed(
+                OperationType::LineConfigGetOutValOffset,
+                Errno::last(),
+            ))
+        } else {
+            Value::new(value)
+        }
+    }
+
+    /// Get the list of overridden offsets and the corresponding types of overridden settings.
+    pub fn overrides(&self) -> Result<Vec<(u32, SettingKind)>> {
+        let num = unsafe { gpiod::gpiod_line_config_get_num_overrides(self.config) } as usize;
+        if num == 0 {
+            return Ok(Vec::new());
+        }
+
+        let mut overrides = Vec::new();
+        let mut offset: Vec<Offset> = vec![0; num];
+        let mut props = vec![0_i32; num];
+
+        unsafe {
+            gpiod::gpiod_line_config_get_overrides(
+                self.config,
+                offset.as_mut_ptr(),
+                props.as_mut_ptr(),
+            )
+        };
+
+        for i in 0..num {
+            overrides.push((offset[i], SettingKind::new(props[i] as u32)?));
+        }
+
+        Ok(overrides)
+    }
+}
+
+impl Drop for Config {
+    /// Free the line config object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_line_config_free(self.config) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
new file mode 100644
index 000000000000..9db51fc30efd
--- /dev/null
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use libc::strlen;
+use std::sync::Arc;
+use std::time::Duration;
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{
+    chip, gpiod, info, Bias, Direction, Drive, Edge, Error, EventClock, Offset, OperationType,
+    Result,
+};
+
+/// Line info
+///
+/// Exposes functions for retrieving kernel information about both requested and
+/// free lines.  Line info object contains an immutable snapshot of a line's status.
+///
+/// The line info contains all the publicly available information about a
+/// line, which does not include the line value.  The line must be requested
+/// to access the line value.
+
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Info {
+    info: *mut gpiod::gpiod_line_info,
+    info_event: bool,
+}
+
+impl Info {
+    /// Get a snapshot of information about the line and optionally start watching it for changes.
+    pub(crate) fn new(ichip: Arc<chip::Internal>, offset: Offset) -> Result<Self> {
+        let info = unsafe { gpiod::gpiod_chip_get_line_info(ichip.chip(), offset) };
+
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipGetLineInfo,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self {
+            info,
+            info_event: false,
+        })
+    }
+
+    pub(crate) fn new_watch(ichip: Arc<chip::Internal>, offset: Offset) -> Result<Self> {
+        let info = unsafe { gpiod::gpiod_chip_watch_line_info(ichip.chip(), offset) };
+
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipWatchLineInfo,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self {
+            info,
+            info_event: false,
+        })
+    }
+
+    /// Get the Line info object associated with an event.
+    pub(crate) fn new_from_event(event: &info::Event) -> Result<Self> {
+        let info = unsafe { gpiod::gpiod_info_event_get_line_info(event.event()) };
+
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::InfoEventGetLineInfo,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self {
+            info,
+            info_event: true,
+        })
+    }
+
+    /// Get the offset of the line within the GPIO chip.
+    ///
+    /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
+    /// uniquely identifies the line within the system.
+
+    pub fn offset(&self) -> Offset {
+        unsafe { gpiod::gpiod_line_info_get_offset(self.info) }
+    }
+
+    /// Get GPIO line's name.
+    pub fn name(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Info`.
+        let name = unsafe { gpiod::gpiod_line_info_get_name(self.info) };
+        if name.is_null() {
+            return Err(Error::NullString("GPIO line's name"));
+        }
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        str::from_utf8(unsafe { slice::from_raw_parts(name as *const u8, strlen(name) as usize) })
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Returns True if the line is in use, false otherwise.
+    ///
+    /// The user space can't know exactly why a line is busy. It may have been
+    /// requested by another process or hogged by the kernel. It only matters that
+    /// the line is used and we can't request it.
+    pub fn is_used(&self) -> bool {
+        unsafe { gpiod::gpiod_line_info_is_used(self.info) }
+    }
+
+    /// Get the GPIO line's consumer name.
+    pub fn consumer(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Info`.
+        let name = unsafe { gpiod::gpiod_line_info_get_consumer(self.info) };
+        if name.is_null() {
+            return Err(Error::NullString("GPIO line's consumer name"));
+        }
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        str::from_utf8(unsafe { slice::from_raw_parts(name as *const u8, strlen(name) as usize) })
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get the GPIO line's direction.
+    pub fn direction(&self) -> Result<Direction> {
+        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) } as u32)
+    }
+
+    /// Returns true if the line is "active-low", false otherwise.
+    pub fn is_active_low(&self) -> bool {
+        unsafe { gpiod::gpiod_line_info_is_active_low(self.info) }
+    }
+
+    /// Get the GPIO line's bias setting.
+    pub fn bias(&self) -> Result<Option<Bias>> {
+        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) } as u32)
+    }
+
+    /// Get the GPIO line's drive setting.
+    pub fn drive(&self) -> Result<Drive> {
+        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) } as u32)
+    }
+
+    /// Get the current edge detection setting of the line.
+    pub fn edge_detection(&self) -> Result<Option<Edge>> {
+        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) } as u32)
+    }
+
+    /// Get the current event clock setting used for edge event timestamps.
+    pub fn event_clock(&self) -> Result<EventClock> {
+        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) } as u32)
+    }
+
+    /// Returns true if the line is debounced (either by hardware or by the
+    /// kernel software debouncer), false otherwise.
+    pub fn is_debounced(&self) -> bool {
+        unsafe { gpiod::gpiod_line_info_is_debounced(self.info) }
+    }
+
+    /// Get the debounce period of the line.
+    pub fn debounce_period(&self) -> Duration {
+        Duration::from_micros(unsafe { gpiod::gpiod_line_info_get_debounce_period_us(self.info) })
+    }
+}
+
+impl Drop for Info {
+    fn drop(&mut self) {
+        // We must not free the Line info object created from `struct info::Event` by calling
+        // libgpiod API.
+        if !self.info_event {
+            unsafe { gpiod::gpiod_line_info_free(self.info) }
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
new file mode 100644
index 000000000000..617efaa34d58
--- /dev/null
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use libc::EINVAL;
+use std::os::raw::c_ulong;
+use std::sync::Arc;
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{
+    chip, edge, gpiod, line, request, Error, Offset, OperationType, Result, Value, ValueMap,
+};
+
+/// Line request operations
+///
+/// Allows interaction with a set of requested lines.
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Request {
+    request: *mut gpiod::gpiod_line_request,
+}
+
+impl Request {
+    /// Request a set of lines for exclusive usage.
+    pub(crate) fn new(
+        ichip: &Arc<chip::Internal>,
+        rconfig: &request::Config,
+        lconfig: &line::Config,
+    ) -> Result<Self> {
+        let request = unsafe {
+            gpiod::gpiod_chip_request_lines(ichip.chip(), rconfig.config(), lconfig.config())
+        };
+
+        if request.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::LineRequest,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { request })
+    }
+
+    /// Get the number of lines in the request.
+    pub fn num_lines(&self) -> usize {
+        unsafe { gpiod::gpiod_line_request_get_num_lines(self.request) as usize }
+    }
+
+    /// Get the offsets of lines in the request.
+    pub fn offsets(&self) -> Vec<Offset> {
+        let mut offsets = vec![0; self.num_lines() as usize];
+
+        unsafe { gpiod::gpiod_line_request_get_offsets(self.request, offsets.as_mut_ptr()) };
+        offsets
+    }
+
+    /// Get the value (0 or 1) of a single line associated with the request.
+    pub fn value(&self, offset: Offset) -> Result<Value> {
+        let value = unsafe { gpiod::gpiod_line_request_get_value(self.request, offset) };
+
+        if value != 0 && value != 1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestGetVal,
+                Errno::last(),
+            ))
+        } else {
+            Value::new(value)
+        }
+    }
+
+    /// Get values of a subset of lines associated with the request.
+    pub fn values_subset(&self, offsets: &[Offset]) -> Result<ValueMap> {
+        let mut values = vec![0; offsets.len()];
+
+        let ret = unsafe {
+            gpiod::gpiod_line_request_get_values_subset(
+                self.request,
+                offsets.len() as c_ulong,
+                offsets.as_ptr(),
+                values.as_mut_ptr(),
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestGetValSubset,
+                Errno::last(),
+            ))
+        } else {
+            let mut map = ValueMap::new();
+
+            for (i, val) in values.iter().enumerate() {
+                map.insert(offsets[i].into(), Value::new(*val)?);
+            }
+
+            Ok(map)
+        }
+    }
+
+    /// Get values of all lines associated with the request.
+    pub fn values(&self) -> Result<ValueMap> {
+        self.values_subset(&self.offsets())
+    }
+
+    /// Set the value of a single line associated with the request.
+    pub fn set_value(&self, offset: Offset, value: Value) -> Result<()> {
+        let ret =
+            unsafe { gpiod::gpiod_line_request_set_value(self.request, offset, value.value()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestSetVal,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get values of a subset of lines associated with the request.
+    pub fn set_values_subset(&self, map: ValueMap) -> Result<()> {
+        let mut offsets = Vec::new();
+        let mut values = Vec::new();
+
+        for (offset, value) in map {
+            offsets.push(offset as u32);
+            values.push(value.value());
+        }
+
+        let ret = unsafe {
+            gpiod::gpiod_line_request_set_values_subset(
+                self.request,
+                offsets.len() as c_ulong,
+                offsets.as_ptr(),
+                values.as_ptr(),
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestSetValSubset,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get values of all lines associated with the request.
+    pub fn set_values(&self, values: &[Value]) -> Result<()> {
+        if values.len() != self.num_lines() as usize {
+            return Err(Error::OperationFailed(
+                OperationType::LineRequestSetVal,
+                Errno::new(EINVAL),
+            ));
+        }
+
+        let mut new_values = Vec::new();
+        for value in values {
+            new_values.push(value.value());
+        }
+
+        let ret =
+            unsafe { gpiod::gpiod_line_request_set_values(self.request, new_values.as_ptr()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestSetVal,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Update the configuration of lines associated with the line request.
+    pub fn reconfigure_lines(&self, lconfig: &line::Config) -> Result<()> {
+        let ret =
+            unsafe { gpiod::gpiod_line_request_reconfigure_lines(self.request, lconfig.config()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestReconfigLines,
+                Errno::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get the file descriptor associated with the line request.
+    pub fn fd(&self) -> u32 {
+        unsafe { gpiod::gpiod_line_request_get_fd(self.request) as u32 }
+    }
+
+    /// Wait for edge events on any of the lines associated with the request.
+    pub fn wait_edge_event(&self, timeout: Option<Duration>) -> Result<bool> {
+        let timeout = match timeout {
+            Some(x) => x.as_nanos() as i64,
+            // Block indefinitely
+            None => -1,
+        };
+
+        let ret = unsafe { gpiod::gpiod_line_request_wait_edge_event(self.request, timeout) };
+
+        match ret {
+            -1 => Err(Error::OperationFailed(
+                OperationType::LineRequestWaitEdgeEvent,
+                Errno::last(),
+            )),
+            0 => Ok(false),
+            _ => Ok(true),
+        }
+    }
+
+    /// Get a number of edge events from a line request.
+    ///
+    /// This function will block if no event was queued for the line.
+    pub fn read_edge_events(&self, buffer: &edge::event::Buffer) -> Result<u32> {
+        let ret = unsafe {
+            gpiod::gpiod_line_request_read_edge_event(
+                self.request,
+                buffer.buffer(),
+                buffer.capacity() as u64,
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestReadEdgeEvent,
+                Errno::last(),
+            ))
+        } else {
+            Ok(ret as u32)
+        }
+    }
+}
+
+impl Drop for Request {
+    /// Release the requested lines and free all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_line_request_release(self.request) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
new file mode 100644
index 000000000000..36a78b8da8d5
--- /dev/null
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use libc::strlen;
+use std::os::raw::{c_char, c_ulong};
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as Errno;
+
+use super::{gpiod, Error, Offset, OperationType, Result};
+
+/// Request configuration objects
+///
+/// Request config objects are used to pass a set of options to the kernel at
+/// the time of the line request. Similarly to the line-config - the mutators
+/// don't return error values. If the values are invalid, in general they are
+/// silently adjusted to acceptable ranges.
+
+#[derive(Clone, Debug, Eq, PartialEq)]
+pub struct Config {
+    config: *mut gpiod::gpiod_request_config,
+}
+
+impl Config {
+    /// Create a new request config object.
+    pub fn new() -> Result<Self> {
+        let config = unsafe { gpiod::gpiod_request_config_new() };
+        if config.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::RequestConfigNew,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self { config })
+    }
+
+    /// Private helper, Returns gpiod_request_config
+    pub(crate) fn config(&self) -> *mut gpiod::gpiod_request_config {
+        self.config
+    }
+
+    /// Set the consumer name for the request.
+    ///
+    /// If the consumer string is too long, it will be truncated to the max
+    /// accepted length.
+    pub fn set_consumer(&self, consumer: &str) {
+        // Null-terminate the string
+        let consumer = consumer.to_owned() + "\0";
+
+        unsafe {
+            gpiod::gpiod_request_config_set_consumer(
+                self.config,
+                consumer.as_ptr() as *const c_char,
+            )
+        }
+    }
+
+    /// Get the consumer name configured in the request config.
+    pub fn consumer(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Config`.
+        let consumer = unsafe { gpiod::gpiod_request_config_get_consumer(self.config) };
+        if consumer.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::RequestConfigGetConsumer,
+                Errno::last(),
+            ));
+        }
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        str::from_utf8(unsafe {
+            slice::from_raw_parts(consumer as *const u8, strlen(consumer) as usize)
+        })
+        .map_err(Error::StringNotUtf8)
+    }
+
+    /// Set the offsets of the lines to be requested.
+    ///
+    /// If too many offsets were specified, the offsets above the limit accepted
+    /// by the kernel (64 lines) are silently dropped.
+    pub fn set_offsets(&self, offsets: &[Offset]) {
+        unsafe {
+            gpiod::gpiod_request_config_set_offsets(
+                self.config,
+                offsets.len() as c_ulong,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the offsets of lines in the request config.
+    pub fn offsets(&self) -> Vec<Offset> {
+        let num = unsafe { gpiod::gpiod_request_config_get_num_offsets(self.config) };
+        let mut offsets = vec![0; num as usize];
+
+        unsafe { gpiod::gpiod_request_config_get_offsets(self.config, offsets.as_mut_ptr()) };
+        offsets
+    }
+
+    /// Set the size of the kernel event buffer for the request.
+    pub fn set_event_buffer_size(&self, size: usize) {
+        unsafe { gpiod::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong) }
+    }
+
+    /// Get the edge event buffer size setting for the request config.
+    pub fn event_buffer_size(&self) -> usize {
+        unsafe { gpiod::gpiod_request_config_get_event_buffer_size(self.config) as usize }
+    }
+}
+
+impl Drop for Config {
+    /// Free the request config object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_request_config_free(self.config) }
+    }
+}
-- 
2.31.1.272.g89b43f80a514

