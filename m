Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986B0743AA8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjF3LTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbjF3LTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:19:05 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4699E10E5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:00 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so15121505e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688123939; x=1690715939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZqSw8EV3b1lBf8XWmaIEMowQm0/NeURhO4iFq1h2i0=;
        b=B8yv1AyKrO0bWEMmWr7K9bdAQ5dX03LbGwSBJB5Sz592L90R636lICiPHKVcYvtbkH
         aNVL6jkKQndiOTfs5kE7G7F5MpWrAaI2tItkBOBt3EyBtAwZuUtoZL57ehFjHopNDypR
         3ZcZccv6XfaLzcvzkXKsqqITW9GE+tYgUphy0IGWitP2nRpbqRisidV40soKlI/LgH/F
         NNT907yM960lCYQdp+IgN1IyxHXdES6lY2PbqPTwLl/GsBmfz4J9iyTthm1ti8a8WPIG
         hRyq/aq7bUqPz21+eZNux2oCtzFJsaGjdNYM3fcja1Qw8ulW7oq6sM/vxNBBkvjzw1VZ
         yOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123939; x=1690715939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZqSw8EV3b1lBf8XWmaIEMowQm0/NeURhO4iFq1h2i0=;
        b=lywR5gNO4Hd1fKWUVCKoXCm3GNIhMXY6bpPb8cFcBr6FlPqnf6sfYNjOFwMiMiC4Q0
         JsUSo00Q8pfGWe+dL38uUwzwarBHyS1LH4llXLeUlC98Uf6vObuOIOuxjoGCJOtEju+a
         0y1/ec+pEmpEdpZRPXkkJIshilX0y6sSCgkjShlqmE62liFDmoagADb4lFFL5GTz3RYe
         fXfVZwSxcnhNoPcBK6jU63GzJplwQeEYxYwlRz35szsOJMVQEq3vs9rEerXTBupJKY72
         /BEaIJhnaJ7u/dAb95RFW9O1xiLEJhFG8nZQIYc2+34i9pGgxEo3Cb1kRcMCDuFWRvz3
         hTYw==
X-Gm-Message-State: AC+VfDw1Xs42uQGlt6A1kLyscNlTdbSRcQgJHSYZCUfv8PxrjTsCKZg7
        8VHvXX2YeGfjkebO3C9uL9QXVw==
X-Google-Smtp-Source: ACHHUZ6+pvkQlXKXzPwoxJaqPxCXVIS+sNTP+l4SPf0wJ7yigvhS94DwzkTbIIZn6oK2c/BsRgOiTw==
X-Received: by 2002:a7b:c40d:0:b0:3f7:c92:57a0 with SMTP id k13-20020a7bc40d000000b003f70c9257a0mr2477806wmi.14.1688123938723;
        Fri, 30 Jun 2023 04:18:58 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003fbb618f7adsm4621917wml.15.2023.06.30.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:18:58 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 30 Jun 2023 13:18:44 +0200
Subject: [libgpiod][PATCH v2 1/4] bindings: rust: clippy: drop unnecessary
 casts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-clippy-v2-1-f44447925ad6@linaro.org>
References: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
In-Reply-To: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688123937; l=9530;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=EMDdrZa8OfgwpVCKve3eSUAi/NDZJtaESlvIVygNjCU=;
 b=VnzQ38m8wkmmbKhZecWBAKmCFRwnCInafwhZBt6vNqTT/XTS2Lnf+WmSu/AIeo6tOGSQ6DOiS
 +R0i/DCWKvkAO+9Up9o4rR9Xen4Su5mQgxzBnPA8J6WxmvIS9qI8OR7
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes clippy warnings on these lines.

Applied the suggested fix using:

    cargo clippy --fix

clippy version: clippy 0.1.70 (90c5418 2023-05-31).

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
2.41.0

