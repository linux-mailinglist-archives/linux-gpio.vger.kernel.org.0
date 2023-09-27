Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6020F7B0A23
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 18:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjI0Q3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 12:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjI0Q3q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 12:29:46 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86076DE
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:43 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-533d6a8d6b6so10407434a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695832182; x=1696436982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAuKYtZA2AkFMpgcdmfty2Sc0tQUPcoGpybNVArcQqU=;
        b=xHtTW225Fb1FR1TPqCCux+TrM/xI0itIeav/TuGfVIeoMkB8jWzFH9DDPZMmeyiGAz
         6Wr24DRDq6E1xx0FIrsMA0jm1J702aHdS1X7L6qOiHAKAGsWdYnwMAmBQBYuTXvpxOgh
         qOZKf5WdelhNOuYAZCX1f+h31a1Rj6C399HQuR57xz4/PBKPSuTOmpRolV3xF9fZbYFy
         BIi+sG90yuHjmJhPtAJh2ywtDsqgC35Uoso/pYBtRWwCKhpZOICdLyxP7EwoMyAwCB48
         T3Kck1CZT80TtDf2GZuRjudpb7vp9Byv9D5MO6WF7rp7JK3c97njCxJgznOcq7leTYgy
         8cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695832182; x=1696436982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAuKYtZA2AkFMpgcdmfty2Sc0tQUPcoGpybNVArcQqU=;
        b=L46i8y3idsWkBYZdD+DWb0h+V/3HDLs37C1NsR/p3hEwqPqrg7ytfJNQOz1fOOx+5O
         EiinaaUSs5OtcM7XTSaHjU2CtLUcyUrQF1Dkx+Cn1rEs9u1YHr1jKmjoJkmfcFDLPz2u
         8YLHTwlTftkrptZKoF+QcQl4RmypWaTL1uxg0h0kJnaELDy9ll1XPA453MS2sgMIJq4j
         YNPR/ColDCO3Y98VOSgJIRVV/MzWrq6KPZfjw9LM8TCK/1IzyAsHFEQh3Ky9hi3ttwGE
         89UqquL2euIKx6zx+7XwsIqTD59JiG/k/mWreYeGlmICz1+jv/1XrwLjws2wYQdeCks+
         qmvQ==
X-Gm-Message-State: AOJu0YzsJvBIel1K2l8fWcRhD+kS8B3rFDw7xsdfTLmQYSgcFeZBSlsz
        1UBJDWpd8gtfaREnt4YJPRtlVA==
X-Google-Smtp-Source: AGHT+IE5Vg+Dyz/bKbjOzlL3IhVdCKmEQ4+B0ZJog4XAHOE3jOi5ifn8BwFCXivW5nM8DHHe2ehqDg==
X-Received: by 2002:aa7:df86:0:b0:52b:db31:3c48 with SMTP id b6-20020aa7df86000000b0052bdb313c48mr2505539edy.0.1695832181907;
        Wed, 27 Sep 2023 09:29:41 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id q8-20020a056402032800b00522828d438csm8384685edw.7.2023.09.27.09.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:29:41 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Wed, 27 Sep 2023 18:29:38 +0200
Subject: [libgpiod][PATCH 2/3] bindings: rust: allow cloning line::Info ->
 line::OwnedInfo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-rust-line-info-soundness-v1-2-990dce6f18ab@linaro.org>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
In-Reply-To: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695832179; l=4959;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=wQpB0yQ8o4YDV6o9oiQRDwi7P1a+31s2CDhZtZJBIjM=;
 b=1DsvWKZUO+7dZ6A4qN0TVt45CBiPVHyhOS64O5J5R0LPk0q7TGWXS8Z9cWOWnVG7do67TpdpA
 UpEvCS+CSRVD1yvbuX48bpYfym955Gd2ix2xea59Qv3cUAjrPGOx2hC
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

While one would usually use the ToOwned [1] contract in rust, libgpipd's
API only allows copying that may fail.

Thus, we cannot implement the existing trait and roll our own method. I
went with `try_clone` since that seems to be used in similar cases across
the `std` crate [2].

It also closes the gap of not having any way to clone owned instances.
Though - again - not through the Clone trait which may not fail [3].

[1] https://doc.rust-lang.org/std/borrow/trait.ToOwned.html
[2] https://doc.rust-lang.org/std/index.html?search=try_clone
[3] https://doc.rust-lang.org/std/clone/trait.Clone.html

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/lib.rs         |  1 +
 bindings/rust/libgpiod/src/line_info.rs   | 16 ++++++++++
 bindings/rust/libgpiod/tests/line_info.rs | 53 +++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 3acc98c..fd95ed2 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -74,6 +74,7 @@ pub enum OperationType {
     LineConfigSetOutputValues,
     LineConfigGetOffsets,
     LineConfigGetSettings,
+    LineInfoCopy,
     LineRequestReconfigLines,
     LineRequestGetVal,
     LineRequestGetValSubset,
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index 32c4bb2..fe01a14 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -58,6 +58,22 @@ impl Info {
         self as *const _ as *mut _
     }
 
+    /// Clones the [gpiod::gpiod_line_info] instance to an [InfoOwned]
+    pub fn try_clone(&self) -> Result<InfoOwned> {
+        // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
+        let copy = unsafe { gpiod::gpiod_line_info_copy(self.as_raw_ptr()) };
+        if copy.is_null() {
+            return Err(Error::OperationFailed(
+                crate::OperationType::LineInfoCopy,
+                errno::errno(),
+            ));
+        }
+
+        // SAFETY: The copy succeeded, we are the owner and stop using the
+        // pointer after this.
+        Ok(unsafe { InfoOwned::from_raw_owned(copy) })
+    }
+
     /// Get the offset of the line within the GPIO chip.
     ///
     /// The offset uniquely identifies the line on the chip. The combination of the chip and offset
diff --git a/bindings/rust/libgpiod/tests/line_info.rs b/bindings/rust/libgpiod/tests/line_info.rs
index ce66a60..d02c9ea 100644
--- a/bindings/rust/libgpiod/tests/line_info.rs
+++ b/bindings/rust/libgpiod/tests/line_info.rs
@@ -19,6 +19,10 @@ mod line_info {
     const NGPIO: usize = 8;
 
     mod properties {
+        use std::thread;
+
+        use libgpiod::{line, request};
+
         use super::*;
 
         #[test]
@@ -271,5 +275,54 @@ mod line_info {
             assert!(info.is_debounced());
             assert_eq!(info.debounce_period(), Duration::from_millis(100));
         }
+
+        fn generate_line_event(chip: &Chip) {
+            let mut line_config = line::Config::new().unwrap();
+            line_config
+                .add_line_settings(&[0], line::Settings::new().unwrap())
+                .unwrap();
+
+            let mut request = chip
+                .request_lines(Some(&request::Config::new().unwrap()), &line_config)
+                .unwrap();
+
+            let mut new_line_config = line::Config::new().unwrap();
+            let mut settings = line::Settings::new().unwrap();
+            settings.set_direction(Direction::Output).unwrap();
+            new_line_config.add_line_settings(&[0], settings).unwrap();
+            request.reconfigure_lines(&new_line_config).unwrap();
+        }
+
+        #[test]
+        fn ownership() {
+            let sim = Sim::new(Some(1), None, false).unwrap();
+            sim.set_line_name(0, "Test line").unwrap();
+            sim.enable().unwrap();
+
+            let chip = Chip::open(&sim.dev_path()).unwrap();
+
+            // start watching line
+            chip.watch_line_info(0).unwrap();
+
+            generate_line_event(&chip);
+
+            // read generated event
+            let event = chip.read_info_event().unwrap();
+            let info = event.line_info().unwrap();
+            assert_eq!(info.name().unwrap(), "Test line");
+
+            // clone info and move to separate thread
+            let info = info.try_clone().unwrap();
+
+            // drop the original event with the associated line_info
+            drop(event);
+
+            // assert that we can still read the name
+            thread::scope(|s| {
+                s.spawn(move || {
+                    assert_eq!(info.name().unwrap(), "Test line");
+                });
+            });
+        }
     }
 }

-- 
2.41.0

