Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0357424C4
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 13:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjF2LKC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 07:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbjF2LJk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 07:09:40 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041672D50
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:14 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so4321385e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036952; x=1690628952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6s4UJTW2s+J/uK95eQceT3Q7N5XarYkMNstNAwDygE=;
        b=z86K03swaTgDH/SDo+FNcXrrk/Rwpd60NqCZLC2CmQCde2Gr81686BNV4LYM8/2igt
         xxDNyts5UY/G/wNrf7btelKlX9x3Jfirv8McsVQtgAK4YCZSGms0wQao+Pdsar554qcl
         CjxLvUFl9IaCZEQMTptXF707PpAM4QvzkYMgE1kurXakcDqpiiaMOoe8xbsYfv+bz0re
         flBSXVb9IyV0jvtBHG5X+6+4S5n5BaIw/Xh7B9NfPJFrzQo0v94zq0H/gqn4aiQ2f8Ib
         1zenmELikG5REZX2iYqTUAQjVKa6/vascKLMUGBDtVXBYqgYEYhN+wzxfhaBkIk3jzez
         2q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036952; x=1690628952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6s4UJTW2s+J/uK95eQceT3Q7N5XarYkMNstNAwDygE=;
        b=IomGyQzcj+2u9aBE8tFa5kX+DX6b0rcM0ORodvsqtByZ+thcDShah+0BvSCUEs9TC6
         4NSPKpWoYj+OmJuoziwrqE9qJFaU0c+a98GLnV+9XOvJE0yCpOClVsZzCJd11sh2slZ0
         zg0A5eaaGktSkdVTGbsci3s6pStJ8yLsksIzSaXJOCWf3xnS3VZV2YqYuX9xDg96In6E
         jHinj8WuLxN3NTO19DMU5DE0gtLnO4ElUnRrFanJSLhjBlLCjMpEGy6StyfVOXSIhobT
         SnqR/04trYO1oq61ZMSdC4+SyECXb1rbgcOHN6sNQ8/WI64GSRa/r4AyUsPMp/6mop2K
         iRIQ==
X-Gm-Message-State: AC+VfDzVym6KGHtYe4kOduNkBpsoJGF5WbuZT4+8tmorXmuqyuN4Q8cW
        BwzElZzSsFJ1NQ+Oi79Xek8t+ALwgcubLs6T3bA=
X-Google-Smtp-Source: ACHHUZ77OnTzJOhyZbRdszB5AfRFMovmGf+/aujhH7WOgIIaHl/Hb2ipt3XHFBHIgklWIdRI1q7VUQ==
X-Received: by 2002:a05:600c:1c16:b0:3fb:b18a:f32d with SMTP id j22-20020a05600c1c1600b003fbb18af32dmr4304504wms.17.1688036952373;
        Thu, 29 Jun 2023 04:09:12 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438BA.versanet.de. [92.116.56.186])
        by smtp.gmail.com with ESMTPSA id cw13-20020a056000090d00b003112f836d4esm15571197wrb.85.2023.06.29.04.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:09:12 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 29 Jun 2023 13:08:59 +0200
Subject: [PATCH libgpiod 1/4] bindings: rust: clippy: drop unnecessary
 casts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230629-clippy-v1-1-9ff088713c54@linaro.org>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
In-Reply-To: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688036951; l=9482;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=Ot1V75qiEATelXlma9s8qXh3jyd7nNo0vESvJozpwlI=;
 b=sLuc4DCpO999c3fIjYSVlBUrNImhohLUuCb4yvozzSdY1RQQVo+tz7Bh5IkEAuCL7zsrGzVWp
 7PLU6cpvyv/DFHf1mbm859BqG8l11DLfw1nbSOqLw3tP+Rbes7nG0ez
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ran cargo clippy --fix on clippy 0.1.70 (90c5418 2023-05-31).

Tested build on x86_64, armv7hf, aarch64.

Reported-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/gpiosim-sys/src/lib.rs         | 2 +-
 bindings/rust/gpiosim-sys/src/sim.rs         | 2 +-
 bindings/rust/libgpiod/src/chip.rs           | 2 +-
 bindings/rust/libgpiod/src/edge_event.rs     | 2 +-
 bindings/rust/libgpiod/src/event_buffer.rs   | 2 +-
 bindings/rust/libgpiod/src/info_event.rs     | 2 +-
 bindings/rust/libgpiod/src/lib.rs            | 2 +-
 bindings/rust/libgpiod/src/line_config.rs    | 4 ++--
 bindings/rust/libgpiod/src/line_request.rs   | 8 ++++----
 bindings/rust/libgpiod/src/line_settings.rs  | 2 +-
 bindings/rust/libgpiod/src/request_config.rs | 2 +-
 bindings/rust/libgpiod/tests/chip.rs         | 2 +-
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
index eed2a42..bf9ae32 100644
--- a/bindings/rust/gpiosim-sys/src/lib.rs
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -46,7 +46,7 @@ impl Value {
                     errno::errno(),
                 ))
             }
-            _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
+            _ => return Err(Error::InvalidEnumValue("Value", val)),
         })
     }
 }
diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
index 896596f..16c2b3e 100644
--- a/bindings/rust/gpiosim-sys/src/sim.rs
+++ b/bindings/rust/gpiosim-sys/src/sim.rs
@@ -164,7 +164,7 @@ impl SimBank {
                 errno::errno(),
             ))
         } else {
-            Value::new(ret as i32)
+            Value::new(ret)
         }
     }
 
diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index f4de008..81e1be6 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -279,7 +279,7 @@ impl Info {
     /// Get the number of GPIO lines exposed by the chip.
     pub fn num_lines(&self) -> usize {
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_chip_info_get_num_lines(self.info) as usize }
+        unsafe { gpiod::gpiod_chip_info_get_num_lines(self.info) }
     }
 }
 
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index d324ce6..0c0cfbc 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -41,7 +41,7 @@ impl Event {
     /// Get the event type.
     pub fn event_type(&self) -> Result<EdgeKind> {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
-        EdgeKind::new(unsafe { gpiod::gpiod_edge_event_get_event_type(self.0) } as u32)
+        EdgeKind::new(unsafe { gpiod::gpiod_edge_event_get_event_type(self.0) })
     }
 
     /// Get the timestamp of the event.
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 1deaf2b..520eb2a 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -82,7 +82,7 @@ impl Buffer {
         }
 
         // SAFETY: `gpiod_edge_event_buffer` is guaranteed to be valid here.
-        let capacity = unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(buffer) as usize };
+        let capacity = unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(buffer) };
 
         Ok(Self {
             buffer,
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
index b0ceb3b..db60600 100644
--- a/bindings/rust/libgpiod/src/info_event.rs
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -34,7 +34,7 @@ impl Event {
     /// Get the event type of the status change event.
     pub fn event_type(&self) -> Result<InfoChangeKind> {
         // SAFETY: `gpiod_info_event` is guaranteed to be valid here.
-        InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) } as u32)
+        InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) })
     }
 
     /// Get the timestamp of the event, read from the monotonic clock.
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 26354e5..3acc98c 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -193,7 +193,7 @@ pub mod line {
                         errno::errno(),
                     ))
                 }
-                _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
+                _ => return Err(Error::InvalidEnumValue("Value", val)),
             })
         }
 
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index e973cde..f4f03f1 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -108,7 +108,7 @@ impl Config {
         let mut map = SettingsMap::new();
         // SAFETY: gpiod_line_config is guaranteed to be valid here
         let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };
-        let mut offsets = vec![0; num_lines as usize];
+        let mut offsets = vec![0; num_lines];
 
         // SAFETY: gpiod_line_config is guaranteed to be valid here.
         let num_stored = unsafe {
@@ -119,7 +119,7 @@ impl Config {
             )
         };
 
-        for offset in &offsets[0..num_stored as usize] {
+        for offset in &offsets[0..num_stored] {
             // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
             let settings =
                 unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, *offset) };
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index b175eea..1140aa9 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -28,12 +28,12 @@ impl Request {
     /// Get the number of lines in the request.
     pub fn num_lines(&self) -> usize {
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_request_get_num_requested_lines(self.request) as usize }
+        unsafe { gpiod::gpiod_line_request_get_num_requested_lines(self.request) }
     }
 
     /// Get the offsets of lines in the request.
     pub fn offsets(&self) -> Vec<Offset> {
-        let mut offsets = vec![0; self.num_lines() as usize];
+        let mut offsets = vec![0; self.num_lines()];
 
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
         let num_offsets = unsafe {
@@ -43,7 +43,7 @@ impl Request {
                 self.num_lines(),
             )
         };
-        offsets.shrink_to(num_offsets as usize);
+        offsets.shrink_to(num_offsets);
         offsets
     }
 
@@ -145,7 +145,7 @@ impl Request {
 
     /// Set values of all lines associated with the request.
     pub fn set_values(&mut self, values: &[Value]) -> Result<&mut Self> {
-        if values.len() != self.num_lines() as usize {
+        if values.len() != self.num_lines() {
             return Err(Error::InvalidArguments);
         }
 
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 918d6c2..79ee2f5 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -244,7 +244,7 @@ impl Settings {
     /// Get the event clock setting.
     pub fn event_clock(&self) -> Result<EventClock> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        EventClock::new(unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) } as u32)
+        EventClock::new(unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) })
     }
 
     /// Set the output value setting.
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
index 0c6c5c1..5bde7c6 100644
--- a/bindings/rust/libgpiod/src/request_config.rs
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -83,7 +83,7 @@ impl Config {
     /// Get the edge event buffer size setting for the request config.
     pub fn event_buffer_size(&self) -> usize {
         // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_request_config_get_event_buffer_size(self.config) as usize }
+        unsafe { gpiod::gpiod_request_config_get_event_buffer_size(self.config) }
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

