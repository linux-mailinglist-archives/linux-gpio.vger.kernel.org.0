Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11325675172
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjATJpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjATJpc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:32 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0476F7AF20
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:29 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso3926238wmn.5
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJP2lJ4UKFavY1ic4B59VsaKuHhjsUyjQZE8rnzk8Ig=;
        b=swXWxnolHIgNgV5LnVUrn94sCxaWSBz6YgGscmKgns1J7BjO1Nqff5bH4BumC9VK5S
         OTrJjgAT2OT+IeowDHb1DMMfC26p9ySXq5IWD1oBBjRB8uyp4nxvZu/59e/L9qHSDknr
         gHCCyeauY5dZQVkIXdQmil0EHa8GauD4W2AZQxkYmYblOJFGcI+p97mnykEphmwX9sxi
         P5Hf5eTNOanf6RZu8Yl4WqKYS/FV0eaRUBbfF2YAjLRnVGoRQKdvpAvJgA1hXhpYm1d6
         unUtZkFIVHYC0XVlczfNwwDwZdNkcFz4w4qH8IkBYVmDcFkE9pw9d14BhoAh/+7dpP0y
         RY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJP2lJ4UKFavY1ic4B59VsaKuHhjsUyjQZE8rnzk8Ig=;
        b=lOQNgRM5jvxxfED5OMR+3MhcLcuLg/Uw2Prh5KlXKzG2qYpF9+yzOd/wz1t+r/d/N5
         CUJQHzNieoK+pFdHzKGZ5pd5+5uTg6Xtqq/CkSnyYYc8eyWz1C2vE9tTMG0YU2zm8cbL
         lIPxCVub9oqTjKFFiulq82JSF37SYHVvG5yTvB/nK862XGNgaikQIkjBu6taikinN8/Y
         6ttkydanspM2eHvMBE+Gw13AkYgDYrTUkn84alAzadzBjx7llfzZbgOwj+HQXmpSOUSq
         vpqNlwEBuJsOaAOms3OfPNEW5z5svjRXTEaw+O/ndoktFK7zdtLWJBLNz1uadBPRrO7S
         2XrQ==
X-Gm-Message-State: AFqh2koWmz9DrT1cREYu/ToPPzsdBvKWnDrkaU/OMmEd1i3DH/G/s/KZ
        M0gUtF/OsQEevNVVJLm/yVMPNQ==
X-Google-Smtp-Source: AMrXdXscEA6RE47sitsCXCtgiR7VfmSOJ1ePk7MZ4ESP3/Gr62FpeyM+mU0LsWe5dnBLe3HkuRAo1A==
X-Received: by 2002:a05:600c:2116:b0:3d6:10e:68a8 with SMTP id u22-20020a05600c211600b003d6010e68a8mr9735980wml.0.1674207928381;
        Fri, 20 Jan 2023 01:45:28 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 7/8] bindings: rust: make mutators return &mut self
Date:   Fri, 20 Jan 2023 10:45:14 +0100
Message-Id: <20230120094515.40464-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120094515.40464-1-brgl@bgdev.pl>
References: <20230120094515.40464-1-brgl@bgdev.pl>
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

In C++ bindings we can chain the mutators as they all return a reference
to the object they modify. It's a common practice to allow that in Rust
too so make all mutators that don't already do it return a mutable
reference to self.

It's also logically incorrect to make mutators borrow an immutable
reference to self. Even if that builds - as we're fiddling with C
pointers - it could change in the future. It's fine for getters but
setters should all use mutable references.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../rust/libgpiod/examples/gpio_events.rs     |  2 +-
 .../examples/gpio_threaded_info_events.rs     |  6 +-
 bindings/rust/libgpiod/examples/gpioget.rs    |  4 +-
 bindings/rust/libgpiod/examples/gpiomon.rs    |  2 +-
 bindings/rust/libgpiod/examples/gpioset.rs    |  4 +-
 bindings/rust/libgpiod/src/line_config.rs     |  4 +-
 bindings/rust/libgpiod/src/line_request.rs    | 16 ++--
 bindings/rust/libgpiod/src/request_config.rs  |  8 +-
 bindings/rust/libgpiod/tests/common/config.rs |  8 +-
 bindings/rust/libgpiod/tests/info_event.rs    |  6 +-
 bindings/rust/libgpiod/tests/line_config.rs   |  2 +-
 bindings/rust/libgpiod/tests/line_request.rs  | 73 ++++++++-----------
 .../rust/libgpiod/tests/request_config.rs     |  2 +-
 13 files changed, 65 insertions(+), 72 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
index cbdf1b5..b26c60b 100644
--- a/bindings/rust/libgpiod/examples/gpio_events.rs
+++ b/bindings/rust/libgpiod/examples/gpio_events.rs
@@ -25,7 +25,7 @@ fn main() -> Result<()> {
     }
 
     let mut lsettings = line::Settings::new()?;
-    let lconfig = line::Config::new()?;
+    let mut lconfig = line::Config::new()?;
     let mut offsets = Vec::<Offset>::new();
 
     for arg in &args[2..] {
diff --git a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
index 367b2f6..620f4ec 100644
--- a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
+++ b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
@@ -32,12 +32,12 @@ fn request_reconfigure_line(
     rx: Receiver<()>,
 ) {
     thread::spawn(move || {
-        let lconfig = line::Config::new().unwrap();
+        let mut lconfig = line::Config::new().unwrap();
         let lsettings = line::Settings::new().unwrap();
         lconfig.add_line_settings(&[offset], lsettings).unwrap();
         let rconfig = request::Config::new().unwrap();
 
-        let request = chip
+        let mut request = chip
             .lock()
             .unwrap()
             .request_lines(Some(&rconfig), &lconfig)
@@ -49,7 +49,7 @@ fn request_reconfigure_line(
         // Wait for parent to signal
         rx.recv().expect("Could not receive from channel");
 
-        let lconfig = line::Config::new().unwrap();
+        let mut lconfig = line::Config::new().unwrap();
         let mut lsettings = line::Settings::new().unwrap();
         lsettings.set_direction(Direction::Output).unwrap();
         lconfig.add_line_settings(&[offset], lsettings).unwrap();
diff --git a/bindings/rust/libgpiod/examples/gpioget.rs b/bindings/rust/libgpiod/examples/gpioget.rs
index 74baf30..a71612b 100644
--- a/bindings/rust/libgpiod/examples/gpioget.rs
+++ b/bindings/rust/libgpiod/examples/gpioget.rs
@@ -20,7 +20,7 @@ fn main() -> Result<()> {
     }
 
     let mut lsettings = line::Settings::new()?;
-    let lconfig = line::Config::new()?;
+    let mut lconfig = line::Config::new()?;
     let mut offsets = Vec::<Offset>::new();
 
     for arg in &args[2..] {
@@ -34,7 +34,7 @@ fn main() -> Result<()> {
     let path = format!("/dev/gpiochip{}", args[1]);
     let chip = Chip::open(&path)?;
 
-    let rconfig = request::Config::new()?;
+    let mut rconfig = request::Config::new()?;
     rconfig.set_consumer(&args[0])?;
 
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
index a09ddfc..8f2a71a 100644
--- a/bindings/rust/libgpiod/examples/gpiomon.rs
+++ b/bindings/rust/libgpiod/examples/gpiomon.rs
@@ -24,7 +24,7 @@ fn main() -> Result<()> {
     }
 
     let mut lsettings = line::Settings::new()?;
-    let lconfig = line::Config::new()?;
+    let mut lconfig = line::Config::new()?;
     let mut offsets = Vec::<Offset>::new();
 
     for arg in &args[2..] {
diff --git a/bindings/rust/libgpiod/examples/gpioset.rs b/bindings/rust/libgpiod/examples/gpioset.rs
index 6247996..4b43010 100644
--- a/bindings/rust/libgpiod/examples/gpioset.rs
+++ b/bindings/rust/libgpiod/examples/gpioset.rs
@@ -24,7 +24,7 @@ fn main() -> Result<()> {
         return Err(Error::InvalidArguments);
     }
 
-    let lconfig = line::Config::new()?;
+    let mut lconfig = line::Config::new()?;
 
     for arg in &args[2..] {
         let pair: Vec<&str> = arg.split('=').collect();
@@ -51,7 +51,7 @@ fn main() -> Result<()> {
     let path = format!("/dev/gpiochip{}", args[1]);
     let chip = Chip::open(&path)?;
 
-    let rconfig = request::Config::new()?;
+    let mut rconfig = request::Config::new()?;
     rconfig.set_consumer(&args[0])?;
 
     chip.request_lines(Some(&rconfig), &lconfig)?;
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 42dad9f..3f42dad 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -56,7 +56,7 @@ impl Config {
     }
 
     /// Add line settings for a set of offsets.
-    pub fn add_line_settings(&self, offsets: &[Offset], settings: Settings) -> Result<()> {
+    pub fn add_line_settings(&mut self, offsets: &[Offset], settings: Settings) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
         let ret = unsafe {
             gpiod::gpiod_line_config_add_line_settings(
@@ -73,7 +73,7 @@ impl Config {
                 errno::errno(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }
 
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 7915924..ff701fb 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -95,7 +95,7 @@ impl Request {
     }
 
     /// Set the value of a single line associated with the request.
-    pub fn set_value(&self, offset: Offset, value: Value) -> Result<()> {
+    pub fn set_value(&mut self, offset: Offset, value: Value) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
         let ret =
             unsafe { gpiod::gpiod_line_request_set_value(self.request, offset, value.value()) };
@@ -106,12 +106,12 @@ impl Request {
                 errno::errno(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }
 
     /// Set values of a subset of lines associated with the request.
-    pub fn set_values_subset(&self, map: ValueMap) -> Result<()> {
+    pub fn set_values_subset(&mut self, map: ValueMap) -> Result<&mut Self> {
         let mut offsets = Vec::new();
         let mut values = Vec::new();
 
@@ -136,12 +136,12 @@ impl Request {
                 errno::errno(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }
 
     /// Set values of all lines associated with the request.
-    pub fn set_values(&self, values: &[Value]) -> Result<()> {
+    pub fn set_values(&mut self, values: &[Value]) -> Result<&mut Self> {
         if values.len() != self.num_lines() as usize {
             return Err(Error::InvalidArguments);
         }
@@ -161,12 +161,12 @@ impl Request {
                 errno::errno(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }
 
     /// Update the configuration of lines associated with the line request.
-    pub fn reconfigure_lines(&self, lconfig: &line::Config) -> Result<()> {
+    pub fn reconfigure_lines(&mut self, lconfig: &line::Config) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
         let ret =
             unsafe { gpiod::gpiod_line_request_reconfigure_lines(self.request, lconfig.config) };
@@ -177,7 +177,7 @@ impl Request {
                 errno::errno(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }
 
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
index 9d38548..939838c 100644
--- a/bindings/rust/libgpiod/src/request_config.rs
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -40,7 +40,7 @@ impl Config {
     ///
     /// If the consumer string is too long, it will be truncated to the max
     /// accepted length.
-    pub fn set_consumer(&self, consumer: &str) -> Result<()> {
+    pub fn set_consumer(&mut self, consumer: &str) -> Result<&mut Self> {
         let consumer = CString::new(consumer).map_err(|_| Error::InvalidString)?;
 
         // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
@@ -51,7 +51,7 @@ impl Config {
             )
         }
 
-        Ok(())
+        Ok(self)
     }
 
     /// Get the consumer name configured in the request config.
@@ -73,9 +73,11 @@ impl Config {
     }
 
     /// Set the size of the kernel event buffer for the request.
-    pub fn set_event_buffer_size(&self, size: usize) {
+    pub fn set_event_buffer_size(&mut self, size: usize) -> &mut Self {
         // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
         unsafe { gpiod::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong) }
+
+        self
     }
 
     /// Get the edge event buffer size setting for the request config.
diff --git a/bindings/rust/libgpiod/tests/common/config.rs b/bindings/rust/libgpiod/tests/common/config.rs
index b838b66..36ccc94 100644
--- a/bindings/rust/libgpiod/tests/common/config.rs
+++ b/bindings/rust/libgpiod/tests/common/config.rs
@@ -43,7 +43,7 @@ impl TestConfig {
         }
     }
 
-    pub(crate) fn rconfig_set_consumer(&self, consumer: &str) {
+    pub(crate) fn rconfig_set_consumer(&mut self, consumer: &str) {
         self.rconfig.set_consumer(consumer).unwrap();
     }
 
@@ -100,7 +100,7 @@ impl TestConfig {
     pub(crate) fn lconfig_add_settings(&mut self, offsets: &[Offset]) {
         self.lconfig
             .add_line_settings(offsets, self.lsettings.take().unwrap())
-            .unwrap()
+            .unwrap();
     }
 
     pub(crate) fn request_lines(&mut self) -> Result<()> {
@@ -128,8 +128,8 @@ impl TestConfig {
         self.lsettings.as_mut().unwrap()
     }
 
-    pub(crate) fn request(&self) -> &request::Request {
-        self.request.as_ref().unwrap()
+    pub(crate) fn request(&mut self) -> &mut request::Request {
+        self.request.as_mut().unwrap()
     }
 }
 
diff --git a/bindings/rust/libgpiod/tests/info_event.rs b/bindings/rust/libgpiod/tests/info_event.rs
index 6bf7a0f..f06dd2d 100644
--- a/bindings/rust/libgpiod/tests/info_event.rs
+++ b/bindings/rust/libgpiod/tests/info_event.rs
@@ -24,12 +24,12 @@ mod info_event {
 
     fn request_reconfigure_line(chip: Arc<Mutex<Chip>>, tx: Sender<()>, rx: Receiver<()>) {
         thread::spawn(move || {
-            let lconfig1 = line::Config::new().unwrap();
+            let mut lconfig1 = line::Config::new().unwrap();
             let lsettings = line::Settings::new().unwrap();
             lconfig1.add_line_settings(&[7], lsettings).unwrap();
             let rconfig = request::Config::new().unwrap();
 
-            let request = chip
+            let mut request = chip
                 .lock()
                 .unwrap()
                 .request_lines(Some(&rconfig), &lconfig1)
@@ -41,7 +41,7 @@ mod info_event {
             // Wait for parent to signal
             rx.recv().expect("Could not receive from channel");
 
-            let lconfig2 = line::Config::new().unwrap();
+            let mut lconfig2 = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_direction(Direction::Output).unwrap();
             lconfig2.add_line_settings(&[7], lsettings).unwrap();
diff --git a/bindings/rust/libgpiod/tests/line_config.rs b/bindings/rust/libgpiod/tests/line_config.rs
index 95f2178..92a7af3 100644
--- a/bindings/rust/libgpiod/tests/line_config.rs
+++ b/bindings/rust/libgpiod/tests/line_config.rs
@@ -33,7 +33,7 @@ mod line_config {
             .unwrap();
 
         // Add settings for multiple lines
-        let lconfig = line::Config::new().unwrap();
+        let mut lconfig = line::Config::new().unwrap();
         lconfig.add_line_settings(&[0, 1, 2], lsettings1).unwrap();
         lconfig.add_line_settings(&[4, 5], lsettings2).unwrap();
 
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index c3fc37b..8ec497f 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -123,7 +123,7 @@ mod line_request {
             // Value read properly after reconfigure
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_active_low(true);
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             lconfig.add_line_settings(&offsets, lsettings).unwrap();
             request.reconfigure_lines(&lconfig).unwrap();
             assert_eq!(request.value(7).unwrap(), Value::InActive);
@@ -153,22 +153,21 @@ mod line_request {
             config.lconfig_val(Some(Direction::Output), Some(Value::InActive));
             config.lconfig_add_settings(&offsets);
             config.request_lines().unwrap();
-            let request = config.request();
 
             // Set single value
-            request.set_value(1, Value::Active).unwrap();
+            config.request().set_value(1, Value::Active).unwrap();
             assert_eq!(config.sim_val(0).unwrap(), SimValue::InActive);
             assert_eq!(config.sim_val(1).unwrap(), SimValue::Active);
             assert_eq!(config.sim_val(3).unwrap(), SimValue::InActive);
             assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
-            request.set_value(1, Value::InActive).unwrap();
+            config.request().set_value(1, Value::InActive).unwrap();
             assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
 
             // Set values of subset
             let mut map = ValueMap::new();
             map.insert(4, Value::Active);
             map.insert(3, Value::Active);
-            request.set_values_subset(map).unwrap();
+            config.request().set_values_subset(map).unwrap();
             assert_eq!(config.sim_val(0).unwrap(), SimValue::InActive);
             assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
             assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
@@ -177,12 +176,12 @@ mod line_request {
             let mut map = ValueMap::new();
             map.insert(4, Value::InActive);
             map.insert(3, Value::InActive);
-            request.set_values_subset(map).unwrap();
+            config.request().set_values_subset(map).unwrap();
             assert_eq!(config.sim_val(3).unwrap(), SimValue::InActive);
             assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
 
             // Set all values
-            request
+            config.request()
                 .set_values(&[
                     Value::Active,
                     Value::InActive,
@@ -194,7 +193,7 @@ mod line_request {
             assert_eq!(config.sim_val(1).unwrap(), SimValue::InActive);
             assert_eq!(config.sim_val(3).unwrap(), SimValue::Active);
             assert_eq!(config.sim_val(4).unwrap(), SimValue::InActive);
-            request
+            config.request()
                 .set_values(&[
                     Value::InActive,
                     Value::InActive,
@@ -251,7 +250,7 @@ mod line_request {
             // Reconfigure
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_direction(Direction::Input).unwrap();
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
 
             // The uAPI config has only 10 attribute slots, this should pass.
             for offset in offsets {
@@ -285,10 +284,8 @@ mod line_request {
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.bias().unwrap(), None);
 
-            let request = config.request();
-
             // Reconfigure
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -297,11 +294,11 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.bias().unwrap(), Some(Bias::PullUp));
 
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -310,11 +307,11 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.bias().unwrap(), Some(Bias::PullDown));
 
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -323,7 +320,7 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.bias().unwrap(), Some(Bias::Disabled));
         }
@@ -336,10 +333,8 @@ mod line_request {
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.drive().unwrap(), Drive::PushPull);
 
-            let request = config.request();
-
             // Reconfigure
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -348,11 +343,11 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.drive().unwrap(), Drive::PushPull);
 
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -361,11 +356,11 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.drive().unwrap(), Drive::OpenDrain);
 
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -374,7 +369,7 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.drive().unwrap(), Drive::OpenSource);
         }
@@ -387,10 +382,8 @@ mod line_request {
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.edge_detection().unwrap(), None);
 
-            let request = config.request();
-
             // Reconfigure
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -399,11 +392,11 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.edge_detection().unwrap(), Some(Edge::Both));
 
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -412,11 +405,11 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.edge_detection().unwrap(), Some(Edge::Rising));
 
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
@@ -425,7 +418,7 @@ mod line_request {
                 ])
                 .unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.edge_detection().unwrap(), Some(Edge::Falling));
         }
@@ -438,22 +431,20 @@ mod line_request {
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
 
-            let request = config.request();
-
             // Reconfigure
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_event_clock(EventClock::Monotonic).unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
 
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_event_clock(EventClock::Realtime).unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
-            request.reconfigure_lines(&lconfig).unwrap();
+            config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
             assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
         }
@@ -470,7 +461,7 @@ mod line_request {
             let request = config.request();
 
             // Reconfigure
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_event_clock(EventClock::HTE).unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
@@ -491,7 +482,7 @@ mod line_request {
             let request = config.request();
 
             // Reconfigure
-            let lconfig = line::Config::new().unwrap();
+            let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings
                 .set_prop(&[
diff --git a/bindings/rust/libgpiod/tests/request_config.rs b/bindings/rust/libgpiod/tests/request_config.rs
index 8c67638..d78c4bd 100644
--- a/bindings/rust/libgpiod/tests/request_config.rs
+++ b/bindings/rust/libgpiod/tests/request_config.rs
@@ -27,7 +27,7 @@ mod request_config {
         #[test]
         fn initialized() {
             const CONSUMER: &str = "foobar";
-            let rconfig = request::Config::new().unwrap();
+            let mut rconfig = request::Config::new().unwrap();
             rconfig.set_consumer(CONSUMER).unwrap();
             rconfig.set_event_buffer_size(64);
 
-- 
2.37.2

