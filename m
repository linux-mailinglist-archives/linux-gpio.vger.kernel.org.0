Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03CC4587C34
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 14:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236920AbiHBMSf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 08:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236865AbiHBMSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 08:18:34 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF8B4F641
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 05:18:31 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id o3so13283159ple.5
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 05:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZMGqBqIV0nC0OVfIDdIBImvZfRBkK8294g/iBwADKuM=;
        b=RvZx1L20Q6u5f9/n7aJCbNVnKzgCS9wU/X/h6giQHat6ScL2VxdAasWR+BWZ8vrdXg
         9NQJHQgZe5lXQhAueOZBlVr19jfeKfhLrtaQSfL7LcLDqLW3Gzi2tTsg0Nkx+uN12Z+s
         mX3wfdww7M1JVPz4TO3crppN0m6MxzrN4IlmaYgHu50h0Dg2ysQ5AFuWESJnsPE4OZyJ
         lxRI4jVGZRqwExLgHShzlXAR0Mby81k2598hzjvplOQBAp6PoxP8bh0PgISXeALlEbw9
         7Kru4w/MlJ9R08aGB+AnjTT5k/VdOr0E8RRHrLQE2PurIrcTKu6jUk4DpqvitjofK8an
         MhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZMGqBqIV0nC0OVfIDdIBImvZfRBkK8294g/iBwADKuM=;
        b=22CQfc/Z/Ldgmgl78PNczFncm/C3UjNWa5dfQM6CsrAQIa03IhWW8y9UG8+M9IWPin
         WsSbyRxPdLYMMez0YJ7Qz8MsDxjqqHiTWqVLB62iEkhhRLV5NXf4ytphngldIib26Zvj
         Tu7eoAqEM94TnUlyVIPSg6BYGLwYCGGxiVHnAZNlKjg9IzPGTn4SJHU2kBw3tFD0cQrB
         nnBrdoI7cM+B2W57m1csD7uw5rYB+ZDc8q/EACi+EKuma5Wv62P/eyNxfjCVZS1adunc
         b/1JErzIFUllycQxUhPldMRVVSUAJY8hxcmx6GkGYRkN6EKWD9Ot8sUTYFXTAYbYtKMx
         uAzQ==
X-Gm-Message-State: ACgBeo3WJsF1bnqkBxeEB382AytZVuo0+olcJKSCMVn7cztRv/8HA29h
        jfrGFRHg6dwCNOfY84R9IVhLuw==
X-Google-Smtp-Source: AA6agR5wddc439RnEXfavpil3To6aTqEtVD+SfFPrA3NxBMO2Yg+KIEqaytb7JKIWsjv/SxOs9b6rw==
X-Received: by 2002:a17:90a:e616:b0:1f5:35a6:6008 with SMTP id j22-20020a17090ae61600b001f535a66008mr1025378pjy.134.1659442710333;
        Tue, 02 Aug 2022 05:18:30 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id u6-20020a170903124600b0016f04c098ddsm1692419plh.226.2022.08.02.05.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 05:18:30 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V5 4/8] libgpiod: Add rust examples
Date:   Tue,  2 Aug 2022 17:48:08 +0530
Message-Id: <d23a8bbe863c85c628bd30b3168d98ea1997a263.1659442066.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1659442066.git.viresh.kumar@linaro.org>
References: <cover.1659442066.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add examples for the usage of the rust bindings, quite similar to the
ones in cxx bindings.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/libgpiod/examples/gpiodetect.rs | 30 ++++++
 bindings/rust/libgpiod/examples/gpiofind.rs   | 35 +++++++
 bindings/rust/libgpiod/examples/gpioget.rs    | 44 +++++++++
 bindings/rust/libgpiod/examples/gpioinfo.rs   | 95 +++++++++++++++++++
 bindings/rust/libgpiod/examples/gpiomon.rs    | 71 ++++++++++++++
 bindings/rust/libgpiod/examples/gpioset.rs    | 64 +++++++++++++
 bindings/rust/libgpiod/examples/gpiowatch.rs  | 54 +++++++++++
 7 files changed, 393 insertions(+)
 create mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs

diff --git a/bindings/rust/libgpiod/examples/gpiodetect.rs b/bindings/rust/libgpiod/examples/gpiodetect.rs
new file mode 100644
index 000000000000..f24ac72e2d48
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiodetect.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpiodetect tool.
+
+use std::env;
+use std::path::Path;
+
+use libgpiod::{gpiochip_devices, Error, Result};
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() > 1 {
+        println!("Usage: {}", args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    for chip in gpiochip_devices(&Path::new("/dev"))? {
+        println!(
+            "{} [{}] ({})",
+            chip.name()?,
+            chip.label()?,
+            chip.num_lines(),
+        );
+    }
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpiofind.rs b/bindings/rust/libgpiod/examples/gpiofind.rs
new file mode 100644
index 000000000000..07e886bc3896
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiofind.rs
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpiofind tool.
+
+use std::env;
+use std::path::Path;
+
+use libgpiod::{gpiochip_devices, Error, Result};
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() != 2 {
+        println!("Usage: {} <line-name>", args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    for chip in gpiochip_devices(&Path::new("/dev"))? {
+        let offset = chip.line_offset_from_name(&args[1]);
+        if offset.is_ok() {
+            println!(
+                "Line {} found: Chip: {}, offset: {}",
+                args[1],
+                chip.name()?,
+                offset?
+            );
+            return Ok(());
+        }
+    }
+
+    println!("Failed to find line: {}", args[1]);
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpioget.rs b/bindings/rust/libgpiod/examples/gpioget.rs
new file mode 100644
index 000000000000..7dccde3debed
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioget.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpioget tool.
+
+use std::env;
+
+use libgpiod::{chip::Chip, line, request, Direction, Error, Offset, Result, Setting, SettingMap};
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        println!("Usage: {} <chip> <line_offset0> ...", args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    let mut config = line::Config::new()?;
+    let mut offsets = Vec::<Offset>::new();
+    let mut map = SettingMap::new();
+
+    for arg in &args[2..] {
+        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
+
+        offsets.push(offset);
+        map.insert(offset.into(), Setting::Direction(Direction::Input));
+    }
+
+    config.set_prop_override(map);
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+    rconfig.set_consumer(&args[0]);
+    rconfig.set_offsets(&offsets);
+
+    let request = chip.request_lines(&rconfig, &config)?;
+    let map = request.values()?;
+
+    println!("{:?}", map);
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpioinfo.rs b/bindings/rust/libgpiod/examples/gpioinfo.rs
new file mode 100644
index 000000000000..8b9fcb000f63
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioinfo.rs
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpioinfo tool.
+
+use std::env;
+use std::path::Path;
+
+use libgpiod::{
+    chip::Chip, gpiochip_devices, is_gpiochip_device, Direction, Error, Offset, Result,
+};
+
+fn line_info(chip: &Chip, offset: Offset) -> Result<()> {
+    let info = chip.line_info(offset)?;
+    let off = info.offset();
+
+    let name = match info.name() {
+        Ok(name) => name,
+        _ => "unused",
+    };
+
+    let consumer = match info.consumer() {
+        Ok(name) => name,
+        _ => "unnamed",
+    };
+
+    let low = if info.is_active_low() {
+        "active-low"
+    } else {
+        "active-high"
+    };
+
+    let dir = match info.direction()? {
+        Direction::AsIs => "None",
+        Direction::Input => "Input",
+        Direction::Output => "Output",
+    };
+
+    println!(
+        "\tline {:>3}\
+              \t{:>10}\
+              \t{:>10}\
+              \t{:>6}\
+              \t{:>14}",
+        off, name, consumer, dir, low
+    );
+
+    Ok(())
+}
+
+fn chip_info(chip: &Chip) -> Result<()> {
+    let ngpio = chip.num_lines();
+
+    println!("GPIO Chip name: {}", chip.name()?);
+    println!("\tlabel: {}", chip.label()?);
+    println!("\tpath: {}", chip.path()?);
+    println!("\tngpio: {}\n", ngpio);
+
+    println!("\tLine information:");
+
+    for offset in 0..ngpio {
+        line_info(chip, offset as Offset)?;
+    }
+    println!("\n");
+
+    Ok(())
+}
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() > 2 {
+        println!("Usage: {}", args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    if args.len() == 1 {
+        for chip in gpiochip_devices(&Path::new("/dev"))? {
+            chip_info(&chip)?;
+        }
+    } else {
+        let index = args[1]
+            .parse::<u32>()
+            .map_err(|_| Error::InvalidArguments)?;
+        let path = format!("/dev/gpiochip{}", index);
+        if is_gpiochip_device(&path) {
+            let chip = Chip::open(&path)?;
+
+            chip_info(&chip)?;
+        }
+    }
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
new file mode 100644
index 000000000000..f2a52663b8ea
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiomon.rs
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpiomon tool.
+
+use std::env;
+
+use libgpiod::{chip::Chip, edge, line, request, Edge, EdgeKind, Error, Offset, Result, Setting};
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
+    let mut config = line::Config::new()?;
+    let mut offsets = Vec::<Offset>::new();
+
+    for arg in &args[2..] {
+        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
+
+        offsets.push(offset);
+    }
+
+    config.set_prop_default(&[Setting::EdgeDetection(Some(Edge::Both))]);
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+    rconfig.set_offsets(&offsets);
+
+    let buffer = edge::event::Buffer::new(1)?;
+    let request = chip.request_lines(&rconfig, &config)?;
+
+    loop {
+        match request.wait_edge_event(None) {
+            Err(x) => {
+                println!("{:?}", x);
+                return Err(Error::InvalidArguments);
+            }
+
+            Ok(false) => {
+                // This shouldn't happen as the call is blocking.
+                panic!();
+            }
+            Ok(true) => (),
+        }
+
+        let count = request.read_edge_events(&buffer)?;
+        if count == 1 {
+            let event = buffer.event(0)?;
+            println!(
+                "line: {} type: {}, time: {:?}",
+                event.line_offset(),
+                match event.event_type()? {
+                    EdgeKind::Rising => "Rising",
+                    EdgeKind::Falling => "Falling",
+                },
+                event.timestamp()
+            );
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/examples/gpioset.rs b/bindings/rust/libgpiod/examples/gpioset.rs
new file mode 100644
index 000000000000..b92d8bcd39c5
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioset.rs
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpioset tool.
+
+use std::env;
+use std::io::{stdin, Read};
+
+use libgpiod::{
+    chip::Chip, line, request, Direction, Error, Offset, Result, Setting, Value, ValueMap,
+};
+
+fn usage(name: &str) {
+    println!("Usage: {} <chip> <line_offset0>=<value0> ...", name);
+}
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        usage(&args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    let mut config = line::Config::new()?;
+    let mut offsets = Vec::<Offset>::new();
+    let mut map = ValueMap::new();
+
+    for arg in &args[2..] {
+        let pair: Vec<&str> = arg.split('=').collect();
+        if pair.len() != 2 {
+            usage(&args[0]);
+            return Err(Error::InvalidArguments);
+        }
+
+        let offset = pair[0]
+            .parse::<Offset>()
+            .map_err(|_| Error::InvalidArguments)?;
+        let value = pair[1]
+            .parse::<i32>()
+            .map_err(|_| Error::InvalidArguments)?;
+
+        offsets.push(offset);
+        map.insert(offset.into(), Value::new(value)?);
+    }
+
+    config.set_prop_default(&[Setting::Direction(Direction::Output)]);
+    config.set_output_values(map)?;
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+    rconfig.set_consumer(&args[0]);
+    rconfig.set_offsets(&offsets);
+
+    chip.request_lines(&rconfig, &config)?;
+
+    // Wait for keypress, let user verify line status.
+    stdin().read_exact(&mut [0u8]).unwrap();
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpiowatch.rs b/bindings/rust/libgpiod/examples/gpiowatch.rs
new file mode 100644
index 000000000000..030168ba9788
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiowatch.rs
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpiowatch tool.
+
+use std::env;
+
+use libgpiod::{chip::Chip, Error, Offset, Result};
+
+fn usage(name: &str) {
+    println!("Usage: {} <chip> <offset0> ...", name);
+}
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 2 {
+        usage(&args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let offset = args[2]
+        .parse::<Offset>()
+        .map_err(|_| Error::InvalidArguments)?;
+
+    let chip = Chip::open(&path)?;
+    let _info = chip.watch_line_info(offset)?;
+
+    match chip.wait_info_event(None) {
+        Err(x) => {
+            println!("{:?}", x);
+            return Err(Error::InvalidArguments);
+        }
+
+        Ok(false) => {
+            // This shouldn't happen as the call is blocking.
+            panic!();
+        }
+        Ok(true) => (),
+    }
+
+    let event = chip.read_info_event()?;
+    println!(
+        "line: {} type: {:?}, time: {:?}",
+        offset,
+        event.event_type()?,
+        event.timestamp()
+    );
+
+    chip.unwatch(offset);
+    Ok(())
+}
-- 
2.31.1.272.g89b43f80a514

