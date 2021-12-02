Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9FE46623F
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 12:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346343AbhLBL02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 06:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357303AbhLBL01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 06:26:27 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C699C06174A
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 03:23:05 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id gt5so20313286pjb.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P9nKlLhYWLEIB1/JxpBIVXBkCWjifIiqw+wFPrkKlRU=;
        b=PopNok2fpXKBjoRL2WRhU3PtXya4eG/hWwQanQv46TliU0c6PELtgFmD5HjXhiEOac
         7xTBVEtkPnlDDJeBMtoATaVkMgVnOYrGbwIikiafjLXd+uId6+jv4cdekaz7Aidd6afe
         q4/UWl30uyX8csW0ruOiC6HbaxkFMh7wYGGFzordIOrr1gfNOSRW8lAbXnzbdM905k15
         w4vwOIr+mO9uEWaSV/YbnapzNAiqbUb09QGxGwVBHK0cyO5KfEX4+1emKI6NLDh5XvQi
         hYRANrqMF0L1vC0ljUs/N3rl7v82uBYFFdaHbOi+Gd6P0eXkQoJdUJqiY5lcfYmJgmxq
         QJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P9nKlLhYWLEIB1/JxpBIVXBkCWjifIiqw+wFPrkKlRU=;
        b=ekDsQEYhCOJWJD5B5KuidjbkNfUx3OEu03oVA4hqkz42OgNiEGnS8WcmsHNSRchrw1
         BW5poFM7BlAQrHqkatwQ8vYaid5yYKvueSD515UWcnWomGufnYEQfP9awV+0fLtYo4Jy
         kOhlvgOtrADYDoyxTsforpEU6xXr5Uk1YAmfvqbxqDqSgmY7hnfZFVook5hWImGFD/4+
         nMsR1SSJ52xrJgmeYrGo16gJbHG39vQ/frwO0O6hR6qWom5liMGaogV4rp2mA5IEGMrb
         QxYrGacd4sXGmLMgJoF40LKcd9QiYs9uEvwUimi4x9K17Q6SP5iv6girzrlSvr5sHwZx
         eGmQ==
X-Gm-Message-State: AOAM533A6+K+lX9gcaroAkOM1W+uaxyUemJGLD3qDiaFbOIlRl5VZeij
        m3X8F/lPxMoHOSDNktPVolKdHw==
X-Google-Smtp-Source: ABdhPJx9areooxI/Uaq5TRVTTWAMF+Knp2XhJ9SO3tDqDGUhYbtlhPi0LhjNxv1V6Vu+ZwRM91ensQ==
X-Received: by 2002:a17:902:654d:b0:141:7df3:b94 with SMTP id d13-20020a170902654d00b001417df30b94mr14337366pln.60.1638444184706;
        Thu, 02 Dec 2021 03:23:04 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id nn15sm2477886pjb.11.2021.12.02.03.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:23:04 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: [PATCH V2 3/4] rust: Add examples
Date:   Thu,  2 Dec 2021 16:52:48 +0530
Message-Id: <394d3d478bf844766155b4ffdf2cbf8daa1d4551.1638443930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1638443930.git.viresh.kumar@linaro.org>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add examples for the usage of the rust bindings, quite similar to the
ones in cxx bindings.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/examples/gpiodetect.rs | 38 ++++++++++++
 bindings/rust/examples/gpiofind.rs   | 43 +++++++++++++
 bindings/rust/examples/gpioget.rs    | 45 ++++++++++++++
 bindings/rust/examples/gpioinfo.rs   | 90 ++++++++++++++++++++++++++++
 bindings/rust/examples/gpiomon.rs    | 73 ++++++++++++++++++++++
 bindings/rust/examples/gpioset.rs    | 55 +++++++++++++++++
 6 files changed, 344 insertions(+)
 create mode 100644 bindings/rust/examples/gpiodetect.rs
 create mode 100644 bindings/rust/examples/gpiofind.rs
 create mode 100644 bindings/rust/examples/gpioget.rs
 create mode 100644 bindings/rust/examples/gpioinfo.rs
 create mode 100644 bindings/rust/examples/gpiomon.rs
 create mode 100644 bindings/rust/examples/gpioset.rs

diff --git a/bindings/rust/examples/gpiodetect.rs b/bindings/rust/examples/gpiodetect.rs
new file mode 100644
index 000000000000..c4b2ef31469d
--- /dev/null
+++ b/bindings/rust/examples/gpiodetect.rs
@@ -0,0 +1,38 @@
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
+use libgpiod::chip::GpiodChip;
+use libgpiod::gpiod_is_gpiochip_device;
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
+            let chip = GpiodChip::open(path).unwrap();
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
index 000000000000..5050f4a39b6b
--- /dev/null
+++ b/bindings/rust/examples/gpiofind.rs
@@ -0,0 +1,43 @@
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
+use libgpiod::chip::GpiodChip;
+use libgpiod::gpiod_is_gpiochip_device;
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
+            let chip = GpiodChip::open(path).unwrap();
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
index 000000000000..47a51b7c56b9
--- /dev/null
+++ b/bindings/rust/examples/gpioget.rs
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpioget tool.
+
+use std::env;
+
+use libgpiod::chip::GpiodChip;
+use libgpiod::line_config::GpiodLineConfig;
+use libgpiod::request_config::GpiodRequestConfig;
+use libgpiod::Direction;
+
+fn main() {
+    let args: Vec<String> = env::args().collect();
+    if args.len() < 3 {
+        println!("Usage: {} <chip> <line_offset0> ...", args[0]);
+        return;
+    }
+
+    let mut config = GpiodLineConfig::new().unwrap();
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
+    let chip = GpiodChip::open(&path).unwrap();
+
+    let rconfig = GpiodRequestConfig::new().unwrap();
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
index 000000000000..1b84df70e811
--- /dev/null
+++ b/bindings/rust/examples/gpioinfo.rs
@@ -0,0 +1,90 @@
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
+use libgpiod::chip::GpiodChip;
+use libgpiod::{gpiod_is_gpiochip_device, Direction};
+
+fn line_info(chip: &GpiodChip, offset: u32) {
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
+        let chip = GpiodChip::open(path).unwrap();
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
index 000000000000..7e44ec0da357
--- /dev/null
+++ b/bindings/rust/examples/gpiomon.rs
@@ -0,0 +1,73 @@
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
+use libgpiod::chip::GpiodChip;
+use libgpiod::event_buffer::GpiodEdgeEventBuffer;
+use libgpiod::line_config::GpiodLineConfig;
+use libgpiod::request_config::GpiodRequestConfig;
+use libgpiod::{Edge, EdgeEvent, Error};
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
+    let mut config = GpiodLineConfig::new().unwrap();
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
+    let chip = GpiodChip::open(&path).unwrap();
+
+    let rconfig = GpiodRequestConfig::new().unwrap();
+    rconfig.set_consumer(&args[0]);
+    rconfig.set_offsets(&offsets);
+
+    let buffer = GpiodEdgeEventBuffer::new(64).unwrap();
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
+        let count = request.edge_event_read(&buffer, 64).unwrap();
+        for i in 0..count {
+            let event = buffer.get_event(i as u64).unwrap();
+            println!(
+                "line: {} type: {}, time: {:?}",
+                event.get_line_offset(),
+                match event.get_event_type().unwrap() {
+                    EdgeEvent::Rising => "Rising",
+                    EdgeEvent::Falling => "Falling",
+                },
+                event.get_timestamp()
+            );
+        }
+    }
+}
diff --git a/bindings/rust/examples/gpioset.rs b/bindings/rust/examples/gpioset.rs
new file mode 100644
index 000000000000..956f2d754717
--- /dev/null
+++ b/bindings/rust/examples/gpioset.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
+//
+// Copyright 2021 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpioset tool.
+
+use std::env;
+
+use libgpiod::chip::GpiodChip;
+use libgpiod::line_config::GpiodLineConfig;
+use libgpiod::request_config::GpiodRequestConfig;
+use libgpiod::Direction;
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
+    let mut config = GpiodLineConfig::new().unwrap();
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
+    let chip = GpiodChip::open(&path).unwrap();
+
+    let rconfig = GpiodRequestConfig::new().unwrap();
+    rconfig.set_consumer(&args[0]);
+    rconfig.set_offsets(&offsets);
+
+    chip.request_lines(&rconfig, &config).unwrap();
+}
-- 
2.31.1.272.g89b43f80a514

