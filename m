Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F196A72CA72
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 17:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbjFLPlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 11:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237685AbjFLPlJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 11:41:09 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D96F10D3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 08:41:07 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b3be39e35dso14905425ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686584467; x=1689176467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIQm8Xzmjf8cEBhagbjyGsjbZPmpYTORKVofimi7QMM=;
        b=AMaHSJnv5tcRXjSc35tkbvHkG+52esBiWMHEe5iCkj9ifQgTgj+p5c+e25j9bdOrjW
         CrWnIVRXAVWi5Z7r0R7T1xsyPF23iCXyInNxEv5WRfHqOrs4lTNM77FACvjUIHRP8uUn
         W521041kMam1EK73C8jS5NOI+OvrtThbnHsmT+AEtEM58Slw/SKi25VJJxYsVvgw4n/A
         bR5/aO7m1kBNZAVJzPHq1DHXAshD7TBKcOZBkCXBBpTaIdMDI8M+uC8M509uK9J+eylW
         0TYTH+wt5TNTSwTgOTg0hMpq+JGX6F8VmpMOZ6bj3ZFvZ7Rd/nIUyqacpuqeqESXo6lq
         28qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686584467; x=1689176467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIQm8Xzmjf8cEBhagbjyGsjbZPmpYTORKVofimi7QMM=;
        b=Qdc20QoL7JkAF07058JGvL69V7s7fDQPjPPqZa/D3kM7UtDVv0Aik6W99KZnmrRMIp
         3PpQNwZc70lrakOz1JpiP0yFkT0wrHFaw75cSN8MUH4RZ8CzcmTxb9o7hLYn6ypycXvG
         jHI8fMZzU1ibj88xe+DxWIb9zwjE//BF4u6ntQgOEL3BXsOpW/R6UZ6o97XPCCyApB89
         ysr2IJOGJuD9UEl1xM0AsBdANLA7UOQ1jrraXQqvKCfPLNoyPAi18MlgofC29wdUhCGe
         C/a28uLTZdX0nqAP+BgO3MiGODKEmQJZbRab3ul0YMBYAK93VU5l+BcI6f+3elpm+LdD
         0KEg==
X-Gm-Message-State: AC+VfDw5kiymUgSmikirHuMRzA/MeATs1kS59h2ErRGGWSRM8sFd2vSV
        M+6sbgAq+ZENKXLH/9E9UWW0BmtrUtc=
X-Google-Smtp-Source: ACHHUZ7ApOTc4lhUcCLUHHfLzDnZMEBu91U27vMMzTHn9var5hnIR5t05ckViTNYd3LPiFZChXGJZQ==
X-Received: by 2002:a17:902:ec8a:b0:1af:d750:10cb with SMTP id x10-20020a170902ec8a00b001afd75010cbmr8224615plg.63.1686584466553;
        Mon, 12 Jun 2023 08:41:06 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id bf5-20020a170902b90500b001a6a6169d45sm8414093plb.168.2023.06.12.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 08:41:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Date:   Mon, 12 Jun 2023 23:40:55 +0800
Message-Id: <20230612154055.56556-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
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

clippy from Rust 1.70 reports a host of warnings due to casting and type
conversions across the FFI interface to libgpiod.
These casts and conversions are required to support old versions of Rust
that do not support recent Rust FFI extensions.

Disable the warnings on a case by case basis, and move
casting/conversion inside the corresponding unsafe section where
appropriate to highlight that the FFI conversion is the cause.

clippy also finds a couple of genuine uneccessary casts, so remove
those too.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

There is also at least one instance of reformatting by rustfmt,
but that seems appropriate too.

Cheers,
Kent.

 bindings/rust/gpiosim-sys/src/lib.rs         |  1 +
 bindings/rust/gpiosim-sys/src/sim.rs         |  6 ++++--
 bindings/rust/libgpiod/src/chip.rs           |  5 ++++-
 bindings/rust/libgpiod/src/edge_event.rs     |  1 +
 bindings/rust/libgpiod/src/event_buffer.rs   |  3 +++
 bindings/rust/libgpiod/src/info_event.rs     |  1 +
 bindings/rust/libgpiod/src/lib.rs            |  1 +
 bindings/rust/libgpiod/src/line_config.rs    | 11 +++++++----
 bindings/rust/libgpiod/src/line_info.rs      |  1 +
 bindings/rust/libgpiod/src/line_request.rs   | 14 +++++++++-----
 bindings/rust/libgpiod/src/line_settings.rs  |  2 ++
 bindings/rust/libgpiod/src/request_config.rs |  5 ++++-
 bindings/rust/libgpiod/tests/chip.rs         |  2 +-
 13 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
index eed2a42..0360333 100644
--- a/bindings/rust/gpiosim-sys/src/lib.rs
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -37,6 +37,7 @@ pub enum Value {
 
 impl Value {
     pub(crate) fn new(val: gpiosim_value) -> Result<Self> {
+        #[allow(clippy::unnecessary_cast)]
         Ok(match val {
             GPIOSIM_VALUE_INACTIVE => Value::InActive,
             GPIOSIM_VALUE_ACTIVE => Value::Active,
diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
index 896596f..cac5659 100644
--- a/bindings/rust/gpiosim-sys/src/sim.rs
+++ b/bindings/rust/gpiosim-sys/src/sim.rs
@@ -155,8 +155,9 @@ impl SimBank {
     }
 
     fn val(&self, offset: Offset) -> Result<Value> {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
-        let ret = unsafe { gpiosim_bank_get_value(self.bank, offset) };
+        let ret = unsafe { gpiosim_bank_get_value(self.bank, offset) as i32};
 
         if ret == -1 {
             Err(Error::OperationFailed(
@@ -164,7 +165,7 @@ impl SimBank {
                 errno::errno(),
             ))
         } else {
-            Value::new(ret as i32)
+            Value::new(ret)
         }
     }
 
@@ -185,6 +186,7 @@ impl SimBank {
     }
 
     fn set_num_lines(&self, num: usize) -> Result<()> {
+        #[allow(clippy::useless_conversion)]
         // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
         let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num.try_into().unwrap()) };
         if ret == -1 {
diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index f4de008..f160d23 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -278,8 +278,11 @@ impl Info {
 
     /// Get the number of GPIO lines exposed by the chip.
     pub fn num_lines(&self) -> usize {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_chip_info_get_num_lines(self.info) as usize }
+        unsafe {
+            gpiod::gpiod_chip_info_get_num_lines(self.info) as usize
+        }
     }
 }
 
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index d324ce6..64d20e2 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -40,6 +40,7 @@ impl Event {
 
     /// Get the event type.
     pub fn event_type(&self) -> Result<EdgeKind> {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
         EdgeKind::new(unsafe { gpiod::gpiod_edge_event_get_event_type(self.0) } as u32)
     }
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 1deaf2b..89611bc 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -54,6 +54,7 @@ impl<'a> Iterator for Events<'a> {
     }
 
     fn next(&mut self) -> Option<Self::Item> {
+        #[allow(clippy::iter_nth_zero)] // as using next() is self referential
         self.nth(0)
     }
 }
@@ -81,6 +82,7 @@ impl Buffer {
             ));
         }
 
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
         let capacity = unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(buffer) as usize };
 
@@ -103,6 +105,7 @@ impl Buffer {
             self.events[i] = ptr::null_mut();
         }
 
+        #[allow(clippy::useless_conversion)]
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
         let ret = unsafe {
             gpiod::gpiod_line_request_read_edge_events(
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
index b0ceb3b..7651f1c 100644
--- a/bindings/rust/libgpiod/src/info_event.rs
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -33,6 +33,7 @@ impl Event {
 
     /// Get the event type of the status change event.
     pub fn event_type(&self) -> Result<InfoChangeKind> {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_info_event` is guaranteed to be valid here.
         InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) } as u32)
     }
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 26354e5..314e157 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -184,6 +184,7 @@ pub mod line {
 
     impl Value {
         pub fn new(val: gpiod::gpiod_line_value) -> Result<Self> {
+            #[allow(clippy::unnecessary_cast)]
             Ok(match val {
                 GPIOD_LINE_VALUE_INACTIVE => Value::InActive,
                 GPIOD_LINE_VALUE_ACTIVE => Value::Active,
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index e973cde..405e675 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -106,20 +106,23 @@ impl Config {
     /// Get a mapping of offsets to line settings stored by this object.
     pub fn line_settings(&self) -> Result<SettingsMap> {
         let mut map = SettingsMap::new();
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: gpiod_line_config is guaranteed to be valid here
-        let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };
-        let mut offsets = vec![0; num_lines as usize];
+        let num_lines =
+            unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) as usize };
+        let mut offsets = vec![0; num_lines];
 
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: gpiod_line_config is guaranteed to be valid here.
         let num_stored = unsafe {
             gpiod::gpiod_line_config_get_configured_offsets(
                 self.config,
                 offsets.as_mut_ptr(),
                 num_lines,
-            )
+            ) as usize
         };
 
-        for offset in &offsets[0..num_stored as usize] {
+        for offset in &offsets[0..num_stored] {
             // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
             let settings =
                 unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, *offset) };
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index 702f1b4..bff9ece 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -142,6 +142,7 @@ impl Info {
 
     /// Get the debounce period of the line.
     pub fn debounce_period(&self) -> Duration {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
         Duration::from_micros(unsafe {
             gpiod::gpiod_line_info_get_debounce_period_us(self.info) as u64
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index b175eea..51cc7cd 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -27,23 +27,27 @@ impl Request {
 
     /// Get the number of lines in the request.
     pub fn num_lines(&self) -> usize {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_request_get_num_requested_lines(self.request) as usize }
+        unsafe {
+            gpiod::gpiod_line_request_get_num_requested_lines(self.request) as usize
+        }
     }
 
     /// Get the offsets of lines in the request.
     pub fn offsets(&self) -> Vec<Offset> {
-        let mut offsets = vec![0; self.num_lines() as usize];
+        let mut offsets = vec![0; self.num_lines()];
 
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
         let num_offsets = unsafe {
             gpiod::gpiod_line_request_get_requested_offsets(
                 self.request,
                 offsets.as_mut_ptr(),
                 self.num_lines(),
-            )
+            ) as usize
         };
-        offsets.shrink_to(num_offsets as usize);
+        offsets.shrink_to(num_offsets);
         offsets
     }
 
@@ -145,7 +149,7 @@ impl Request {
 
     /// Set values of all lines associated with the request.
     pub fn set_values(&mut self, values: &[Value]) -> Result<&mut Self> {
-        if values.len() != self.num_lines() as usize {
+        if values.len() != self.num_lines() {
             return Err(Error::InvalidArguments);
         }
 
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 918d6c2..3b1d2b6 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -218,6 +218,7 @@ impl Settings {
 
     /// Get the debounce period.
     pub fn debounce_period(&self) -> Result<Duration> {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         Ok(Duration::from_micros(unsafe {
             gpiod::gpiod_line_settings_get_debounce_period_us(self.settings) as u64
@@ -243,6 +244,7 @@ impl Settings {
 
     /// Get the event clock setting.
     pub fn event_clock(&self) -> Result<EventClock> {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         EventClock::new(unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) } as u32)
     }
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
index 0c6c5c1..48edfaf 100644
--- a/bindings/rust/libgpiod/src/request_config.rs
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -82,8 +82,11 @@ impl Config {
 
     /// Get the edge event buffer size setting for the request config.
     pub fn event_buffer_size(&self) -> usize {
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_request_config_get_event_buffer_size(self.config) as usize }
+        unsafe {
+            gpiod::gpiod_request_config_get_event_buffer_size(self.config) as usize
+        }
     }
 }
 
diff --git a/bindings/rust/libgpiod/tests/chip.rs b/bindings/rust/libgpiod/tests/chip.rs
index f264708..60b4ecc 100644
--- a/bindings/rust/libgpiod/tests/chip.rs
+++ b/bindings/rust/libgpiod/tests/chip.rs
@@ -59,7 +59,7 @@ mod chip {
             assert_eq!(info.label().unwrap(), LABEL);
             assert_eq!(info.name().unwrap(), sim.chip_name());
             assert_eq!(chip.path().unwrap(), sim.dev_path().to_str().unwrap());
-            assert_eq!(info.num_lines(), NGPIO as usize);
+            assert_eq!(info.num_lines(), NGPIO);
         }
 
         #[test]
-- 
2.40.1

