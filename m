Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA136B3CAA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 11:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjCJKqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 05:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjCJKqL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 05:46:11 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B3665C44
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 02:46:00 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso5707328wmb.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 02:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678445159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFOtVTztKbusbP3luh9Uo0/xgHafDNyU9O/h30YfjE8=;
        b=k5GuEGMyPfi+MqxK7ra5gXUqPgzjfkSBcNxVM2uHtz8jbYMxJuNEw4zkhq5X2FWuBh
         fxBYS1t2HCVy34XTpWpZeuD/osi4Zctyl0PNwdyXndJnxejbO9PoGKrEcrXY+u78geMa
         5PS/agL7mPzja/KAt5hWzya4nOP+bRXygCTuym54t9cCUj5K1ohLQCRMqF/Mg9RF+JDt
         Io3s4SsPPd8tu/cUiWnM5SOV3xQn2hbGboTvkL5IcUTiCsaeHhogrxFVVEMjP9F/RL1B
         k0BST/viweaYhWlNGd7B5wsBdRmNzjdpaZYpmDv/fpotzKgCP/76m2yWaTYHkRlgDvlF
         V6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678445159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFOtVTztKbusbP3luh9Uo0/xgHafDNyU9O/h30YfjE8=;
        b=uECBu2K4oHbwJCEOGd5pq1j5f3nPWcf/2qiym7RMjBVFqqICsawfyAKJh3gBIBXYMY
         SMAwVXUkQaTKB2DG0ACXfiy7SSqKe8/iaNzJwQITfmNauY/JR0UWtzD9807jSnYRVlTY
         kT2VMaT0B52As3xgpp14w1N22c9mzJe3Jcjg0V2NBVDvi7vYKoouI0pAnL8WHEE9/V9P
         R5rVjAoPCUFraGOB+fbPsg73MwZfZv9t2CER6TJ31HGZxrijhzgjz3ykzaXWMRhJTS2o
         HuAF26GCFw0y8k/Dv4LIzgZnfBCLa/PX5Fbjkl9yuoJ0jBfhqZ9x6w/6ahiaUVyhiVZE
         nvOA==
X-Gm-Message-State: AO0yUKWwkWgyTkn3jyF44xI3wFK2mtQoa69GqTj8Wrj6G8sLDsVSAFsc
        C0whqElMKF+MKwXHVhK1p4mpkWWX5bEr5Soh94M=
X-Google-Smtp-Source: AK7set86TAINXhJTqL9YC+Zig7lNtysJ6jibGDq4YJJ6j6PfuUSlyqylmezs4punB5vcpQl0q7okwQ==
X-Received: by 2002:a05:600c:34c4:b0:3eb:3998:8bca with SMTP id d4-20020a05600c34c400b003eb39988bcamr896460wmq.17.1678445158770;
        Fri, 10 Mar 2023 02:45:58 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:60e1:2dd9:3b20:5b74])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c2caf00b003e8f0334db8sm3071437wmc.5.2023.03.10.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:45:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: rust: examples: add a reimplementation of gpionotify
Date:   Fri, 10 Mar 2023 11:45:55 +0100
Message-Id: <20230310104555.62813-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new rust example - a simplified reimplementation of the gpionotify
tool.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Viresh, please take a look at my attempt at a rust sample. :)

 bindings/rust/libgpiod/examples/Makefile.am   |  1 +
 bindings/rust/libgpiod/examples/gpionotify.rs | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 bindings/rust/libgpiod/examples/gpionotify.rs

diff --git a/bindings/rust/libgpiod/examples/Makefile.am b/bindings/rust/libgpiod/examples/Makefile.am
index 6028fff..2e1ccbd 100644
--- a/bindings/rust/libgpiod/examples/Makefile.am
+++ b/bindings/rust/libgpiod/examples/Makefile.am
@@ -9,6 +9,7 @@ EXTRA_DIST = \
 	gpioget.rs \
 	gpioinfo.rs \
 	gpiomon.rs \
+	gpionotify.rs \
 	gpioset.rs \
 	gpio_threaded_info_events.rs \
 	gpiowatch.rs
diff --git a/bindings/rust/libgpiod/examples/gpionotify.rs b/bindings/rust/libgpiod/examples/gpionotify.rs
new file mode 100644
index 0000000..54445d2
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpionotify.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Linaro Ltd.
+// SPDX-FileCopyrightTest: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+//
+// Simplified Rust implementation of the gpionotify tool.
+
+use std::env;
+
+use libgpiod::{
+    chip::Chip,
+    line::{Offset, InfoChangeKind},
+    Error, Result,
+};
+
+fn usage(name: &str) {
+    println!("Usage: {} <chip> <offset0> ...", name);
+}
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        usage(&args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    let mut offsets = Vec::<Offset>::new();
+
+    for arg in &args[2..] {
+        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
+        offsets.push(offset);
+    }
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    for &offset in offsets.iter() {
+        let _info = chip.watch_line_info(offset).unwrap();
+    }
+
+    loop {
+        let event = chip.read_info_event().unwrap();
+        println!(
+            "event: {}, line: {}, timestamp: {:?}",
+            match event.event_type()? {
+                InfoChangeKind::LineRequested => "Line requested",
+                InfoChangeKind::LineReleased => "Line released",
+                InfoChangeKind::LineConfigChanged => "Line config changed",
+            },
+            event.line_info().unwrap().offset(),
+            event.timestamp()
+        );
+    }
+}
-- 
2.37.2

