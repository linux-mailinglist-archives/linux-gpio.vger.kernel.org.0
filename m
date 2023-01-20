Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB60D675171
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjATJpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjATJpa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:30 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A529A7AF28
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:29 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso3215739wms.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E17aiASFSVSKOKEmVb0OD2JLFjLlsJTHoTLVMO3XhM=;
        b=VTCBM7SXesl2cA9ZxrOMxD70F20bo37Ws0kI3xmm78rJ7eGW4l4M8Q1caM8IKVUgP3
         7+QPObrq5EGeAubZpWFC3JjeE1kfDiHcphuRQP0xs3Zw43PEIbtUE1z8VH3wHXX52gNV
         yNsYm8fdayc62ZAbXEbvCei/C9MU0WBcTaTPhRCmyvz33Y9c26OjZgjeOujom/qvn7Q/
         QvG7qVHM8v1IyrPkL9d/kPMxUae5PFPTPpWg3eW9I9ghAb1cGWiAu21u6GOKdrshMvnC
         daThZbOUn59iSHpe+3WqFT6nsWWu3CV9ySuNubLND0WVY6fDidVY6k78pSzAnUzwZ+cL
         5G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2E17aiASFSVSKOKEmVb0OD2JLFjLlsJTHoTLVMO3XhM=;
        b=b8Ts4ahcOP0FqV+MFg83m9+YCaxmdVVGP5e0Y7rA1NIdcb/ZkaQKdXuW7Gk5QMHD8O
         QQckFeoLE3HgpKP5PxfjRXlvgEDeRYLrSP1Z24QVpl161NTURLTvtubvKVOzwaqhDDEY
         dLGRG+idm1EQz6yk5rElZibvmced+YeJiVwIueP1gsyXRjGePS5xD+PeKuSk0o4Pu/fX
         o9z/ciXhM2hY86FWGksKxHSglRsj6mqk5SFUl7Yrue8uamJDtab3Seuu/pTLjWSfME7r
         dPxtmjlvzr9sr7U+PIUi7U+hkBDpErJpXbNo+whZNWJQ10XvRV3du0GLIRLVC+mzvc2f
         Ledg==
X-Gm-Message-State: AFqh2kqSYbmPy4aRBtYT+22NpSDMLyPLvTOpJbWEvtthpdQjD2v1h4wv
        DESBbYWsKUSuRNDnj5/YoIu3B8P5EJtvLeJC
X-Google-Smtp-Source: AMrXdXvJzrFWlqCY/PsW4v5t/cEirUiUw7PVs9FBOZ/8gANLjdyO1iWJh7N5lg7qngI5ylCNt1X7lg==
X-Received: by 2002:a05:600c:3488:b0:3d2:370b:97f4 with SMTP id a8-20020a05600c348800b003d2370b97f4mr21916048wmq.16.1674207929189;
        Fri, 20 Jan 2023 01:45:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 8/8] bindings: rust: provide line_config.set_output_values()
Date:   Fri, 20 Jan 2023 10:45:15 +0100
Message-Id: <20230120094515.40464-9-brgl@bgdev.pl>
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

Add a new function to line config allowing to set a list of output values
for requested lines. This works very similarily to the C++ version of the
new C interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/lib.rs           |  1 +
 bindings/rust/libgpiod/src/line_config.rs   | 24 +++++++-
 bindings/rust/libgpiod/tests/line_config.rs | 62 +++++++++++++++++++++
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index a5d018c..f268ceb 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -71,6 +71,7 @@ pub enum OperationType {
     InfoEventGetLineInfo,
     LineConfigNew,
     LineConfigAddSettings,
+    LineConfigSetOutputValues,
     LineConfigGetOffsets,
     LineConfigGetSettings,
     LineRequestReconfigLines,
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 3f42dad..32f057f 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -7,7 +7,7 @@ use std::collections::HashMap;
 
 use super::{
     gpiod,
-    line::{Offset, Settings},
+    line::{Offset, Settings, Value},
     Error, OperationType, Result,
 };
 
@@ -77,6 +77,28 @@ impl Config {
         }
     }
 
+    /// Set output values for a number of lines.
+    pub fn set_output_values(&mut self, values: &[Value]) -> Result<&mut Self> {
+        let mut mapped_values = Vec::new();
+        for value in values {
+            mapped_values.push(value.value());
+        }
+
+        let ret = unsafe {
+            gpiod::gpiod_line_config_set_output_values(self.config, mapped_values.as_ptr(),
+                                                       values.len() as u64)
+        };
+
+        if ret == -1 {
+            Err(Error::OperationFailed(
+                OperationType::LineConfigSetOutputValues,
+                errno::errno(),
+            ))
+        } else {
+            Ok(self)
+        }
+    }
+
     /// Get a mapping of offsets to line settings stored by this object.
     pub fn line_settings(&self) -> Result<HashMap<Offset, Settings>> {
         let mut map: HashMap<Offset, Settings> = HashMap::new();
diff --git a/bindings/rust/libgpiod/tests/line_config.rs b/bindings/rust/libgpiod/tests/line_config.rs
index 92a7af3..96ce127 100644
--- a/bindings/rust/libgpiod/tests/line_config.rs
+++ b/bindings/rust/libgpiod/tests/line_config.rs
@@ -5,9 +5,11 @@
 mod common;
 
 mod line_config {
+    use libgpiod::chip::Chip;
     use libgpiod::line::{
         self, Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value,
     };
+    use gpiosim_sys::Sim;
 
     #[test]
     fn settings() {
@@ -76,4 +78,64 @@ mod line_config {
             SettingVal::OutputValue(Value::Active)
         );
     }
+
+    #[test]
+    fn set_global_output_values() {
+        let sim = Sim::new(Some(4), None, true).unwrap();
+        let mut settings = line::Settings::new().unwrap();
+        settings.set_direction(Direction::Output).unwrap();
+
+        let mut config = line::Config::new().unwrap();
+        config
+            .add_line_settings(&[0, 1, 2, 3], settings)
+            .unwrap()
+            .set_output_values(&[
+                Value::Active,
+                Value::InActive,
+                Value::Active,
+                Value::InActive
+            ])
+            .unwrap();
+
+        let chip = Chip::open(&sim.dev_path()).unwrap();
+        let _request = chip.request_lines(None, &config);
+
+        assert_eq!(sim.val(0).unwrap(), gpiosim_sys::Value::Active);
+        assert_eq!(sim.val(1).unwrap(), gpiosim_sys::Value::InActive);
+        assert_eq!(sim.val(2).unwrap(), gpiosim_sys::Value::Active);
+        assert_eq!(sim.val(3).unwrap(), gpiosim_sys::Value::InActive);
+    }
+
+    #[test]
+    fn read_back_global_output_values() {
+        let mut settings = line::Settings::new().unwrap();
+        settings
+            .set_direction(Direction::Output)
+            .unwrap()
+            .set_output_value(Value::Active)
+            .unwrap();
+
+        let mut config = line::Config::new().unwrap();
+        config
+            .add_line_settings(&[0, 1, 2, 3], settings)
+            .unwrap()
+            .set_output_values(&[
+                Value::Active,
+                Value::InActive,
+                Value::Active,
+                Value::InActive,
+            ])
+            .unwrap();
+
+        assert_eq!(
+            config
+                .line_settings()
+                .unwrap()
+                .get(&1)
+                .unwrap()
+                .output_value()
+                .unwrap(),
+            Value::InActive
+        );
+    }
 }
-- 
2.37.2

