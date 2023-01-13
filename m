Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC6E66A569
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjAMVwf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjAMVwe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:34 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E5089BE3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:31 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1975590wmc.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XLMg9CuAafuTq2nWOWQf1Mzz+IC/toxbU6U7qxH2IQ=;
        b=rG7Wt9Xv2i7ZTb0ayunyZcEDFLKjyFyRjUxtKoNHKgmN46jnHL8cvU2bRAWxhK64kX
         nlx0cWQG/+Y6cCtDZtuAPV+im2m1YE6BFtrmr5d69D3zwfb9wK1SMBh92Q/X+dddG3wX
         3kgfJ8vBpE4vvBDgGNMcYEzo2+KDTMOSx0v/IT8rySLUFjpMb0mQAq2/WBIQsFj9Gh2U
         kf/GY0dkicyI8fIsk/aFPNoEhYTMI1y7sbdT1PAGDvhmhJoZd3skBHJn0HOpMjGT0sf8
         +ZAsaRDpkdoayYObNasx/m6abM3J/a455EROS7jsIy0qXj7JldEL/goi7Xy3NrG2KjYi
         d2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XLMg9CuAafuTq2nWOWQf1Mzz+IC/toxbU6U7qxH2IQ=;
        b=o5G843L0eOsqycL2Ig4MzEyoT6OPcSy8D0u6xBSfzIT14zP7ZD491pvP+yy7hZpFnc
         P6ZymCDJFQD/EZW51DQf5RJPyApoT0+3RaJdk7Bpt/yJPYGd+sD1cUpvRz38zQc790bQ
         PoqwtfOJRHeMqb1truvLKX1WEhW20BjRl+imR8+7/OJLRx528e2vYklOk9i3OkdZAACx
         1KBPY9DStYBRZULALIO5O7Q+qnffDEINCqgrlmC+M6jLsUxfYWw2UoDkwyAatOvuYE05
         01Xi/t68mo6qLI+skjM5uPxPGvFNiTu5Zm8m3NvgtIoVU3fT3R93RR+RugPktWAqxKh3
         rB5g==
X-Gm-Message-State: AFqh2kp6E08HCNcscOMMNZ5YXx/r4b51llIfx568n4muJ1FnyeojuYqE
        zl2KiUaGP6e16Myge1hrzTD7nw==
X-Google-Smtp-Source: AMrXdXs9oith08H2bjTnEEAo96igNiPeWnnxjnLmwJFAErf97ujJm2XfT929A9LFnV8QdCqZUOVldA==
X-Received: by 2002:a05:600c:1d10:b0:3d9:ef75:ea6e with SMTP id l16-20020a05600c1d1000b003d9ef75ea6emr916892wms.38.1673646750771;
        Fri, 13 Jan 2023 13:52:30 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:30 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 14/16] bindings: rust: make request_config optional in Chip.request_lines()
Date:   Fri, 13 Jan 2023 22:52:08 +0100
Message-Id: <20230113215210.616812-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Request config is not necessary to request lines. In C API we accept
a NULL pointer, in C++ it's not necessary to assign a request_config
to the request builder, in Python the consumer and event buffer size
arguments are optional. Let's make rust bindings consistent and not
require the request config to be always present. Convert the argument
in request_lines to Option and update the rest of the code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/examples/gpio_events.rs         |  2 +-
 .../libgpiod/examples/gpio_threaded_info_events.rs     |  2 +-
 bindings/rust/libgpiod/examples/gpioget.rs             |  2 +-
 bindings/rust/libgpiod/examples/gpiomon.rs             |  2 +-
 bindings/rust/libgpiod/examples/gpioset.rs             |  2 +-
 bindings/rust/libgpiod/src/chip.rs                     | 10 ++++++++--
 bindings/rust/libgpiod/tests/common/config.rs          |  2 +-
 bindings/rust/libgpiod/tests/info_event.rs             |  2 +-
 8 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
index 04267d9..cbdf1b5 100644
--- a/bindings/rust/libgpiod/examples/gpio_events.rs
+++ b/bindings/rust/libgpiod/examples/gpio_events.rs
@@ -42,7 +42,7 @@ fn main() -> Result<()> {
     let rconfig = request::Config::new()?;
 
     let mut buffer = request::Buffer::new(1)?;
-    let request = chip.request_lines(&rconfig, &lconfig)?;
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     loop {
         match request.wait_edge_events(None) {
diff --git a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
index e17f0f0..367b2f6 100644
--- a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
+++ b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
@@ -40,7 +40,7 @@ fn request_reconfigure_line(
         let request = chip
             .lock()
             .unwrap()
-            .request_lines(&rconfig, &lconfig)
+            .request_lines(Some(&rconfig), &lconfig)
             .unwrap();
 
         // Signal the parent to continue
diff --git a/bindings/rust/libgpiod/examples/gpioget.rs b/bindings/rust/libgpiod/examples/gpioget.rs
index 6e60833..74baf30 100644
--- a/bindings/rust/libgpiod/examples/gpioget.rs
+++ b/bindings/rust/libgpiod/examples/gpioget.rs
@@ -37,7 +37,7 @@ fn main() -> Result<()> {
     let rconfig = request::Config::new()?;
     rconfig.set_consumer(&args[0])?;
 
-    let request = chip.request_lines(&rconfig, &lconfig)?;
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
     let map = request.values()?;
 
     println!("{:?}", map);
diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
index f17a81f..a09ddfc 100644
--- a/bindings/rust/libgpiod/examples/gpiomon.rs
+++ b/bindings/rust/libgpiod/examples/gpiomon.rs
@@ -41,7 +41,7 @@ fn main() -> Result<()> {
     let rconfig = request::Config::new()?;
 
     let mut buffer = request::Buffer::new(1)?;
-    let request = chip.request_lines(&rconfig, &lconfig)?;
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     loop {
         match request.wait_edge_events(None) {
diff --git a/bindings/rust/libgpiod/examples/gpioset.rs b/bindings/rust/libgpiod/examples/gpioset.rs
index 875a3ad..6247996 100644
--- a/bindings/rust/libgpiod/examples/gpioset.rs
+++ b/bindings/rust/libgpiod/examples/gpioset.rs
@@ -54,7 +54,7 @@ fn main() -> Result<()> {
     let rconfig = request::Config::new()?;
     rconfig.set_consumer(&args[0])?;
 
-    chip.request_lines(&rconfig, &lconfig)?;
+    chip.request_lines(Some(&rconfig), &lconfig)?;
 
     // Wait for keypress, let user verify line status.
     stdin().read_exact(&mut [0u8]).unwrap();
diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index 91b4c94..9c3c2b4 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -11,6 +11,7 @@ use std::cmp::Ordering;
 use std::ffi::{CStr, CString};
 use std::os::{raw::c_char, unix::prelude::AsRawFd};
 use std::path::Path;
+use std::ptr;
 use std::str;
 use std::sync::Arc;
 use std::time::Duration;
@@ -195,13 +196,18 @@ impl Chip {
     /// Request a set of lines for exclusive usage.
     pub fn request_lines(
         &self,
-        rconfig: &request::Config,
+        rconfig: Option<&request::Config>,
         lconfig: &line::Config,
     ) -> Result<request::Request> {
+        let req_cfg = match rconfig {
+            Some(cfg) => cfg.config,
+            _ => ptr::null(),
+        } as *mut gpiod::gpiod_request_config;
+
         // SAFETY: The `gpiod_line_request` returned by libgpiod is guaranteed to live as long
         // as the `struct Request`.
         let request = unsafe {
-            gpiod::gpiod_chip_request_lines(self.ichip.chip, rconfig.config, lconfig.config)
+            gpiod::gpiod_chip_request_lines(self.ichip.chip, req_cfg, lconfig.config)
         };
 
         if request.is_null() {
diff --git a/bindings/rust/libgpiod/tests/common/config.rs b/bindings/rust/libgpiod/tests/common/config.rs
index 842a70a..b838b66 100644
--- a/bindings/rust/libgpiod/tests/common/config.rs
+++ b/bindings/rust/libgpiod/tests/common/config.rs
@@ -106,7 +106,7 @@ impl TestConfig {
     pub(crate) fn request_lines(&mut self) -> Result<()> {
         let chip = Chip::open(&self.sim.lock().unwrap().dev_path())?;
 
-        self.request = Some(chip.request_lines(&self.rconfig, &self.lconfig)?);
+        self.request = Some(chip.request_lines(Some(&self.rconfig), &self.lconfig)?);
         self.chip = Some(chip);
 
         Ok(())
diff --git a/bindings/rust/libgpiod/tests/info_event.rs b/bindings/rust/libgpiod/tests/info_event.rs
index bfa0058..6bf7a0f 100644
--- a/bindings/rust/libgpiod/tests/info_event.rs
+++ b/bindings/rust/libgpiod/tests/info_event.rs
@@ -32,7 +32,7 @@ mod info_event {
             let request = chip
                 .lock()
                 .unwrap()
-                .request_lines(&rconfig, &lconfig1)
+                .request_lines(Some(&rconfig), &lconfig1)
                 .unwrap();
 
             // Signal the parent to continue
-- 
2.37.2

