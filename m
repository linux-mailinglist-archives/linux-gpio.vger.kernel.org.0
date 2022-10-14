Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C84065FECB2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 12:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiJNKrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 06:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiJNKrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 06:47:46 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516D315F914
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:43 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t12-20020a17090a3b4c00b0020b04251529so4424643pjf.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2seQsCe0Mv1nJHv/wuyNrWbZKGot6C6wp+PveofM58=;
        b=nNMxTxQ/faabZ5tt7j5d2oX42yb/Ex8Qcw5CskGd/Qb3ffSpSI5RxFggIByhRrGKU2
         PW3GkkcKG7IEmFQNLaxL5RMWeRb3A2bnjltTH9PRwNwkD4N1wQhLD6c6HaRApDtwgtsn
         oi2v3im8J5xY39SRfunn+5pnOfeYmgEafYe/ywSeyL1zAA8TMsix50eKLY/tmTMqnHgC
         yGbkNZ3bcUzuala1wMVcXM1QFtzsjALqTj00Ir8d0O8sldC4TibcAG3Rp16uvUgl4OgN
         Ce5oOLLUVfLxD8lu2L+QupgZQQcnJ5Rx45JvZce8M+BoQ+c88jZApGpLo8ZTHZT0BSEi
         U6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2seQsCe0Mv1nJHv/wuyNrWbZKGot6C6wp+PveofM58=;
        b=Yn8jdxmKHxeL54w/5BPMhOyFO9FVaTbBZ7foDkZySnQwnHKuNGJqk7nnWU+WSWMg1f
         HE4Z9uD63lfTENYX03LkggTJEKZIL4PoxNW1SyPyAYo6WrbO/wJWzOlx8XsysoW+FFDY
         9dpUdtknBZNZ2/UR19eksha79kwXN7KPeM7aHFrvklzUvtHH0iznvfMvNAlZZ2zAMhhJ
         yP5hb0IepYCKikzySJlceXOGAcLDEkNeOp5DwGX3YrrTzJCV39kie7b0vuNaLvbFskMQ
         2sdqoU88RY9bNQYlO8Njp9cyXgp+YPYR/+1cw4HYbpWEuKSt0oX1+3MXArAhowy6FHEs
         aRIQ==
X-Gm-Message-State: ACrzQf1lTnmkW45M6AE99ADPtmfIQ9Ji+I3tc6fF54HpknrqTTSqYv1t
        rxDx4Yt9oygCupGkKh1P3yoBZg==
X-Google-Smtp-Source: AMsMyM5/2uwPNabArFZ1+f1Aa/frszW/qBryFHM7m225efbyMGwYvFX8DyShi+ctHuRt3UHm0HS0rA==
X-Received: by 2002:a17:902:9a49:b0:17a:6662:9334 with SMTP id x9-20020a1709029a4900b0017a66629334mr4355525plv.63.1665744462684;
        Fri, 14 Oct 2022 03:47:42 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id u6-20020a63ef06000000b00464aa9ea6fasm1184101pgh.20.2022.10.14.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 03:47:42 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V7 4/8] libgpiod: Add rust examples
Date:   Fri, 14 Oct 2022 16:17:21 +0530
Message-Id: <2d5fe872fcbf3e817cf09944494252a0e1bc8979.1665744170.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1665744170.git.viresh.kumar@linaro.org>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
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
 bindings/rust/libgpiod/examples/gpioget.rs    | 42 ++++++++
 bindings/rust/libgpiod/examples/gpioinfo.rs   | 95 +++++++++++++++++++
 bindings/rust/libgpiod/examples/gpiomon.rs    | 73 ++++++++++++++
 bindings/rust/libgpiod/examples/gpioset.rs    | 60 ++++++++++++
 bindings/rust/libgpiod/examples/gpiowatch.rs  | 54 +++++++++++
 7 files changed, 389 insertions(+)
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
index 000000000000..f4c111987d96
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioget.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpioget tool.
+
+use std::env;
+
+use libgpiod::{chip::Chip, line, request, Direction, Error, Offset, Result, SettingVal};
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        println!("Usage: {} <chip> <line_offset0> ...", args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    let mut lsettings = line::Settings::new()?;
+    let lconfig = line::Config::new()?;
+    let mut offsets = Vec::<Offset>::new();
+
+    for arg in &args[2..] {
+        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
+        offsets.push(offset);
+    }
+
+    lsettings.set_prop(&[SettingVal::Direction(Direction::Input)])?;
+    lconfig.add_line_settings(&offsets, lsettings)?;
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+    rconfig.set_consumer(&args[0]);
+
+    let request = chip.request_lines(&rconfig, &lconfig)?;
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
index 000000000000..2f3af2d2daa0
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiomon.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpiomon tool.
+
+use std::env;
+
+use libgpiod::{
+    chip::Chip, edge, line, request, Edge, EdgeKind, Error, Offset, Result, SettingVal,
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
+    let mut lsettings = line::Settings::new()?;
+    let lconfig = line::Config::new()?;
+    let mut offsets = Vec::<Offset>::new();
+
+    for arg in &args[2..] {
+        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
+        offsets.push(offset);
+    }
+
+    lsettings.set_prop(&[SettingVal::EdgeDetection(Some(Edge::Both))])?;
+    lconfig.add_line_settings(&offsets, lsettings)?;
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+
+    let mut buffer = edge::event::Buffer::new(1)?;
+    let request = chip.request_lines(&rconfig, &lconfig)?;
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
+        let count = request.read_edge_events(&mut buffer)?;
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
index 000000000000..56ed241ce9de
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioset.rs
@@ -0,0 +1,60 @@
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
+use libgpiod::{chip::Chip, line, request, Direction, Error, Offset, Result, SettingVal, Value};
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
+    let lconfig = line::Config::new()?;
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
+        let mut lsettings = line::Settings::new()?;
+        lsettings.set_prop(&[
+            SettingVal::Direction(Direction::Output),
+            SettingVal::OutputValue(Value::new(value)?),
+        ])?;
+        lconfig.add_line_settings(&[offset], lsettings)?;
+    }
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+    rconfig.set_consumer(&args[0]);
+
+    chip.request_lines(&rconfig, &lconfig)?;
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

