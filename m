Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A84856B8A6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237365AbiGHLfW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237499AbiGHLfV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:35:21 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0908A951D2
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:35:19 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id l12so10776913plk.13
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ua8WVVBVbwvOiDb6cmEltYIfkj/SDJgEAU17pUygcsg=;
        b=LsmmFibcAHV0ggtyIm2RDpXXPFh248zn3HbGZE5WiAaSRE2v0OhrKFjD6g5pDFpOsQ
         VNSLLhpgP0JAJUSMEhR49UU0TURWOfRyKPuQwoK0HjBe+okv8XMvp/sDQuAWAXTyfT8c
         F+/nqFPonwbgBjAeGIaOvzu4k+N+KQFlw5NJn+mZuw0Chjfylf4An8CaxOjMAU9q5xSa
         BkEHdK6Z/yn7IyMKNpqn0tloRW5KdA7mW3IXNDs4OPcZnjyo06SUdt9ucDXfD3TzjHSI
         ayNV5BG+mtr2gMAPERdcWiYcRjH/KNs8+YW/YDc9IlVsVTUbvH2kp+Vn6bHL4Lqxvuka
         BnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ua8WVVBVbwvOiDb6cmEltYIfkj/SDJgEAU17pUygcsg=;
        b=6MWB4OGD5BoYEovSkVSJ5b7ZpPbLMnCnR1hwQSu4Fw50Zm+VwOKe4HL6hYYBr48SK8
         qbcb4Cm3Xclvq9x64UfBpce52B5na3Np53m6pr44toSaZy4+zm5+2+ltAQ++2QIxAuVf
         VCq/oYq+ZvcFc70gtgjR2WeBBHnePSyB83DA0FiX3lCJfZEjgJnaKpYTB7JYO1c9sXQi
         To6B0tZTG8lmKkAsQgSoy1fUIApuoDrhn4lTHL+dw8EJWACAzlTJCqvGky9U6n9TE4Ej
         VAU7Ce5ctLJUNVKoufXyFrRFntAgrEN2wpll5oKC1nsLoUUFBT4K/cyK9KxEMmHisnPx
         /RWg==
X-Gm-Message-State: AJIora+fB98HFRtngaBsQqdcpao3rAszxFXWundkObVm0wbWrrMOX94E
        DtL+DRZPgyXcMckvnyRhFjurTQ==
X-Google-Smtp-Source: AGRyM1uVuUT8OPf+8g9GA8t5jG3f63SkxXSMxje/1b3N1V+5X3lDOo/ppbGeNptngEubCHxKt+okrQ==
X-Received: by 2002:a17:902:b7c9:b0:16c:354:a029 with SMTP id v9-20020a170902b7c900b0016c0354a029mr3196861plz.58.1657280118358;
        Fri, 08 Jul 2022 04:35:18 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id j18-20020a63e752000000b0040aeb7e9358sm26932459pgk.90.2022.07.08.04.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:35:18 -0700 (PDT)
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
Subject: [PATCH V4 5/8] libgpiod: Add rust examples
Date:   Fri,  8 Jul 2022 17:04:58 +0530
Message-Id: <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1657279685.git.viresh.kumar@linaro.org>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 000000000000..82307e4eecea
--- /dev/null
+++ b/bindings/rust/examples/gpiodetect.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
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
index 000000000000..bbbd7a87ece8
--- /dev/null
+++ b/bindings/rust/examples/gpiofind.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
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
index 000000000000..c3bc35fcfdb6
--- /dev/null
+++ b/bindings/rust/examples/gpioget.rs
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
+        config.set_direction_override(Direction::Input, offset);
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
index 000000000000..bd30d9096ce8
--- /dev/null
+++ b/bindings/rust/examples/gpioinfo.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
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
index 000000000000..872907b386f3
--- /dev/null
+++ b/bindings/rust/examples/gpiomon.rs
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
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
+    config.set_edge_detection_default(Edge::Both);
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
+        match request.wait_edge_event(Duration::new(1, 0)) {
+            Err(Error::OperationTimedOut) => continue,
+            Err(x) => {
+                println!("{:?}", x);
+                return;
+            }
+            Ok(()) => (),
+        }
+
+        let count = request.read_edge_event(&buffer, 1).unwrap();
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
index 000000000000..ef70e8edbaae
--- /dev/null
+++ b/bindings/rust/examples/gpioset.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
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
+    config.set_direction_default(Direction::Output);
+    config.set_output_values(&offsets, &values).unwrap();
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

