Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5865F5EA6C4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 15:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbiIZNDX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 09:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbiIZNDB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 09:03:01 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C506CD646
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:35:10 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id k2so6196585vsk.8
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WbvnBZUJ0h4fAMtBh7gYyt5ruELVcpQ4MXQLS7QS+v4=;
        b=F61PzHWIg9xlO/Ts8OPlrQkmxDh6/tU5f3odXMtAiO25X+02dWub92wvdlToAoq/8Y
         8aesXkkcv3dyFB8gDoGYGz985gyKSAJytA2JNKffOS3aTrpEJHp4OkSve1p9RdWk1ec4
         s9MM47bMafpAeK33RvS7cRcbV1u6NfuhhGtTrUYdSRELhqNTWsGLcM+xjWvAj2gJpmvf
         di1r3XhYZrhAmrt0JSDFsgr/jOSisT336QWRjpfGLL1tNO7IXTxQknJqhu8vgBdHAGud
         qd2MkCtp4lwJb8CdqHDXbq+cqmkKyVK2ntwW5NsA7Oem1hBCMqAhrV73lY5MYLthpUC3
         JjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WbvnBZUJ0h4fAMtBh7gYyt5ruELVcpQ4MXQLS7QS+v4=;
        b=FFd8tU9a31d99LGxDatoIwi9a//pWugHEGaxWpoWIFqw0xwjhwv+9zhJs1uiVuYnaK
         Gpe/4h+S/iGCiBcPzUN0divk5NBCU5U6qYlvg29/IPbgIFd+3VT8leHIo/QwGEnxOnGM
         X5U0BMwbUk+ev4jWsYAJAAjUcb6zaLMyAIE1DrXANrwqNd/+Ff4oRz3hB/NCh9cOUySH
         q7HbSWg/ZTSEPn/cslgZm9GIrlrK2VBt3JnRoaRSct5hTT+fxtzC4oI79LfVKcYV6mqs
         oW7lZJHQfU7J2IzzlNg+0aN5wx5h5w9py4gwR92Ti/89ddNzJBtmJVDhJn1LD7lJatfE
         Pqzg==
X-Gm-Message-State: ACrzQf3Fo48f26hwsnp4krBmUbFvaUqo1xBQjT91/mN5UgJmtBkOvlYf
        B3ZyCeUjfuhsTwLW5f+/LmRL/7gqHVCUUQ==
X-Google-Smtp-Source: AMsMyM4H3FKiJI/IrIp5BKvTRz6msMG99AFFsAZQsxXU2V8ag25/vqMDFno8q3aAvjNTPhQSCV9q+A==
X-Received: by 2002:a17:902:d70e:b0:178:2d9d:ba7b with SMTP id w14-20020a170902d70e00b001782d9dba7bmr21626122ply.90.1664190518162;
        Mon, 26 Sep 2022 04:08:38 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11863057pfp.163.2022.09.26.04.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:08:37 -0700 (PDT)
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
Subject: [PATCH V6 4/8] libgpiod: Add rust examples
Date:   Mon, 26 Sep 2022 16:38:16 +0530
Message-Id: <11e31698d4e01c487a0346ea721519c7b4da3f15.1664189248.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1664189248.git.viresh.kumar@linaro.org>
References: <cover.1664189248.git.viresh.kumar@linaro.org>
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
index 000000000000..bf01b5717963
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
+    let buffer = edge::event::Buffer::new(1)?;
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

