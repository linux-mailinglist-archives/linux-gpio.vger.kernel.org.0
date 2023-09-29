Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7801E7B3351
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 15:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbjI2NS0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 09:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbjI2NSZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 09:18:25 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3BEB7
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:18:23 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5363227cc80so2730597a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695993501; x=1696598301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PASfd6CZpk6Nv9y25I709P3Low/Uen0b1n7845iDH8g=;
        b=DowURrTloYvzGHD81fpaEXlsWRAQDiMVrZn/waAdyhbL/53TkkSutGOg5UrX5DE+Aa
         NN2ourhzv87SR+R0w7gn4Ndfh+tDoiYCGOZH5FZ6IseSu2sj+q0JsnzDeSz/pX7+JvoW
         /6PM6Lr7wupnav85yqHr8ezdgJGKPrGqAmT/aNdSS4qsmsb6416rGw0K+LIEia1NDhoW
         /4kPu7grcPKAb8zC+YGXznjr9y4mzSdScZXMoHvlpxHJTI/Jz2Sa+5hgUtjwm8DbWDQv
         AfWvz+d4tfspGdP4DQxsq98B2fuh8p5mFpV1BzwnTrFhltWLdJInA1dlH39e5yLjZwvR
         UPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695993501; x=1696598301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PASfd6CZpk6Nv9y25I709P3Low/Uen0b1n7845iDH8g=;
        b=CL80s5jEhSDug046xVCfZTClLi91HwYMFDOnwhmqtamm2Yt9at8S489Jvotl/efXfs
         gA//zxY09xcnmiLEQPokgyNpVzD/0kQeBKv80N59rhzi3Xj5zF6EljP9kH5N9ySezUgw
         9R3Ac1d9bYmhYFriK61En9VWpZZRjSuYui0dUoHSISpp2J1G/ylIaCDfzxD7vMGMDJyK
         x5IJIZfSSrEWLPZSMJ8/kp2v/5g0OgSfZy3gcX/rA4Sh3eTJyEnzpAjLP7OtYWz4i/2H
         MHcU10bs2rQ4xgGCG/RP0ux5AxcIS+qT15YiHD2x7mBvjIJ4cjQKyKqe6VV2LU/PIMQ/
         k/YA==
X-Gm-Message-State: AOJu0Yxm7VbY10RotZeGviWNhKf79dXaUxeKpZFob1PffJ3uJP/7gvjM
        5JcUx0bemRXkiRiGnNHD2R4gXPQmCQb8uWgOsi4=
X-Google-Smtp-Source: AGHT+IE9fh8kksirohx8/E1SA/c4zO33rDPOmf0Kbs5EYw0a+7MQlZoYYyk9CO9+nHgA/pOI9/mCQg==
X-Received: by 2002:a17:907:2cf8:b0:9a1:c659:7c56 with SMTP id hz24-20020a1709072cf800b009a1c6597c56mr3923884ejc.22.1695993501466;
        Fri, 29 Sep 2023 06:18:21 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id ck17-20020a170906c45100b00992e14af9c3sm12510086ejb.143.2023.09.29.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:18:21 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 29 Sep 2023 15:18:17 +0200
Subject: [libgpiod][PATCH v2 3/3] bindings: rust: allow cloning
 line::InfoRef -> line::Info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-rust-line-info-soundness-v2-3-9782b7f20f26@linaro.org>
References: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
In-Reply-To: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695993498; l=4918;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=nfsIfKbieH28SEVJTPMlOY7C6S7extD5dj4g+Xknc7E=;
 b=uhJLYe4+QfiG/IpySX1TT2exveCpe3wbBvCnbcJUqX0pzpJEvePeBmlMBozzQTOc9AUA1WQ1v
 m6GkZAHfo8CBACafH6QlDERIKZQ83cNo+b5pU7N00R4Yp7MGjGTiRgp
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
index e3ea5e1..c9dd379 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -58,6 +58,22 @@ impl InfoRef {
         self as *const _ as *mut _
     }
 
+    /// Clones the line info object.
+    pub fn try_clone(&self) -> Result<Info> {
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
+        Ok(unsafe { Info::from_raw_owned(copy) })
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

