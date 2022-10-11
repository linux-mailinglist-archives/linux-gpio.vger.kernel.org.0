Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77065FAB97
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 06:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiJKEQ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 00:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiJKEQ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 00:16:57 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08D231DC5
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:16:55 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id f23so12108003plr.6
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 21:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g6kiMC99I01rEu9wjNrq3xjnWd2NMws2Sc9s8b4yqX8=;
        b=Bqu8pvrgtFGSy9oEcKgvNaW1JNeT6SqxwKWVujFya1NAn4NH4wxPGvq2cD7yP3id/Y
         KbxojSkHMmM/9SyJqsvGDpAt0VTB+5wh3wqqB7TpNfYbx60gr2pxq1IGrX2K0rPG3ema
         cTbgXW6HXG6BX26BsssED4TlFLdlFhoOyXqvaMxZsW3Msi8RfUTyW9yYzf2Tc0F3kKLE
         d/NFc68T5YgU7UsnJQoxh7XV+w4zP1jrOSEANEVaETEOPsioFtPOd2QTIL4NSkXQbg72
         xrC1SuAb6WMQ0/xyaDUyJZc0r0TYmwstbkCfJIVoaRaFdraAUmJfNedqUqSSmF3U1ut+
         AeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6kiMC99I01rEu9wjNrq3xjnWd2NMws2Sc9s8b4yqX8=;
        b=aBgJZEJup78oVzkwCm4V3BiaD3v6CJlqoZse2YDw5Nx6F+qALHU64BezicqE8IcFrw
         baQTAQIYpDEchTPVapbTnNNOSQvqz1wj/E8TxI0OhgAPW/JEdYThq5pDu/KyDl54lkht
         rKq3upv9+Y+uAvGJoF40Pn4tq03Y9z1P26O/LTwLGctuC8E6KJmH6WMxRrOhQq6NUGpq
         g+8SjxQZ9qGvpD0nBg2T0zKFCLm2J899dXzoGE0lweRxjTt2fpIWKABluhYVII1n5865
         wVHGpqdNnG8rDgxDdZfxOIsRHH7TXZnnF7RIIr+m2DJHl45RnQhzp2z5IoPfVs6oqgi/
         3rkA==
X-Gm-Message-State: ACrzQf0/KLi1oe6x/+N6NBVfCjRwHx8CI/2eadmF6XS96616xyxdESpo
        AuIZuwUD6eXg8vyYKGTPj8GTQQ==
X-Google-Smtp-Source: AMsMyM5emnr6GSUKLTV98Tqb5BDZUREpXKFEbM3yuLVg9k2rSll2IjGeNgtc1/3tl4gyFSiSIed07Q==
X-Received: by 2002:a17:90a:e7d0:b0:20c:169f:7503 with SMTP id kb16-20020a17090ae7d000b0020c169f7503mr19878706pjb.175.1665461814875;
        Mon, 10 Oct 2022 21:16:54 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090a6e4a00b0020af2bab83fsm6865132pjm.23.2022.10.10.21.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 21:16:54 -0700 (PDT)
Date:   Tue, 11 Oct 2022 09:46:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221011041651.amibtu24kcgm67e7@vireshk-i7>
References: <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29-09-22, 15:55, Miguel Ojeda wrote:
> It looks like a container whose elements get invalidated, so
> `read_edge_event` could require an exclusive reference to `buffer` in
> Rust, that way you cannot keep borrows to its elements like `ev` if
> you want to call it. But of course this requires tying the lifetime of
> the events to that of the buffer.

What about the below code changes on top of V6 ?

Changes:
- Removed BufferInternal.
- Event contains a reference to the Buffer now, with lifetime.
- read_edge_event() expects a mutable reference to buffer, to make it
  exclusive, i.e. disallow any previous Event references to exist at
  compilation itself.

diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index ce583916a2e3..f5426459d779 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -3,12 +3,11 @@
 // Copyright 2022 Linaro Ltd. All Rights Reserved.
 //     Viresh Kumar <viresh.kumar@linaro.org>
 
-use std::sync::Arc;
 use std::time::Duration;
 
 use vmm_sys_util::errno::Error as Errno;
 
-use super::{edge::event::BufferInternal, gpiod, EdgeKind, Error, Offset, OperationType, Result};
+use super::{edge::event::Buffer, gpiod, EdgeKind, Error, Offset, OperationType, Result};
 
 /// Line edge events handling
 ///
@@ -22,15 +21,15 @@ use super::{edge::event::BufferInternal, gpiod, EdgeKind, Error, Offset, Operati
 /// number of events are being read.
 
 #[derive(Debug, Eq, PartialEq)]
-pub struct Event {
-    ibuffer: Option<Arc<BufferInternal>>,
+pub struct Event<'b> {
+    buffer: Option<&'b Buffer>,
     event: *mut gpiod::gpiod_edge_event,
 }
 
-impl Event {
+impl<'b> Event<'b> {
     /// Get an event stored in the buffer.
-    pub(crate) fn new(ibuffer: &Arc<BufferInternal>, index: u64) -> Result<Self> {
-        let event = unsafe { gpiod::gpiod_edge_event_buffer_get_event(ibuffer.buffer(), index) };
+    pub(crate) fn new(buffer: &'b Buffer, index: u64) -> Result<Self> {
+        let event = unsafe { gpiod::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
         if event.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::EdgeEventBufferGetEvent,
@@ -39,7 +38,7 @@ impl Event {
         }
 
         Ok(Self {
-            ibuffer: Some(ibuffer.clone()),
+            buffer: Some(buffer),
             event,
         })
     }
@@ -54,7 +53,7 @@ impl Event {
         }
 
         Ok(Self {
-            ibuffer: None,
+            buffer: None,
             event,
         })
     }
@@ -91,11 +90,11 @@ impl Event {
     }
 }
 
-impl Drop for Event {
+impl<'b> Drop for Event<'b> {
     /// Free the edge event.
     fn drop(&mut self) {
         // Free the event only if a copy is made
-        if self.ibuffer.is_none() {
+        if self.buffer.is_none() {
             unsafe { gpiod::gpiod_edge_event_free(self.event) };
         }
     }
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index e272e7aa9e9d..11c8b5e1d7c9 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -4,7 +4,6 @@
 //     Viresh Kumar <viresh.kumar@linaro.org>
 
 use std::os::raw::c_ulong;
-use std::sync::Arc;
 
 use vmm_sys_util::errno::Error as Errno;
 
@@ -12,11 +11,11 @@ use super::{edge, gpiod, Error, OperationType, Result};
 
 /// Line edge events buffer
 #[derive(Clone, Debug, Eq, PartialEq)]
-pub(crate) struct BufferInternal {
+pub struct Buffer {
     buffer: *mut gpiod::gpiod_edge_event_buffer,
 }
 
-impl BufferInternal {
+impl Buffer {
     /// Create a new edge event buffer.
     ///
     /// If capacity equals 0, it will be set to a default value of 64. If
@@ -37,36 +36,6 @@ impl BufferInternal {
     pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
         self.buffer
     }
-}
-
-impl Drop for BufferInternal {
-    /// Free the edge event buffer and release all associated resources.
-    fn drop(&mut self) {
-        unsafe { gpiod::gpiod_edge_event_buffer_free(self.buffer) };
-    }
-}
-
-/// Line edge events buffer
-#[derive(Clone, Debug, Eq, PartialEq)]
-pub struct Buffer {
-    ibuffer: Arc<BufferInternal>,
-}
-
-impl Buffer {
-    /// Create a new edge event buffer.
-    ///
-    /// If capacity equals 0, it will be set to a default value of 64. If
-    /// capacity is larger than 1024, it will be limited to 1024.
-    pub fn new(capacity: usize) -> Result<Self> {
-        Ok(Self {
-            ibuffer: Arc::new(BufferInternal::new(capacity)?),
-        })
-    }
-
-    /// Private helper, Returns gpiod_edge_event_buffer
-    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
-        self.ibuffer.buffer()
-    }
 
     /// Get the capacity of the event buffer.
     pub fn capacity(&self) -> usize {
@@ -75,7 +44,7 @@ impl Buffer {
 
     /// Read an event stored in the buffer.
     pub fn event(&self, index: u64) -> Result<edge::Event> {
-        edge::Event::new(&self.ibuffer, index)
+        edge::Event::new(self, index)
     }
 
     /// Get the number of events the buffer contains.
@@ -88,3 +57,10 @@ impl Buffer {
         self.len() == 0
     }
 }
+
+impl Drop for Buffer {
+    /// Free the edge event buffer and release all associated resources.
+    fn drop(&mut self) {
+        unsafe { gpiod::gpiod_edge_event_buffer_free(self.buffer) };
+    }
+}
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 617efaa34d58..e4ff951aef29 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -218,7 +218,7 @@ impl Request {
     /// Get a number of edge events from a line request.
     ///
     /// This function will block if no event was queued for the line.
-    pub fn read_edge_events(&self, buffer: &edge::event::Buffer) -> Result<u32> {
+    pub fn read_edge_events(&self, buffer: &mut edge::event::Buffer) -> Result<u32> {
         let ret = unsafe {
             gpiod::gpiod_line_request_read_edge_event(
                 self.request,


And here is an example where we get compilation error on the commented
line:

fn main() -> Result<()> {
    let mut lsettings = line::Settings::new()?;
    let lconfig = line::Config::new()?;
    let offsets = vec![1, 2];

    lsettings.set_prop(&[SettingVal::EdgeDetection(Some(Edge::Both))])?;
    lconfig.add_line_settings(&offsets, lsettings)?;

    let path = "/dev/gpiochip0".to_string();
    let chip = Chip::open(&path)?;

    let rconfig = request::Config::new()?;

    let mut buffer = edge::event::Buffer::new(2)?;
    let request = chip.request_lines(&rconfig, &lconfig)?;

    loop {
        match request.wait_edge_event(None) {
            Err(x) => {
                println!("{:?}", x);
                return Err(Error::InvalidArguments);
            }

            Ok(false) => {
                // This shouldn't happen as the call is blocking.
                panic!();
            }
            Ok(true) => (),
        }

        request.read_edge_events(&mut buffer)?;
        let event0 = buffer.event(0)?;
        let event1 = buffer.event(1)?;

        println!("{:?}", (event0.line_offset(), event1.line_offset()));
        drop(event0);

        // This fails to compile
        // request.read_edge_events(&mut buffer)?;

        drop(event1);
        // This compiles fine
        request.read_edge_events(&mut buffer)?;
    }
}

-- 
viresh
