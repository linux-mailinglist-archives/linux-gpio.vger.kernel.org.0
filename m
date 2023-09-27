Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57277AFFDF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjI0JZh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjI0JZf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:25:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D0C10E
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:25:33 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50325ce89e9so17660348e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695806732; x=1696411532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YP2J2mJp3X4ShVj1w5135JS59RjhxoK2JGE5CqQ42dY=;
        b=Azmq7HM0Yu0nzRzQioNc4lHn5Q/z/e+CtZhLanKNZ+vi3Ll5CgrBOA0m0tTirx2Uvz
         +SndpErfQTEp43n0J+yw0fR4YMTdBKbsNVimd378ke+F3hbLEbh0w44sHk8V0IOfRPJu
         hwQ+WvLAeFNUaJRCEEILSlaFZ7bu/KyxzcL94yz8lXu+P5mKf6Q4dM2D8kCgws3UzJmN
         dCQ8pm60Fp198rohKX893ixRS4+7Pq4AScSJsHJROYohQD37WNhLqW4JBxPrBBA3nxC+
         18ng1lUyLPmyvzXvHS5F04JwD6lvnlrzoWsnyM/uIxL883lb1eQ97IAAuor8kD1ThlgF
         p5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806732; x=1696411532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP2J2mJp3X4ShVj1w5135JS59RjhxoK2JGE5CqQ42dY=;
        b=gznCMgHGMTNSPbyy4oXD0jMOL8DCBHfQr2VdNHQl40rKqslm3sLl3W4+LSHlmx8zoI
         fHJDwP09MPBPAJS8LaD4JEiXj6Ekjg2z+FV1PVriWdB7jOeoqxoI3Po5T2FzK4XE/by5
         dBZabIIEMvCq7DsAodPxjHNrwuBlqvltBqgf8a1zEax7n35WvVj90JXz4m1jiv+7LyGU
         ufR3FEWj2EgF2VxXI1UMn2Q18ANkjl+0pY08GDmxhJVaXqk0olTZHyua/w1/oOIdY9yu
         Q6DkjPlQ5APS7O76W/CRfADwjQL1/XQ/Qn4oIQDOQcxCTqDv5/iNaXK8LHN7E4IREZEe
         4VLA==
X-Gm-Message-State: AOJu0YyDe2ztuOd7Z8qafPCK5j1469WjKoQtY+K/e1Zxcup9iG7SbwC3
        1yHtB+0JWwY/ec65awoJfqeATw==
X-Google-Smtp-Source: AGHT+IG0H1+/JHeiUBOi4oeaTzrYcW9tunwHWqCoJIzxeoKUfg5brIwfbbKRaZqBpGCqgJT3fyzOww==
X-Received: by 2002:a05:6512:251e:b0:502:d743:8a6c with SMTP id be30-20020a056512251e00b00502d7438a6cmr1313645lfb.9.1695806732111;
        Wed, 27 Sep 2023 02:25:32 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0ac900b0040646cf9fa7sm667861wmr.42.2023.09.27.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:25:31 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Wed, 27 Sep 2023 11:25:24 +0200
Subject: [libgpiod][PATCH 2/2] bindings: rust: drop unneeded Arc within
 Chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-chip-drop-arc-v1-2-28013bf95948@linaro.org>
References: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
In-Reply-To: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695806730; l=8326;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=2jPHjG+FCBIFY076Q8mw/Qcb0nhSLsCPQf73UvZcmEk=;
 b=VvJ3dKUVDPuMgaXaLMi6REeeubQFo/lrYrXWHQsz3n7dybHpQp8AwhwzQLpc57ZH0a3h/YyOL
 Dw8J9JDShfoCa5kFV3yQ8uysxSSKaKHiecTOSwguJSa0J0ZiSagPvpi
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

Chip was modeled with an Arc that only was used to pass the chip pointer
to the chip::Info constructor. With that refactored to take a reference,
we can just drop the Arc.

This allows to get rid of the `Internal` helper struct that was only
required by the Arc.

As a side-effect, we also get rid of this clippy warning:

  warning: usage of an `Arc` that is not `Send` or `Sync`
    --> libgpiod/src/chip.rs:75:21
     |
  75 |         let ichip = Arc::new(Internal::open(path)?);
     |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
     = note: the trait `Send` is not implemented for `Internal`
     = note: the trait `Sync` is not implemented for `Internal`
     = note: required for `Arc<Internal>` to implement `Send` and `Sync`
     = help: consider using an `Rc` instead or wrapping the inner type with a `Mutex`

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/chip.rs | 81 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 49 deletions(-)

diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index 4545ddb..ebc15dc 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -13,7 +13,6 @@ use std::os::{raw::c_char, unix::prelude::AsRawFd};
 use std::path::Path;
 use std::ptr;
 use std::str;
-use std::sync::Arc;
 use std::time::Duration;
 
 use super::{
@@ -22,14 +21,24 @@ use super::{
     request, Error, OperationType, Result,
 };
 
+/// GPIO chip
+///
+/// A GPIO chip object is associated with an open file descriptor to the GPIO
+/// character device. It exposes basic information about the chip and allows
+/// callers to retrieve information about each line, watch lines for state
+/// changes and make line requests.
 #[derive(Debug, Eq, PartialEq)]
-struct Internal {
+pub struct Chip {
     chip: *mut gpiod::gpiod_chip,
 }
 
-impl Internal {
+// SAFETY: Safe as chip is modeling a owned chip instance that may be freely
+// moved to other threads
+unsafe impl Send for Chip {}
+
+impl Chip {
     /// Find a chip by path.
-    fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
+    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
         // Null-terminate the string
         let path = path.as_ref().to_string_lossy() + "\0";
 
@@ -45,37 +54,6 @@ impl Internal {
 
         Ok(Self { chip })
     }
-}
-
-impl Drop for Internal {
-    /// Close the chip and release all associated resources.
-    fn drop(&mut self) {
-        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_chip_close(self.chip) }
-    }
-}
-
-/// GPIO chip
-///
-/// A GPIO chip object is associated with an open file descriptor to the GPIO
-/// character device. It exposes basic information about the chip and allows
-/// callers to retrieve information about each line, watch lines for state
-/// changes and make line requests.
-#[derive(Debug, Eq, PartialEq)]
-pub struct Chip {
-    ichip: Arc<Internal>,
-}
-
-// SAFETY: Safe as `Internal` won't be freed until the `Chip` is dropped.
-unsafe impl Send for Chip {}
-
-impl Chip {
-    /// Find a chip by path.
-    pub fn open<P: AsRef<Path>>(path: &P) -> Result<Self> {
-        let ichip = Arc::new(Internal::open(path)?);
-
-        Ok(Self { ichip })
-    }
 
     /// Get the chip name as represented in the kernel.
     pub fn info(&self) -> Result<Info> {
@@ -86,7 +64,7 @@ impl Chip {
     pub fn path(&self) -> Result<&str> {
         // SAFETY: The string returned by libgpiod is guaranteed to live as long
         // as the `struct Chip`.
-        let path = unsafe { gpiod::gpiod_chip_get_path(self.ichip.chip) };
+        let path = unsafe { gpiod::gpiod_chip_get_path(self.chip) };
 
         // SAFETY: The string is guaranteed to be valid here by the C API.
         unsafe { CStr::from_ptr(path) }
@@ -98,7 +76,7 @@ impl Chip {
     pub fn line_info(&self, offset: Offset) -> Result<line::Info> {
         // SAFETY: The `gpiod_line_info` returned by libgpiod is guaranteed to live as long
         // as the `struct Info`.
-        let info = unsafe { gpiod::gpiod_chip_get_line_info(self.ichip.chip, offset) };
+        let info = unsafe { gpiod::gpiod_chip_get_line_info(self.chip, offset) };
 
         if info.is_null() {
             return Err(Error::OperationFailed(
@@ -114,7 +92,7 @@ impl Chip {
     /// it for future changes.
     pub fn watch_line_info(&self, offset: Offset) -> Result<line::Info> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        let info = unsafe { gpiod::gpiod_chip_watch_line_info(self.ichip.chip, offset) };
+        let info = unsafe { gpiod::gpiod_chip_watch_line_info(self.chip, offset) };
 
         if info.is_null() {
             return Err(Error::OperationFailed(
@@ -130,7 +108,7 @@ impl Chip {
     pub fn unwatch(&self, offset: Offset) {
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
         unsafe {
-            gpiod::gpiod_chip_unwatch_line_info(self.ichip.chip, offset);
+            gpiod::gpiod_chip_unwatch_line_info(self.chip, offset);
         }
     }
 
@@ -143,7 +121,7 @@ impl Chip {
         };
 
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
-        let ret = unsafe { gpiod::gpiod_chip_wait_info_event(self.ichip.chip, timeout) };
+        let ret = unsafe { gpiod::gpiod_chip_wait_info_event(self.chip, timeout) };
 
         match ret {
             -1 => Err(Error::OperationFailed(
@@ -160,7 +138,7 @@ impl Chip {
     pub fn read_info_event(&self) -> Result<info::Event> {
         // SAFETY: The `gpiod_info_event` returned by libgpiod is guaranteed to live as long
         // as the `struct Event`.
-        let event = unsafe { gpiod::gpiod_chip_read_info_event(self.ichip.chip) };
+        let event = unsafe { gpiod::gpiod_chip_read_info_event(self.chip) };
         if event.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::ChipReadInfoEvent,
@@ -177,10 +155,7 @@ impl Chip {
 
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_chip_get_line_offset_from_name(
-                self.ichip.chip,
-                name.as_ptr() as *const c_char,
-            )
+            gpiod::gpiod_chip_get_line_offset_from_name(self.chip, name.as_ptr() as *const c_char)
         };
 
         if ret == -1 {
@@ -207,7 +182,7 @@ impl Chip {
         // SAFETY: The `gpiod_line_request` returned by libgpiod is guaranteed to live as long
         // as the `struct Request`.
         let request =
-            unsafe { gpiod::gpiod_chip_request_lines(self.ichip.chip, req_cfg, lconfig.config) };
+            unsafe { gpiod::gpiod_chip_request_lines(self.chip, req_cfg, lconfig.config) };
 
         if request.is_null() {
             return Err(Error::OperationFailed(
@@ -220,6 +195,14 @@ impl Chip {
     }
 }
 
+impl Drop for Chip {
+    /// Close the chip and release all associated resources.
+    fn drop(&mut self) {
+        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
+        unsafe { gpiod::gpiod_chip_close(self.chip) }
+    }
+}
+
 impl AsRawFd for Chip {
     /// Get the file descriptor associated with the chip.
     ///
@@ -227,7 +210,7 @@ impl AsRawFd for Chip {
     /// `struct Chip` may fail.
     fn as_raw_fd(&self) -> i32 {
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_chip_get_fd(self.ichip.chip) }
+        unsafe { gpiod::gpiod_chip_get_fd(self.chip) }
     }
 }
 
@@ -240,8 +223,8 @@ pub struct Info {
 impl Info {
     /// Find a GPIO chip by path.
     fn new(chip: &Chip) -> Result<Self> {
-        // SAFETY: `chip.ichip.chip` is guaranteed to be valid here.
-        let info = unsafe { gpiod::gpiod_chip_get_info(chip.ichip.chip) };
+        // SAFETY: `chip.chip` is guaranteed to be valid here.
+        let info = unsafe { gpiod::gpiod_chip_get_info(chip.chip) };
         if info.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::ChipGetInfo,

-- 
2.41.0

