Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0925B47A874
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 12:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhLTLRQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 06:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhLTLRQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 06:17:16 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1383C061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:15 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id c2so8439687pfc.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dFl/9CfI0v3IUZFEwsW2+WxeLJI+0xP6cCS9S/x45aU=;
        b=RClDW+oaQ9qYJkzflzuz0qjgWMZhiaJLWbMawHnRHXD2DhgfvjuiYEmmRknIVZq580
         hcRYDs6NVmLqMmW1dT0ifISLNjUegWCzr74Es6fDczIEXetR84C0pFoCg0ONRdtRfxwj
         7CxptjhOsu3bq0SWRfZkFu8Wz3rvYHTLP6kSVn9kp/evpY5MWh9INKwaxTTb7NWkt7o2
         22oaRRxVwsEpqjEUd5lxIt1Ud7Oqi08ZmTcATe4WrUywxh8ATWpxM+okawwIcP57lvv5
         YpsruOn6yvFENPvmzX765KBLCAwO/LXbe0KscrnEHsLb24y9x2K8f+gvcFTNa1MRAOVO
         EvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dFl/9CfI0v3IUZFEwsW2+WxeLJI+0xP6cCS9S/x45aU=;
        b=pFjsRrNb9Zu+w3ruYZRubG9qrlZXtYbhPSLDkesClXPRUjX+FWHwiLeygrkquw8x5s
         hhU4plr5GBzgT9GfaECMNFVSHjewPbm5bQB/8ix7sriRtu8qHCkK+sapV+9otvc+aLmF
         feCDJmyVfbk1EYmurfFUt5u7b23UtTzST4ajMXTBCTeZ7t23bWaMQYT0VIItPITYzpKr
         vL2yJ4qSxXXx3RWVZNkFhn5j6kERMn3TYaPfTn2isKxKY5OrRwiwIMqWu4Hz+UZe68m/
         T8sSdpb/Kg3IYuoya5a1CUamWDJ2USPcR2WI/dFrs3BnNPLA/cky8CIvwUupSxJxXou+
         jPrQ==
X-Gm-Message-State: AOAM531FjAEmu/lJoua+WRimQY48t2RbjDRK4e2uxw1g5gqS7U8zFoQb
        NIIcMU6ia5BDs2HqO1fjInLgRA==
X-Google-Smtp-Source: ABdhPJwcQy0l3u095xqsjlvLdGA3MlJRwlnsXVnog4mM2K7MGBNKcQy6Hs0vKNEB7WA9EuIcn5Qe6Q==
X-Received: by 2002:a62:b40a:0:b0:4ad:55cb:1766 with SMTP id h10-20020a62b40a000000b004ad55cb1766mr15829069pfn.47.1639999035435;
        Mon, 20 Dec 2021 03:17:15 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id d10sm15100260pfj.51.2021.12.20.03.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:17:15 -0800 (PST)
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
Subject: [PATCH V3 3/4] libgpiod: Add rust examples
Date:   Mon, 20 Dec 2021 16:41:37 +0530
Message-Id: <2c8660feb33219eb52c7f53c8c161b3955b3ba8b.1639997241.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1639997241.git.viresh.kumar@linaro.org>
References: <cover.1639997241.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add examples for the usage of the rust bindings, quite similar to the
ones in cxx bindings.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/examples/gpiodetect.rs | 37 ++++++++++++
 bindings/rust/examples/gpiofind.rs   | 42 +++++++++++++
 bindings/rust/examples/gpioget.rs    | 42 +++++++++++++
 bindings/rust/examples/gpioinfo.rs   | 89 ++++++++++++++++++++++++++++
 bindings/rust/examples/gpiomon.rs    | 68 +++++++++++++++++++++
 bindings/rust/examples/gpioset.rs    | 52 ++++++++++++++++
 6 files changed, 330 insertions(+)
 create mode 100644 bindings/rust/examples/gpiodetect.rs
 create mode 100644 bindings/rust/examples/gpiofind.rs
 create mode 100644 bindings/rust/examples/gpioget.rs
 create mode 100644 bindings/rust/examples/gpioinfo.rs
 create mode 100644 bindings/rust/examples/gpiomon.rs
 create mode 100644 bindings/rust/examples/gpioset.rs

diff --git a/bindings/rust/examples/gpiodetect.rs b/bindings/rust/examples/gpiodetect.rs
new file mode 100644
index 000000000000..505ad1e3420d
--- /dev/null
+++ b/bindings/rust/examples/gpiodetect.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpiodetect tool.
+
+use std::env;
+use std::fs;
+use std::path::Path;
+
+use libgpiod::{gpiod_is_gpiochip_device, Chip};
+
+fn main() {
+    let args: Vec<String> = env::args().collect();
+    if args.len() > 1 {
+        println!("Usage: {}", args[0]);
+        return;
+    }
+
+    for entry in fs::read_dir(Path::new("/dev")).unwrap() {
+        let pathbuf = entry.unwrap().path();
+        let path = pathbuf.to_str().unwrap();
+
+        if gpiod_is_gpiochip_device(path) {
+            let chip = Chip::open(path).unwrap();
+            let ngpio = chip.get_num_lines();
+
+            println!(
+                "{} [{}] ({})",
+                chip.get_name().unwrap(),
+                chip.get_label().unwrap(),
+                ngpio
+            );
+        }
+    }
+}
diff --git a/bindings/rust/examples/gpiofind.rs b/bindings/rust/examples/gpiofind.rs
new file mode 100644
index 000000000000..7c20d71acb9f
--- /dev/null
+++ b/bindings/rust/examples/gpiofind.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpiofind tool.
+
+use std::env;
+use std::fs;
+use std::path::Path;
+
+use libgpiod::{gpiod_is_gpiochip_device, Chip};
+
+fn main() {
+    let args: Vec<String> = env::args().collect();
+    if args.len() != 2 {
+        println!("Usage: {} <line-name>", args[0]);
+        return;
+    }
+
+    for entry in fs::read_dir(Path::new("/dev")).unwrap() {
+        let pathbuf = entry.unwrap().path();
+        let path = pathbuf.to_str().unwrap();
+
+        if gpiod_is_gpiochip_device(path) {
+            let chip = Chip::open(path).unwrap();
+
+            let offset = chip.find_line(&args[1]);
+            if offset.is_ok() {
+                println!(
+                    "Line {} found: Chip: {}, offset: {}",
+                    args[1],
+                    chip.get_name().unwrap(),
+                    offset.unwrap()
+                );
+                return;
+            }
+        }
+    }
+
+    println!("Failed to find line: {}", args[1]);
+}
diff --git a/bindings/rust/examples/gpioget.rs b/bindings/rust/examples/gpioget.rs
new file mode 100644
index 000000000000..0105cefdc119
--- /dev/null
+++ b/bindings/rust/examples/gpioget.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpioget tool.
+
+use std::env;
+
+use libgpiod::{Chip, Direction, LineConfig, RequestConfig};
+
+fn main() {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        println!("Usage: {} <chip> <line_offset0> ...", args[0]);
+        return;
+    }
+
+    let mut config = LineConfig::new().unwrap();
+    let mut offsets = Vec::<u32>::new();
+
+    for arg in &args[2..] {
+        let offset = arg.parse::<u32>().unwrap();
+
+        offsets.push(offset);
+        config.set_direction_offset(Direction::Input, offset);
+    }
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path).unwrap();
+
+    let rconfig = RequestConfig::new().unwrap();
+    rconfig.set_consumer(&args[0]);
+    rconfig.set_offsets(&offsets);
+
+    let request = chip.request_lines(&rconfig, &config).unwrap();
+
+    let mut values: Vec<i32> = vec![0; offsets.len()];
+    request.get_values(&mut values).unwrap();
+
+    println!("{:?}", values);
+}
diff --git a/bindings/rust/examples/gpioinfo.rs b/bindings/rust/examples/gpioinfo.rs
new file mode 100644
index 000000000000..1d74a17e3c90
--- /dev/null
+++ b/bindings/rust/examples/gpioinfo.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpioinfo tool.
+
+use std::env;
+use std::fs;
+use std::path::Path;
+
+use libgpiod::{gpiod_is_gpiochip_device, Chip, Direction};
+
+fn line_info(chip: &Chip, offset: u32) {
+    let info = chip.line_info(offset).unwrap();
+    let off = info.get_offset();
+
+    let name = match info.get_name() {
+        Ok(name) => name,
+        _ => "unused",
+    };
+
+    let consumer = match info.get_consumer() {
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
+    let dir = match info.get_direction().unwrap() {
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
+}
+
+fn chip_info(path: &str) {
+    if gpiod_is_gpiochip_device(path) {
+        let chip = Chip::open(path).unwrap();
+        let ngpio = chip.get_num_lines();
+
+        println!("GPIO Chip name: {}", chip.get_name().unwrap());
+        println!("\tlabel: {}", chip.get_label().unwrap());
+        println!("\tpath: {}", chip.get_path().unwrap());
+        println!("\tngpio: {}\n", ngpio);
+
+        println!("\tLine information:");
+
+        for offset in 0..ngpio {
+            line_info(&chip, offset);
+        }
+        println!("\n");
+    }
+}
+
+fn main() {
+    let args: Vec<String> = env::args().collect();
+    if args.len() > 2 {
+        println!("Usage: {}", args[0]);
+        return;
+    }
+
+    if args.len() == 1 {
+        for entry in fs::read_dir(Path::new("/dev")).unwrap() {
+            let pathbuf = entry.unwrap().path();
+            let path = pathbuf.to_str().unwrap();
+
+            chip_info(path);
+        }
+    } else {
+        let index = args[1].parse::<u32>().unwrap();
+        let path = format!("/dev/gpiochip{}", index);
+
+        chip_info(&path);
+    }
+}
diff --git a/bindings/rust/examples/gpiomon.rs b/bindings/rust/examples/gpiomon.rs
new file mode 100644
index 000000000000..cf6700c5a960
--- /dev/null
+++ b/bindings/rust/examples/gpiomon.rs
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpiomon tool.
+
+use std::env;
+use std::time::Duration;
+
+use libgpiod::{Chip, Edge, EdgeEventBuffer, Error, LineConfig, LineEdgeEvent, RequestConfig};
+
+fn usage(name: &str) {
+    println!("Usage: {} <chip> <offset0> ...", name);
+}
+
+fn main() {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        usage(&args[0]);
+        return;
+    }
+
+    let mut config = LineConfig::new().unwrap();
+    let mut offsets = Vec::<u32>::new();
+
+    for arg in &args[2..] {
+        let offset = arg.parse::<u32>().unwrap();
+
+        offsets.push(offset);
+    }
+
+    config.set_edge_detection(Edge::Both);
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path).unwrap();
+
+    let rconfig = RequestConfig::new().unwrap();
+    rconfig.set_offsets(&offsets);
+
+    let buffer = EdgeEventBuffer::new(1).unwrap();
+    let request = chip.request_lines(&rconfig, &config).unwrap();
+
+    loop {
+        match request.edge_event_wait(Duration::new(1, 0)) {
+            Err(Error::OperationTimedOut) => continue,
+            Err(x) => {
+                println!("{:?}", x);
+                return;
+            }
+            Ok(()) => (),
+        }
+
+        let count = request.edge_event_read(&buffer, 1).unwrap();
+        if count == 1 {
+            let event = buffer.get_event(0).unwrap();
+            println!(
+                "line: {} type: {}, time: {:?}",
+                event.get_line_offset(),
+                match event.get_event_type().unwrap() {
+                    LineEdgeEvent::Rising => "Rising",
+                    LineEdgeEvent::Falling => "Falling",
+                },
+                event.get_timestamp()
+            );
+        }
+    }
+}
diff --git a/bindings/rust/examples/gpioset.rs b/bindings/rust/examples/gpioset.rs
new file mode 100644
index 000000000000..3b8f9d227181
--- /dev/null
+++ b/bindings/rust/examples/gpioset.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpioset tool.
+
+use std::env;
+
+use libgpiod::{Chip, Direction, LineConfig, RequestConfig};
+
+fn usage(name: &str) {
+    println!("Usage: {} <chip> <line_offset0>=<value0> ...", name);
+}
+
+fn main() {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        usage(&args[0]);
+        return;
+    }
+
+    let mut config = LineConfig::new().unwrap();
+    let mut offsets = Vec::<u32>::new();
+    let mut values = Vec::<i32>::new();
+
+    for arg in &args[2..] {
+        let pair: Vec<&str> = arg.split('=').collect();
+        if pair.len() != 2 {
+            usage(&args[0]);
+            return;
+        }
+
+        let offset = pair[0].parse::<u32>().unwrap();
+        let value = pair[1].parse::<u32>().unwrap();
+
+        offsets.push(offset);
+        values.push(value as i32);
+    }
+
+    config.set_direction(Direction::Output);
+    config.set_output_values(&offsets, &values);
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path).unwrap();
+
+    let rconfig = RequestConfig::new().unwrap();
+    rconfig.set_consumer(&args[0]);
+    rconfig.set_offsets(&offsets);
+
+    chip.request_lines(&rconfig, &config).unwrap();
+}
-- 
2.31.1.272.g89b43f80a514

