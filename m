Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE3A561EFC2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 10:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiKGJ6E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 04:58:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbiKGJ6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 04:58:02 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B592D2
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 01:57:59 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 6so1868675pgm.6
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 01:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktkT+1+Q/QiLpB8weu9Eag4DDbuBTsF2KGDqyh1dZsg=;
        b=gumM59ITyyJST9vASd68TFL0Mb1hD2yiSXiOrpSF++nyebAh/euyuBSZO3LgOYaD9k
         AFkRAghXGIg7IafKKisyhqV0dStuBHdJ8GayhTaVxiiuFsSG+onSCYa9yJv48sXNpRSQ
         Z6p5xCj0A/S+vI3oLWpzrW+56MFGE//H0T8Kgujsoh/ffkwkd+unvi+hhjwnfBS1r8ne
         UlbHOrorBRHa7Sld/I3Y5gxWNZDSAvpfn51Tf1d/+uW3xpofhPmyL+HPY+HkdA0kPnmp
         BhJA3DH3ajvqYV61AB6S39mpaYSGRQ/IeU8vGWp/riPY9JUtU7/+XEKKA5NX3WpnVQ6Y
         zksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktkT+1+Q/QiLpB8weu9Eag4DDbuBTsF2KGDqyh1dZsg=;
        b=SoIkyOxdwMnVhg09hiDpl8apR/9+J48QPjLecHLVt5FV1SKmYxTANAg4Uz/cRn0pQl
         Pq1ryEntLjMp8ZzwS/6zL/gYfrsfGhwwKhYm3tJLf6EpGuBXJQ4gyOgLqmDn3aSgIldS
         apt7pLgtwZByrDKp8kVpxHhitQiBjwLIJu0yRT58Jw1sSbZfPCPXFoMeTDO9x7XKOeN2
         1srZSj4cDBL9eLMMYBw3u/Vu43BLuhAJWialA+5550AqflVV1nO9umpk/Hj4KfLGQmwM
         Kz/nZmnpy6e/w6qphatWPjBB+TNfMi0aLufjuy4AxYpjyVKSTuIMJLWMuYhh+NikSAjW
         39cA==
X-Gm-Message-State: ACrzQf1ycY/YTNHPP4JlUGEizrFV5Ll/xehqKgQlku0ley5RXUKB3xZA
        qMUbp+0tHzsbyuAn2DTAvFXqxg==
X-Google-Smtp-Source: AMsMyM49yawn1+WBvMpho+Yi+z3oTvZ7TZsDD/J35MDVcPgVxPYl1TI9M37s18QuN4ArxuOunL+KWw==
X-Received: by 2002:a63:f47:0:b0:46a:e00c:24c7 with SMTP id 7-20020a630f47000000b0046ae00c24c7mr42790963pgp.239.1667815077257;
        Mon, 07 Nov 2022 01:57:57 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id a15-20020aa78e8f000000b00565c8634e55sm4048848pfr.135.2022.11.07.01.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:57:56 -0800 (PST)
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
Subject: [libgpiod][PATCH V9 5/8] bindings: rust: Add libgpiod crate
Date:   Mon,  7 Nov 2022 15:27:31 +0530
Message-Id: <bc252896b6f4e9b14192d3f716c8bc5a27ee1ad7.1667815011.git.viresh.kumar@linaro.org>
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

Add rust wrapper crate, around the libpiod-sys crate added earlier, to
provide a convenient interface for the users.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/Cargo.toml                     |   1 +
 bindings/rust/libgpiod/Cargo.toml            |  18 +
 bindings/rust/libgpiod/src/chip.rs           | 310 ++++++++++++
 bindings/rust/libgpiod/src/edge_event.rs     |  93 ++++
 bindings/rust/libgpiod/src/event_buffer.rs   | 167 +++++++
 bindings/rust/libgpiod/src/info_event.rs     |  69 +++
 bindings/rust/libgpiod/src/lib.rs            | 479 +++++++++++++++++++
 bindings/rust/libgpiod/src/line_config.rs    | 135 ++++++
 bindings/rust/libgpiod/src/line_info.rs      | 162 +++++++
 bindings/rust/libgpiod/src/line_request.rs   | 227 +++++++++
 bindings/rust/libgpiod/src/line_settings.rs  | 297 ++++++++++++
 bindings/rust/libgpiod/src/request_config.rs |  95 ++++
 12 files changed, 2053 insertions(+)
 create mode 100644 bindings/rust/libgpiod/Cargo.toml
 create mode 100644 bindings/rust/libgpiod/src/chip.rs
 create mode 100644 bindings/rust/libgpiod/src/edge_event.rs
 create mode 100644 bindings/rust/libgpiod/src/event_buffer.rs
 create mode 100644 bindings/rust/libgpiod/src/info_event.rs
 create mode 100644 bindings/rust/libgpiod/src/lib.rs
 create mode 100644 bindings/rust/libgpiod/src/line_config.rs
 create mode 100644 bindings/rust/libgpiod/src/line_info.rs
 create mode 100644 bindings/rust/libgpiod/src/line_request.rs
 create mode 100644 bindings/rust/libgpiod/src/line_settings.rs
 create mode 100644 bindings/rust/libgpiod/src/request_config.rs

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index b9eea6b3a5ea..4fdf4e06ff90 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -2,5 +2,6 @@
 
 members = [
     "gpiosim",
+    "libgpiod",
     "libgpiod-sys"
 ]
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
new file mode 100644
index 000000000000..65ca079b5e15
--- /dev/null
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -0,0 +1,18 @@
+[package]
+name = "libgpiod"
+version = "0.1.0"
+authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
+description = "libgpiod wrappers"
+repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
+categories = ["api-bindings", "hardware-support", "embedded", "os::linux-apis"]
+rust-version = "1.56"
+keywords = ["libgpiod", "gpio"]
+license = "Apache-2.0 OR BSD-3-Clause"
+edition = "2021"
+
+[dependencies]
+errno = "0.2.8"
+intmap = "2.0.0"
+libc = "0.2.39"
+libgpiod-sys = { path = "../libgpiod-sys" }
+thiserror = "1.0"
diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
new file mode 100644
index 000000000000..d51f3a57c871
--- /dev/null
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+pub mod info {
+    /// GPIO chip info event related definitions.
+    pub use crate::info_event::*;
+}
+
+use std::cmp::Ordering;
+use std::ffi::{CStr, CString};
+use std::os::{raw::c_char, unix::prelude::AsRawFd};
+use std::path::Path;
+use std::str;
+use std::sync::Arc;
+use std::time::Duration;
+
+use super::{
+    gpiod,
+    line::{self, Offset},
+    request, Error, OperationType, Result,
+};
+
+#[derive(Debug, Eq, PartialEq)]
+struct Internal {
+    chip: *mut gpiod::gpiod_chip,
+}
+
+impl Internal {
+    /// Find a chip by path.
+    fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
+        // Null-terminate the string
+        let path = path.as_ref().to_string_lossy() + "\0";
+
+        // SAFETY: The `gpiod_chip` returned by libgpiod is guaranteed to live as long
+        // as the `struct Internal`.
+        let chip = unsafe { gpiod::gpiod_chip_open(path.as_ptr() as *const c_char) };
+        if chip.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipOpen,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { chip })
+    }
+}
+
+impl Drop for Internal {
+    /// Close the chip and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
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
+#[derive(Debug, Eq, PartialEq)]
+pub struct Chip {
+    ichip: Arc<Internal>,
+}
+
+// Safe as `Internal` won't be freed until the `Chip` is dropped.
+unsafe impl Send for Chip {}
+
+impl Chip {
+    /// Find a chip by path.
+    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
+        let ichip = Arc::new(Internal::open(path)?);
+
+        Ok(Self { ichip })
+    }
+
+    /// Get the chip name as represented in the kernel.
+    pub fn info(&self) -> Result<Info> {
+        Info::new(self.ichip.clone())
+    }
+
+    /// Get the path used to find the chip.
+    pub fn path(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Chip`.
+        let path = unsafe { gpiod::gpiod_chip_get_path(self.ichip.chip) };
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        unsafe { CStr::from_ptr(path) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get a snapshot of information about the line.
+    pub fn line_info(&self, offset: Offset) -> Result<line::Info> {
+        // SAFETY: The `gpiod_line_info` returned by libgpiod is guaranteed to live as long
+        // as the `struct Info`.
+        let info = unsafe { gpiod::gpiod_chip_get_line_info(self.ichip.chip, offset) };
+
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipGetLineInfo,
+                errno::errno(),
+            ));
+        }
+
+        line::Info::new(info)
+    }
+
+    /// Get the current snapshot of information about the line at given offset and start watching
+    /// it for future changes.
+    pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        let info = unsafe { gpiod::gpiod_chip_watch_line_info(self.ichip.chip, offset) };
+
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipWatchLineInfo,
+                errno::errno(),
+            ));
+        }
+
+        line::Info::new_watch(info)
+    }
+
+    /// Stop watching a line
+    pub fn unwatch(&self, offset: Offset) {
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        unsafe {
+            gpiod::gpiod_chip_unwatch_line_info(self.ichip.chip, offset);
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
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        let ret = unsafe { gpiod::gpiod_chip_wait_info_event(self.ichip.chip, timeout) };
+
+        match ret {
+            -1 => Err(Error::OperationFailed(
+                OperationType::ChipWaitInfoEvent,
+                errno::errno(),
+            )),
+            0 => Ok(false),
+            _ => Ok(true),
+        }
+    }
+
+    /// Read a single line status change event from the chip. If no events are
+    /// pending, this function will block.
+    pub fn read_info_event(&self) -> Result<info::Event> {
+        // SAFETY: The `gpiod_info_event` returned by libgpiod is guaranteed to live as long
+        // as the `struct Event`.
+        let event = unsafe { gpiod::gpiod_chip_read_info_event(self.ichip.chip) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipReadInfoEvent,
+                errno::errno(),
+            ));
+        }
+
+        Ok(info::Event::new(event))
+    }
+
+    /// Map a GPIO line's name to its offset within the chip.
+    pub fn line_offset_from_name(&self, name: &str) -> Result<Offset> {
+        let name = CString::new(name).map_err(|_| Error::InvalidString)?;
+
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_chip_get_line_offset_from_name(
+                self.ichip.chip,
+                name.as_ptr() as *const c_char,
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::ChipGetLineOffsetFromName,
+                errno::errno(),
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
+    ) -> Result<request::Request> {
+        let request = unsafe {
+            // SAFETY: The `gpiod_line_request` returned by libgpiod is guaranteed to live as long
+            // as the `struct Request`.
+            gpiod::gpiod_chip_request_lines(self.ichip.chip, rconfig.config, lconfig.config)
+        };
+
+        if request.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipRequestLines,
+                errno::errno(),
+            ));
+        }
+
+        request::Request::new(request)
+    }
+}
+
+impl AsRawFd for Chip {
+    /// Get the file descriptor associated with the chip.
+    ///
+    /// The returned file descriptor must not be closed by the caller, else other methods for the
+    /// `struct Chip` may fail.
+    fn as_raw_fd(&self) -> i32 {
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_chip_get_fd(self.ichip.chip) }
+    }
+}
+
+/// GPIO chip Information
+#[derive(Debug, Eq)]
+pub struct Info {
+    info: *mut gpiod::gpiod_chip_info,
+}
+
+impl Info {
+    /// Find a GPIO chip by path.
+    fn new(chip: Arc<Internal>) -> Result<Self> {
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        let info = unsafe { gpiod::gpiod_chip_get_info(chip.chip) };
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::ChipGetInfo,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { info })
+    }
+
+    /// Get the GPIO chip name as represented in the kernel.
+    pub fn name(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Chip`.
+        let name = unsafe { gpiod::gpiod_chip_info_get_name(self.info) };
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        unsafe { CStr::from_ptr(name) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get the GPIO chip label as represented in the kernel.
+    pub fn label(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct Chip`.
+        let label = unsafe { gpiod::gpiod_chip_info_get_label(self.info) };
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        unsafe { CStr::from_ptr(label) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get the number of GPIO lines exposed by the chip.
+    pub fn num_lines(&self) -> usize {
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_chip_info_get_num_lines(self.info) as usize }
+    }
+}
+
+impl PartialEq for Info {
+    fn eq(&self, other: &Self) -> bool {
+        self.name().unwrap().eq(other.name().unwrap())
+    }
+}
+
+impl PartialOrd for Info {
+    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
+        let name = match self.name() {
+            Ok(name) => name,
+            _ => return None,
+        };
+
+        let other_name = match other.name() {
+            Ok(name) => name,
+            _ => return None,
+        };
+
+        name.partial_cmp(other_name)
+    }
+}
+
+impl Drop for Info {
+    /// Close the GPIO chip info and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_chip_info_free(self.info) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
new file mode 100644
index 000000000000..4e167f3ee701
--- /dev/null
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::time::Duration;
+
+use super::{
+    gpiod,
+    line::{EdgeKind, Offset},
+    Error, OperationType, Result,
+};
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
+pub struct Event(*mut gpiod::gpiod_edge_event);
+
+impl Event {
+    pub fn event_clone(event: &Event) -> Result<Event> {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        let event = unsafe { gpiod::gpiod_edge_event_copy(event.0) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::EdgeEventCopy,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self(event))
+    }
+
+    /// Get the event type.
+    pub fn event_type(&self) -> Result<EdgeKind> {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        EdgeKind::new(unsafe { gpiod::gpiod_edge_event_get_event_type(self.0) } as u32)
+    }
+
+    /// Get the timestamp of the event.
+    pub fn timestamp(&self) -> Duration {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        Duration::from_nanos(unsafe { gpiod::gpiod_edge_event_get_timestamp_ns(self.0) })
+    }
+
+    /// Get the offset of the line on which the event was triggered.
+    pub fn line_offset(&self) -> Offset {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_edge_event_get_line_offset(self.0) }
+    }
+
+    /// Get the global sequence number of the event.
+    ///
+    /// Returns sequence number of the event relative to all lines in the
+    /// associated line request.
+    pub fn global_seqno(&self) -> usize {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        unsafe {
+            gpiod::gpiod_edge_event_get_global_seqno(self.0)
+                .try_into()
+                .unwrap()
+        }
+    }
+
+    /// Get the event sequence number specific to concerned line.
+    ///
+    /// Returns sequence number of the event relative to the line within the
+    /// lifetime of the associated line request.
+    pub fn line_seqno(&self) -> usize {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        unsafe {
+            gpiod::gpiod_edge_event_get_line_seqno(self.0)
+                .try_into()
+                .unwrap()
+        }
+    }
+}
+
+impl Drop for Event {
+    /// Free the edge event.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_edge_event_free(self.0) };
+    }
+}
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
new file mode 100644
index 000000000000..8053b9aaaada
--- /dev/null
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::raw::c_ulong;
+use std::ptr;
+
+use super::{
+    gpiod,
+    request::{Event, Request},
+    Error, OperationType, Result,
+};
+
+/// Line edge events
+///
+/// An iterator over the elements of type `Event`.
+
+pub struct Events<'a> {
+    buffer: &'a mut Buffer,
+    read_index: usize,
+    len: usize,
+}
+
+impl<'a> Events<'a> {
+    pub fn new(buffer: &'a mut Buffer, len: usize) -> Self {
+        Self {
+            buffer,
+            read_index: 0,
+            len,
+        }
+    }
+
+    /// Get the number of contained events in the snapshot, this doesn't change
+    /// on reading events from the iterator.
+    pub fn len(&self) -> usize {
+        self.len
+    }
+
+    /// Check if buffer is empty.
+    pub fn is_empty(&self) -> bool {
+        self.len == 0
+    }
+}
+
+impl<'a> Iterator for Events<'a> {
+    type Item = Result<&'a Event>;
+
+    fn nth(&mut self, n: usize) -> Option<Self::Item> {
+        if self.read_index + n >= self.len {
+            return None;
+        }
+
+        self.read_index += n + 1;
+        Some(self.buffer.event(self.read_index - 1))
+    }
+
+    fn next(&mut self) -> Option<Self::Item> {
+        self.nth(0)
+    }
+}
+
+/// Line edge events buffer
+#[derive(Debug, Eq, PartialEq)]
+pub struct Buffer {
+    pub(crate) buffer: *mut gpiod::gpiod_edge_event_buffer,
+    events: Vec<*mut gpiod::gpiod_edge_event>,
+}
+
+impl Buffer {
+    /// Create a new edge event buffer.
+    ///
+    /// If capacity equals 0, it will be set to a default value of 64. If
+    /// capacity is larger than 1024, it will be limited to 1024.
+    pub fn new(capacity: usize) -> Result<Self> {
+        // SAFETY: The `gpiod_edge_event_buffer` returned by libgpiod is guaranteed to live as long
+        // as the `struct Buffer`.
+        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
+        if buffer.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::EdgeEventBufferNew,
+                errno::errno(),
+            ));
+        }
+
+        // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
+        let capacity = unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(buffer) as usize };
+
+        Ok(Self {
+            buffer,
+            events: vec![ptr::null_mut(); capacity],
+        })
+    }
+
+    /// Get the capacity of the event buffer.
+    pub fn capacity(&self) -> usize {
+        self.events.len()
+    }
+
+    /// Get edge events from a line request.
+    ///
+    /// This function will block if no event was queued for the line.
+    pub fn read_edge_events(&mut self, request: &Request) -> Result<Events> {
+        for i in 0..self.events.len() {
+            self.events[i] = ptr::null_mut();
+        }
+
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_line_request_read_edge_event(
+                request.request,
+                self.buffer,
+                self.events.len().try_into().unwrap(),
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestReadEdgeEvent,
+                errno::errno(),
+            ))
+        } else {
+            let ret = ret as usize;
+
+            if ret > self.events.len() {
+                Err(Error::TooManyEvents(ret, self.events.len()))
+            } else {
+                Ok(Events::new(self, ret))
+            }
+        }
+    }
+
+    /// Read an event stored in the buffer.
+    fn event<'a>(&mut self, index: usize) -> Result<&'a Event> {
+        if self.events[index].is_null() {
+            // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
+            // as the `struct Event`.
+            let event = unsafe {
+                gpiod::gpiod_edge_event_buffer_get_event(self.buffer, index.try_into().unwrap())
+            };
+
+            if event.is_null() {
+                return Err(Error::OperationFailed(
+                    OperationType::EdgeEventBufferGetEvent,
+                    errno::errno(),
+                ));
+            }
+
+            self.events[index] = event;
+        }
+
+        Ok(unsafe {
+            // This will not lead to `drop(event)`.
+            (self.events.as_ptr().add(index) as *const Event)
+                .as_ref()
+                .unwrap()
+        })
+    }
+}
+
+impl Drop for Buffer {
+    /// Free the edge event buffer and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_edge_event_buffer_free(self.buffer) };
+    }
+}
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
new file mode 100644
index 000000000000..09de4dd3458a
--- /dev/null
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::time::Duration;
+
+use super::{
+    gpiod,
+    line::{self, InfoChangeKind},
+    Error, OperationType, Result,
+};
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
+#[derive(Debug, Eq, PartialEq)]
+pub struct Event {
+    pub(crate) event: *mut gpiod::gpiod_info_event,
+}
+
+impl Event {
+    /// Get a single chip's line's status change event.
+    pub(crate) fn new(event: *mut gpiod::gpiod_info_event) -> Self {
+        Self { event }
+    }
+
+    /// Get the event type of the status change event.
+    pub fn event_type(&self) -> Result<InfoChangeKind> {
+        // SAFETY: `gpiod_info_event` is guaranteed to be valid here.
+        InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) } as u32)
+    }
+
+    /// Get the timestamp of the event, read from the monotonic clock.
+    pub fn timestamp(&self) -> Duration {
+        // SAFETY: `gpiod_info_event` is guaranteed to be valid here.
+        Duration::from_nanos(unsafe { gpiod::gpiod_info_event_get_timestamp_ns(self.event) })
+    }
+
+    /// Get the line-info object associated with the event.
+    pub fn line_info(&self) -> Result<line::Info> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        let info = unsafe { gpiod::gpiod_info_event_get_line_info(self.event) };
+
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::InfoEventGetLineInfo,
+                errno::errno(),
+            ));
+        }
+
+        line::Info::new_from_event(info)
+    }
+}
+
+impl Drop for Event {
+    /// Free the info event object and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_info_event` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_info_event_free(self.event) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
new file mode 100644
index 000000000000..cddaa7ba36c7
--- /dev/null
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
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
+use std::ffi::CStr;
+use std::fs;
+use std::os::raw::c_char;
+use std::path::Path;
+use std::time::Duration;
+use std::{fmt, str};
+
+use intmap::IntMap;
+use thiserror::Error as ThisError;
+
+use libgpiod_sys as gpiod;
+
+/// Operation types, used with OperationFailed() Error.
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub enum OperationType {
+    ChipOpen,
+    ChipWaitInfoEvent,
+    ChipGetLine,
+    ChipGetLineInfo,
+    ChipGetLineOffsetFromName,
+    ChipGetInfo,
+    ChipReadInfoEvent,
+    ChipRequestLines,
+    ChipWatchLineInfo,
+    EdgeEventBufferGetEvent,
+    EdgeEventCopy,
+    EdgeEventBufferNew,
+    InfoEventGetLineInfo,
+    LineConfigNew,
+    LineConfigAddSettings,
+    LineConfigGetOffsets,
+    LineConfigGetSettings,
+    LineRequestReconfigLines,
+    LineRequestGetVal,
+    LineRequestGetValSubset,
+    LineRequestSetVal,
+    LineRequestSetValSubset,
+    LineRequestReadEdgeEvent,
+    LineRequestWaitEdgeEvent,
+    LineSettingsNew,
+    LineSettingsCopy,
+    LineSettingsGetOutVal,
+    LineSettingsSetDirection,
+    LineSettingsSetEdgeDetection,
+    LineSettingsSetBias,
+    LineSettingsSetDrive,
+    LineSettingsSetActiveLow,
+    LineSettingsSetDebouncePeriod,
+    LineSettingsSetEventClock,
+    LineSettingsSetOutputValue,
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
+#[derive(Copy, Clone, Debug, Eq, PartialEq, ThisError)]
+pub enum Error {
+    #[error("Failed to get {0}")]
+    NullString(&'static str),
+    #[error("String not utf8: {0:?}")]
+    StringNotUtf8(str::Utf8Error),
+    #[error("Invalid String")]
+    InvalidString,
+    #[error("Invalid enum {0} value: {1}")]
+    InvalidEnumValue(&'static str, u32),
+    #[error("Operation {0} Failed: {1}")]
+    OperationFailed(OperationType, errno::Errno),
+    #[error("Invalid Arguments")]
+    InvalidArguments,
+    #[error("Event count more than buffer capacity: {0} > {1}")]
+    TooManyEvents(usize, usize),
+    #[error("Std Io Error")]
+    IoError,
+}
+
+mod info_event;
+
+/// GPIO chip related definitions.
+pub mod chip;
+
+mod edge_event;
+mod event_buffer;
+mod line_request;
+mod request_config;
+
+/// GPIO chip request related definitions.
+pub mod request {
+    pub use crate::edge_event::*;
+    pub use crate::event_buffer::*;
+    pub use crate::line_request::*;
+    pub use crate::request_config::*;
+}
+
+mod line_config;
+mod line_info;
+mod line_settings;
+
+/// GPIO chip line related definitions.
+pub mod line {
+    pub use crate::line_config::*;
+    pub use crate::line_info::*;
+    pub use crate::line_settings::*;
+
+    use super::*;
+
+    /// Value settings.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum Value {
+        /// Active
+        Active,
+        /// Inactive
+        InActive,
+    }
+
+    /// Maps offset to Value.
+    pub type ValueMap = IntMap<Value>;
+
+    impl Value {
+        pub fn new(val: i32) -> Result<Self> {
+            Ok(match val {
+                0 => Value::InActive,
+                1 => Value::Active,
+                _ => return Err(Error::InvalidEnumValue("Value", val as u32)),
+            })
+        }
+
+        pub(crate) fn value(&self) -> i32 {
+            match self {
+                Value::Active => 1,
+                Value::InActive => 0,
+            }
+        }
+    }
+
+    /// Offset type.
+    pub type Offset = u32;
+
+    /// Direction settings.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum Direction {
+        /// Request the line(s), but don't change direction.
+        AsIs,
+        /// Direction is input - for reading the value of an externally driven GPIO line.
+        Input,
+        /// Direction is output - for driving the GPIO line.
+        Output,
+    }
+
+    impl Direction {
+        pub(crate) fn new(dir: u32) -> Result<Self> {
+            Ok(match dir {
+                gpiod::GPIOD_LINE_DIRECTION_AS_IS => Direction::AsIs,
+                gpiod::GPIOD_LINE_DIRECTION_INPUT => Direction::Input,
+                gpiod::GPIOD_LINE_DIRECTION_OUTPUT => Direction::Output,
+                _ => return Err(Error::InvalidEnumValue("Direction", dir)),
+            })
+        }
+
+        pub(crate) fn gpiod_direction(&self) -> u32 {
+            match self {
+                Direction::AsIs => gpiod::GPIOD_LINE_DIRECTION_AS_IS,
+                Direction::Input => gpiod::GPIOD_LINE_DIRECTION_INPUT,
+                Direction::Output => gpiod::GPIOD_LINE_DIRECTION_OUTPUT,
+            }
+        }
+    }
+
+    /// Internal bias settings.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum Bias {
+        /// The internal bias is disabled.
+        Disabled,
+        /// The internal pull-up bias is enabled.
+        PullUp,
+        /// The internal pull-down bias is enabled.
+        PullDown,
+    }
+
+    impl Bias {
+        pub(crate) fn new(bias: u32) -> Result<Option<Self>> {
+            Ok(match bias {
+                gpiod::GPIOD_LINE_BIAS_UNKNOWN => None,
+                gpiod::GPIOD_LINE_BIAS_AS_IS => None,
+                gpiod::GPIOD_LINE_BIAS_DISABLED => Some(Bias::Disabled),
+                gpiod::GPIOD_LINE_BIAS_PULL_UP => Some(Bias::PullUp),
+                gpiod::GPIOD_LINE_BIAS_PULL_DOWN => Some(Bias::PullDown),
+                _ => return Err(Error::InvalidEnumValue("Bias", bias)),
+            })
+        }
+
+        pub(crate) fn gpiod_bias(bias: Option<Bias>) -> u32 {
+            match bias {
+                None => gpiod::GPIOD_LINE_BIAS_AS_IS,
+                Some(bias) => match bias {
+                    Bias::Disabled => gpiod::GPIOD_LINE_BIAS_DISABLED,
+                    Bias::PullUp => gpiod::GPIOD_LINE_BIAS_PULL_UP,
+                    Bias::PullDown => gpiod::GPIOD_LINE_BIAS_PULL_DOWN,
+                },
+            }
+        }
+    }
+
+    /// Drive settings.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum Drive {
+        /// Drive setting is push-pull.
+        PushPull,
+        /// Line output is open-drain.
+        OpenDrain,
+        /// Line output is open-source.
+        OpenSource,
+    }
+
+    impl Drive {
+        pub(crate) fn new(drive: u32) -> Result<Self> {
+            Ok(match drive {
+                gpiod::GPIOD_LINE_DRIVE_PUSH_PULL => Drive::PushPull,
+                gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN => Drive::OpenDrain,
+                gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE => Drive::OpenSource,
+                _ => return Err(Error::InvalidEnumValue("Drive", drive)),
+            })
+        }
+
+        pub(crate) fn gpiod_drive(&self) -> u32 {
+            match self {
+                Drive::PushPull => gpiod::GPIOD_LINE_DRIVE_PUSH_PULL,
+                Drive::OpenDrain => gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN,
+                Drive::OpenSource => gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE,
+            }
+        }
+    }
+
+    /// Edge detection settings.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum Edge {
+        /// Line detects rising edge events.
+        Rising,
+        /// Line detects falling edge events.
+        Falling,
+        /// Line detects both rising and falling edge events.
+        Both,
+    }
+
+    impl Edge {
+        pub(crate) fn new(edge: u32) -> Result<Option<Self>> {
+            Ok(match edge {
+                gpiod::GPIOD_LINE_EDGE_NONE => None,
+                gpiod::GPIOD_LINE_EDGE_RISING => Some(Edge::Rising),
+                gpiod::GPIOD_LINE_EDGE_FALLING => Some(Edge::Falling),
+                gpiod::GPIOD_LINE_EDGE_BOTH => Some(Edge::Both),
+                _ => return Err(Error::InvalidEnumValue("Edge", edge)),
+            })
+        }
+
+        pub(crate) fn gpiod_edge(edge: Option<Edge>) -> u32 {
+            match edge {
+                None => gpiod::GPIOD_LINE_EDGE_NONE,
+                Some(edge) => match edge {
+                    Edge::Rising => gpiod::GPIOD_LINE_EDGE_RISING,
+                    Edge::Falling => gpiod::GPIOD_LINE_EDGE_FALLING,
+                    Edge::Both => gpiod::GPIOD_LINE_EDGE_BOTH,
+                },
+            }
+        }
+    }
+
+    /// Line setting kind.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum SettingKind {
+        /// Line direction.
+        Direction,
+        /// Bias.
+        Bias,
+        /// Drive.
+        Drive,
+        /// Edge detection.
+        EdgeDetection,
+        /// Active-low setting.
+        ActiveLow,
+        /// Debounce period.
+        DebouncePeriod,
+        /// Event clock type.
+        EventClock,
+        /// Output value.
+        OutputValue,
+    }
+
+    /// Line settings.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum SettingVal {
+        /// Line direction.
+        Direction(Direction),
+        /// Bias.
+        Bias(Option<Bias>),
+        /// Drive.
+        Drive(Drive),
+        /// Edge detection.
+        EdgeDetection(Option<Edge>),
+        /// Active-low setting.
+        ActiveLow(bool),
+        /// Debounce period.
+        DebouncePeriod(Duration),
+        /// Event clock type.
+        EventClock(EventClock),
+        /// Output value.
+        OutputValue(Value),
+    }
+
+    impl fmt::Display for SettingVal {
+        fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+            write!(f, "{:?}", self)
+        }
+    }
+
+    /// Event clock settings.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum EventClock {
+        /// Line uses the monotonic clock for edge event timestamps.
+        Monotonic,
+        /// Line uses the realtime clock for edge event timestamps.
+        Realtime,
+        /// Line uses the hardware timestamp engine clock for edge event timestamps.
+        HTE,
+    }
+
+    impl EventClock {
+        pub(crate) fn new(clock: u32) -> Result<Self> {
+            Ok(match clock {
+                gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC => EventClock::Monotonic,
+                gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME => EventClock::Realtime,
+                gpiod::GPIOD_LINE_EVENT_CLOCK_HTE => EventClock::HTE,
+                _ => return Err(Error::InvalidEnumValue("Eventclock", clock)),
+            })
+        }
+
+        pub(crate) fn gpiod_clock(&self) -> u32 {
+            match self {
+                EventClock::Monotonic => gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+                EventClock::Realtime => gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME,
+                EventClock::HTE => gpiod::GPIOD_LINE_EVENT_CLOCK_HTE,
+            }
+        }
+    }
+
+    /// Line status change event types.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum InfoChangeKind {
+        /// Line has been requested.
+        LineRequested,
+        /// Previously requested line has been released.
+        LineReleased,
+        /// Line configuration has changed.
+        LineConfigChanged,
+    }
+
+    impl InfoChangeKind {
+        pub(crate) fn new(kind: u32) -> Result<Self> {
+            Ok(match kind {
+                gpiod::GPIOD_INFO_EVENT_LINE_REQUESTED => InfoChangeKind::LineRequested,
+                gpiod::GPIOD_INFO_EVENT_LINE_RELEASED => InfoChangeKind::LineReleased,
+                gpiod::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => InfoChangeKind::LineConfigChanged,
+                _ => return Err(Error::InvalidEnumValue("InfoChangeKind", kind)),
+            })
+        }
+    }
+
+    /// Edge event types.
+    #[derive(Copy, Clone, Debug, Eq, PartialEq)]
+    pub enum EdgeKind {
+        /// Rising edge event.
+        Rising,
+        /// Falling edge event.
+        Falling,
+    }
+
+    impl EdgeKind {
+        pub(crate) fn new(kind: u32) -> Result<Self> {
+            Ok(match kind {
+                gpiod::GPIOD_EDGE_EVENT_RISING_EDGE => EdgeKind::Rising,
+                gpiod::GPIOD_EDGE_EVENT_FALLING_EDGE => EdgeKind::Falling,
+                _ => return Err(Error::InvalidEnumValue("EdgeEvent", kind)),
+            })
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
+    // SAFETY: libgpiod won't access the path reference once the call returns.
+    unsafe { gpiod::gpiod_is_gpiochip_device(path.as_ptr() as *const c_char) }
+}
+
+/// GPIO devices.
+///
+/// Returns a vector of unique available GPIO Chips.
+///
+/// The chips are sorted in ascending order of the chip names.
+pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
+    let mut devices = Vec::new();
+
+    for entry in fs::read_dir(path).map_err(|_| Error::IoError)?.flatten() {
+        let path = entry.path();
+
+        if is_gpiochip_device(&path) {
+            let chip = chip::Chip::open(&path)?;
+            let info = chip.info()?;
+
+            devices.push((chip, info));
+        }
+    }
+
+    devices.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap());
+    devices.dedup_by(|a, b| a.1.eq(&b.1));
+
+    Ok(devices.into_iter().map(|a| a.0).collect())
+}
+
+/// Get the API version of the libgpiod library as a human-readable string.
+pub fn libgpiod_version() -> Result<&'static str> {
+    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
+    let version = unsafe { gpiod::gpiod_version_string() };
+
+    if version.is_null() {
+        return Err(Error::NullString("GPIO library version"));
+    }
+
+    // SAFETY: The string is guaranteed to be valid here by the C API.
+    unsafe { CStr::from_ptr(version) }
+        .to_str()
+        .map_err(Error::StringNotUtf8)
+}
+
+/// Get the API version of the libgpiod crate as a human-readable string.
+pub fn crate_version() -> &'static str {
+    env!("CARGO_PKG_VERSION")
+}
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
new file mode 100644
index 000000000000..96acbf70e945
--- /dev/null
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::raw::{c_ulong, c_void};
+use std::slice;
+
+use super::{
+    gpiod,
+    line::{Offset, Settings},
+    Error, OperationType, Result,
+};
+
+/// Line configuration objects.
+///
+/// The line-config object contains the configuration for lines that can be
+/// used in two cases:
+///  - when making a line request
+///  - when reconfiguring a set of already requested lines.
+///
+/// A new line-config object is empty. Using it in a request will lead to an
+/// error. In order for a line-config to become useful, it needs to be assigned
+/// at least one offset-to-settings mapping by calling
+/// ::gpiod_line_config_add_line_settings.
+///
+/// When calling ::gpiod_chip_request_lines, the library will request all
+/// offsets that were assigned settings in the order that they were assigned.
+
+#[derive(Debug, Eq, PartialEq)]
+pub struct Config {
+    pub(crate) config: *mut gpiod::gpiod_line_config,
+}
+
+impl Config {
+    /// Create a new line config object.
+    pub fn new() -> Result<Self> {
+        // SAFETY: The `gpiod_line_config` returned by libgpiod is guaranteed to live as long
+        // as the `struct Config`.
+        let config = unsafe { gpiod::gpiod_line_config_new() };
+
+        if config.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::LineConfigNew,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { config })
+    }
+
+    /// Resets the entire configuration stored in the object. This is useful if
+    /// the user wants to reuse the object without reallocating it.
+    pub fn reset(&mut self) {
+        // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_config_reset(self.config) }
+    }
+
+    /// Add line settings for a set of offsets.
+    pub fn add_line_settings(&self, offsets: &[Offset], settings: Settings) -> Result<()> {
+        // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_line_config_add_line_settings(
+                self.config,
+                offsets.as_ptr(),
+                offsets.len() as c_ulong,
+                settings.settings,
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineConfigAddSettings,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get line settings for offset.
+    pub fn line_settings(&self, offset: Offset) -> Result<Settings> {
+        // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
+        let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, offset) };
+
+        if settings.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::LineConfigGetSettings,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Settings::new_with_settings(settings))
+    }
+
+    /// Get configured offsets.
+    pub fn offsets(&self) -> Result<Vec<Offset>> {
+        let mut num: u64 = 0;
+        let mut ptr: *mut Offset = std::ptr::null_mut();
+
+        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
+        // as it is not explicitly freed with `free()`.
+        let ret = unsafe {
+            gpiod::gpiod_line_config_get_offsets(
+                self.config,
+                &mut num as *mut _ as *mut _,
+                &mut ptr,
+            )
+        };
+
+        if ret == -1 {
+            return Err(Error::OperationFailed(
+                OperationType::LineConfigGetOffsets,
+                errno::errno(),
+            ));
+        }
+
+        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
+        // as it is not explicitly freed with `free()`.
+        let offsets = unsafe { slice::from_raw_parts(ptr as *const Offset, num as usize).to_vec() };
+
+        // SAFETY: The `ptr` array is guaranteed to be valid here.
+        unsafe { libc::free(ptr as *mut c_void) };
+
+        Ok(offsets)
+    }
+}
+
+impl Drop for Config {
+    /// Free the line config object and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_config_free(self.config) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
new file mode 100644
index 000000000000..412c9b835235
--- /dev/null
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::ffi::CStr;
+use std::str;
+use std::time::Duration;
+
+use super::{
+    gpiod,
+    line::{Bias, Direction, Drive, Edge, EventClock, Offset},
+    Error, Result,
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
+#[derive(Debug, Eq, PartialEq)]
+pub struct Info {
+    info: *mut gpiod::gpiod_line_info,
+    contained: bool,
+}
+
+impl Info {
+    fn new_internal(info: *mut gpiod::gpiod_line_info, contained: bool) -> Result<Self> {
+        Ok(Self { info, contained })
+    }
+
+    /// Get a snapshot of information about the line.
+    pub(crate) fn new(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
+        Info::new_internal(info, false)
+    }
+
+    /// Get a snapshot of information about the line and start watching it for changes.
+    pub(crate) fn new_watch(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
+        Info::new_internal(info, false)
+    }
+
+    /// Get the Line info object associated with an event.
+    pub(crate) fn new_from_event(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
+        Info::new_internal(info, true)
+    }
+
+    /// Get the offset of the line within the GPIO chip.
+    ///
+    /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
+    /// uniquely identifies the line within the system.
+
+    pub fn offset(&self) -> Offset {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
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
+        unsafe { CStr::from_ptr(name) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Returns True if the line is in use, false otherwise.
+    ///
+    /// The user space can't know exactly why a line is busy. It may have been
+    /// requested by another process or hogged by the kernel. It only matters that
+    /// the line is used and we can't request it.
+    pub fn is_used(&self) -> bool {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
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
+        unsafe { CStr::from_ptr(name) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Get the GPIO line's direction.
+    pub fn direction(&self) -> Result<Direction> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) } as u32)
+    }
+
+    /// Returns true if the line is "active-low", false otherwise.
+    pub fn is_active_low(&self) -> bool {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_info_is_active_low(self.info) }
+    }
+
+    /// Get the GPIO line's bias setting.
+    pub fn bias(&self) -> Result<Option<Bias>> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) } as u32)
+    }
+
+    /// Get the GPIO line's drive setting.
+    pub fn drive(&self) -> Result<Drive> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) } as u32)
+    }
+
+    /// Get the current edge detection setting of the line.
+    pub fn edge_detection(&self) -> Result<Option<Edge>> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) } as u32)
+    }
+
+    /// Get the current event clock setting used for edge event timestamps.
+    pub fn event_clock(&self) -> Result<EventClock> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) } as u32)
+    }
+
+    /// Returns true if the line is debounced (either by hardware or by the
+    /// kernel software debouncer), false otherwise.
+    pub fn is_debounced(&self) -> bool {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_info_is_debounced(self.info) }
+    }
+
+    /// Get the debounce period of the line.
+    pub fn debounce_period(&self) -> Duration {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        Duration::from_micros(unsafe {
+            gpiod::gpiod_line_info_get_debounce_period_us(self.info) as u64
+        })
+    }
+}
+
+impl Drop for Info {
+    fn drop(&mut self) {
+        // We must not free the Line info object created from `struct chip::Event` by calling
+        // libgpiod API.
+        if !self.contained {
+            // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+            unsafe { gpiod::gpiod_line_info_free(self.info) }
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
new file mode 100644
index 000000000000..7101d098b6f5
--- /dev/null
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::{raw::c_ulong, unix::prelude::AsRawFd};
+use std::time::Duration;
+
+use super::{
+    gpiod,
+    line::{self, Offset, Value, ValueMap},
+    request, Error, OperationType, Result,
+};
+
+/// Line request operations
+///
+/// Allows interaction with a set of requested lines.
+#[derive(Debug, Eq, PartialEq)]
+pub struct Request {
+    pub(crate) request: *mut gpiod::gpiod_line_request,
+}
+
+impl Request {
+    /// Request a set of lines for exclusive usage.
+    pub(crate) fn new(request: *mut gpiod::gpiod_line_request) -> Result<Self> {
+        Ok(Self { request })
+    }
+
+    /// Get the number of lines in the request.
+    pub fn num_lines(&self) -> usize {
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_request_get_num_lines(self.request) as usize }
+    }
+
+    /// Get the offsets of lines in the request.
+    pub fn offsets(&self) -> Vec<Offset> {
+        let mut offsets = vec![0; self.num_lines() as usize];
+
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_request_get_offsets(self.request, offsets.as_mut_ptr()) };
+        offsets
+    }
+
+    /// Get the value (0 or 1) of a single line associated with the request.
+    pub fn value(&self, offset: Offset) -> Result<Value> {
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        let value = unsafe { gpiod::gpiod_line_request_get_value(self.request, offset) };
+
+        if value != 0 && value != 1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestGetVal,
+                errno::errno(),
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
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
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
+                errno::errno(),
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
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        let ret =
+            unsafe { gpiod::gpiod_line_request_set_value(self.request, offset, value.value()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestSetVal,
+                errno::errno(),
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
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
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
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get values of all lines associated with the request.
+    pub fn set_values(&self, values: &[Value]) -> Result<()> {
+        if values.len() != self.num_lines() as usize {
+            return Err(Error::InvalidArguments);
+        }
+
+        let mut new_values = Vec::new();
+        for value in values {
+            new_values.push(value.value());
+        }
+
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        let ret =
+            unsafe { gpiod::gpiod_line_request_set_values(self.request, new_values.as_ptr()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestSetVal,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Update the configuration of lines associated with the line request.
+    pub fn reconfigure_lines(&self, lconfig: &line::Config) -> Result<()> {
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        let ret =
+            unsafe { gpiod::gpiod_line_request_reconfigure_lines(self.request, lconfig.config) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineRequestReconfigLines,
+                errno::errno(),
+            ))
+        } else {
+            Ok(())
+        }
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
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        let ret = unsafe { gpiod::gpiod_line_request_wait_edge_event(self.request, timeout) };
+
+        match ret {
+            -1 => Err(Error::OperationFailed(
+                OperationType::LineRequestWaitEdgeEvent,
+                errno::errno(),
+            )),
+            0 => Ok(false),
+            _ => Ok(true),
+        }
+    }
+
+    /// Get a number of edge events from a line request.
+    ///
+    /// This function will block if no event was queued for the line.
+    pub fn read_edge_events<'a>(
+        &'a self,
+        buffer: &'a mut request::Buffer,
+    ) -> Result<request::Events> {
+        buffer.read_edge_events(self)
+    }
+}
+
+impl AsRawFd for Request {
+    /// Get the file descriptor associated with the line request.
+    fn as_raw_fd(&self) -> i32 {
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_request_get_fd(self.request) }
+    }
+}
+
+impl Drop for Request {
+    /// Release the requested lines and free all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_request_release(self.request) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
new file mode 100644
index 000000000000..50242d2c841a
--- /dev/null
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::time::Duration;
+
+use super::{
+    gpiod,
+    line::{Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value},
+    Error, OperationType, Result,
+};
+
+/// Line settings objects.
+///
+/// Line settings object contains a set of line properties that can be used
+/// when requesting lines or reconfiguring an existing request.
+///
+/// Mutators in general can only fail if the new property value is invalid. The
+/// return values can be safely ignored - the object remains valid even after
+/// a mutator fails and simply uses the sane default appropriate for given
+/// property.
+
+#[derive(Debug, Eq, PartialEq)]
+pub struct Settings {
+    pub(crate) settings: *mut gpiod::gpiod_line_settings,
+}
+
+impl Settings {
+    /// Create a new line settings object.
+    pub fn new() -> Result<Self> {
+        // SAFETY: The `gpiod_line_settings` returned by libgpiod is guaranteed to live as long
+        // as the `struct Settings`.
+        let settings = unsafe { gpiod::gpiod_line_settings_new() };
+
+        if settings.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::LineSettingsNew,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { settings })
+    }
+
+    pub fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
+        Self { settings }
+    }
+
+    /// Resets the line settings object to its default values.
+    pub fn reset(&mut self) {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_settings_reset(self.settings) }
+    }
+
+    /// Makes copy of the settings object.
+    pub fn settings_clone(&self) -> Result<Self> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let settings = unsafe { gpiod::gpiod_line_settings_copy(self.settings) };
+        if settings.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::LineSettingsCopy,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { settings })
+    }
+
+    /// Set line prop setting.
+    pub fn set_prop(&mut self, props: &[SettingVal]) -> Result<&mut Self> {
+        for property in props {
+            match property {
+                SettingVal::Direction(prop) => self.set_direction(*prop)?,
+                SettingVal::EdgeDetection(prop) => self.set_edge_detection(*prop)?,
+                SettingVal::Bias(prop) => self.set_bias(*prop)?,
+                SettingVal::Drive(prop) => self.set_drive(*prop)?,
+                SettingVal::ActiveLow(prop) => self.set_active_low(*prop),
+                SettingVal::DebouncePeriod(prop) => self.set_debounce_period(*prop),
+                SettingVal::EventClock(prop) => self.set_event_clock(*prop)?,
+                SettingVal::OutputValue(prop) => self.set_output_value(*prop)?,
+            };
+        }
+
+        Ok(self)
+    }
+
+    /// Get the line prop setting.
+    pub fn prop(&self, property: SettingKind) -> Result<SettingVal> {
+        Ok(match property {
+            SettingKind::Direction => SettingVal::Direction(self.direction()?),
+            SettingKind::EdgeDetection => SettingVal::EdgeDetection(self.edge_detection()?),
+            SettingKind::Bias => SettingVal::Bias(self.bias()?),
+            SettingKind::Drive => SettingVal::Drive(self.drive()?),
+            SettingKind::ActiveLow => SettingVal::ActiveLow(self.active_low()),
+            SettingKind::DebouncePeriod => SettingVal::DebouncePeriod(self.debounce_period()?),
+            SettingKind::EventClock => SettingVal::EventClock(self.event_clock()?),
+            SettingKind::OutputValue => SettingVal::OutputValue(self.output_value()?),
+        })
+    }
+
+    /// Set the line direction.
+    pub fn set_direction(&mut self, direction: Direction) -> Result<&mut Self> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_line_settings_set_direction(
+                self.settings,
+                direction.gpiod_direction() as i32,
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineSettingsSetDirection,
+                errno::errno(),
+            ))
+        } else {
+            Ok(self)
+        }
+    }
+
+    /// Get the direction setting.
+    pub fn direction(&self) -> Result<Direction> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        Direction::new(unsafe { gpiod::gpiod_line_settings_get_direction(self.settings) } as u32)
+    }
+
+    /// Set the edge event detection setting.
+    pub fn set_edge_detection(&mut self, edge: Option<Edge>) -> Result<&mut Self> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_line_settings_set_edge_detection(
+                self.settings,
+                Edge::gpiod_edge(edge) as i32,
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineSettingsSetEdgeDetection,
+                errno::errno(),
+            ))
+        } else {
+            Ok(self)
+        }
+    }
+
+    /// Get the edge event detection setting.
+    pub fn edge_detection(&self) -> Result<Option<Edge>> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        Edge::new(unsafe { gpiod::gpiod_line_settings_get_edge_detection(self.settings) } as u32)
+    }
+
+    /// Set the bias setting.
+    pub fn set_bias(&mut self, bias: Option<Bias>) -> Result<&mut Self> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_line_settings_set_bias(self.settings, Bias::gpiod_bias(bias) as i32)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineSettingsSetBias,
+                errno::errno(),
+            ))
+        } else {
+            Ok(self)
+        }
+    }
+
+    /// Get the bias setting.
+    pub fn bias(&self) -> Result<Option<Bias>> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        Bias::new(unsafe { gpiod::gpiod_line_settings_get_bias(self.settings) } as u32)
+    }
+
+    /// Set the drive setting.
+    pub fn set_drive(&mut self, drive: Drive) -> Result<&mut Self> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_line_settings_set_drive(self.settings, drive.gpiod_drive() as i32)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineSettingsSetDrive,
+                errno::errno(),
+            ))
+        } else {
+            Ok(self)
+        }
+    }
+
+    /// Get the drive setting.
+    pub fn drive(&self) -> Result<Drive> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        Drive::new(unsafe { gpiod::gpiod_line_settings_get_drive(self.settings) } as u32)
+    }
+
+    /// Set active-low setting.
+    pub fn set_active_low(&mut self, active_low: bool) -> &mut Self {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        unsafe {
+            gpiod::gpiod_line_settings_set_active_low(self.settings, active_low);
+        }
+        self
+    }
+
+    /// Check the active-low setting.
+    pub fn active_low(&self) -> bool {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_settings_get_active_low(self.settings) }
+    }
+
+    /// Set the debounce period setting.
+    pub fn set_debounce_period(&mut self, period: Duration) -> &mut Self {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        unsafe {
+            gpiod::gpiod_line_settings_set_debounce_period_us(
+                self.settings,
+                period.as_micros().try_into().unwrap(),
+            );
+        }
+
+        self
+    }
+
+    /// Get the debounce period.
+    pub fn debounce_period(&self) -> Result<Duration> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        Ok(Duration::from_micros(unsafe {
+            gpiod::gpiod_line_settings_get_debounce_period_us(self.settings) as u64
+        }))
+    }
+
+    /// Set the event clock setting.
+    pub fn set_event_clock(&mut self, clock: EventClock) -> Result<&mut Self> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let ret = unsafe {
+            gpiod::gpiod_line_settings_set_event_clock(self.settings, clock.gpiod_clock() as i32)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineSettingsSetEventClock,
+                errno::errno(),
+            ))
+        } else {
+            Ok(self)
+        }
+    }
+
+    /// Get the event clock setting.
+    pub fn event_clock(&self) -> Result<EventClock> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        EventClock::new(unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) } as u32)
+    }
+
+    /// Set the output value setting.
+    pub fn set_output_value(&mut self, value: Value) -> Result<&mut Self> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let ret =
+            unsafe { gpiod::gpiod_line_settings_set_output_value(self.settings, value.value()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineSettingsSetOutputValue,
+                errno::errno(),
+            ))
+        } else {
+            Ok(self)
+        }
+    }
+
+    /// Get the output value, 0 or 1.
+    pub fn output_value(&self) -> Result<Value> {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        let value = unsafe { gpiod::gpiod_line_settings_get_output_value(self.settings) };
+
+        if value != 0 && value != 1 {
+            Err(Error::OperationFailed(
+                OperationType::LineSettingsGetOutVal,
+                errno::errno(),
+            ))
+        } else {
+            Value::new(value)
+        }
+    }
+}
+
+impl Drop for Settings {
+    /// Free the line settings object and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_settings_free(self.settings) }
+    }
+}
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
new file mode 100644
index 000000000000..4b5247548254
--- /dev/null
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::ffi::{CStr, CString};
+use std::os::raw::{c_char, c_ulong};
+use std::str;
+
+use super::{gpiod, Error, OperationType, Result};
+
+/// Request configuration objects
+///
+/// Request config objects are used to pass a set of options to the kernel at
+/// the time of the line request. The mutators don't return error values. If the
+/// values are invalid, in general they are silently adjusted to acceptable
+/// ranges.
+
+#[derive(Debug, Eq, PartialEq)]
+pub struct Config {
+    pub(crate) config: *mut gpiod::gpiod_request_config,
+}
+
+impl Config {
+    /// Create a new request config object.
+    pub fn new() -> Result<Self> {
+        // SAFETY: The `gpiod_request_config` returned by libgpiod is guaranteed to live as long
+        // as the `struct Config`.
+        let config = unsafe { gpiod::gpiod_request_config_new() };
+        if config.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::RequestConfigNew,
+                errno::errno(),
+            ));
+        }
+
+        Ok(Self { config })
+    }
+
+    /// Set the consumer name for the request.
+    ///
+    /// If the consumer string is too long, it will be truncated to the max
+    /// accepted length.
+    pub fn set_consumer(&self, consumer: &str) -> Result<()> {
+        let consumer = CString::new(consumer).map_err(|_| Error::InvalidString)?;
+
+        // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
+        unsafe {
+            gpiod::gpiod_request_config_set_consumer(
+                self.config,
+                consumer.as_ptr() as *const c_char,
+            )
+        }
+
+        Ok(())
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
+                errno::errno(),
+            ));
+        }
+
+        // SAFETY: The string is guaranteed to be valid here by the C API.
+        unsafe { CStr::from_ptr(consumer) }
+            .to_str()
+            .map_err(Error::StringNotUtf8)
+    }
+
+    /// Set the size of the kernel event buffer for the request.
+    pub fn set_event_buffer_size(&self, size: usize) {
+        // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong) }
+    }
+
+    /// Get the edge event buffer size setting for the request config.
+    pub fn event_buffer_size(&self) -> usize {
+        // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_request_config_get_event_buffer_size(self.config) as usize }
+    }
+}
+
+impl Drop for Config {
+    /// Free the request config object and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_request_config_free(self.config) }
+    }
+}
-- 
2.31.1.272.g89b43f80a514

