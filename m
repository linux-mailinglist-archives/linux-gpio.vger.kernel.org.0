Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2963E73AF83
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjFWEkd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFWEkb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:40:31 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09CC2126
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:40:30 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-25695bb6461so1017059a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495230; x=1690087230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aicv3iSaSdW9gNmipfOFxBBI9tBLPlse2rRBJRUbMeA=;
        b=AaZknz7SMHmWuWa6UKsYvLuWLk6xPlgbC7J9gHd8Zmm2FNjSd/mR83kohGW0BNBl4z
         s3TWjeLITBJkFcwmW/jRQVO475SqX1WK+IT9zj7PMoAoHH/bqOUguH6amLq8jtoVBgSn
         YHaQMREdaP+bstufwjd//bKXc/rbjiO4HiyVK0npU6oBXzBnnJaqphueWMUZufOuPngF
         cPCJTh8K8q6iOClSdtreqEzycWFZH4XVTs374DkpTq6Ef+ekqv0Q9aXO1tsdObzSTGyq
         F2SJ8C2kg5BtvM5C81U3TieRuCarR12yVJhFmZ3dtFIDpDK8y8iK57WGZA0GEjcaqOvw
         7zqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495230; x=1690087230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aicv3iSaSdW9gNmipfOFxBBI9tBLPlse2rRBJRUbMeA=;
        b=a0FfeOFZziV497fWIXuj37kp9oHtcl4HcqRwU0Nf5Pv+gUIKqD2EqeNyAKyRYUGeOq
         sqxMr4lgrPtAtFJwdzijwL6rLEvESlZssoZHXQmlT/ZujewQzm2AuM2HcldSpoYGu6+v
         A7uLZZZydNQ15VLPSWm0G0Xi69T3aYGeJTAwUZd3ai2Ej0/VB+uN3n23QwJ71EdRAbH2
         zLp+vtB2sgS5KH0XwZd7cm7w4z1cRwvcanB0bl9kyMp/2xzuyhr18utKTGsA7A6mjX4G
         Cy9Uwac487aH3xcWvj2+l9FWqG510koSZ0yu1zo6A8DTe19jz0opyIe5BMKe+worQkCc
         Z8PA==
X-Gm-Message-State: AC+VfDwcUEkd7jmzjbbMiqOL+xf676fFD+dXuq3F8DtECvfTJlkYE4jn
        /YAKIPAiIJYEOlxjy8MWwk2U7eHp44E=
X-Google-Smtp-Source: ACHHUZ6d4av/ZP/porE8MMvDAEl6fb2rBa0BM9FEy+U4g1+Zz2fyrHwt9MT2GOUHxEJ0OuHGeeRq5A==
X-Received: by 2002:a17:90a:6286:b0:25e:b5d4:a156 with SMTP id d6-20020a17090a628600b0025eb5d4a156mr28140822pjj.2.1687495230091;
        Thu, 22 Jun 2023 21:40:30 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:40:29 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 7/8] bindings: rust: examples: consistency cleanup
Date:   Fri, 23 Jun 2023 12:39:00 +0800
Message-ID: <20230623043901.16764-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
References: <20230623043901.16764-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A collection of minor changes to be more consistent with other examples:
 - capitalize comments
 - add line offset to value outputs
 - drop comma from edge event outputs

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../rust/libgpiod/examples/get_line_value.rs    |  4 ++--
 .../rust/libgpiod/examples/toggle_line_value.rs | 17 ++++++++---------
 .../rust/libgpiod/examples/watch_line_value.rs  | 10 +++++-----
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/get_line_value.rs b/bindings/rust/libgpiod/examples/get_line_value.rs
index 732fb71..39141e2 100644
--- a/bindings/rust/libgpiod/examples/get_line_value.rs
+++ b/bindings/rust/libgpiod/examples/get_line_value.rs
@@ -6,7 +6,7 @@
 use libgpiod::line;
 
 fn main() -> libgpiod::Result<()> {
-    // example configuration - customize to suit your situation
+    // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
 
@@ -23,6 +23,6 @@ fn main() -> libgpiod::Result<()> {
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     let value = request.value(line_offset)?;
-    println!("{:?}", value);
+    println!("{}={:?}", line_offset, value);
     Ok(())
 }
diff --git a/bindings/rust/libgpiod/examples/toggle_line_value.rs b/bindings/rust/libgpiod/examples/toggle_line_value.rs
index cd7038e..6d5f697 100644
--- a/bindings/rust/libgpiod/examples/toggle_line_value.rs
+++ b/bindings/rust/libgpiod/examples/toggle_line_value.rs
@@ -3,22 +3,21 @@
 //
 // Minimal example of toggling a single line.
 
-use libgpiod::line;
-use std::time::Duration;
+use core::time::Duration;
+use libgpiod::line::{self, Value};
 
-fn toggle_value(value: line::Value) -> line::Value {
+fn toggle_value(value: Value) -> Value {
     match value {
-        line::Value::Active => line::Value::InActive,
-        line::Value::InActive => line::Value::Active,
+        Value::Active => Value::InActive,
+        Value::InActive => Value::Active,
     }
 }
 
 fn main() -> libgpiod::Result<()> {
-    // example configuration - customize to suit your situation
+    // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
-
-    let mut value = line::Value::Active;
+    let mut value = Value::Active;
 
     let mut settings = line::Settings::new()?;
     settings
@@ -35,7 +34,7 @@ fn main() -> libgpiod::Result<()> {
     let mut req = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     loop {
-        println!("{:?}", value);
+        println!("{}={:?}", line_offset, value);
         std::thread::sleep(Duration::from_secs(1));
         value = toggle_value(value);
         req.set_value(line_offset, value)?;
diff --git a/bindings/rust/libgpiod/examples/watch_line_value.rs b/bindings/rust/libgpiod/examples/watch_line_value.rs
index 5a95b6a..3bf40af 100644
--- a/bindings/rust/libgpiod/examples/watch_line_value.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_value.rs
@@ -7,12 +7,12 @@ use libgpiod::line;
 use std::time::Duration;
 
 fn main() -> libgpiod::Result<()> {
-    // example configuration - customize to suit your situation
+    // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
 
     let mut lsettings = line::Settings::new()?;
-    // assume a button connecting the pin to ground,
+    // Assume a button connecting the pin to ground,
     // so pull it up and provide some debounce.
     lsettings
         .set_edge_detection(Some(line::Edge::Both))?
@@ -28,7 +28,7 @@ fn main() -> libgpiod::Result<()> {
     let chip = libgpiod::chip::Chip::open(&chip_path)?;
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
-    // a larger buffer is an optimisation for reading bursts of events from the
+    // A larger buffer is an optimisation for reading bursts of events from the
     // kernel, but that is not necessary in this case, so 1 is fine.
     let mut buffer = libgpiod::request::Buffer::new(1)?;
     loop {
@@ -37,10 +37,10 @@ fn main() -> libgpiod::Result<()> {
         for event in events {
             let event = event?;
             println!(
-                "line: {}, type: {}, event #{}",
+                "line: {}  type: {:<7}  event #{}",
                 event.line_offset(),
                 match event.event_type()? {
-                    line::EdgeKind::Rising => "Rising ",
+                    line::EdgeKind::Rising => "Rising",
                     line::EdgeKind::Falling => "Falling",
                 },
                 event.line_seqno()
-- 
2.41.0

