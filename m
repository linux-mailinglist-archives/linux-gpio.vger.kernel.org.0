Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599CA6134E2
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 12:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiJaLsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 07:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiJaLr6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 07:47:58 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D5E203
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:56 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id f140so10478254pfa.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MVCfi3lWu1Om23SOS6ps2Bv8bFkn/B3WyCcptsWJJo=;
        b=Ycc8bsp2gpLT5OlNa2PHaQuWvUcRAiwAsdQeoGbc+FJUlmNaqKvTDciQMAUFhU2x5F
         4CZz3zs4QLKjmRiAx4nXkmyeYOtBQY6nZbpfVSlQY+FyBNJSetEzSx8/yiuyKJxcO/gO
         MHABKmmPe90U/JvKNYR8xH9iKfXozNw+iYH1GLfJjTcFfx2mBCO0OjifiTtsqSFoIMPp
         GveqInWD6+26y8srz/tE8XToG2qSwfiTX1BKwc3UMZKGhTk36n/CP5BaH9diF8ZZwD+x
         Mv6WZ7XR0alBi4vJ08pNyLUopL6SuLFDGk4Vtp0in45PZM4fujbBXClI8WPHPVK27vU8
         CTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MVCfi3lWu1Om23SOS6ps2Bv8bFkn/B3WyCcptsWJJo=;
        b=XLpo41CPomHMRgw3LxrtOArXG0LhMEtZ8iOKYiLNKmkk2Cqni8/lTgbE024Pi3Hh27
         fitNJUyxRu/8GihAsms4+nqnAI5bVMRZOKBUts2mmf+6ZHewnr54QM3uzWuTAUfVF0TP
         05jNDNvskQS/bOZ+EjsElzXgo1QuyDEnDT+ZMVKWJo9gdDw64AkjwU+Ez5W62zvN7Ij0
         +vWNlvXwc+yHZhXW8eZwQSD5yXCp23CoMnlLtDh1Jnq/23ITLLy34o6fiMetlurftsR6
         GOKfCtrsIp6r4xQdM3ke0nrprLiu8kbXIFnrjw4vBNIuyc63BE4zh5pdkB51y7csi8Uu
         tx5Q==
X-Gm-Message-State: ACrzQf0p2kno3i3580PN9G8uQEZKlk2wDzwwb1IpC+5yHsY2o1l/g3Iu
        F1nAGXpiSDSZXbeov7O6y7KvTw==
X-Google-Smtp-Source: AMsMyM5qW0hV2b2c+p+/chSAPOKYCdwCaBuw7vilDP0RjKTAkfa9WQ/fE22/tLE75fmi82AYoA9clQ==
X-Received: by 2002:a62:cd4b:0:b0:56d:5b06:c88b with SMTP id o72-20020a62cd4b000000b0056d5b06c88bmr6578800pfg.78.1667216876126;
        Mon, 31 Oct 2022 04:47:56 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id b14-20020aa7950e000000b00560a25fae1fsm4387414pfp.206.2022.10.31.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:55 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod v2][PATCH V8 9/9] bindings: rust: Implement iterator for edge events
Date:   Mon, 31 Oct 2022 17:17:17 +0530
Message-Id: <4082a496a1da3e3c11b08a360f5ba7f7d70f9719.1667215380.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667215380.git.viresh.kumar@linaro.org>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
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

It would be much more convenient for the user to iterate over the events
in the Rust idiomatic way (i.e. "for event in events"), instead of
indexing into the vector.

This also lets us drop the hard requirement of explicitly dropping the
event before reading new events from the buffer again.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../rust/libgpiod/examples/gpio_events.rs     |  47 +++----
 bindings/rust/libgpiod/examples/gpiomon.rs    |   5 +-
 bindings/rust/libgpiod/src/edge_event.rs      |  56 +++------
 bindings/rust/libgpiod/src/event_buffer.rs    | 119 ++++++++++++++----
 bindings/rust/libgpiod/src/lib.rs             |   2 +
 bindings/rust/libgpiod/src/line_request.rs    |   5 +-
 bindings/rust/libgpiod/tests/edge_event.rs    |  47 ++++---
 7 files changed, 172 insertions(+), 109 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
index 77a7d2a5faa1..57dd5b4db546 100644
--- a/bindings/rust/libgpiod/examples/gpio_events.rs
+++ b/bindings/rust/libgpiod/examples/gpio_events.rs
@@ -59,30 +59,31 @@ fn main() -> Result<()> {
             Ok(true) => (),
         }
 
-        let count = request.read_edge_events(&mut buffer)?;
-        if count == 1 {
-            let event = buffer.event(0)?;
-            let cloned_event = request::Event::event_clone(&event)?;
-
-            // This is required before reading events again into the buffer.
-            drop(event);
+        let events = request.read_edge_events(&mut buffer)?;
+        for event in events {
+            let cloned_event = request::Event::event_clone(event)?;
+            println!(
+                "line: {} type: {:?}, time: {:?}",
+                cloned_event.line_offset(),
+                cloned_event.event_type(),
+                cloned_event.timestamp()
+            );
+            println!(
+                "line: {} type: {:?}, time: {:?}",
+                event.line_offset(),
+                event.event_type(),
+                event.timestamp()
+            );
+        }
 
-            let count = request.read_edge_events(&mut buffer)?;
-            if count == 1 {
-                let event = buffer.event(0)?;
-                println!(
-                    "line: {} type: {:?}, time: {:?}",
-                    cloned_event.line_offset(),
-                    cloned_event.event_type(),
-                    cloned_event.timestamp()
-                );
-                println!(
-                    "line: {} type: {:?}, time: {:?}",
-                    event.line_offset(),
-                    event.event_type(),
-                    event.timestamp()
-                );
-            }
+        let events = request.read_edge_events(&mut buffer)?;
+        for event in events {
+            println!(
+                "line: {} type: {:?}, time: {:?}",
+                event.line_offset(),
+                event.event_type(),
+                event.timestamp()
+            );
         }
     }
 }
diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
index a03ea31dfd53..4dea5d1c8dd7 100644
--- a/bindings/rust/libgpiod/examples/gpiomon.rs
+++ b/bindings/rust/libgpiod/examples/gpiomon.rs
@@ -58,9 +58,8 @@ fn main() -> Result<()> {
             Ok(true) => (),
         }
 
-        let count = request.read_edge_events(&mut buffer)?;
-        if count == 1 {
-            let event = buffer.event(0)?;
+        let events = request.read_edge_events(&mut buffer)?;
+        for event in events {
             println!(
                 "line: {} type: {}, time: {:?}",
                 event.line_offset(),
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index 95b05e947d26..dc71efcb2396 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -8,7 +8,6 @@ use std::time::Duration;
 use super::{
     gpiod,
     line::{EdgeKind, Offset},
-    request::Buffer,
     Error, OperationType, Result,
 };
 
@@ -24,29 +23,33 @@ use super::{
 /// number of events are being read.
 
 #[derive(Debug, Eq, PartialEq)]
-pub struct Event<'b> {
-    buffer: Option<&'b Buffer>,
-    event: *mut gpiod::gpiod_edge_event,
+pub struct Event {
+    pub(crate) event: *mut gpiod::gpiod_edge_event,
+    pub(crate) cloned: bool,
 }
 
-impl<'b> Event<'b> {
+impl Event {
     /// Get an event stored in the buffer.
-    pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Event<'b>> {
-        // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
-        // as the `struct Event`.
-        let event = unsafe {
-            gpiod::gpiod_edge_event_buffer_get_event(buffer.buffer, index.try_into().unwrap())
-        };
+    pub(crate) fn new(event: *mut gpiod::gpiod_edge_event) -> Event {
+        Self {
+            event,
+            cloned: false,
+        }
+    }
+
+    pub fn event_clone(event: &Event) -> Result<Event> {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
         if event.is_null() {
             return Err(Error::OperationFailed(
-                OperationType::EdgeEventBufferGetEvent,
+                OperationType::EdgeEventCopy,
                 errno::errno(),
             ));
         }
 
         Ok(Self {
-            buffer: Some(buffer),
             event,
+            cloned: true,
         })
     }
 
@@ -95,32 +98,11 @@ impl<'b> Event<'b> {
     }
 }
 
-impl<'e, 'b> Event<'e> {
-    pub fn event_clone(event: &Event<'b>) -> Result<Event<'e>>
-    where
-        'e: 'b,
-    {
-        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
-        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
-        if event.is_null() {
-            return Err(Error::OperationFailed(
-                OperationType::EdgeEventCopy,
-                errno::errno(),
-            ));
-        }
-
-        Ok(Self {
-            buffer: None,
-            event,
-        })
-    }
-}
-
-impl<'b> Drop for Event<'b> {
+impl Drop for Event {
     /// Free the edge event.
     fn drop(&mut self) {
-        // Free the event only if a copy is made
-        if self.buffer.is_none() {
+        // Only free the cloned event, others are freed with the buffer.
+        if self.cloned {
             // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
             unsafe { gpiod::gpiod_edge_event_free(self.event) };
         }
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 16d7022034df..d1bfac54070c 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -4,14 +4,74 @@
 //     Viresh Kumar <viresh.kumar@linaro.org>
 
 use std::os::raw::c_ulong;
+use std::ptr;
 
-use super::{gpiod, request, Error, OperationType, Result};
+use super::{
+    gpiod,
+    request::{Event, Request},
+    Error, OperationType, Result,
+};
+
+pub struct Events<'a> {
+    buffer: &'a mut Buffer,
+    events: Vec<&'a Event>,
+    index: usize,
+}
+
+impl<'a> Events<'a> {
+    pub fn new(buffer: &'a mut Buffer, len: usize) -> Self {
+        let mut events = Vec::new();
+
+        for i in 0..len {
+            // SAFETY: We could have simply pushed the reference of the event to the events vector
+            // here, but that causes a build error as buffer is borrowed as both mutable and
+            // immutable. Instead of a reference, perform unsafe pointer magic to do the same
+            // thing. It is safe as the events buffer will always outlive Events and the reference
+            // will always be valid.
+            events.push(unsafe {
+                (buffer.events.as_ptr().add(i) as *const Event)
+                    .as_ref()
+                    .unwrap()
+            });
+        }
+
+        Self {
+            buffer,
+            events,
+            index: 0,
+        }
+    }
+
+    /// Get the number of events the buffer contains.
+    pub fn len(&self) -> usize {
+        self.events.len()
+    }
+
+    /// Check if buffer is empty.
+    pub fn is_empty(&self) -> bool {
+        self.events.is_empty()
+    }
+}
+
+impl<'a> Iterator for Events<'a> {
+    type Item = &'a Event;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.events.is_empty() || self.buffer.update_event(self.index).is_err() {
+            return None;
+        }
+
+        self.index += 1;
+        Some(self.events.remove(0))
+    }
+}
 
 /// Line edge events buffer
 #[derive(Debug, Eq, PartialEq)]
 pub struct Buffer {
     pub(crate) buffer: *mut gpiod::gpiod_edge_event_buffer,
-    event_count: usize,
+    events: Vec<Event>,
+    capacity: usize,
 }
 
 impl Buffer {
@@ -30,22 +90,32 @@ impl Buffer {
             ));
         }
 
+        // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
+        let capacity = unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(buffer) as usize };
+        let mut events = Vec::new();
+        events.resize_with(capacity, || Event::new(ptr::null_mut()));
+
         Ok(Self {
             buffer,
-            event_count: 0,
+            events,
+            capacity,
         })
     }
 
-    /// Get a number of edge events from a line request.
+    /// Get edge events from a line request.
     ///
     /// This function will block if no event was queued for the line.
-    pub fn read_edge_events(&mut self, request: &request::Request) -> Result<u32> {
+    pub fn read_edge_events(&mut self, request: &Request) -> Result<Events> {
+        for i in 0..self.events.len() {
+            self.events[i].event = ptr::null_mut();
+        }
+
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
         let ret = unsafe {
             gpiod::gpiod_line_request_read_edge_event(
                 request.request,
                 self.buffer,
-                self.capacity().try_into().unwrap(),
+                self.capacity.try_into().unwrap(),
             )
         };
 
@@ -55,30 +125,37 @@ impl Buffer {
                 errno::errno(),
             ))
         } else {
-            // Set count of events read in the buffer
-            self.set_event_count(ret as usize);
-            Ok(ret as u32)
-        }
-    }
+            let ret = ret as usize;
 
-    /// Set the number of events read into the event buffer.
-    pub(crate) fn set_event_count(&mut self, count: usize) {
-        self.event_count = count
+            if ret > self.capacity {
+                Err(Error::TooManyEvents(ret, self.capacity))
+            } else {
+                Ok(Events::new(self, ret))
+            }
+        }
     }
 
     /// Get the capacity of the event buffer.
     pub fn capacity(&self) -> usize {
-        // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer) as usize }
+        self.capacity
     }
 
     /// Read an event stored in the buffer.
-    pub fn event(&self, index: usize) -> Result<request::Event> {
-        if index >= self.event_count {
-            Err(Error::InvalidArguments)
-        } else {
-            request::Event::new(self, index)
+    fn update_event(&mut self, index: usize) -> Result<()> {
+        // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
+        // as the `struct Event`.
+        let event = unsafe {
+            gpiod::gpiod_edge_event_buffer_get_event(self.buffer, index.try_into().unwrap())
+        };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::EdgeEventBufferGetEvent,
+                errno::errno(),
+            ));
         }
+
+        self.events[index].event = event;
+        Ok(())
     }
 
     /// Get the number of events the buffer contains.
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 5452d47d51bc..3bcd3b97647c 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -103,6 +103,8 @@ pub enum Error {
     OperationFailed(OperationType, errno::Errno),
     #[error("Invalid Arguments")]
     InvalidArguments,
+    #[error("Event count more than buffer capacity: {0} > {1}")]
+    TooManyEvents(usize, usize),
     #[error("Std Io Error")]
     IoError,
 }
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 10d2197b876a..7101d098b6f5 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -202,7 +202,10 @@ impl Request {
     /// Get a number of edge events from a line request.
     ///
     /// This function will block if no event was queued for the line.
-    pub fn read_edge_events(&self, buffer: &mut request::Buffer) -> Result<u32> {
+    pub fn read_edge_events<'a>(
+        &'a self,
+        buffer: &'a mut request::Buffer,
+    ) -> Result<request::Events> {
         buffer.read_edge_events(self)
     }
 }
diff --git a/bindings/rust/libgpiod/tests/edge_event.rs b/bindings/rust/libgpiod/tests/edge_event.rs
index dd95f6d82caa..ac32f7b2ba2c 100644
--- a/bindings/rust/libgpiod/tests/edge_event.rs
+++ b/bindings/rust/libgpiod/tests/edge_event.rs
@@ -93,10 +93,10 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
-            assert_eq!(buf.len(), 1);
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
 
-            let event = buf.event(0).unwrap();
+            let event = events.next().unwrap();
             let ts_rising = event.timestamp();
             assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
             assert_eq!(event.line_offset(), GPIO);
@@ -108,10 +108,10 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
-            assert_eq!(buf.len(), 1);
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
 
-            let event = buf.event(0).unwrap();
+            let event = events.next().unwrap();
             let ts_falling = event.timestamp();
             assert_eq!(event.event_type().unwrap(), EdgeKind::Falling);
             assert_eq!(event.line_offset(), GPIO);
@@ -143,10 +143,10 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
-            assert_eq!(buf.len(), 1);
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
 
-            let event = buf.event(0).unwrap();
+            let event = events.next().unwrap();
             assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
             assert_eq!(event.line_offset(), GPIO);
 
@@ -175,10 +175,10 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
-            assert_eq!(buf.len(), 1);
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
 
-            let event = buf.event(0).unwrap();
+            let event = events.next().unwrap();
             assert_eq!(event.event_type().unwrap(), EdgeKind::Falling);
             assert_eq!(event.line_offset(), GPIO);
 
@@ -207,10 +207,10 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
-            assert_eq!(buf.len(), 1);
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
 
-            let event = buf.event(0).unwrap();
+            let event = events.next().unwrap();
             assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
             assert_eq!(event.line_offset(), GPIO[0]);
             assert_eq!(event.global_seqno(), 1);
@@ -223,10 +223,10 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 1);
-            assert_eq!(buf.len(), 1);
+            let mut events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 1);
 
-            let event = buf.event(0).unwrap();
+            let event = events.next().unwrap();
             assert_eq!(event.event_type().unwrap(), EdgeKind::Rising);
             assert_eq!(event.line_offset(), GPIO[1]);
             assert_eq!(event.global_seqno(), 2);
@@ -257,15 +257,14 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 3);
-            assert_eq!(buf.len(), 3);
+            let events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 3);
 
             let mut global_seqno = 1;
             let mut line_seqno = 1;
 
             // Verify sequence number of events
-            for i in 0..3 {
-                let event = buf.event(i).unwrap();
+            for event in events {
                 assert_eq!(event.line_offset(), GPIO);
                 assert_eq!(event.global_seqno(), global_seqno);
                 assert_eq!(event.line_seqno(), line_seqno);
@@ -293,8 +292,8 @@ mod edge_event {
                 .wait_edge_event(Some(Duration::from_secs(1)))
                 .unwrap());
 
-            assert_eq!(config.request().read_edge_events(&mut buf).unwrap(), 2);
-            assert_eq!(buf.len(), 2);
+            let events = config.request().read_edge_events(&mut buf).unwrap();
+            assert_eq!(events.len(), 2);
         }
     }
 }
-- 
2.31.1.272.g89b43f80a514

