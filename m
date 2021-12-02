Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDD546623E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 12:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357301AbhLBL01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 06:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346343AbhLBL00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 06:26:26 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09E5C061757
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 03:23:03 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id gt5so20313245pjb.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 03:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dkINZEb+RKa8xFVhZ+o4WtzQ64lvejQBwXmERGfdzvE=;
        b=qhVZkD+f3IJzcntcworyvPiPp386CcHu5+4kvGhY4pSBWa1UGV/hGU5WLPzYZYIpq6
         8WBN82fOrPpeqdhrV7vxTExZP9C/riUb2Cy379CpYtB4DMjEGL4GRuk3ooykdfpuEYSk
         /FIJE9oD1xcB9U8iQXD1uWsHjitkgJtYfl4o1KADx6kKZ4cL0Y23DouQ21HdJkIwzKIF
         9J5kP+nmm0kgClPetMMyqTCLrTpa7w06m0eu/Vq2Z6KUSor3YxA3ZbXjLRuqHbwlM1S0
         1g1zJysgWB94SERhk/FK74gSwi6I85z1ucJLMj+s62LMcXW7/7aANrikU8AC+B0TrdYy
         Vxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dkINZEb+RKa8xFVhZ+o4WtzQ64lvejQBwXmERGfdzvE=;
        b=L+CvCBaQbwKw8rrOCLgZLmUkutbl4YdVAy9Kw6HjjE+swc6KVlfC5YbKpWB8p/AebT
         7onb7KZe8JoJdRVehWvidsf3JwyBxo5VCJfbuaHCq0Y+tNbYP0vPeDGz11BlAZulH5f6
         IoIiVXhk4SlM0S6fs9JqGZ7aAP7SI0HIAeVPq6MDLQILwND8gGyhJXyFl1zakLFDBJ4R
         /mrbInBwhCuSnPdN6qTVocTDNeH7mDlqhaaYsCckyP01jj7so+2ooDyZVnU06PYunjAd
         cMyVFabFSl0u6rVvWALpu26/3RMrFyKhQfR68KHXVd9yYxNz9YWqUARNLY3Rj52utwC7
         F4aQ==
X-Gm-Message-State: AOAM531y2309svBASFUoD+P41FDCsjORzYw2plvCUpl5LUHvAwzFS8/u
        TtOPzJNbeI7DFn0JjAumxE6rRg==
X-Google-Smtp-Source: ABdhPJyk8bFmT6OIaGeF8x7wqD6BkZnhVn6BCLGxQGXe69uHZCLev7xr7yRHmtOv2aEa4kvcSO+o0g==
X-Received: by 2002:a17:902:64c2:b0:141:c171:b99b with SMTP id y2-20020a17090264c200b00141c171b99bmr14529375pli.55.1638444182252;
        Thu, 02 Dec 2021 03:23:02 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id y26sm2090059pgc.72.2021.12.02.03.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:23:01 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: [PATCH V2 2/4] libgpiod: Add rust wrappers
Date:   Thu,  2 Dec 2021 16:52:47 +0530
Message-Id: <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1638443930.git.viresh.kumar@linaro.org>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add rust wrappers around FFI bindings to provide a convenient interface
for the users.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/Cargo.toml            |   2 +
 bindings/rust/src/chip.rs           | 197 +++++++++++++
 bindings/rust/src/edge_event.rs     |  78 +++++
 bindings/rust/src/event_buffer.rs   |  59 ++++
 bindings/rust/src/info_event.rs     |  70 +++++
 bindings/rust/src/lib.rs            | 268 +++++++++++++++++
 bindings/rust/src/line_config.rs    | 431 ++++++++++++++++++++++++++++
 bindings/rust/src/line_info.rs      | 186 ++++++++++++
 bindings/rust/src/line_request.rs   | 217 ++++++++++++++
 bindings/rust/src/request_config.rs | 118 ++++++++
 10 files changed, 1626 insertions(+)
 create mode 100644 bindings/rust/src/chip.rs
 create mode 100644 bindings/rust/src/edge_event.rs
 create mode 100644 bindings/rust/src/event_buffer.rs
 create mode 100644 bindings/rust/src/info_event.rs
 create mode 100644 bindings/rust/src/line_config.rs
 create mode 100644 bindings/rust/src/line_info.rs
 create mode 100644 bindings/rust/src/line_request.rs
 create mode 100644 bindings/rust/src/request_config.rs

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index 62f3d52ddb0f..d57dfd65ba7d 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -6,6 +6,8 @@ edition = "2021"
 # See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
 
 [dependencies]
+thiserror = "1.0"
+vmm-sys-util = "=0.9.0"
 
 [build-dependencies]
 bindgen = "0.59.1"
diff --git a/bindings/rust/src/chip.rs b/bindings/rust/src/chip.rs
new file mode 100644
index 000000000000..144f5ef9c570
--- /dev/null
+++ b/bindings/rust/src/chip.rs
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::raw::c_char;
+use std::sync::Arc;
+use std::time::Duration;
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::{bindings, Error, Result};
+use crate::info_event::GpiodInfoEvent;
+use crate::line_config::GpiodLineConfig;
+use crate::line_info::GpiodLineInfo;
+use crate::line_request::GpiodLineRequest;
+use crate::request_config::GpiodRequestConfig;
+
+/// GPIO chip
+///
+/// A GPIO chip object is associated with an open file descriptor to the GPIO
+/// character device. It exposes basic information about the chip and allows
+/// callers to retrieve information about each line, watch lines for state
+/// changes and make line requests.
+pub(crate) struct GpiodChipInternal {
+    chip: *mut bindings::gpiod_chip,
+}
+
+impl GpiodChipInternal {
+    /// Find a GPIO chip by path.
+    pub(crate) fn open(path: &str) -> Result<Self> {
+        let chip = unsafe { bindings::gpiod_chip_open(path.as_ptr() as *const c_char) };
+        if chip.is_null() {
+            return Err(Error::OperationFailed("GpiodChip open", IoError::last()));
+        }
+
+        Ok(Self { chip })
+    }
+
+    /// Private helper, Returns gpiod_chip
+    pub(crate) fn chip(&self) -> *mut bindings::gpiod_chip {
+        self.chip
+    }
+}
+
+impl Drop for GpiodChipInternal {
+    /// Close the GPIO chip and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_chip_close(self.chip) }
+    }
+}
+
+pub struct GpiodChip {
+    ichip: Arc<GpiodChipInternal>,
+}
+
+impl GpiodChip {
+    /// Find a GPIO chip by path.
+    pub fn open(path: &str) -> Result<Self> {
+        Ok(Self {
+            ichip: Arc::new(GpiodChipInternal::open(path)?),
+        })
+    }
+
+    /// Get the GPIO chip name as represented in the kernel.
+    pub fn get_name(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct GpiodChip`.
+        let name = unsafe { bindings::gpiod_chip_get_name(self.ichip.chip()) };
+        if name.is_null() {
+            return Err(Error::NameNotFound("GPIO chip name"));
+        }
+
+        unsafe {
+            str::from_utf8(slice::from_raw_parts(
+                name as *const u8,
+                bindings::strlen(name) as usize,
+            ))
+            .map_err(Error::InvalidString)
+        }
+    }
+
+    /// Get the GPIO chip label as represented in the kernel.
+    pub fn get_label(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct GpiodChip`.
+        let label = unsafe { bindings::gpiod_chip_get_label(self.ichip.chip()) };
+        if label.is_null() {
+            return Err(Error::NameNotFound("GPIO chip label"));
+        }
+
+        unsafe {
+            str::from_utf8(slice::from_raw_parts(
+                label as *const u8,
+                bindings::strlen(label) as usize,
+            ))
+            .map_err(Error::InvalidString)
+        }
+    }
+
+    /// Get the path used to find this GPIO chip.
+    pub fn get_path(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct GpiodChip`.
+        let path = unsafe { bindings::gpiod_chip_get_path(self.ichip.chip()) };
+        if path.is_null() {
+            return Err(Error::NameNotFound("GPIO chip path"));
+        }
+
+        unsafe {
+            str::from_utf8(slice::from_raw_parts(
+                path as *const u8,
+                bindings::strlen(path) as usize,
+            ))
+            .map_err(Error::InvalidString)
+        }
+    }
+
+    /// Get the number of GPIO lines exposed by this chip.
+    pub fn get_num_lines(&self) -> u32 {
+        unsafe { bindings::gpiod_chip_get_num_lines(self.ichip.chip()) }
+    }
+
+    /// Get the current snapshot of information about the line at given offset.
+    pub fn line_info(&self, offset: u32) -> Result<GpiodLineInfo> {
+        GpiodLineInfo::new(self.ichip.clone(), offset, false)
+    }
+
+    /// Get the current snapshot of information about the line at given offset
+    /// and optionally start watching it for future changes.
+    pub fn watch_line_info(&self, offset: u32) -> Result<GpiodLineInfo> {
+        GpiodLineInfo::new(self.ichip.clone(), offset, true)
+    }
+
+    /// Get the file descriptor associated with this chip.
+    ///
+    /// The returned file descriptor must not be closed by the caller, else other methods for the
+    /// `struct GpiodChip` may fail.
+    pub fn get_fd(&self) -> Result<u32> {
+        let fd = unsafe { bindings::gpiod_chip_get_fd(self.ichip.chip()) };
+
+        if fd < 0 {
+            Err(Error::OperationFailed("GpiodChip get-fd", IoError::last()))
+        } else {
+            Ok(fd as u32)
+        }
+    }
+
+    /// Wait for line status events on any of the watched lines exposed by this
+    /// chip.
+    pub fn info_event_wait(&self, timeout: Duration) -> Result<()> {
+        let ret = unsafe {
+            bindings::gpiod_chip_info_event_wait(self.ichip.chip(), timeout.as_nanos() as u64)
+        };
+
+        match ret {
+            -1 => Err(Error::OperationFailed(
+                "GpiodChip info-event-wait",
+                IoError::last(),
+            )),
+            0 => Err(Error::OperationTimedOut),
+            _ => Ok(()),
+        }
+    }
+
+    /// Read a single line status change event from this chip. If no events are
+    /// pending, this function will block.
+    pub fn info_event_read(&self) -> Result<GpiodInfoEvent> {
+        GpiodInfoEvent::new(&self.ichip.clone())
+    }
+
+    /// Map a GPIO line's name to its offset within the chip.
+    pub fn find_line(&self, name: &str) -> Result<u32> {
+        let ret = unsafe {
+            bindings::gpiod_chip_find_line(self.ichip.chip(), name.as_ptr() as *const c_char)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodChip find-line",
+                IoError::last(),
+            ))
+        } else {
+            Ok(ret as u32)
+        }
+    }
+
+    /// Request a set of lines for exclusive usage.
+    pub fn request_lines(
+        &self,
+        rconfig: &GpiodRequestConfig,
+        lconfig: &GpiodLineConfig,
+    ) -> Result<GpiodLineRequest> {
+        GpiodLineRequest::new(&self.ichip.clone(), rconfig, lconfig)
+    }
+}
diff --git a/bindings/rust/src/edge_event.rs b/bindings/rust/src/edge_event.rs
new file mode 100644
index 000000000000..5fe292ac69aa
--- /dev/null
+++ b/bindings/rust/src/edge_event.rs
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::{bindings, EdgeEvent, Error, Result};
+use crate::event_buffer::GpiodEdgeEventBuffer;
+
+/// Line edge events handling
+///
+/// An edge event object contains information about a single line event. It
+/// contains the event type, timestamp and the offset of the line on which the
+/// event occurred as well as two sequential numbers (global for all lines
+/// associated with the parent chip and local for this line only).
+///
+/// For performance and to limit the number of memory allocations when a lot of
+/// events are being read, edge events are stored in an edge-event buffer object.
+
+pub struct GpiodEdgeEvent {
+    event: *mut bindings::gpiod_edge_event,
+}
+
+impl GpiodEdgeEvent {
+    /// Get an event stored in the buffer.
+    pub fn new(buffer: &GpiodEdgeEventBuffer, index: u64) -> Result<Self> {
+        let event = unsafe { bindings::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodEdgeEvent buffer-get-event",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self { event })
+    }
+
+    /// Get the event type.
+    pub fn get_event_type(&self) -> Result<EdgeEvent> {
+        EdgeEvent::new(unsafe { bindings::gpiod_edge_event_get_event_type(self.event) } as u32)
+    }
+
+    /// Get the timestamp of the event.
+    pub fn get_timestamp(&self) -> Duration {
+        Duration::from_nanos(unsafe { bindings::gpiod_edge_event_get_timestamp(self.event) })
+    }
+
+    /// Get the offset of the line on which the event was triggered.
+    pub fn get_line_offset(&self) -> u32 {
+        unsafe { bindings::gpiod_edge_event_get_line_offset(self.event) }
+    }
+
+    /// Get the global sequence number of this event.
+    ///
+    /// Returns sequence number of the event relative to all lines in the
+    /// associated line request.
+    pub fn get_global_seqno(&self) -> u64 {
+        unsafe { bindings::gpiod_edge_event_get_global_seqno(self.event) }
+    }
+
+    /// Get the event sequence number specific to concerned line.
+    ///
+    /// Returns sequence number of the event relative to this line within the
+    /// lifetime of the associated line request.
+    pub fn get_line_seqno(&self) -> u64 {
+        unsafe { bindings::gpiod_edge_event_get_line_seqno(self.event) }
+    }
+}
+
+impl Drop for GpiodEdgeEvent {
+    /// Free the edge event object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_edge_event_free(self.event) }
+    }
+}
diff --git a/bindings/rust/src/event_buffer.rs b/bindings/rust/src/event_buffer.rs
new file mode 100644
index 000000000000..fd702e91818d
--- /dev/null
+++ b/bindings/rust/src/event_buffer.rs
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::{bindings, Error, Result};
+use crate::edge_event::GpiodEdgeEvent;
+
+/// Line edge events buffer
+pub struct GpiodEdgeEventBuffer {
+    buffer: *mut bindings::gpiod_edge_event_buffer,
+}
+
+impl GpiodEdgeEventBuffer {
+    /// Create a new edge event buffer.
+    ///
+    /// If capacity equals 0, it will be set to a default value of 64. If
+    /// capacity is larger than 1024, it will be limited to 1024.
+    pub fn new(capacity: u32) -> Result<Self> {
+        let buffer = unsafe { bindings::gpiod_edge_event_buffer_new(capacity) };
+        if buffer.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodEdgeEventBuffer new",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self { buffer })
+    }
+
+    /// Private helper, Returns gpiod_edge_event_buffer
+    pub(crate) fn buffer(&self) -> *mut bindings::gpiod_edge_event_buffer {
+        self.buffer
+    }
+
+    /// Get the capacity of the event buffer.
+    pub fn get_capacity(&self) -> u32 {
+        unsafe { bindings::gpiod_edge_event_buffer_get_capacity(self.buffer) }
+    }
+
+    /// Read an event stored in the buffer.
+    pub fn get_event(&self, index: u64) -> Result<GpiodEdgeEvent> {
+        GpiodEdgeEvent::new(self, index)
+    }
+
+    /// Get the number of events this buffers stores.
+    pub fn num_events(&self) -> u32 {
+        unsafe { bindings::gpiod_edge_event_buffer_num_events(self.buffer) }
+    }
+}
+
+impl Drop for GpiodEdgeEventBuffer {
+    /// Free the edge event buffer and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_edge_event_buffer_free(self.buffer) };
+    }
+}
diff --git a/bindings/rust/src/info_event.rs b/bindings/rust/src/info_event.rs
new file mode 100644
index 000000000000..e0f82b31548f
--- /dev/null
+++ b/bindings/rust/src/info_event.rs
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::convert::TryFrom;
+use std::sync::Arc;
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::chip::GpiodChipInternal;
+use super::{bindings, Error, Event, Result};
+use crate::line_info::GpiodLineInfo;
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
+pub struct GpiodInfoEvent {
+    event: *mut bindings::gpiod_info_event,
+}
+
+impl GpiodInfoEvent {
+    /// Get a single chip's line's status change event.
+    pub(crate) fn new(ichip: &Arc<GpiodChipInternal>) -> Result<Self> {
+        let event = unsafe { bindings::gpiod_chip_info_event_read(ichip.chip()) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodInfoEvent event-read",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self { event })
+    }
+
+    /// Private helper, Returns gpiod_info_event
+    pub(crate) fn event(&self) -> *mut bindings::gpiod_info_event {
+        self.event
+    }
+
+    /// Get the event type of this status change event.
+    pub fn get_event_type(&self) -> Result<Event> {
+        Event::new(unsafe { bindings::gpiod_info_event_get_event_type(self.event) } as u32)
+    }
+
+    /// Get the timestamp of the event.
+    pub fn get_timestamp(&self) -> Duration {
+        Duration::from_nanos(unsafe { bindings::gpiod_info_event_get_timestamp(self.event) })
+    }
+
+    /// Get the line-info object associated with this event.
+    pub fn line_info(&self) -> Result<GpiodLineInfo> {
+        GpiodLineInfo::try_from(self)
+    }
+}
+
+impl Drop for GpiodInfoEvent {
+    /// Free the info event object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_info_event_free(self.event) }
+    }
+}
diff --git a/bindings/rust/src/lib.rs b/bindings/rust/src/lib.rs
index e69de29bb2d1..cbdef64fdb8b 100644
--- a/bindings/rust/src/lib.rs
+++ b/bindings/rust/src/lib.rs
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Rust wrappers for GPIOD APIs
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
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
+mod bindings;
+pub mod chip;
+pub mod edge_event;
+pub mod event_buffer;
+pub mod info_event;
+pub mod line_config;
+pub mod line_info;
+pub mod line_request;
+pub mod request_config;
+
+use std::os::raw::c_char;
+use std::{slice, str};
+
+use thiserror::Error as ThisError;
+use vmm_sys_util::errno::Error as IoError;
+
+/// Result of libgpiod operations
+pub type Result<T> = std::result::Result<T, Error>;
+
+/// Error codes for libgpiod operations
+#[derive(Copy, Clone, Debug, PartialEq, ThisError)]
+pub enum Error {
+    #[error("Failed to find {0}")]
+    NameNotFound(&'static str),
+    #[error("Invalid String: {0:?}")]
+    InvalidString(str::Utf8Error),
+    #[error("Invalid {0} value: {1}")]
+    InvalidValue(&'static str, u32),
+    #[error("Operation {0} Failed: {1}")]
+    OperationFailed(&'static str, IoError),
+    #[error("Operation Timed-out")]
+    OperationTimedOut,
+}
+
+/// Direction settings.
+pub enum Direction {
+    /// Request the line(s), but didn't change current direction.
+    AsIs,
+    /// Direction is input - we're reading the state of a GPIO line.
+    Input,
+    /// Direction is output - we're driving the GPIO line.
+    Output,
+}
+
+impl Direction {
+    fn new(dir: u32) -> Result<Self> {
+        match dir {
+            bindings::GPIOD_LINE_DIRECTION_AS_IS => Ok(Direction::AsIs),
+            bindings::GPIOD_LINE_DIRECTION_INPUT => Ok(Direction::Input),
+            bindings::GPIOD_LINE_DIRECTION_OUTPUT => Ok(Direction::Output),
+            _ => Err(Error::InvalidValue("direction", dir)),
+        }
+    }
+
+    fn gpiod_direction(&self) -> u32 {
+        match self {
+            Direction::AsIs => bindings::GPIOD_LINE_DIRECTION_AS_IS,
+            Direction::Input => bindings::GPIOD_LINE_DIRECTION_INPUT,
+            Direction::Output => bindings::GPIOD_LINE_DIRECTION_OUTPUT,
+        }
+    }
+}
+
+/// Internal bias settings.
+pub enum Bias {
+    /// Don't change the bias setting when applying line config.
+    AsIs,
+    /// The internal bias state is unknown.
+    Unknown,
+    /// The internal bias is disabled.
+    Disabled,
+    /// The internal pull-up bias is enabled.
+    PullUp,
+    /// The internal pull-down bias is enabled.
+    PullDown,
+}
+
+impl Bias {
+    fn new(bias: u32) -> Result<Self> {
+        match bias {
+            bindings::GPIOD_LINE_BIAS_AS_IS => Ok(Bias::AsIs),
+            bindings::GPIOD_LINE_BIAS_UNKNOWN => Ok(Bias::Unknown),
+            bindings::GPIOD_LINE_BIAS_DISABLED => Ok(Bias::Disabled),
+            bindings::GPIOD_LINE_BIAS_PULL_UP => Ok(Bias::PullUp),
+            bindings::GPIOD_LINE_BIAS_PULL_DOWN => Ok(Bias::PullDown),
+            _ => Err(Error::InvalidValue("bias", bias)),
+        }
+    }
+
+    fn gpiod_bias(&self) -> u32 {
+        match self {
+            Bias::AsIs => bindings::GPIOD_LINE_BIAS_AS_IS,
+            Bias::Unknown => bindings::GPIOD_LINE_BIAS_UNKNOWN,
+            Bias::Disabled => bindings::GPIOD_LINE_BIAS_DISABLED,
+            Bias::PullUp => bindings::GPIOD_LINE_BIAS_PULL_UP,
+            Bias::PullDown => bindings::GPIOD_LINE_BIAS_PULL_DOWN,
+        }
+    }
+}
+
+/// Drive settings.
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
+            bindings::GPIOD_LINE_DRIVE_PUSH_PULL => Ok(Drive::PushPull),
+            bindings::GPIOD_LINE_DRIVE_OPEN_DRAIN => Ok(Drive::OpenDrain),
+            bindings::GPIOD_LINE_DRIVE_OPEN_SOURCE => Ok(Drive::OpenSource),
+            _ => Err(Error::InvalidValue("drive", drive)),
+        }
+    }
+
+    fn gpiod_drive(&self) -> u32 {
+        match self {
+            Drive::PushPull => bindings::GPIOD_LINE_DRIVE_PUSH_PULL,
+            Drive::OpenDrain => bindings::GPIOD_LINE_DRIVE_OPEN_DRAIN,
+            Drive::OpenSource => bindings::GPIOD_LINE_DRIVE_OPEN_SOURCE,
+        }
+    }
+}
+
+/// Edge detection settings.
+pub enum Edge {
+    /// Line edge detection is disabled.
+    None,
+    /// Line detects rising edge events.
+    Rising,
+    /// Line detect falling edge events.
+    Falling,
+    /// Line detects both rising and falling edge events.
+    Both,
+}
+
+impl Edge {
+    fn new(edge: u32) -> Result<Self> {
+        match edge {
+            bindings::GPIOD_LINE_EDGE_NONE => Ok(Edge::None),
+            bindings::GPIOD_LINE_EDGE_RISING => Ok(Edge::Rising),
+            bindings::GPIOD_LINE_EDGE_FALLING => Ok(Edge::Falling),
+            bindings::GPIOD_LINE_EDGE_BOTH => Ok(Edge::Both),
+            _ => Err(Error::InvalidValue("edge", edge)),
+        }
+    }
+
+    fn gpiod_edge(&self) -> u32 {
+        match self {
+            Edge::None => bindings::GPIOD_LINE_EDGE_NONE,
+            Edge::Rising => bindings::GPIOD_LINE_EDGE_RISING,
+            Edge::Falling => bindings::GPIOD_LINE_EDGE_FALLING,
+            Edge::Both => bindings::GPIOD_LINE_EDGE_BOTH,
+        }
+    }
+}
+
+/// Event clock settings.
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
+            bindings::GPIOD_LINE_EVENT_CLOCK_MONOTONIC => Ok(EventClock::Monotonic),
+            bindings::GPIOD_LINE_EVENT_CLOCK_REALTIME => Ok(EventClock::Realtime),
+            _ => Err(Error::InvalidValue("event clock", clock)),
+        }
+    }
+
+    fn gpiod_clock(&self) -> u32 {
+        match self {
+            EventClock::Monotonic => bindings::GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+            EventClock::Realtime => bindings::GPIOD_LINE_EVENT_CLOCK_REALTIME,
+        }
+    }
+}
+
+/// Line status change event types.
+pub enum Event {
+    /// Line has been requested.
+    LineRequested,
+    /// Previously requested line has been released.
+    LineReleased,
+    /// Line configuration has changed.
+    LineConfigChanged,
+}
+
+impl Event {
+    fn new(event: u32) -> Result<Self> {
+        match event {
+            bindings::GPIOD_INFO_EVENT_LINE_REQUESTED => Ok(Event::LineRequested),
+            bindings::GPIOD_INFO_EVENT_LINE_RELEASED => Ok(Event::LineReleased),
+            bindings::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => Ok(Event::LineConfigChanged),
+            _ => Err(Error::InvalidValue("event", event)),
+        }
+    }
+}
+
+/// Edge event types.
+pub enum EdgeEvent {
+    /// Rising edge event.
+    Rising,
+    /// Falling edge event.
+    Falling,
+}
+
+impl EdgeEvent {
+    fn new(event: u32) -> Result<Self> {
+        match event {
+            bindings::GPIOD_EDGE_EVENT_RISING_EDGE => Ok(EdgeEvent::Rising),
+            bindings::GPIOD_EDGE_EVENT_FALLING_EDGE => Ok(EdgeEvent::Falling),
+            _ => Err(Error::InvalidValue("edge event", event)),
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
+pub fn gpiod_is_gpiochip_device(path: &str) -> bool {
+    unsafe { bindings::gpiod_is_gpiochip_device(path.as_ptr() as *const c_char) }
+}
+
+/// Get the API version of the library as a human-readable string.
+pub fn gpiod_version_string() -> Result<&'static str> {
+    // SAFETY: The string returned by libgpiod is guaranteed to live forever.
+    let version = unsafe { bindings::gpiod_version_string() };
+
+    if version.is_null() {
+        return Err(Error::NameNotFound("GPIO library version"));
+    }
+
+    unsafe {
+        str::from_utf8(slice::from_raw_parts(
+            version as *const u8,
+            bindings::strlen(version) as usize,
+        ))
+        .map_err(Error::InvalidString)
+    }
+}
diff --git a/bindings/rust/src/line_config.rs b/bindings/rust/src/line_config.rs
new file mode 100644
index 000000000000..e79affe87e0c
--- /dev/null
+++ b/bindings/rust/src/line_config.rs
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::{bindings, Bias, Direction, Drive, Edge, Error, EventClock, Result};
+
+/// Line configuration objects.
+///
+/// The line-config object stores the configuration for lines that can be used
+/// in two cases: when making a line request and when reconfiguring a set of
+/// already requested lines. The mutators for the line request don't return
+/// errors. If the set of options is too complex to be translated into kernel
+/// uAPI structures - the error will be returned at the time of the request or
+/// reconfiguration. If an invalid value was passed to any of the getters - the
+/// default value will be silently used instead. Each option can be set
+/// globally, for a single line offset or for multiple line offsets.
+pub struct GpiodLineConfig {
+    config: *mut bindings::gpiod_line_config,
+}
+
+impl GpiodLineConfig {
+    /// Create a new line config object.
+    pub fn new() -> Result<Self> {
+        let config = unsafe { bindings::gpiod_line_config_new() };
+
+        if config.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodLineConfig new",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self { config })
+    }
+
+    /// Private helper, Returns gpiod_line_config
+    pub(crate) fn config(&self) -> *mut bindings::gpiod_line_config {
+        self.config
+    }
+
+    /// Resets the entire configuration stored in this object. This is useful if
+    /// the user wants to reuse the object without reallocating it.
+    pub fn reset(&mut self) {
+        unsafe { bindings::gpiod_line_config_reset(self.config) }
+    }
+
+    /// Set the direction for all lines.
+    pub fn set_direction(&mut self, direction: Direction) {
+        unsafe {
+            bindings::gpiod_line_config_set_direction(
+                self.config,
+                direction.gpiod_direction() as i32,
+            )
+        }
+    }
+
+    /// Set the direction for a single line at given offset.
+    pub fn set_direction_offset(&mut self, direction: Direction, offset: u32) {
+        unsafe {
+            bindings::gpiod_line_config_set_direction_offset(
+                self.config,
+                direction.gpiod_direction() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Set the direction for a subset of lines.
+    pub fn set_direction_subset(&mut self, direction: Direction, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_direction_subset(
+                self.config,
+                direction.gpiod_direction() as i32,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the direction of a given line.
+    ///
+    /// If an offset is used for which no config was provided, the function will
+    /// return the global default value.
+    pub fn get_direction(&self, offset: u32) -> Result<Direction> {
+        Direction::new(
+            unsafe { bindings::gpiod_line_config_get_direction(self.config, offset) } as u32,
+        )
+    }
+
+    /// Set the edge event detection for all lines.
+    pub fn set_edge_detection(&mut self, edge: Edge) {
+        unsafe {
+            bindings::gpiod_line_config_set_edge_detection(self.config, edge.gpiod_edge() as i32)
+        }
+    }
+
+    /// Set the edge event detection for a single line at given offset.
+    pub fn set_edge_detection_offset(&mut self, edge: Edge, offset: u32) {
+        unsafe {
+            bindings::gpiod_line_config_set_edge_detection_offset(
+                self.config,
+                edge.gpiod_edge() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Set the edge event detection for a subset of lines.
+    pub fn set_edge_detection_subset(&mut self, edge: Edge, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_edge_detection_subset(
+                self.config,
+                edge.gpiod_edge() as i32,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the edge event detection setting for a given line.
+    ///
+    /// Returns edge event detection setting that would have been used for given
+    /// offset if the config object was used in a request at the time of the
+    /// call. If an offset is used for which no config was provided, the
+    /// function will return the global default value.
+    pub fn get_edge_detection(&self, offset: u32) -> Result<Edge> {
+        Edge::new(
+            unsafe { bindings::gpiod_line_config_get_edge_detection(self.config, offset) } as u32,
+        )
+    }
+
+    /// Set the bias of all lines.
+    pub fn set_bias(&mut self, bias: Bias) {
+        unsafe { bindings::gpiod_line_config_set_bias(self.config, bias.gpiod_bias() as i32) }
+    }
+
+    /// Set the bias for a single line at given offset.
+    pub fn set_bias_offset(&mut self, bias: Bias, offset: u32) {
+        unsafe {
+            bindings::gpiod_line_config_set_bias_offset(
+                self.config,
+                bias.gpiod_bias() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Set the bias for a subset of lines.
+    pub fn set_bias_subset(&mut self, bias: Bias, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_bias_subset(
+                self.config,
+                bias.gpiod_bias() as i32,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the bias setting for a given line.
+    ///
+    /// Returns Bias setting that would have been used for given offset if the
+    /// config object was used in a request at the time of the call. If an
+    /// offset is used for which no config was provided, the function will
+    /// return the global default value.
+    pub fn get_bias(&self, offset: u32) -> Result<Bias> {
+        Bias::new(unsafe { bindings::gpiod_line_config_get_bias(self.config, offset) } as u32)
+    }
+
+    /// Set the drive of all lines.
+    pub fn set_drive(&mut self, drive: Drive) {
+        unsafe { bindings::gpiod_line_config_set_drive(self.config, drive.gpiod_drive() as i32) }
+    }
+
+    /// Set the drive for a single line at given offset.
+    pub fn set_drive_offset(&mut self, drive: Drive, offset: u32) {
+        unsafe {
+            bindings::gpiod_line_config_set_drive_offset(
+                self.config,
+                drive.gpiod_drive() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Set the drive for a subset of lines.
+    pub fn set_drive_subset(&mut self, drive: Drive, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_drive_subset(
+                self.config,
+                drive.gpiod_drive() as i32,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the drive setting for a given line.
+    ///
+    /// Returns drive setting that would have been used for given offset if the
+    /// config object was used in a request at the time of the call. If an
+    /// offset is used for which no config was provided, the function will
+    /// return the global default value.
+    pub fn get_drive(&self, offset: u32) -> Result<Drive> {
+        Drive::new(unsafe { bindings::gpiod_line_config_get_drive(self.config, offset) } as u32)
+    }
+
+    /// Set all lines as active-low.
+    pub fn set_active_low(&mut self) {
+        unsafe { bindings::gpiod_line_config_set_active_low(self.config) }
+    }
+
+    /// Set a single line as active-low.
+    pub fn set_active_low_offset(&mut self, offset: u32) {
+        unsafe { bindings::gpiod_line_config_set_active_low_offset(self.config, offset) }
+    }
+
+    /// Set a subset of lines as active-low.
+    pub fn set_active_low_subset(&mut self, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_active_low_subset(
+                self.config,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Check if the line at given offset was configured as active-low.
+    ///
+    /// Returns active-low setting that would have been used for given offset if
+    /// the config object was used in a request at the time of the call. If an
+    /// offset is used for which no config was provided, the function will
+    /// return the global default value.
+    pub fn is_active_low(&self, offset: u32) -> bool {
+        unsafe { bindings::gpiod_line_config_is_active_low(self.config, offset) }
+    }
+
+    /// Set all lines as active-high.
+    pub fn set_active_high(&mut self) {
+        unsafe { bindings::gpiod_line_config_set_active_high(self.config) }
+    }
+
+    /// Set a single line as active-high.
+    pub fn set_active_high_offset(&mut self, offset: u32) {
+        unsafe { bindings::gpiod_line_config_set_active_high_offset(self.config, offset) }
+    }
+
+    /// Set a subset of lines as active-high.
+    pub fn set_active_high_subset(&mut self, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_active_high_subset(
+                self.config,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Set the debounce period for all lines, disables debouncing if 0.
+    pub fn set_debounce_period_us(&mut self, period: Duration) {
+        unsafe {
+            bindings::gpiod_line_config_set_debounce_period_us(
+                self.config,
+                period.as_micros() as u64,
+            )
+        }
+    }
+
+    /// Set the debounce period for a single line at given offset, disables
+    /// debouncing if 0.
+    pub fn set_debounce_period_us_offset(&mut self, period: Duration, offset: u32) {
+        unsafe {
+            bindings::gpiod_line_config_set_debounce_period_us_offset(
+                self.config,
+                period.as_micros() as u64,
+                offset,
+            )
+        }
+    }
+
+    /// Set the debounce period for a subset of lines, disables debouncing if
+    /// `period` is 0.
+    pub fn set_debounce_period_us_subset(&mut self, period: Duration, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_debounce_period_us_subset(
+                self.config,
+                period.as_micros() as u64,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the debounce period for a given line.
+    ///
+    /// Returns debounce period that would have been used for given offset if
+    /// the config object was used in a request at the time of the call. If an
+    /// offset is used for which no config was provided, the function will
+    /// return the global default value.
+    pub fn get_debounce_period_us(&self, offset: u32) -> Result<Duration> {
+        Ok(Duration::from_micros(unsafe {
+            bindings::gpiod_line_config_get_debounce_us_period(self.config, offset)
+        }))
+    }
+
+    /// Set the event clock for all lines.
+    pub fn set_event_clock(&mut self, clock: EventClock) {
+        unsafe {
+            bindings::gpiod_line_config_set_event_clock(self.config, clock.gpiod_clock() as i32)
+        }
+    }
+
+    /// Set the event clock for a single line at given offset.
+    pub fn set_event_clock_offset(&mut self, clock: EventClock, offset: u32) {
+        unsafe {
+            bindings::gpiod_line_config_set_event_clock_offset(
+                self.config,
+                clock.gpiod_clock() as i32,
+                offset,
+            )
+        }
+    }
+
+    /// Set the event clock for a subset of lines.
+    pub fn set_event_clock_subset(&mut self, clock: EventClock, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_event_clock_subset(
+                self.config,
+                clock.gpiod_clock() as i32,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Set the output value for a single offset.
+    pub fn set_output_value(&mut self, offset: u32, value: u32) {
+        unsafe { bindings::gpiod_line_config_set_output_value(self.config, offset, value as i32) }
+    }
+
+    /// Set the output values for a set of offsets.
+    pub fn set_output_values(&mut self, offsets: &[u32], values: &[i32]) {
+        unsafe {
+            bindings::gpiod_line_config_set_output_values(
+                self.config,
+                values.len() as u32,
+                offsets.as_ptr(),
+                values.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the number of lines for which the config object stores values.
+    pub fn num_output_values(&self) -> u32 {
+        unsafe { bindings::gpiod_line_config_num_output_values(self.config) }
+    }
+
+    /// Get the output value configured for a given line, 0 or 1.
+    pub fn get_output_value(&self, offset: u32) -> Result<u32> {
+        let value = unsafe { bindings::gpiod_line_config_get_output_value(self.config, offset) };
+
+        if value != 0 && value != 1 {
+            Err(Error::OperationFailed(
+                "GpiodLineConfig get-output-value",
+                IoError::last(),
+            ))
+        } else {
+            Ok(value as u32)
+        }
+    }
+
+    /// Get the output value mapping (offset, value) at given index.
+    ///
+    /// This function together with `get_num_output()` allows to iterate over
+    /// all output value mappings currently held by this object.
+    pub fn get_output_value_index(&self, index: u32) -> Result<(u32, u32)> {
+        let mut offset: u32 = 0;
+        let mut value: i32 = 0;
+
+        let ret = unsafe {
+            bindings::gpiod_line_config_get_output_value_index(
+                self.config,
+                index,
+                &mut offset,
+                &mut value,
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineConfig get-output-value-index",
+                IoError::last(),
+            ))
+        } else {
+            Ok((offset, !!(value as u32)))
+        }
+    }
+
+    /// Get all output value mappings stored in this config object.
+    ///
+    /// Each offset in the offsets vector corresponds to the value in the values
+    /// array at the same index.
+    pub fn get_output_values(&self) -> Result<(Vec<u32>, Vec<i32>)> {
+        let count = self.num_output_values() as usize;
+        let mut offset: Vec<u32> = vec![0; count];
+        let mut value: Vec<i32> = vec![0; count];
+
+        unsafe {
+            bindings::gpiod_line_config_get_output_values(
+                self.config,
+                offset.as_mut_ptr(),
+                value.as_mut_ptr(),
+            )
+        };
+
+        Ok((offset, value))
+    }
+}
+
+impl Drop for GpiodLineConfig {
+    /// Free the line config object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_line_config_free(self.config) }
+    }
+}
diff --git a/bindings/rust/src/line_info.rs b/bindings/rust/src/line_info.rs
new file mode 100644
index 000000000000..df6dda5c6aa3
--- /dev/null
+++ b/bindings/rust/src/line_info.rs
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::convert::TryFrom;
+use std::sync::Arc;
+use std::time::Duration;
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::chip::GpiodChipInternal;
+use super::{bindings, Bias, Direction, Drive, Edge, Error, EventClock, Result};
+use crate::info_event::GpiodInfoEvent;
+
+/// Line info
+///
+/// Exposes functions for retrieving kernel information about both requested and
+/// free lines. Line info object contains an immutable snapshot of the line's
+/// state at the time when it was created.
+pub struct GpiodLineInfo {
+    info: *mut bindings::gpiod_line_info,
+    ichip: Option<Arc<GpiodChipInternal>>,
+    free: bool,
+}
+
+impl GpiodLineInfo {
+    /// Get the current snapshot of information about the line at given offset
+    /// and optionally start watching it for changes.
+    pub(crate) fn new(ichip: Arc<GpiodChipInternal>, offset: u32, watch: bool) -> Result<Self> {
+        let info = if watch {
+            unsafe { bindings::gpiod_chip_watch_line_info(ichip.chip(), offset) }
+        } else {
+            unsafe { bindings::gpiod_chip_get_line_info(ichip.chip(), offset) }
+        };
+
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodLineInfo line-info",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self {
+            info,
+            ichip: if watch { Some(ichip) } else { None },
+            free: watch,
+        })
+    }
+
+    /// Stop watching the line
+    pub fn unwatch(&mut self) {
+        if let Some(ichip) = &self.ichip {
+            unsafe {
+                bindings::gpiod_chip_unwatch_line_info(ichip.chip(), self.get_offset());
+            }
+            self.ichip = None;
+        }
+    }
+
+    /// Get the offset of the line within the GPIO chip.
+    pub fn get_offset(&self) -> u32 {
+        unsafe { bindings::gpiod_line_info_get_offset(self.info) }
+    }
+
+    /// Get GPIO line's name.
+    pub fn get_name(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct GpiodLineInfo`.
+        let name = unsafe { bindings::gpiod_line_info_get_name(self.info) };
+        if name.is_null() {
+            return Err(Error::NameNotFound("GPIO line's name"));
+        }
+
+        unsafe {
+            str::from_utf8(slice::from_raw_parts(
+                name as *const u8,
+                bindings::strlen(name) as usize,
+            ))
+            .map_err(Error::InvalidString)
+        }
+    }
+
+    /// Returns True if the line is in use, false otherwise.
+    ///
+    /// The user space can't know exactly why a line is busy. It may have been
+    /// requested by another process or hogged by the kernel. It only matters that
+    /// the line is used and we can't request it.
+    pub fn is_used(&self) -> bool {
+        unsafe { bindings::gpiod_line_info_is_used(self.info) }
+    }
+
+    /// Get the GPIO line's consumer name.
+    pub fn get_consumer(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct GpiodLineInfo`.
+        let name = unsafe { bindings::gpiod_line_info_get_consumer(self.info) };
+        if name.is_null() {
+            return Err(Error::NameNotFound("GPIO line's consumer name"));
+        }
+
+        unsafe {
+            str::from_utf8(slice::from_raw_parts(
+                name as *const u8,
+                bindings::strlen(name) as usize,
+            ))
+            .map_err(Error::InvalidString)
+        }
+    }
+
+    /// Get the GPIO line's direction.
+    pub fn get_direction(&self) -> Result<Direction> {
+        Direction::new(unsafe { bindings::gpiod_line_info_get_direction(self.info) } as u32)
+    }
+
+    /// Returns true if this line is "active-low", false otherwise.
+    pub fn is_active_low(&self) -> bool {
+        unsafe { bindings::gpiod_line_info_is_active_low(self.info) }
+    }
+
+    /// Get the GPIO line's bias setting.
+    pub fn get_bias(&self) -> Result<Bias> {
+        Bias::new(unsafe { bindings::gpiod_line_info_get_bias(self.info) } as u32)
+    }
+
+    /// Get the GPIO line's drive setting.
+    pub fn get_drive(&self) -> Result<Drive> {
+        Drive::new(unsafe { bindings::gpiod_line_info_get_drive(self.info) } as u32)
+    }
+
+    /// Get the current edge detection setting of this line.
+    pub fn get_edge_detection(&self) -> Result<Edge> {
+        Edge::new(unsafe { bindings::gpiod_line_info_get_edge_detection(self.info) } as u32)
+    }
+
+    /// Get the current event clock setting used for edge event timestamps.
+    pub fn get_event_clock(&self) -> Result<EventClock> {
+        EventClock::new(unsafe { bindings::gpiod_line_info_get_event_clock(self.info) } as u32)
+    }
+
+    /// Returns true if the line is debounced (either by hardware or by the
+    /// kernel software debouncer), false otherwise.
+    pub fn is_debounced(&self) -> bool {
+        unsafe { bindings::gpiod_line_info_is_debounced(self.info) }
+    }
+
+    /// Get the current debounce period.
+    pub fn get_debounce_period_us(&self) -> Duration {
+        Duration::from_micros(unsafe {
+            bindings::gpiod_line_info_get_debounce_period_us(self.info)
+        })
+    }
+}
+
+impl TryFrom<&GpiodInfoEvent> for GpiodLineInfo {
+    type Error = Error;
+
+    /// Get the Line info object associated with a event.
+    fn try_from(event: &GpiodInfoEvent) -> Result<Self> {
+        let info = unsafe { bindings::gpiod_info_event_get_line_info(event.event()) };
+        if info.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodLineInfo try-from",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self {
+            info,
+            ichip: None,
+            free: false,
+        })
+    }
+}
+
+impl Drop for GpiodLineInfo {
+    fn drop(&mut self) {
+        // We must not free the Line info object created from `struct GpiodInfoEvent` by calling
+        // libgpiod API.
+        if self.free {
+            self.unwatch();
+            unsafe { bindings::gpiod_line_info_free(self.info) }
+        }
+    }
+}
diff --git a/bindings/rust/src/line_request.rs b/bindings/rust/src/line_request.rs
new file mode 100644
index 000000000000..1b00fcd04bac
--- /dev/null
+++ b/bindings/rust/src/line_request.rs
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::sync::Arc;
+use std::time::Duration;
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::{bindings, chip::GpiodChipInternal, Error, Result};
+use crate::event_buffer::GpiodEdgeEventBuffer;
+use crate::line_config::GpiodLineConfig;
+use crate::request_config::GpiodRequestConfig;
+
+/// Line request operations
+///
+/// Allows interaction with a set of requested lines.
+pub struct GpiodLineRequest {
+    request: *mut bindings::gpiod_line_request,
+}
+
+impl GpiodLineRequest {
+    /// Request a set of lines for exclusive usage.
+    pub(crate) fn new(
+        ichip: &Arc<GpiodChipInternal>,
+        rconfig: &GpiodRequestConfig,
+        lconfig: &GpiodLineConfig,
+    ) -> Result<Self> {
+        let request = unsafe {
+            bindings::gpiod_chip_request_lines(ichip.chip(), rconfig.config(), lconfig.config())
+        };
+
+        if request.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodLineRequest request-lines",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self { request })
+    }
+
+    /// Get the number of lines in this request.
+    pub fn get_num_lines(&self) -> u32 {
+        unsafe { bindings::gpiod_line_request_get_num_lines(self.request) }
+    }
+
+    /// Get the offsets of lines in this request.
+    pub fn get_offsets(&self) -> Vec<u32> {
+        let mut offsets = vec![0; self.get_num_lines() as usize];
+
+        unsafe { bindings::gpiod_line_request_get_offsets(self.request, offsets.as_mut_ptr()) };
+        offsets
+    }
+
+    /// Get values of all lines associated with this request.
+    pub fn get_values(&self, values: &mut Vec<i32>) -> Result<()> {
+        let ret =
+            unsafe { bindings::gpiod_line_request_get_values(self.request, values.as_mut_ptr()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest get-values",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get the value (0 or 1) of a single line associated with this request.
+    pub fn get_value(&self, offset: u32) -> Result<u32> {
+        let value = unsafe { bindings::gpiod_line_request_get_value(self.request, offset) };
+
+        if value != 0 && value != 1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest get-value",
+                IoError::last(),
+            ))
+        } else {
+            Ok(value as u32)
+        }
+    }
+
+    /// Get values of a subset of lines associated with this request.
+    pub fn get_values_subset(&self, offsets: &[u32], values: &mut Vec<i32>) -> Result<()> {
+        let ret = unsafe {
+            bindings::gpiod_line_request_get_values_subset(
+                self.request,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+                values.as_mut_ptr(),
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest get-values-subset",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get values of all lines associated with this request.
+    pub fn set_values(&self, values: &[i32]) -> Result<()> {
+        let ret = unsafe { bindings::gpiod_line_request_set_values(self.request, values.as_ptr()) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest set-values",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Set the value of a single line associated with this request.
+    pub fn set_value(&self, offset: u32, value: i32) -> Result<()> {
+        let ret = unsafe { bindings::gpiod_line_request_set_value(self.request, offset, !!value) };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest set-value",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get values of a subset of lines associated with this request.
+    pub fn set_values_subset(&self, offsets: &[u32], values: &[i32]) -> Result<()> {
+        let ret = unsafe {
+            bindings::gpiod_line_request_set_values_subset(
+                self.request,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+                values.as_ptr(),
+            )
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest set-values-subset",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Update the configuration of lines associated with this line request.
+    pub fn reconfigure_lines(&self, lconfig: &GpiodLineConfig) -> Result<()> {
+        let ret = unsafe {
+            bindings::gpiod_line_request_reconfigure_lines(self.request, lconfig.config())
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest reconfigure-lines",
+                IoError::last(),
+            ))
+        } else {
+            Ok(())
+        }
+    }
+
+    /// Get the file descriptor associated with this line request.
+    pub fn get_fd(&self) -> u32 {
+        unsafe { bindings::gpiod_line_request_get_fd(self.request) as u32 }
+    }
+
+    /// Wait for edge events on any of the lines associated with this request.
+    pub fn edge_event_wait(&self, timeout: Duration) -> Result<()> {
+        let ret = unsafe {
+            bindings::gpiod_line_request_edge_event_wait(self.request, timeout.as_nanos() as u64)
+        };
+
+        match ret {
+            -1 => Err(Error::OperationFailed(
+                "GpiodLineRequest edge-event-wait",
+                IoError::last(),
+            )),
+            0 => Err(Error::OperationTimedOut),
+            _ => Ok(()),
+        }
+    }
+
+    /// Get a number of edge events from a line request.
+    ///
+    /// This function will block if no event was queued for this line.
+    pub fn edge_event_read(&self, buffer: &GpiodEdgeEventBuffer, max_events: u32) -> Result<u32> {
+        let ret = unsafe {
+            bindings::gpiod_line_request_edge_event_read(self.request, buffer.buffer(), max_events)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                "GpiodLineRequest edge-event-read",
+                IoError::last(),
+            ))
+        } else {
+            Ok(ret as u32)
+        }
+    }
+}
+
+impl Drop for GpiodLineRequest {
+    /// Release the requested lines and free all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_line_request_release(self.request) }
+    }
+}
diff --git a/bindings/rust/src/request_config.rs b/bindings/rust/src/request_config.rs
new file mode 100644
index 000000000000..eef7c08ff798
--- /dev/null
+++ b/bindings/rust/src/request_config.rs
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+
+use std::os::raw::c_char;
+use std::{slice, str};
+
+use vmm_sys_util::errno::Error as IoError;
+
+use super::{bindings, Error, Result};
+
+/// Request configuration objects
+///
+/// Request config object is used to pass a set of options to the kernel at the
+/// time of the line request. Similarly to the line-config - the mutators don't
+/// return error values. If the values are invalid, in general they are silently
+/// adjusted to acceptable ranges.
+pub struct GpiodRequestConfig {
+    config: *mut bindings::gpiod_request_config,
+}
+
+impl GpiodRequestConfig {
+    /// Create a new request config object.
+    pub fn new() -> Result<Self> {
+        let config = unsafe { bindings::gpiod_request_config_new() };
+        if config.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodRequestConfig new",
+                IoError::last(),
+            ));
+        }
+
+        Ok(Self { config })
+    }
+
+    /// Private helper, Returns gpiod_request_config
+    pub(crate) fn config(&self) -> *mut bindings::gpiod_request_config {
+        self.config
+    }
+
+    /// Set the consumer string.
+    ///
+    /// If the consumer string is too long, it will be truncated to the max
+    /// accepted length.
+    pub fn set_consumer(&self, consumer: &str) {
+        unsafe {
+            bindings::gpiod_request_config_set_consumer(
+                self.config,
+                consumer.as_ptr() as *const c_char,
+            )
+        }
+    }
+
+    /// Get the consumer string.
+    pub fn get_consumer(&self) -> Result<&str> {
+        // SAFETY: The string returned by libgpiod is guaranteed to live as long
+        // as the `struct GpiodRequestConfig`.
+        let consumer = unsafe { bindings::gpiod_request_config_get_consumer(self.config) };
+        if consumer.is_null() {
+            return Err(Error::OperationFailed(
+                "GpiodRequestConfig get-consumer",
+                IoError::last(),
+            ));
+        }
+
+        unsafe {
+            str::from_utf8(slice::from_raw_parts(
+                consumer as *const u8,
+                bindings::strlen(consumer) as usize,
+            ))
+            .map_err(Error::InvalidString)
+        }
+    }
+
+    /// Set line offsets for this request.
+    ///
+    /// If too many offsets were specified, the offsets above the limit accepted
+    /// by the kernel (64 lines) are silently dropped.
+    pub fn set_offsets(&self, offsets: &[u32]) {
+        unsafe {
+            bindings::gpiod_request_config_set_offsets(
+                self.config,
+                offsets.len() as u32,
+                offsets.as_ptr(),
+            )
+        }
+    }
+
+    /// Get the offsets of lines in this request config.
+    pub fn get_num_offsets(&self) -> Vec<u32> {
+        let num = unsafe { bindings::gpiod_request_config_get_num_offsets(self.config) };
+        let mut offsets = vec![0, num];
+
+        unsafe { bindings::gpiod_request_config_get_offsets(self.config, offsets.as_mut_ptr()) };
+        offsets
+    }
+
+    /// Set the size of the kernel event buffer.
+    ///
+    /// The kernel may adjust the value if it's too high. If set to 0, the
+    /// default value will be used.
+    pub fn set_event_buffer_size(&self, size: u32) {
+        unsafe { bindings::gpiod_request_config_set_event_buffer_size(self.config, size) }
+    }
+
+    /// Get the edge event buffer size from this request config.
+    pub fn get_event_buffer_size(&self) -> u32 {
+        unsafe { bindings::gpiod_request_config_get_event_buffer_size(self.config) }
+    }
+}
+
+impl Drop for GpiodRequestConfig {
+    /// Free the request config object and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { bindings::gpiod_request_config_free(self.config) }
+    }
+}
-- 
2.31.1.272.g89b43f80a514

