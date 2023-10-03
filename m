Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528737B65A1
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 11:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbjJCJkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 05:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239587AbjJCJkO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 05:40:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A84AC
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 02:40:09 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9a9cd066db5so123358066b.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696326008; x=1696930808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjdE/xPloOMKb9spIrzBpu7eiKhwqgXm3YpYHDI65Uc=;
        b=q60SaHE9v0btRqpHzkKPn3tdu0RZUpv57M/lGQ9HiV4iSdyv7BtBf+FDZ/O5O+8xXR
         +8j8fE3LKDuIWPinJxQ+Ohf1xDS/Hl/C7c6r816Pyf0ozd1KEAG1sCA7QtCipkvohxnX
         q1QtuhWo1BA4q9TBGC0kYlJdl+o9dZ3gFtdMjhTA9mQWJRCzzEPuVn0uMoeE9KIsD9D4
         WHO6fBkWg7YV1blpHlAe4HxbgaeD5gvWv9pUrARPJQVvpLZYao8NmKe7iMOBvWF7blKQ
         xZ+F/FVws+Z34vYk2MbUPlKnAvW58mHBhs8Mb3ni/i6QA3bDneKRkuv/pPlLMsW+qbWR
         +rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696326008; x=1696930808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjdE/xPloOMKb9spIrzBpu7eiKhwqgXm3YpYHDI65Uc=;
        b=H2sa8TcyhwR49CZMdLkm5IEOaehVQhlM5o3pwI8gO1wsfuFv8EEIMbxe4KAnfIR7z6
         jAA6Clg/Ur271Ly6QA2RkCfC2cZk43iAqzD2NM7cYsHNHzO0if4tLHCeUUPNptlyUhRX
         ZUQ7qpp3LM0jy0fVgXyjIQMQLqktUFP8KRluLYSEL/Cm7EW7W0QfDQAlQCKnWYFwsa3H
         8bomw/sKHWlw1SF2ab19viPeyPrEt4bp4O3ph20T4FgxaK3W1p4tpFNhEDBfEiR2GUHL
         0vPra+tpySSu/CRXV0GKoA+HJ+LGDFcUGGfPWUr080b0tYD1e7iv5ydfcHibunSQIaHl
         9iUQ==
X-Gm-Message-State: AOJu0Ywj/VgdfCpo5b+FKiVTKFCn0nUGp0vLYl8jQyFGqv6iArHOBcIf
        oVskg29cX5ZIpEd/mgkkptGQsrk93JcCd49HuNQ=
X-Google-Smtp-Source: AGHT+IEI6oaP9CTTsHqH+5JnZQudAF1MiEB9S82XpWLQrzzxuXJJWNnBgAlrydzsDIqehTv9t8xAOQ==
X-Received: by 2002:a17:906:3041:b0:9ae:52af:1128 with SMTP id d1-20020a170906304100b009ae52af1128mr13388882ejd.70.1696326008447;
        Tue, 03 Oct 2023 02:40:08 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b0098e2969ed44sm749747ejo.45.2023.10.03.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 02:40:08 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Tue, 03 Oct 2023 11:39:58 +0200
Subject: [libgpiod][PATCH v3 2/3] bindings: rust: rename
 {event,settings}_clone to try_clone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231003-rust-line-info-soundness-v3-2-555ba21b4632@linaro.org>
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
In-Reply-To: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696326006; l=3542;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=thIbjomkx9jSTXRqnoRfUTcCYtXynXlVJrr01JGRz1s=;
 b=m+k8vv251YEEFstS4KvDQ7gJRoIAvUb+0nZX9YD/h+m0LNhDGTgFPZYHctTgTYKz6tYJR+aBr
 OKnv69svkvpAtkycCu1hedk9F4RXFEEl47Ho1mT7j2sz8uA+gz3ZMTi
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

What is getting cloned is already clear from the type. This also aligns
a bit better with similar methods from the `std` crate [1].

[1] https://doc.rust-lang.org/std/index.html?search=try_clone

Link: https://lore.kernel.org/r/CVUKC1HXG1P8.13XIUCCXN95F0@ablu-work
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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
index da22bea..e0ae200 100644
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

