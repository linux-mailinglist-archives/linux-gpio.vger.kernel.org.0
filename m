Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F057A7B65A2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 11:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239587AbjJCJkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 05:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239667AbjJCJkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 05:40:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFC79B
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 02:40:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso120123366b.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696326009; x=1696930809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJRWE+PEMXtTq10j/JMrQfU2zuLae1X7s2MCcubzLrs=;
        b=x2qtVHNBfDCoJeFWrfBEnfo03ImeLdk0XHQG6FoQIL1p4kWqWDpXnDNFZszLbsRof8
         XDFSHxb/TAtRjYW6LAb5gxUdSohbStI+K/cFBugo0ZRJGmK17x3OV6zvfIcRfV778oSl
         GVTx39Z+uEUypsooL7HJq80FG9BKIHHaKEj2H1O4zwzpJ/c+Cv7eWwxjgWkIMSK1f9LV
         A1LsRYsLnBHgNIy7rr+R+pkTk8ZyxlxL5ohPNQ1PEJpI9sE9vIR3wX8bm9lbm1+jEmef
         i1tihX74A+P8mGQ0N73ZDHG4mecN+DqdkFx3mh++MgdbBRv0KA64H3MWyKD7HT+blcCd
         8n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696326009; x=1696930809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJRWE+PEMXtTq10j/JMrQfU2zuLae1X7s2MCcubzLrs=;
        b=dlez0nclcSXzpTkS02RKrBGLEBpo3rE2rjUaVr6Rus4yTiLLXxw17vIpTmDH55hiRG
         KnmfvAhm6f2yVP7YeRIh7Y3QvcHtlW21I9TZm1mry94YIRgoL7G7fQEqrrAHt0GVQ0Ja
         w7sVkOVCEsWdZjSFY3zIPVXc6wmwOoVLOvroyYh8VbkREaUitxhFiapzDrjWhYb2Zix0
         Z9bGve4NPfKXxn4UsMd3WPTygXdoEAETdITpxX+dGdXVDtgRRWSew1rffowFcYNHrzE8
         QcBHNv6sB6tOMdH7jJ1wTMJ1MogtnvudFeIZkmJ9v/2RM4MyuAVGn5jnDBDsQL+zOR1A
         CRNQ==
X-Gm-Message-State: AOJu0YzPlmR6xylQ3/83bGlsWV1Aw0+G4AHZKo4XVnWZbDDBLTYieJKu
        JfjCattqRr4OlKh/bFhK+YzNzaLc+uYexOHMDjk=
X-Google-Smtp-Source: AGHT+IEoaXm8IvPfM36JMOk9A3pOKheU7k2poD088HXQHejbLp11tFtECgykfk8QRb6BlTC1KaFLcg==
X-Received: by 2002:a17:907:75ee:b0:9b6:5d6f:cef8 with SMTP id jz14-20020a17090775ee00b009b65d6fcef8mr1054670ejc.47.1696326009147;
        Tue, 03 Oct 2023 02:40:09 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b0098e2969ed44sm749747ejo.45.2023.10.03.02.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 02:40:08 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Tue, 03 Oct 2023 11:39:59 +0200
Subject: [libgpiod][PATCH v3 3/3] bindings: rust: allow cloning
 line::InfoRef -> line::Info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231003-rust-line-info-soundness-v3-3-555ba21b4632@linaro.org>
References: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
In-Reply-To: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696326006; l=4962;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=4GsJRUyBVXshs5srI82JN1icT4+H889c4HiUdAKCDlY=;
 b=6h5I7DuS2jrvw8JgDk1omuDtXLs/yqzLJM0D97PTPa8qkNCCQwjQfreY6Fso4t0vvy8WDI029
 Ocd34shSj/yBqe0ptPjwAxJyzLH4zAnc5S9urE7W+lGqsNwewktTpTa
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

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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
index 2148789..bd290f6 100644
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
+        Ok(unsafe { Info::from_raw(copy) })
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

