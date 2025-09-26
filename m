Return-Path: <linux-gpio+bounces-26634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54FBA4407
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9F361B22E34
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6901F09B3;
	Fri, 26 Sep 2025 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X5RSxiVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF811D7995
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897360; cv=none; b=ijwTATHPz2+A4r5GGN1kIIveB1G34v2aHresmdpVS0Xifroh4Xt4/+DPlTLWXEFhgiaNjvLVnb6H4igBxCaENwhYofHhsedfAjbaNV4aPnocxN+uDQ+ifYwhsMCLqz1DpuwQhMJzkAJGRngmDqkef1uXhvpa1BFEZbtQAAthNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897360; c=relaxed/simple;
	bh=PV5SKeS+Hh/eg10LGqj51Zx42tjdNozQN7jlVcM9nFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/riaLIUfByzY6iCkuF+wXVypt+/WvqTXntsFEKT+5KAIOljaYbn8gKb4AW86rpJgmrJBovCVjGK/TsZlnOZnInZ+75XHTucDe8bDmJlpZ3TRYibJ61KDkTW/cunarmUyUj22hq/JbbmEFGxlIKUvxTusLSy/gyojUUIPQrwTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X5RSxiVm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46de78b595dso11464285e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758897356; x=1759502156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1lHf8Xgd2U7MwAZNG1fZ8upj+OxLdyiBkbGRoKUVAA=;
        b=X5RSxiVmrKsaI3hRrjelbXAE17Aacx7U/2qPmsFgFRmsttK3TQIUFYiMa7ONejSIMM
         LZVMoq7h0+KC8g+W4ZOhEizCThhD0ChqZcHfbcOpLu6ytYBiQ27wKwbW7A0cyGtjQgz7
         YuAwOb1/a6+gVoRJYtYnGFwlbrYhX1wKaXdUgqrHbpadZ7Kxf8iW9aBok0aLzTAH4tJE
         vSpg9OV7sM3r5sBpOFDiZlCzQhgphj5Vkt/OAXXcdVwkfHKyyEKFX8Zvn2VsY4TxzT0K
         vZX5YyIYyBVQCJ9q9RowOj467UVdJii7UBNqXhVqRZTwd8AaMuiFgyyhMLpokJM478Ik
         XGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758897356; x=1759502156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1lHf8Xgd2U7MwAZNG1fZ8upj+OxLdyiBkbGRoKUVAA=;
        b=YwK34Os9zfEVdQbGoQVDSmWzHvJguEZoqQ6JgiHvezqV9Djh2ZMyL6LMBtYYqrlxKR
         Hn7Ozou40DKaQABKty0m8FkuR8qaJFy8kZqUOBaHsPHETCj4GFtSDN/ma5o3shdfa0Aq
         Qu7HNUFm0ihz/Q1Q5QIEexOqpBoYGsBxu+fpOZk2BbeXzgyDeMUWUg2XPBbQDtqjPcXj
         A4d+ntTpoemIy0HHWiOHlwvVvCypHm57HKSj939EcRu420AgEY4ziaKWIgiHq52KIOjm
         639c7w/ydclOHEVQJn+MbXL5uaGzU8HuyOdkVrqDRVkv8uhINihaQ8MgNTFA61DRSd1W
         p5Jg==
X-Gm-Message-State: AOJu0YxlBf62PhCiM4n42TGnT4+Mg5sfkQdaeTR01DFZQjNYsD8fQb+a
	0DWZWKTdpjlglTV/EBRTnFE3SUUQ8/U7tGyKkMFVQo0my5dXWxmrlAJlEKk8fWj9Wdk=
X-Gm-Gg: ASbGncskg2bOiVl4+7zQ1W1aQ9XVTySzrCBj5WiHsAzfrNAdLodbXiVncfV1cjZqu36
	/i4eTiPiVKsEas8udt5pbSMhfhb4FI0RaSfTIRBuq3zRTHM4589dmtz3JErylau2ghPwFRab9x4
	BkU7wZV4kIGozblglarLn4zvvpniIbkmZP8GYUyniJ6sW1e9vk8hA4F2MmYdngAmtQa95TqyE1F
	AZXU3p1NxSa1nZWKeb/32ysDcbdnesIyMdX7YKJ2wTKkQWGLqBy6SO8G0IzbgwyJa9/TH9iaMdG
	WO1tBfVF0vgq6Otxy4MrMzA1+ESBRWDJgWPqE2uBZ/9zFsd3Q2GI+P3OvoenNoIqiY7V0ta+6m+
	YjdUQDp/cir6jsLL+
X-Google-Smtp-Source: AGHT+IGUoEOiutXlwC4EZkRvNZ/p7/MndUOArLvGOMu77jC4Of3Nnvp9j4Fd2Av4xIzJav9KX1hoew==
X-Received: by 2002:a05:600c:4709:b0:46e:3c29:ce9d with SMTP id 5b1f17b1804b1-46e3c29cf81mr24777945e9.32.1758897356068;
        Fri, 26 Sep 2025 07:35:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm7515317f8f.62.2025.09.26.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:35:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 26 Sep 2025 16:35:42 +0200
Subject: [PATCH libgpiod 1/3] bindings: rust: complete the unification of
 exports in examples
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-rust-release-tweaks-v1-1-beae932eb691@linaro.org>
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
In-Reply-To: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
To: Erik Wierich <erik@riscstar.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10997;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4R1x4L2pNWgTp0E7jHqHmvFa0f56CuZ0ldC0ZhvTON0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1qTJXg9VM3ttSjMzGhynO4AY/C0ZPaVTcxZfN
 mDXLv7S1DWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNakyQAKCRARpy6gFHHX
 ciedD/4yKgLimIiDOf2DqRRGhLLxqCuCZududIkUxiE6kJVtvXKMFm67bFk/iRahk1mdrLMFNpt
 g1qXtxm98FD8Gb+A4RpR6UZ3+Vt+sq8tRv3PSImERgL99g5lkluA5reM+ywSGzCh11d/lZOxcRZ
 TW3Vtthj17N0aWHyIuZp+GjP3NY0fTdWc9tv9FxMj3QtG6jlYxQholyZd1uxgvwFs8mCxRjTf1h
 57HkktFtPGTOq3bpk6y0nLdgpSFmgovVvsaYRWZftJzHOBnfwgh7QSPC84mTjzrenTrUf7nH2qw
 4vdfdiW9NuXgxmzH3HVdcKDKSq1iNqJbIQ6q0kEcsjMaKBfbnluDBzAlK0ik93lAtmZjYv6J0Hg
 A2o6EMwyR8C0hZhKPiQI0aa07/tCN2PTNFkvnCYbqGUQI0+/MQ5Y92Fl0NzzinTRokniEYdvhTu
 C/c6K1inFxh2WC3psEsvBYI+7G58KepFBz/CJMpiuzpPB/7vjJCjlwu0dlnXkVJ2BUmf7iAWYOt
 wa+hV/YvM9FoXZnwwQaqzIgwAyNQbJp5jVbJ1pvrXOaQIshQC8Hqcd6FBFRQpNs8WVrhI8sWqhy
 6hi1q+XCaq26vSgjMjN+MjbiqVKk0NxRgwdax4KG9AC3TF8JYQiMLGny1WXY59HJxPzw0myP7fs
 gPK3cu8LwWr2ZsQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit cd32f27dd550 ("bindings: rust: unify imports in examples") failed
to consistently unify the code across all examples so finish the
process.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../rust/libgpiod/examples/toggle_line_value.rs    | 17 +++++++++------
 .../examples/toggle_multiple_line_values.rs        | 17 +++++++++------
 .../rust/libgpiod/examples/watch_line_rising.rs    | 23 ++++++++++++--------
 .../rust/libgpiod/examples/watch_line_value.rs     | 25 +++++++++++++---------
 .../examples/watch_multiple_line_values.rs         | 18 +++++++++-------
 5 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/toggle_line_value.rs b/bindings/rust/libgpiod/examples/toggle_line_value.rs
index 8d34c5fa18746bc89fe6597f22a77c000a6b49c6..33b17d5a36364f4a0e9e93c0f68570f764fc31a4 100644
--- a/bindings/rust/libgpiod/examples/toggle_line_value.rs
+++ b/bindings/rust/libgpiod/examples/toggle_line_value.rs
@@ -5,9 +5,12 @@
 
 use core::time::Duration;
 use libgpiod::{
-    line::{self, Value},
+    chip::Chip,
+    line::{Config as LineConfig, Direction, Settings, Value},
+    request::Config as ReqConfig,
     Result,
 };
+use std::thread::sleep;
 
 fn toggle_value(value: Value) -> Value {
     match value {
@@ -22,23 +25,23 @@ fn main() -> Result<()> {
     let line_offset = 5;
     let mut value = Value::Active;
 
-    let mut settings = line::Settings::new()?;
+    let mut settings = Settings::new()?;
     settings
-        .set_direction(line::Direction::Output)?
+        .set_direction(Direction::Output)?
         .set_output_value(value)?;
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig.add_line_settings(&[line_offset], settings)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("toggle-line-value")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let mut req = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     loop {
         println!("{line_offset}={value:?}");
-        std::thread::sleep(Duration::from_secs(1));
+        sleep(Duration::from_secs(1));
         value = toggle_value(value);
         req.set_value(line_offset, value)?;
     }
diff --git a/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
index e15b09392ccbf38d99a1aa591c6022fab64f7ecf..3572deb19734146c4727e05a5273b6ec52fa14e8 100644
--- a/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
@@ -5,9 +5,12 @@
 
 use core::time::Duration;
 use libgpiod::{
-    line::{self, Offset, Value},
+    chip::Chip,
+    line::{Config as LineConfig, Direction, Offset, Settings, Value},
+    request::Config as ReqConfig,
     Result,
 };
+use std::thread::sleep;
 
 fn toggle_value(value: Value) -> Value {
     match value {
@@ -35,23 +38,23 @@ fn main() -> Result<()> {
     let line_offsets = [5, 3, 7];
     let mut values = vec![Value::Active, Value::Active, Value::InActive];
 
-    let mut lsettings = line::Settings::new()?;
-    lsettings.set_direction(line::Direction::Output)?;
+    let mut lsettings = Settings::new()?;
+    lsettings.set_direction(Direction::Output)?;
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig
         .add_line_settings(&line_offsets, lsettings)?
         .set_output_values(&values)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("toggle-multiple-line-values")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let mut req = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     loop {
         print_values(&line_offsets, &values);
-        std::thread::sleep(Duration::from_secs(1));
+        sleep(Duration::from_secs(1));
         toggle_values(&mut values);
         req.set_values(&values)?;
     }
diff --git a/bindings/rust/libgpiod/examples/watch_line_rising.rs b/bindings/rust/libgpiod/examples/watch_line_rising.rs
index 00e65f0e9df3cf73613f71173bcc8c1f6beb5ae5..77434ae89d3ca76e1686d6debddd88141a3dda08 100644
--- a/bindings/rust/libgpiod/examples/watch_line_rising.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_rising.rs
@@ -3,28 +3,33 @@
 //
 // Minimal example of watching for edges on a single line.
 
-use libgpiod::{line, Result};
+use libgpiod::{
+    chip::Chip,
+    line::{Config as LineConfig, Edge, EdgeKind, Settings},
+    request::{Buffer, Config as ReqConfig},
+    Result,
+};
 
 fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
 
-    let mut lsettings = line::Settings::new()?;
-    lsettings.set_edge_detection(Some(line::Edge::Rising))?;
+    let mut lsettings = Settings::new()?;
+    lsettings.set_edge_detection(Some(Edge::Rising))?;
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig.add_line_settings(&[line_offset], lsettings)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("watch-line-value")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     // A larger buffer is an optimisation for reading bursts of events from the
     // kernel, but that is not necessary in this case, so 1 is fine.
-    let mut buffer = libgpiod::request::Buffer::new(1)?;
+    let mut buffer = Buffer::new(1)?;
     loop {
         // blocks until at least one event is available
         let events = request.read_edge_events(&mut buffer)?;
@@ -34,8 +39,8 @@ fn main() -> Result<()> {
                 "line: {}  type: {:<7}  event #{}",
                 event.line_offset(),
                 match event.event_type()? {
-                    line::EdgeKind::Rising => "Rising",
-                    line::EdgeKind::Falling => "Falling",
+                    EdgeKind::Rising => "Rising",
+                    EdgeKind::Falling => "Falling",
                 },
                 event.line_seqno()
             );
diff --git a/bindings/rust/libgpiod/examples/watch_line_value.rs b/bindings/rust/libgpiod/examples/watch_line_value.rs
index 3df5a2bec2910a96d36da989b34624e2f669394c..3d5bc86724e316077bfb24b8fbf4f2365bb429ab 100644
--- a/bindings/rust/libgpiod/examples/watch_line_value.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_value.rs
@@ -3,7 +3,12 @@
 //
 // Minimal example of watching for edges on a single line.
 
-use libgpiod::{line, Result};
+use libgpiod::{
+    chip::Chip,
+    line::{Bias, Config as LineConfig, Edge, EdgeKind, Settings},
+    request::{Buffer, Config as ReqConfig},
+    Result,
+};
 use std::time::Duration;
 
 fn main() -> Result<()> {
@@ -11,26 +16,26 @@ fn main() -> Result<()> {
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
 
-    let mut lsettings = line::Settings::new()?;
+    let mut lsettings = Settings::new()?;
     // Assume a button connecting the pin to ground,
     // so pull it up and provide some debounce.
     lsettings
-        .set_edge_detection(Some(line::Edge::Both))?
-        .set_bias(Some(line::Bias::PullUp))?
+        .set_edge_detection(Some(Edge::Both))?
+        .set_bias(Some(Bias::PullUp))?
         .set_debounce_period(Duration::from_millis(10));
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig.add_line_settings(&[line_offset], lsettings)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("watch-line-value")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     // A larger buffer is an optimisation for reading bursts of events from the
     // kernel, but that is not necessary in this case, so 1 is fine.
-    let mut buffer = libgpiod::request::Buffer::new(1)?;
+    let mut buffer = Buffer::new(1)?;
     loop {
         // blocks until at least one event is available
         let events = request.read_edge_events(&mut buffer)?;
@@ -40,8 +45,8 @@ fn main() -> Result<()> {
                 "line: {}  type: {:<7}  event #{}",
                 event.line_offset(),
                 match event.event_type()? {
-                    line::EdgeKind::Rising => "Rising",
-                    line::EdgeKind::Falling => "Falling",
+                    EdgeKind::Rising => "Rising",
+                    EdgeKind::Falling => "Falling",
                 },
                 event.line_seqno()
             );
diff --git a/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
index 81d211784d4929eb925231d05199a61a24816d74..10079ac8cc0da733adeadefd101455c046eaa7fd 100644
--- a/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
@@ -4,8 +4,10 @@
 // Minimal example of watching for edges on multiple lines.
 
 use libgpiod::{
-    line::{self, EdgeKind},
-    request, Result,
+    chip::Chip,
+    line::{Config as LineConfig, Edge, EdgeKind, Settings},
+    request::{Buffer, Config as ReqConfig},
+    Result,
 };
 
 fn main() -> Result<()> {
@@ -13,19 +15,19 @@ fn main() -> Result<()> {
     let chip_path = "/dev/gpiochip0";
     let line_offsets = [5, 3, 7];
 
-    let mut lsettings = line::Settings::new()?;
-    lsettings.set_edge_detection(Some(line::Edge::Both))?;
+    let mut lsettings = Settings::new()?;
+    lsettings.set_edge_detection(Some(Edge::Both))?;
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig.add_line_settings(&line_offsets, lsettings)?;
 
-    let mut rconfig = request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("watch-multiple-line-values")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
-    let mut buffer = request::Buffer::new(4)?;
+    let mut buffer = Buffer::new(4)?;
     loop {
         // Blocks until at least one event is available.
         let events = request.read_edge_events(&mut buffer)?;

-- 
2.48.1


