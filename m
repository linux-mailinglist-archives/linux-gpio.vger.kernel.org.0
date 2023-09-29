Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2F27B3350
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 15:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbjI2NSZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 09:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbjI2NSY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 09:18:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438BE1AC
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:18:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9a64619d8fbso1921097466b.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695993501; x=1696598301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRn42sMlLcAqn5yMX1PI4XNkolBHdvIATUS8RBoa5YM=;
        b=cCYhEJMrH6YNVEJSRjFZN0y0Ww5MBTScQgoJWMj0rYJFSlQJHvuV1zQWeTBkylolMq
         oP1bEYDorTNs9e3GlwzjiQvoTeB1quRO46AldZXhVCrllH1zZAt8l3sylACkjVxC5HfQ
         Hf9Olki5iaswyZaROXouDP1teKyjPlx+bbzVZWpPAMYM9dtRLCxNxS7uWhH9wAqVUv/1
         2tPmvhGrbwAvjLLf654kkHi6ITa5TPca8MJGffXEZIpVwSsGcYCQEjESPOssSk2IAlyJ
         o5SoUJrw8SBP+5W/PS5cP1t1kpaevR128mDwdSEp2jQ+JNDhHgyXcv7O/LFRvdoNeUwd
         sMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695993501; x=1696598301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRn42sMlLcAqn5yMX1PI4XNkolBHdvIATUS8RBoa5YM=;
        b=ofgZIu3zPhdGviPXFPU3oufygws81vOAcmjidfP1EWD5ka12aLpY8LjtFBVtL52LEh
         DVwi9q3XxZnS+tNKciY14rX5tgj3f5N+on8DZQlmtS2Twv9ZH1j2vjprV+CKMcuUdlqt
         x5bUIkajWAs0SINAeExwAQAppj46X4BCBrmMkGEmtl1fte3lyO7m+PsPj0GQB4wAQx9z
         ZbWFKHg/E4UlGngneiIMA7CaYErbAa8+Cw579bZLTti28QvkN98MQLuY2PRkPq0YwMrY
         pcwtPqLPCnbKumLUHdYWxhCeIglI6sUrNROSvGVfuGJzOVRdaKJ8kHPf7cdi1rKBgbOd
         h3fg==
X-Gm-Message-State: AOJu0Yz5oUcb8LL1SUutVB3AwnmDseQgFHzLqNibSvfyEu49S1wnu85o
        2Siwe059HtcJ3wLXt02Rl6xAp/g4oS8QN3OCXEk=
X-Google-Smtp-Source: AGHT+IGZHUP9duE5F0bpuFvI0GVcoIWe0I7Hn49cqVwNhiqt1i4hz3wKufXfE4yrdOPMvm6iu8qkPg==
X-Received: by 2002:a17:906:9c9:b0:9a5:c4c0:2d8a with SMTP id r9-20020a17090609c900b009a5c4c02d8amr3539917eje.24.1695993500637;
        Fri, 29 Sep 2023 06:18:20 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id ck17-20020a170906c45100b00992e14af9c3sm12510086ejb.143.2023.09.29.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:18:20 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 29 Sep 2023 15:18:16 +0200
Subject: [libgpiod][PATCH v2 2/3] bindings: rust: rename
 {event,settings}_clone to try_clone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-rust-line-info-soundness-v2-2-9782b7f20f26@linaro.org>
References: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
In-Reply-To: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695993498; l=3492;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=74mM/rOYixRKJAgPFvu7pOERfZFDGCmE5T2ja0svTn8=;
 b=l1WfuJzRZQ22D/d+oNAmA6+aiU9UVU6H4ArY8zzKSenyXQBtkmiTcuBgce81I7/6BiuCp+oqZ
 GMKDyOlcAGoAtd7Y5ZQFDIs1m/D0zTMQmUZNALowTn2yY3imDiiJILT
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

What is getting cloned is already clear from the type. This also aligns
a bit better with similar methods from the `std` crate [1].

[1] https://doc.rust-lang.org/std/index.html?search=try_clone

Link: https://lore.kernel.org/r/CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs | 2 +-
 bindings/rust/libgpiod/src/edge_event.rs                    | 3 ++-
 bindings/rust/libgpiod/src/line_settings.rs                 | 4 ++--
 bindings/rust/libgpiod/tests/line_request.rs                | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
index ad90d7b..8dbb496 100644
--- a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
+++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
@@ -34,7 +34,7 @@ fn main() -> libgpiod::Result<()> {
         let event = events.next().unwrap()?;
 
         // This will out live `event` and the next read_edge_events().
-        let cloned_event = libgpiod::request::Event::event_clone(event)?;
+        let cloned_event = libgpiod::request::Event::try_clone(event)?;
 
         let events = request.read_edge_events(&mut buffer)?;
         for event in events {
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index 0c0cfbc..4c940ba 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -25,7 +25,8 @@ use super::{
 pub struct Event(*mut gpiod::gpiod_edge_event);
 
 impl Event {
-    pub fn event_clone(event: &Event) -> Result<Event> {
+    /// Makes a copy of the event object.
+    pub fn try_clone(event: &Event) -> Result<Event> {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
         let event = unsafe { gpiod::gpiod_edge_event_copy(event.0) };
         if event.is_null() {
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index f0b3e9c..41b27e2 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -52,8 +52,8 @@ impl Settings {
         unsafe { gpiod::gpiod_line_settings_reset(self.settings) }
     }
 
-    /// Makes copy of the settings object.
-    pub fn settings_clone(&self) -> Result<Self> {
+    /// Makes a copy of the settings object.
+    pub fn try_clone(&self) -> Result<Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         let settings = unsafe { gpiod::gpiod_line_settings_copy(self.settings) };
         if settings.is_null() {
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index 9af5226..8731719 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -272,7 +272,7 @@ mod line_request {
             for offset in offsets {
                 lsettings.set_debounce_period(Duration::from_millis((100 + offset).into()));
                 lconfig
-                    .add_line_settings(&[offset as Offset], lsettings.settings_clone().unwrap())
+                    .add_line_settings(&[offset as Offset], lsettings.try_clone().unwrap())
                     .unwrap();
             }
 

-- 
2.41.0

