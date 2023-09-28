Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82EE7B1FD4
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 16:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjI1Ohj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 10:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjI1Ohi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 10:37:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E53E19D
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:37 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-534659061afso7021584a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695911855; x=1696516655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5BxhjMaBD9Q6vKzv0NJ0uo9X/jQrD+Md0yYIciYwbo=;
        b=sk43Y3Cc861o1ngmJtNmNoa4PHRrPLdjVBOdj7MXIPHRP3XWwmuKgE3FSUAULrfoR/
         y8K47HOYBYQSS7SWXdagQnD5KZdRmYLVqXp7OJrOFwsRt/x3Cr36wyRh1XhIeffTQB29
         XMyrhGgBc85llk0c4wlO3bQJmXK8bscQnC7S1A5ukPkgQD7SnyUCAun+WDMJJ82KtIoy
         mcgSi9Laf+vrYLO3a5VoX/zpONKUf6nbD9oPHF7CNlTmSb0PT1Ng/0g88KHdn9PpLCD4
         DHS5bL/uKGnR1/Cps2P0EwyMDmFaW5ibDPsVsdeyp6W0RudjQTLQ2UEUqf3R9u2WVyxj
         B43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695911855; x=1696516655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5BxhjMaBD9Q6vKzv0NJ0uo9X/jQrD+Md0yYIciYwbo=;
        b=SiJ8DAXfKGUt1oeh40YUaiDBDjwe3vsNF6IB+5LYVKDHCfv0ZD1S5eWihrUrGDMsmw
         dhC493Qwp2ABMrpqrW8gYbY+QLnVjQZi7YfC597HNcRngVZfZPLsBHFVc1eZQDOsvDrV
         ET0paGzPvX+pt5r391r8uRQQkmZrBLqpZvv57i+Hejvm5CkMTlnzgWMak3BPfPlf6K0t
         CR81Y+3pACFPOlGL+SP6LTz44Y8DmbJAc6RRiO+ibiaq9uhEbEhZ0kNRM3PyqRpBE1Xt
         zA095ODXhUwD3Wg30Sqtf99fiV/Y7wDabY+/tKRBIP1jy6Jkbdx6wL19eEtjrjw5trbE
         r/cQ==
X-Gm-Message-State: AOJu0YxemizkA6TQ7sfejd/pEF2OdWTMqqnrvlro/rllnGbWamf6mzhS
        /XRT39ZD9heQZ/8BubH3vKHIXg==
X-Google-Smtp-Source: AGHT+IFVe0qStMR5EZPqdBbCqRrLHqdaysAGC2AsTmAGKsJ2QAFGUhIm1TXERDEE84301ExbYGDm/g==
X-Received: by 2002:aa7:de09:0:b0:533:4d45:36ad with SMTP id h9-20020aa7de09000000b005334d4536admr1544569edv.11.1695911855361;
        Thu, 28 Sep 2023 07:37:35 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d68f000000b005333922efb0sm9789688edr.78.2023.09.28.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 07:37:34 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 28 Sep 2023 16:37:30 +0200
Subject: [libgpiod][PATCH 3/3] bindings: rust: mark all owning types as
 `Send`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-rust-send-trait-v1-3-30b4f59d13cb@linaro.org>
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
In-Reply-To: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695911851; l=6050;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=DQjcV18Zzml7GwrqlL1NGFIcqUrahm+fL8twaU6BToA=;
 b=QBbrY83HMRAeGnyyupgg7o4aEZ8w0AGTkPiJ5CY0WhK9ee+kPm1LqJ22PisOIizbZylkTFKip
 AXQ73gjgOrqCNpzoHqsld/YLgumernfbuBOuCnyKJ+iIeZ41RgILe4k
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

The thread-safety rules of libgpiod allow individual object instances to
be used from different threads. So far, this was not actually possible
with the Rust bindings. Not being `Send` disallowed the user to transfer
the ownership to different threads.

Rust also has a `Sync` marker. That one would even allow sending
references of objects to other threads. Since we wrap a lot of C
functions with `fn foo(&self)` signatures, that would not be safe.
libgpiod does not allow concurrent API calls to the same object instance
- which Rust would allow for read-only references. Thus, we do not
define that one.

Chip was already modeled correctly.

line::Info is not marked as Send since it may either be owning or non-
owning. That problem is fixed as part of a separate pull request [1].

[1] https://lore.kernel.org/r/20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org

Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/edge_event.rs     | 4 ++++
 bindings/rust/libgpiod/src/event_buffer.rs   | 8 ++++++++
 bindings/rust/libgpiod/src/info_event.rs     | 4 ++++
 bindings/rust/libgpiod/src/line_config.rs    | 4 ++++
 bindings/rust/libgpiod/src/line_request.rs   | 4 ++++
 bindings/rust/libgpiod/src/line_settings.rs  | 4 ++++
 bindings/rust/libgpiod/src/request_config.rs | 4 ++++
 7 files changed, 32 insertions(+)

diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index 0c0cfbc..639f033 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -24,6 +24,10 @@ use super::{
 #[derive(Debug, Eq, PartialEq)]
 pub struct Event(*mut gpiod::gpiod_edge_event);
 
+// SAFETY: Event models a wrapper around an owned gpiod_edge_event and may
+// be safely sent to other threads.
+unsafe impl Send for Event {}
+
 impl Event {
     pub fn event_clone(event: &Event) -> Result<Event> {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 2e4bfd3..68d6e2f 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -68,6 +68,14 @@ pub struct Buffer {
     events: Vec<*mut gpiod::gpiod_edge_event>,
 }
 
+// SAFETY: Buffer models an owned gpiod_edge_event_buffer. However, there may
+// be events tied to it. Concurrent access from multiple threads to a buffer
+// and its associated events is not allowed by the C lib.
+// In Rust, those events will always be borrowed from a buffer instance. Thus,
+// either Rust prevents the user to move the Buffer while there are still
+// borrowed events, or we can safely send the the Buffer.
+unsafe impl Send for Buffer {}
+
 impl Buffer {
     /// Create a new edge event buffer.
     ///
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
index db60600..1e26b37 100644
--- a/bindings/rust/libgpiod/src/info_event.rs
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -25,6 +25,10 @@ pub struct Event {
     pub(crate) event: *mut gpiod::gpiod_info_event,
 }
 
+// SAFETY: Event models a wrapper around an owned gpiod_info_event and may be
+// safely sent to other threads.
+unsafe impl Send for Event {}
+
 impl Event {
     /// Get a single chip's line's status change event.
     pub(crate) fn new(event: *mut gpiod::gpiod_info_event) -> Self {
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index f4f03f1..d0a4aba 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -28,6 +28,10 @@ pub struct Config {
     pub(crate) config: *mut gpiod::gpiod_line_config,
 }
 
+// SAFETY: Config models a wrapper around an owned gpiod_line_config and may be
+// safely sent to other threads.
+unsafe impl Send for Config {}
+
 impl Config {
     /// Create a new line config object.
     pub fn new() -> Result<Self> {
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index a5697d6..64ef05d 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -20,6 +20,10 @@ pub struct Request {
     pub(crate) request: *mut gpiod::gpiod_line_request,
 }
 
+// SAFETY: Request models a wrapper around an owned gpiod_line_request and may
+// be safely sent to other threads.
+unsafe impl Send for Request {}
+
 impl Request {
     /// Request a set of lines for exclusive usage.
     pub(crate) fn new(request: *mut gpiod::gpiod_line_request) -> Result<Self> {
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index f0b3e9c..c81d118 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -25,6 +25,10 @@ pub struct Settings {
     pub(crate) settings: *mut gpiod::gpiod_line_settings,
 }
 
+// SAFETY: Settings models a wrapper around an owned gpiod_line_settings and may
+// be safely sent to other threads.
+unsafe impl Send for Settings {}
+
 impl Settings {
     /// Create a new line settings object.
     pub fn new() -> Result<Self> {
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
index 5bde7c6..9b66cc9 100644
--- a/bindings/rust/libgpiod/src/request_config.rs
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -20,6 +20,10 @@ pub struct Config {
     pub(crate) config: *mut gpiod::gpiod_request_config,
 }
 
+// SAFETY: Config models a wrapper around an owned gpiod_request_config and may
+// be safely sent to other threads.
+unsafe impl Send for Config {}
+
 impl Config {
     /// Create a new request config object.
     pub fn new() -> Result<Self> {

-- 
2.41.0

