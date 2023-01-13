Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9ED66A56B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjAMVwj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjAMVwf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:35 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A720489BE3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:34 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so3936903wms.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQcLeZIkcK2mK3eX1QbdQa48abhjGftWAhXaMFjukPc=;
        b=aQ+rFbitz6NDPCMORsc7vtSasntegG+7mknPc/BxyPuXTQ6qeC8CoZdRFjdKhu9lRJ
         nvD9zFSEY3HRkDCYuXG2oG+q4D95rL439h0MLlhwoVqAP3a0DBxqAit/ezclu7iEzwTu
         1XzpbgqMe2vpdtK1ABhXqWqcf1mPWgv8gGp+JQARAQ0x3AZd9Ptgx8ZCj0C8dKQTn+dL
         e9sk3Vr/4D6Zdy/FUCyiDVMn6j9IatJsyHFQeU5GZc/XFvA0AGn+Zuj7nRsw3vA52xY+
         R7PypL6vtvzOJWLtKv0hF8EeGfcO77tqwVE1ijnZiPoN6t+fVCT0KvF7Hg2iRODWpD0h
         VAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQcLeZIkcK2mK3eX1QbdQa48abhjGftWAhXaMFjukPc=;
        b=cE9zU73jK+EEtd/8+gsbc+LyAL+AekpicKEnTAhSafhsN0rgyOtYnBLdxJt/3Rj1tn
         eLzSu0H2e7qsurqf/gx6HvlBhWQtmQT0MwisV7stgmm/0P14uZigb1A2TUNJcXcDSXrf
         PsueVXSSli3GDR7Vryl/XQR59c0lpzy+FsDs3cqPxo+hpI5kWmJuUJpzThK+mTOD1GdF
         J0hA5gTTa/vHw1qjg+cynw334Hre19gUbqzV+Y49xh2SeRFNHjxGnDzTx7KNXsNpcAoZ
         3sDGAwOt1ClLfZ9A/9dn4BKSkjeoSAvM50xaK1kli9BF2T6kHWfuQGnTTLtyN5Da7J+w
         kBXQ==
X-Gm-Message-State: AFqh2kp9gyPRkYWq1MI8Fb991fyqN+E1v3dsaYRefJuzBpoNohmzFlwB
        rdF6Zq6A+gIl3gBP8NkbQ9Be0g==
X-Google-Smtp-Source: AMrXdXuHg/ow3Au/0tyZ3Z39e4trXOLaOr5WZRjHnT0fJ3gQrNnCvCGQSDbIu6ud5oYXc84gXA0NlA==
X-Received: by 2002:a05:600c:3b14:b0:3cf:d18e:528b with SMTP id m20-20020a05600c3b1400b003cfd18e528bmr906746wms.39.1673646753212;
        Fri, 13 Jan 2023 13:52:33 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:32 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 16/16] bindings: rust: provide line_config.set_output_values()
Date:   Fri, 13 Jan 2023 22:52:10 +0100
Message-Id: <20230113215210.616812-17-brgl@bgdev.pl>
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
index 2169bf1..b276cf0 100644
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

