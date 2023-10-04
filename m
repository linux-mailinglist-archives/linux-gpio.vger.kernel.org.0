Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448357B8010
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 15:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242354AbjJDNAa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 09:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242521AbjJDNA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 09:00:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874FAE6
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 06:00:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-533cbbd0153so3752399a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696424423; x=1697029223; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUxHRAAUJ8e4w2sN24vI2mGf3yYOo4or/Y+gwtC/L2Y=;
        b=MrjRIKgelKm/2BT1jKQmAVjSYcKRP8vai9OYYNu5HS37hiG3vpblqStmCrrkpZ/MbW
         9+sk7xozHYVXoUfG3+ERKq8GYJ0lqvqfTnN2NVRhGOTnquWvww7Sq0GFpcW2Kam98+MP
         pd8FGeim17sGyJK7bjK0f05yz8Hy4MUwt+TW9H00kEU0heatmKFVRRPTLddDTlj1T732
         ueJGadqkpH/Wy9Ebi+3vjWBd8nIfVNiZkfKUrVABbMhTijUV07T5RrS9TnwypUMjcvtH
         wtmA7eCOAptepGD+j1CVZUtHBLXaTiL5NnEXXl7NKuDfvbrakUKTVX4jYONdSCXHFwKr
         qTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424423; x=1697029223;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUxHRAAUJ8e4w2sN24vI2mGf3yYOo4or/Y+gwtC/L2Y=;
        b=HZ974/oTWKzqxS7sXReT/Riw/KjUSxAFD4a1hDEmD1WpehrQaxsfgXgXDYEmbJGrOJ
         zmzVlbirdm8D6h4RNzpofwX0HBzfkoQZKBuiSwu7RTEjsBdiT/+F09xPjmha0Yhvcu4r
         UuaxBXPB/mp+1b1bZyF7LOGHLC/P+4f+EOzLeCpKkd9AJY8TuYZvtVEMsH/S7wKnxOC5
         87EkshnMCRg7LsiKj6hQgx4W47wLK9uVuYzBUHPfhWoOLi6c/yJZpLPjcUdllgElQCWV
         p+p1eNNH9CbYsU0oEPBfGSbWpp9JEkNQCP3NGB3rP5WVfIkKN6N2/UaOQkNko1SIV749
         MmLg==
X-Gm-Message-State: AOJu0YxLCeX+lW4UFwUP/oplr7oZY+0QauK9tLj7ebvcEV/rziHofekN
        iK+5GlgyYe01DJNErNv4etdkrtDWYmphxWMV/+o=
X-Google-Smtp-Source: AGHT+IF8oZMlxrNLjnlTKjVb7MDbgLCyaWLSGqt2VuaHlidR3fb5iL2Srf5T6aZeS6K/hdyfFqWO1g==
X-Received: by 2002:a17:906:10a:b0:9ae:3e2f:4d00 with SMTP id 10-20020a170906010a00b009ae3e2f4d00mr2521060eje.70.1696424422754;
        Wed, 04 Oct 2023 06:00:22 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id ss26-20020a170907039a00b009a5f1d15644sm2692005ejb.119.2023.10.04.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 06:00:21 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Wed, 04 Oct 2023 15:00:00 +0200
Subject: [libgpiod][PATCH v4] bindings: rust: rename {event,settings}_clone
 to try_clone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231004-rust-line-info-soundness-v4-1-cff89db04aa5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM9hHWUC/4XN3YrCMBAF4Fcpud7IZNK/eLXvsXjRNJM6IIkkW
 pTSdzf2QlwW3MvDmfPNIjIlpiz21SISzZw5hhLqr0qMxyFMJNmVLBBQg8FOpmu+yBOHUgQfZY7
 X4ALlLFU9Qk/gsCUjyvycyPNto3/Eie105ujEoTRHzpeY7tvPWW39//ysJEhjwI3UetUP9rtcD
 SnuYpo2dcZ3yXyQ8Cl1PdrOI3hs/0j6JSkA/UHSRWqaxg6obN1q/CWt6/oAqIbfjF8BAAA=
To:     brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696424421; l=4820;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=mqShslodg0Oiui24nKpcl44gAU2f6npkFD4lJg/3f90=;
 b=2sGUpPRu/+m/akoY64tUy4HeRiLaxoZKv+hTG1GCwqLlXcatf/xXAzVygWJ64Jyt8SWtQ4DGg
 HS5gOLSLZtQA6NPm1VDlh1/kCH4RyjzTRRFbRaKl/ne1hyyGThgFCc8
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
Resending only the missing patch, rebased on the others.

To: Linux-GPIO <linux-gpio@vger.kernel.org>
To: brgl@bgdev.pl
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>
---
Changes in v4:
- Rebased on top of the already merged patches
- Link to v3: https://lore.kernel.org/r/20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org

Changes in v3:
- Renamed from_raw_{owned,non_owning}() -> from_raw()
- Link to v2: https://lore.kernel.org/r/20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org

Changes in v2:
- Removed unneeded temporary variables
- Added missing SAFETY comment
- Renamed owning wrapper to `Event`, non-owning to `EventRef`
- Renamed existing clone methods to try_clone()
- Slightly tweaked try_clone() documentation
- Dropped version bump commit
- Added Fixes tag
- CC'd Kent - suggested by vireshk since he reviewed his commits
- Link to v1: https://lore.kernel.org/r/20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org
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
index 639f033..7f8f377 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -29,7 +29,8 @@ pub struct Event(*mut gpiod::gpiod_edge_event);
 unsafe impl Send for Event {}
 
 impl Event {
-    pub fn event_clone(event: &Event) -> Result<Event> {
+    /// Makes a copy of the event object.
+    pub fn try_clone(event: &Event) -> Result<Event> {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
         let event = unsafe { gpiod::gpiod_edge_event_copy(event.0) };
         if event.is_null() {
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index c81d118..4ba20d4 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -56,8 +56,8 @@ impl Settings {
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
 

---
base-commit: 808d15ebffdcee5e418a210815e57e6128e0f803
change-id: 20230927-rust-line-info-soundness-14c08e0d26e9

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

