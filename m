Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CAA7B0A25
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 18:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjI0Q3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 12:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjI0Q3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 12:29:47 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D8791
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:43 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-503f39d3236so18748364e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695832181; x=1696436981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ilpm4D79ZZHb1iiGH0uF3SWZE4QbY2zEZ7GL3rg5gyo=;
        b=pGYs8u6anzF3VWlNwQJH/XoGgcun/VWxcipzltzGMSoSDXhgPLdskzVZ6ZxP2aB8iY
         j2SFJ0EGe7Y9bmL3R5Dkq+lL60hbPrkTDai1T1xcB/nTSGgEgbX7iy977IoM7RdusZFt
         7ZDKH1A0AHSfrv1YFGEDOJXER4zUCCQ3YhxQToy6inJBnMHcVPKbeOPI1Gi5E/z05bnF
         1hwlW3kc4qcj/C8UVg8FB//Dzni1IVjAW1XuIOH48eWW/fWf0DYdSuo6EFPQ2Y1XEn/1
         kKwfMDneB7MfSB1Th8KCHoas5FXmx0faQcIItJL5d+uP9In4jQZBXNiDoCdE4aV+dGnH
         DaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695832181; x=1696436981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ilpm4D79ZZHb1iiGH0uF3SWZE4QbY2zEZ7GL3rg5gyo=;
        b=bHQipG9d06DTFH5kt2xFaffiVo9iK4FoNkFufbXa/PiUXO6r6+47Ovm7rEqe1aHUm/
         6pQctPEFL+E+OQ/QVnzZCsiUCcExYOnrE5eynL2JpAyJNumhSVipJ0/JYzYp0sQ2wmRw
         oFdYUByhPMpJntZgR76J6SjklNWpOj4Dra04JJrsBCgbkUIfJ3Fuu/7KWYbX1AzHhEPG
         EjXZnm/y3qwDERj/xdQ6sqb6nrKO5P8KXZqFnmeg8TfrTKe/anwBXnNNnDCcHxuvpP0F
         TkyIzekYKl2unG3INfJ+qcGwlpQRivfl+pfLSEUpSpgWru0KQxijs4qpRBQ7E2DlxUON
         Kbfg==
X-Gm-Message-State: AOJu0YyQ6KptXDeD378K95tBbyQOtlj7OEL/NbDEDEktW519KL9q2IP0
        Ixp2b+T+8WuGSTfBtMY3Y5LYVoXAGXWOi2Ab7WA=
X-Google-Smtp-Source: AGHT+IGE+zDv9UXFzxw4sH7l5TtCxW3U2iIzZm6+YoGdMv9wwevANSlqBJcj57ONsXA4ybgOZI1gjQ==
X-Received: by 2002:a05:6512:128a:b0:500:7c51:4684 with SMTP id u10-20020a056512128a00b005007c514684mr2814474lfs.56.1695832181205;
        Wed, 27 Sep 2023 09:29:41 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id q8-20020a056402032800b00522828d438csm8384685edw.7.2023.09.27.09.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:29:40 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Wed, 27 Sep 2023 18:29:37 +0200
Subject: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of line_info
 modeling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
In-Reply-To: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695832179; l=15595;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=esi7nwxi/+XHj0Y/QwDPvaMsZJpjJNMOOy+lrWrmbA8=;
 b=V0fzoFl3ZjBN3MaM2+WHgZ/BpoL4Hb/lCBjBZU/xf3dufZnpcTqpeoiPMXXeSwH9giKjppaKt
 dJM7byCYqInDkMgOAYEbzPqyHoOwse5z9KNrN4EN+jOLNs9cCbV7IdR
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While attention was provided to prevent freeing in non-owned use-cases,
the lifetime of these object was not properly modeled.

The line_info from an event may only be used for as long as the event
exists.

This allowed us to write unsafe-free Rust code that causes a
use-after-free:

  let event = chip.read_info_event().unwrap();
  let line_info = event.line_info().unwrap();
  drop(event);
  dbg!(line_info.name().unwrap());

Which makes the AddressSanitizer scream:

  ==90154==ERROR: AddressSanitizer: heap-use-after-free on address 0x50b000005dc4 at pc 0x55a4f883a009 bp 0x7f60ac8fbbc0 sp 0x7f60ac8fb388
  READ of size 2 at 0x50b000005dc4 thread T2
      [...]
      #3 0x55a4f8c3d5f3 in libgpiod::line_info::Info::name::h5ba0bfd360ecb405 libgpiod/bindings/rust/libgpiod/src/line_info.rs:70:18
    	[...]

  0x50b000005dc4 is located 4 bytes inside of 112-byte region [0x50b000005dc0,0x50b000005e30)
  freed by thread T2 here:
      [...]
      #1 0x7f60b07f7e31 in gpiod_info_event_free libgpiod/lib/info-event.c:61:2
      [...]

  previously allocated by thread T2 here:
      #0 0x55a4f88b04be in malloc /rustc/llvm/src/llvm-project/compiler-rt/lib/asan/asan_malloc_linux.cpp:69:3
      #1 0x7f60b07f8ff0 in gpiod_line_info_from_uapi libgpiod/lib/line-info.c:144:9

The fix is to distinguish between the owned and non-owned variants and
assigning lifetimes to non-owned variants.

For modeling the non-owned type there are a couple of options. The ideal
solution would be using extern_types [1]. But that is still unstable.
Instead, we are defining a #[repr(transparent)] wrapper around the opaque
gpiod_line_info struct and cast the pointer to a reference.

This was recommended on the Rust Discord server as good practise.
(Thanks to Kyuuhachi, shepmaster, pie_flavor and ilyvion! Also thanks to
@epilys for a brainstorming on this on #linaro-virtualization IRC).

Of course, determining the lifetimes and casting across the types
requires some care. So this adds a couple of SAFETY comments that would
probably also have helped the existing code.

[1] https://github.com/rust-lang/rfcs/blob/master/text/1861-extern-types.md

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/chip.rs       |  16 +++-
 bindings/rust/libgpiod/src/info_event.rs |   6 +-
 bindings/rust/libgpiod/src/line_info.rs  | 128 +++++++++++++++++++++----------
 3 files changed, 103 insertions(+), 47 deletions(-)

diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index 81e1be6..02265fc 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -95,7 +95,7 @@ impl Chip {
     }
 
     /// Get a snapshot of information about the line.
-    pub fn line_info(&self, offset: Offset) -> Result<line::Info> {
+    pub fn line_info(&self, offset: Offset) -> Result<line::InfoOwned> {
         // SAFETY: The `gpiod_line_info` returned by libgpiod is guaranteed to live as long
         // as the `struct Info`.
         let info = unsafe { gpiod::gpiod_chip_get_line_info(self.ichip.chip, offset) };
@@ -107,12 +107,16 @@ impl Chip {
             ));
         }
 
-        line::Info::new(info)
+        // SAFETY: We verified that the pointer is valid. We own the pointer and
+        // no longer use it after converting it into a InfoOwned instance.
+        let line_info = unsafe { line::InfoOwned::from_raw_owned(info) };
+
+        Ok(line_info)
     }
 
     /// Get the current snapshot of information about the line at given offset and start watching
     /// it for future changes.
-    pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info> {
+    pub fn watch_line_info(&self, offset: Offset) -> Result<line::InfoOwned> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
         let info = unsafe { gpiod::gpiod_chip_watch_line_info(self.ichip.chip, offset) };
 
@@ -123,7 +127,11 @@ impl Chip {
             ));
         }
 
-        line::Info::new_watch(info)
+        // SAFETY: We verified that the pointer is valid. We own the instance and
+        // no longer use it after converting it into a InfoOwned instance.
+        let line_info = unsafe { line::InfoOwned::from_raw_owned(info) };
+
+        Ok(line_info)
     }
 
     /// Stop watching a line
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
index db60600..e88dd72 100644
--- a/bindings/rust/libgpiod/src/info_event.rs
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -44,7 +44,7 @@ impl Event {
     }
 
     /// Get the line-info object associated with the event.
-    pub fn line_info(&self) -> Result<line::Info> {
+    pub fn line_info(&self) -> Result<&line::Info> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
         let info = unsafe { gpiod::gpiod_info_event_get_line_info(self.event) };
 
@@ -55,7 +55,9 @@ impl Event {
             ));
         }
 
-        line::Info::new_from_event(info)
+        let line_info = unsafe { line::Info::from_raw_non_owning(info) };
+
+        Ok(line_info)
     }
 }
 
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index c4f488c..32c4bb2 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -2,9 +2,10 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-use std::ffi::CStr;
+use std::ops::Deref;
 use std::str;
 use std::time::Duration;
+use std::{ffi::CStr, marker::PhantomData};
 
 use super::{
     gpiod,
@@ -12,7 +13,7 @@ use super::{
     Error, Result,
 };
 
-/// Line info
+/// Line info reference
 ///
 /// Exposes functions for retrieving kernel information about both requested and
 /// free lines.  Line info object contains an immutable snapshot of a line's status.
@@ -20,48 +21,57 @@ use super::{
 /// The line info contains all the publicly available information about a
 /// line, which does not include the line value.  The line must be requested
 /// to access the line value.
-
-#[derive(Debug, Eq, PartialEq)]
+///
+/// [Info] only abstracts a reference to a [gpiod::gpiod_line_info] instance whose lifetime is managed
+/// by a different object instance. The owned counter-part of this type is [InfoOwned].
+#[derive(Debug)]
+#[repr(transparent)]
 pub struct Info {
-    info: *mut gpiod::gpiod_line_info,
-    contained: bool,
+    _info: gpiod::gpiod_line_info,
+    // Avoid the automatic `Sync` implementation.
+    //
+    // The C lib does not allow parallel invocations of the API. We could model
+    // that by restricting all wrapper functions to `&mut Info` - which would
+    // ensure exclusive access. But that would make the API a bit weird...
+    // So instead we just suppress the `Sync` implementation, which suppresses
+    // the `Send` implementation on `&Info` - disallowing to send it to other
+    // threads, making concurrent use impossible.
+    _not_sync: PhantomData<*mut gpiod::gpiod_line_info>,
 }
 
 impl Info {
-    fn new_internal(info: *mut gpiod::gpiod_line_info, contained: bool) -> Result<Self> {
-        Ok(Self { info, contained })
-    }
-
-    /// Get a snapshot of information about the line.
-    pub(crate) fn new(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
-        Info::new_internal(info, false)
-    }
-
-    /// Get a snapshot of information about the line and start watching it for changes.
-    pub(crate) fn new_watch(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
-        Info::new_internal(info, false)
+    /// Converts a non-owning pointer to a wrapper reference of a specific
+    /// lifetime
+    ///
+    /// No ownership will be assumed, the pointer must be free'd by the original
+    /// owner.
+    ///
+    /// SAFETY: The pointer must point to an instance that is valid for the
+    /// entire lifetime 'a. The instance must be owned by an object that is
+    /// owned by the thread invoking this method. The owning object may not be
+    /// moved to another thread for the entire lifetime 'a.
+    pub(crate) unsafe fn from_raw_non_owning<'a>(info: *mut gpiod::gpiod_line_info) -> &'a Info {
+        &*(info as *mut _)
     }
 
-    /// Get the Line info object associated with an event.
-    pub(crate) fn new_from_event(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
-        Info::new_internal(info, true)
+    fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
+        self as *const _ as *mut _
     }
 
     /// Get the offset of the line within the GPIO chip.
     ///
     /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
     /// uniquely identifies the line within the system.
-
     pub fn offset(&self) -> Offset {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_info_get_offset(self.info) }
+        unsafe { gpiod::gpiod_line_info_get_offset(self.as_raw_ptr()) }
     }
 
     /// Get GPIO line's name.
     pub fn name(&self) -> Result<&str> {
         // SAFETY: The string returned by libgpiod is guaranteed to live as long
         // as the `struct Info`.
-        let name = unsafe { gpiod::gpiod_line_info_get_name(self.info) };
+        let name = unsafe { gpiod::gpiod_line_info_get_name(self.as_raw_ptr()) };
         if name.is_null() {
             return Err(Error::NullString("GPIO line's name"));
         }
@@ -79,14 +89,14 @@ impl Info {
     /// the line is used and we can't request it.
     pub fn is_used(&self) -> bool {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_info_is_used(self.info) }
+        unsafe { gpiod::gpiod_line_info_is_used(self.as_raw_ptr()) }
     }
 
     /// Get the GPIO line's consumer name.
     pub fn consumer(&self) -> Result<&str> {
         // SAFETY: The string returned by libgpiod is guaranteed to live as long
         // as the `struct Info`.
-        let name = unsafe { gpiod::gpiod_line_info_get_consumer(self.info) };
+        let name = unsafe { gpiod::gpiod_line_info_get_consumer(self.as_raw_ptr()) };
         if name.is_null() {
             return Err(Error::NullString("GPIO line's consumer name"));
         }
@@ -100,44 +110,44 @@ impl Info {
     /// Get the GPIO line's direction.
     pub fn direction(&self) -> Result<Direction> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) })
+        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.as_raw_ptr()) })
     }
 
     /// Returns true if the line is "active-low", false otherwise.
     pub fn is_active_low(&self) -> bool {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_info_is_active_low(self.info) }
+        unsafe { gpiod::gpiod_line_info_is_active_low(self.as_raw_ptr()) }
     }
 
     /// Get the GPIO line's bias setting.
     pub fn bias(&self) -> Result<Option<Bias>> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) })
+        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.as_raw_ptr()) })
     }
 
     /// Get the GPIO line's drive setting.
     pub fn drive(&self) -> Result<Drive> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) })
+        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.as_raw_ptr()) })
     }
 
     /// Get the current edge detection setting of the line.
     pub fn edge_detection(&self) -> Result<Option<Edge>> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) })
+        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.as_raw_ptr()) })
     }
 
     /// Get the current event clock setting used for edge event timestamps.
     pub fn event_clock(&self) -> Result<EventClock> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) })
+        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.as_raw_ptr()) })
     }
 
     /// Returns true if the line is debounced (either by hardware or by the
     /// kernel software debouncer), false otherwise.
     pub fn is_debounced(&self) -> bool {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_info_is_debounced(self.info) }
+        unsafe { gpiod::gpiod_line_info_is_debounced(self.as_raw_ptr()) }
     }
 
     /// Get the debounce period of the line.
@@ -147,18 +157,54 @@ impl Info {
         #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
         Duration::from_micros(unsafe {
-            gpiod::gpiod_line_info_get_debounce_period_us(self.info) as u64
+            gpiod::gpiod_line_info_get_debounce_period_us(self.as_raw_ptr()) as u64
         })
     }
 }
 
-impl Drop for Info {
+/// Line info
+///
+/// This is the owned counterpart to [Info]. Due to a [Deref] implementation,
+/// all functions of [Info] can also be called on this type.
+#[derive(Debug)]
+pub struct InfoOwned {
+    info: *mut gpiod::gpiod_line_info,
+}
+
+// SAFETY: InfoOwned models a owned instance whose ownership may be safely
+// transferred to other threads.
+unsafe impl Send for InfoOwned {}
+
+impl InfoOwned {
+    /// Converts a owned pointer into an owned instance
+    ///
+    /// Assumes sole ownership over a [gpiod::gpiod_line_info] instance.
+    ///
+    /// SAFETY: The pointer must point to an instance that is valid. After
+    /// constructing an [InfoOwned] the pointer MUST NOT be used for any other
+    /// purpose anymore. All interactions with the libgpiod API have to happen
+    /// through this object.
+    pub(crate) unsafe fn from_raw_owned(info: *mut gpiod::gpiod_line_info) -> InfoOwned {
+        InfoOwned { info }
+    }
+}
+
+impl Deref for InfoOwned {
+    type Target = Info;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The pointer is valid for the entire lifetime '0. InfoOwned is
+        // not Sync. Therefore, no &InfoOwned may be held by a different thread.
+        // Hence, the current thread owns it. Since we borrow with the lifetime
+        // of '0, no move to a different thread can occur while a reference
+        // remains being hold.
+        unsafe { Info::from_raw_non_owning(self.info) }
+    }
+}
+
+impl Drop for InfoOwned {
     fn drop(&mut self) {
-        // We must not free the Line info object created from `struct chip::Event` by calling
-        // libgpiod API.
-        if !self.contained {
-            // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-            unsafe { gpiod::gpiod_line_info_free(self.info) }
-        }
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_line_info_free(self.info) }
     }
 }

-- 
2.41.0

