Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582BA73AF87
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbjFWEkx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjFWEkq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:40:46 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C592686
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:40:42 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-25e9e5f9e0cso70082a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495241; x=1690087241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBXQ2xN/9S3exvadY1sG7spNVMDB2/dnp1h0M9QqrDY=;
        b=canMXTyV8e9pubb83w7cSidIhJL8lhVvEACmmo/QLeN8Yqu3/ltGDyTb3rqDH1DGDr
         6Dt7cL2zqw+C7tu3so9ZhXFibN5T1GxOp/KA/SmMYrHWG2R764pQS5qvIXZvtA6xRoVm
         0mwfkYN/3l00/1rN/aly+ePPwBMcWlQVIxbZtSjWz9Fiz2ev1kqH++HGb8uo5wKfs/XR
         QAp/1b5S+uY2TyEamQlrKtGPSF/wWcf49VqVpwfcW2DyYh5UgaS6xPjFjHeupXy1tGJ0
         cyxEdM+3wkPIzxcpBECFzzjodhIqblZEQXZd9sl2ztQ2R7DXH7cvlUdM9kY0nb8K9m/C
         kxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495241; x=1690087241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBXQ2xN/9S3exvadY1sG7spNVMDB2/dnp1h0M9QqrDY=;
        b=MpmSu7389hiDIXEDRwaMCTIop9STVF/RR2UO6ZDN+jKwl/uBty5B+6kCC1sBWPqyxp
         tEzIQRPR3Fq/Y5r04aCFqNEBjjwYPaOR2QDNI8d011FQvsdKLFyUfMj6zLqumHaqPW9C
         uVnFy5Jj445a8synZd63zbKC9VvvePD7SKA6hj66dPEtQhp/tnxK9ouCJq0LjCEkLDIo
         PKfqwbKvft4qS/h6CTHKoBWA59XoUVwF/DVBGuo8tmnhbzLnhtiWrxbrh+oYBmbAkl/U
         Zc2ardEsygQs0D01Pn30hUZ/t1OZ18WgsqlrViqL1DiG9IZttEuEIepOgF51FGUdQTtI
         T9xw==
X-Gm-Message-State: AC+VfDxXMrhO9OpPmyU/tjWQkatYm+u0IwMDc82l18zpC5gde0xRV68r
        DMfvxbnXnS43HGQDcQVOFVIP489hBqU=
X-Google-Smtp-Source: ACHHUZ4+XXCQGPBxbjA+bScmTR3LRoPSPwT2BvzLPB3R+bHv+5B/8uOsVcAwAtFqHFG1SpDvON/WnQ==
X-Received: by 2002:a17:90a:30d:b0:262:a8b1:c241 with SMTP id 13-20020a17090a030d00b00262a8b1c241mr90448pje.47.1687495240232;
        Thu, 22 Jun 2023 21:40:40 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:40:39 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 8/8] bindings: rust: examples: replace tools examples with use case examples
Date:   Fri, 23 Jun 2023 12:39:01 +0800
Message-ID: <20230623043901.16764-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
References: <20230623043901.16764-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace tool examples with use case examples drawn from the tools,
gpio_events example with buffered_event_lifetimes, and
gpio_threaded_info_events with reconfigure_input_to_output.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/rust/libgpiod/examples/Makefile.am   |  21 +--
 .../examples/buffered_event_lifetimes.rs      |  58 ++++++++
 .../libgpiod/examples/find_line_by_name.rs    |  29 ++++
 .../rust/libgpiod/examples/get_chip_info.rs   |  22 +++
 .../rust/libgpiod/examples/get_line_info.rs   |  37 +++++
 .../examples/get_multiple_line_values.rs      |  29 ++++
 .../rust/libgpiod/examples/gpio_events.rs     |  88 ------------
 .../examples/gpio_threaded_info_events.rs     | 132 ------------------
 bindings/rust/libgpiod/examples/gpiodetect.rs |  30 ----
 bindings/rust/libgpiod/examples/gpiofind.rs   |  36 -----
 bindings/rust/libgpiod/examples/gpioget.rs    |  45 ------
 bindings/rust/libgpiod/examples/gpioinfo.rs   |  97 -------------
 bindings/rust/libgpiod/examples/gpiomon.rs    |  74 ----------
 bindings/rust/libgpiod/examples/gpionotify.rs |  53 -------
 bindings/rust/libgpiod/examples/gpioset.rs    |  63 ---------
 bindings/rust/libgpiod/examples/gpiowatch.rs  |  53 -------
 .../examples/reconfigure_input_to_output.rs   |  42 ++++++
 .../examples/toggle_multiple_line_values.rs   |  55 ++++++++
 .../rust/libgpiod/examples/watch_line_info.rs |  32 +++++
 .../libgpiod/examples/watch_line_rising.rs    |  44 ++++++
 .../examples/watch_multiple_line_values.rs    |  46 ++++++
 21 files changed, 405 insertions(+), 681 deletions(-)
 create mode 100644 bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
 create mode 100644 bindings/rust/libgpiod/examples/find_line_by_name.rs
 create mode 100644 bindings/rust/libgpiod/examples/get_chip_info.rs
 create mode 100644 bindings/rust/libgpiod/examples/get_line_info.rs
 create mode 100644 bindings/rust/libgpiod/examples/get_multiple_line_values.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpio_events.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpionotify.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
 delete mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs
 create mode 100644 bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
 create mode 100644 bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_line_info.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_line_rising.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_multiple_line_values.rs

diff --git a/bindings/rust/libgpiod/examples/Makefile.am b/bindings/rust/libgpiod/examples/Makefile.am
index b3338bd..ea1826f 100644
--- a/bindings/rust/libgpiod/examples/Makefile.am
+++ b/bindings/rust/libgpiod/examples/Makefile.am
@@ -3,16 +3,17 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 EXTRA_DIST = \
+	buffered_event_lifetimes.rs \
+	find_line_by_name.rs \
+	get_chip_info.rs \
+	get_line_info.rs \
 	get_line_value.rs \
-	gpiodetect.rs \
-	gpio_events.rs \
-	gpiofind.rs \
-	gpioget.rs \
-	gpioinfo.rs \
-	gpiomon.rs \
-	gpionotify.rs \
-	gpioset.rs \
+	get_multiple_line_values.rs \
 	gpio_threaded_info_events.rs \
-	gpiowatch.rs \
+	reconfigure_input_to_output \
 	toggle_line_value.rs \
-	watch_line_value.rs
+	toggle_multiple_line_values.rs \
+	watch_line_info.rs \
+	watch_line_rising.rs \
+	watch_line_value.rs \
+	watch_multiple_line_values.rs
diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
new file mode 100644
index 0000000..ad90d7b
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2022 Linaro Ltd.
+// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+//
+// An example demonstrating that an edge event must be cloned to outlive
+// subsequent writes to the containing event buffer.
+
+use libgpiod::line;
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offset = 5;
+
+    let mut lsettings = line::Settings::new()?;
+    lsettings.set_edge_detection(Some(line::Edge::Both))?;
+
+    let mut lconfig = line::Config::new()?;
+    lconfig.add_line_settings(&[line_offset], lsettings)?;
+
+    let mut rconfig = libgpiod::request::Config::new()?;
+    rconfig.set_consumer("buffered-event-lifetimes")?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
+
+    let mut buffer = libgpiod::request::Buffer::new(4)?;
+
+    loop {
+        // Blocks until at least one event is available
+        let mut events = request.read_edge_events(&mut buffer)?;
+
+        // This can't be used across the next read_edge_events().
+        let event = events.next().unwrap()?;
+
+        // This will out live `event` and the next read_edge_events().
+        let cloned_event = libgpiod::request::Event::event_clone(event)?;
+
+        let events = request.read_edge_events(&mut buffer)?;
+        for event in events {
+            let event = event?;
+            println!(
+                "line: {}  type: {:?}  event #{}",
+                event.line_offset(),
+                event.event_type(),
+                event.line_seqno(),
+            );
+        }
+
+        // `cloned_event` is still available to be used.
+        println!(
+            "line: {}  type: {:?}  event #{}",
+            cloned_event.line_offset(),
+            cloned_event.event_type(),
+            cloned_event.line_seqno(),
+        );
+    }
+}
diff --git a/bindings/rust/libgpiod/examples/find_line_by_name.rs b/bindings/rust/libgpiod/examples/find_line_by_name.rs
new file mode 100644
index 0000000..f7b9919
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/find_line_by_name.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of finding a line with the given name.
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let line_name = "GPIO19";
+
+    // Names are not guaranteed unique, so this finds the first line with
+    // the given name.
+    for chip in libgpiod::gpiochip_devices(&"/dev")? {
+        let offset = chip.line_offset_from_name(line_name);
+
+        if offset.is_ok() {
+            let info = chip.info()?;
+            println!(
+                "{}: {} {}",
+                line_name,
+                info.name()?,
+                offset?
+            );
+            return Ok(());
+        }
+    }
+
+    println!("line '{}' not found", line_name);
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/get_chip_info.rs b/bindings/rust/libgpiod/examples/get_chip_info.rs
new file mode 100644
index 0000000..cc23c86
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/get_chip_info.rs
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of reading the info for a chip.
+
+use libgpiod::{self, Result};
+
+fn main() -> Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let info = chip.info()?;
+    println!(
+        "{} [{}] ({} lines)",
+        info.name()?,
+        info.label()?,
+        info.num_lines(),
+    );
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/get_line_info.rs b/bindings/rust/libgpiod/examples/get_line_info.rs
new file mode 100644
index 0000000..086db90
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/get_line_info.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of reading the info for a line.
+
+use libgpiod::line::Direction;
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offset = 3;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let info = chip.line_info(line_offset)?;
+
+    let name = info.name().unwrap_or("unnamed");
+    let consumer = info.consumer().unwrap_or("unused");
+
+    let dir = match info.direction()? {
+        Direction::AsIs => "none",
+        Direction::Input => "input",
+        Direction::Output => "output",
+    };
+
+    let low = if info.is_active_low() {
+        "active-low"
+    } else {
+        "active-high"
+    };
+
+    println!(
+        "line {:>3}: {:>12} {:>12} {:>8} {:>10}",
+        line_offset, name, consumer, dir, low
+    );
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/get_multiple_line_values.rs b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
new file mode 100644
index 0000000..a1be5a6
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of reading multiple lines.
+
+use libgpiod::line::{self, Direction};
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offsets = [5, 3, 7];
+
+    let mut lsettings = line::Settings::new()?;
+    let mut lconfig = line::Config::new()?;
+
+    lsettings.set_direction(Direction::Input)?;
+    lconfig.add_line_settings(&line_offsets, lsettings)?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+
+    let mut rconfig = libgpiod::request::Config::new()?;
+    rconfig.set_consumer("get-multiple-line-values")?;
+
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
+    let values = request.values()?;
+
+    println!("{:?}", values);
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
deleted file mode 100644
index a45b6db..0000000
--- a/bindings/rust/libgpiod/examples/gpio_events.rs
+++ /dev/null
@@ -1,88 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation to show handling of events, when the buffer
-// is read into multiple times. Based on gpiomon example.
-
-use std::env;
-
-use libgpiod::{
-    chip::Chip,
-    line::{self, Edge, Offset},
-    request, Error, Result,
-};
-
-fn usage(name: &str) {
-    println!("Usage: {} <chip> <offset0> ...", name);
-}
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() < 3 {
-        usage(&args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    let mut lsettings = line::Settings::new()?;
-    let mut lconfig = line::Config::new()?;
-    let mut offsets = Vec::<Offset>::new();
-
-    for arg in &args[2..] {
-        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
-        offsets.push(offset);
-    }
-
-    lsettings.set_edge_detection(Some(Edge::Both))?;
-    lconfig.add_line_settings(&offsets, lsettings)?;
-
-    let path = format!("/dev/gpiochip{}", args[1]);
-    let chip = Chip::open(&path)?;
-
-    let rconfig = request::Config::new()?;
-
-    let mut buffer = request::Buffer::new(1)?;
-    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
-
-    loop {
-        match request.wait_edge_events(None) {
-            Err(x) => {
-                println!("{:?}", x);
-                return Err(Error::InvalidArguments);
-            }
-
-            Ok(false) => {
-                // This shouldn't happen as the call is blocking.
-                panic!();
-            }
-            Ok(true) => (),
-        }
-
-        let mut events = request.read_edge_events(&mut buffer)?;
-
-        // This can't be used across the next read_edge_events().
-        let event = events.next().unwrap()?;
-
-        // This will out live `event` and the next read_edge_events().
-        let cloned_event = request::Event::event_clone(event)?;
-
-        let events = request.read_edge_events(&mut buffer)?;
-        for event in events {
-            let event = event?;
-            println!(
-                "line: {} type: {:?}, time: {:?}",
-                event.line_offset(),
-                event.event_type(),
-                event.timestamp()
-            );
-        }
-
-        // `cloned_event` is still available to be used.
-        println!(
-            "line: {} type: {:?}, time: {:?}",
-            cloned_event.line_offset(),
-            cloned_event.event_type(),
-            cloned_event.timestamp()
-        );
-    }
-}
diff --git a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
deleted file mode 100644
index 8853a7b..0000000
--- a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
+++ /dev/null
@@ -1,132 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation to show handling of info events, that are
-// generated from another thread.
-
-use std::{
-    env,
-    sync::{
-        mpsc::{self, Receiver, Sender},
-        Arc, Mutex,
-    },
-    thread,
-    time::Duration,
-};
-
-use libgpiod::{
-    chip::Chip,
-    line::{self, Direction, InfoChangeKind, Offset},
-    request, Error, Result,
-};
-
-fn usage(name: &str) {
-    println!("Usage: {} <chip> <offset>", name);
-}
-
-fn request_reconfigure_line(
-    chip: Arc<Mutex<Chip>>,
-    offset: Offset,
-    tx: Sender<()>,
-    rx: Receiver<()>,
-) {
-    thread::spawn(move || {
-        let mut lconfig = line::Config::new().unwrap();
-        let lsettings = line::Settings::new().unwrap();
-        lconfig.add_line_settings(&[offset], lsettings).unwrap();
-        let rconfig = request::Config::new().unwrap();
-
-        let mut request = chip
-            .lock()
-            .unwrap()
-            .request_lines(Some(&rconfig), &lconfig)
-            .unwrap();
-
-        // Signal the parent to continue
-        tx.send(()).expect("Could not send signal on channel");
-
-        // Wait for parent to signal
-        rx.recv().expect("Could not receive from channel");
-
-        let mut lconfig = line::Config::new().unwrap();
-        let mut lsettings = line::Settings::new().unwrap();
-        lsettings.set_direction(Direction::Output).unwrap();
-        lconfig.add_line_settings(&[offset], lsettings).unwrap();
-
-        request.reconfigure_lines(&lconfig).unwrap();
-
-        // Signal the parent to continue
-        tx.send(()).expect("Could not send signal on channel");
-
-        // Wait for parent to signal
-        rx.recv().expect("Could not receive from channel");
-    });
-}
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() != 3 {
-        usage(&args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    let path = format!("/dev/gpiochip{}", args[1]);
-    let offset = args[2]
-        .parse::<Offset>()
-        .map_err(|_| Error::InvalidArguments)?;
-
-    let chip = Arc::new(Mutex::new(Chip::open(&path)?));
-    chip.lock().unwrap().watch_line_info(offset)?;
-
-    // Thread synchronizing mechanism
-    let (tx_main, rx_thread) = mpsc::channel();
-    let (tx_thread, rx_main) = mpsc::channel();
-
-    // Generate events
-    request_reconfigure_line(chip.clone(), offset, tx_thread, rx_thread);
-
-    // Wait for thread to signal
-    rx_main.recv().expect("Could not receive from channel");
-
-    // Line requested event
-    assert!(chip
-        .lock()
-        .unwrap()
-        .wait_info_event(Some(Duration::from_secs(1)))?);
-    let event = chip.lock().unwrap().read_info_event()?;
-    assert_eq!(event.event_type()?, InfoChangeKind::LineRequested);
-
-    // Signal the thread to continue
-    tx_main.send(()).expect("Could not send signal on channel");
-
-    // Wait for thread to signal
-    rx_main.recv().expect("Could not receive from channel");
-
-    // Line changed event
-    assert!(chip
-        .lock()
-        .unwrap()
-        .wait_info_event(Some(Duration::from_millis(10)))?);
-    let event = chip.lock().unwrap().read_info_event()?;
-    assert_eq!(event.event_type()?, InfoChangeKind::LineConfigChanged);
-
-    // Signal the thread to continue
-    tx_main.send(()).expect("Could not send signal on channel");
-
-    // Line released event
-    assert!(chip
-        .lock()
-        .unwrap()
-        .wait_info_event(Some(Duration::from_millis(10)))?);
-    let event = chip.lock().unwrap().read_info_event()?;
-    assert_eq!(event.event_type().unwrap(), InfoChangeKind::LineReleased);
-
-    // No events available
-    assert!(!chip
-        .lock()
-        .unwrap()
-        .wait_info_event(Some(Duration::from_millis(100)))?);
-
-    Ok(())
-}
diff --git a/bindings/rust/libgpiod/examples/gpiodetect.rs b/bindings/rust/libgpiod/examples/gpiodetect.rs
deleted file mode 100644
index 9792252..0000000
--- a/bindings/rust/libgpiod/examples/gpiodetect.rs
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation of gpiodetect tool.
-
-use std::env;
-use std::path::Path;
-
-use libgpiod::{self, Error, Result};
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() > 1 {
-        println!("Usage: {}", args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    for chip in libgpiod::gpiochip_devices(&Path::new("/dev"))? {
-        let info = chip.info()?;
-        println!(
-            "{} [{}] ({})",
-            info.name()?,
-            info.label()?,
-            info.num_lines(),
-        );
-    }
-
-    Ok(())
-}
diff --git a/bindings/rust/libgpiod/examples/gpiofind.rs b/bindings/rust/libgpiod/examples/gpiofind.rs
deleted file mode 100644
index da0530d..0000000
--- a/bindings/rust/libgpiod/examples/gpiofind.rs
+++ /dev/null
@@ -1,36 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation of gpiofind tool.
-
-use std::env;
-use std::path::Path;
-
-use libgpiod::{self, Error, Result};
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() != 2 {
-        println!("Usage: {} <line-name>", args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    for chip in libgpiod::gpiochip_devices(&Path::new("/dev"))? {
-        let offset = chip.line_offset_from_name(&args[1]);
-        let info = chip.info()?;
-
-        if offset.is_ok() {
-            println!(
-                "Line {} found: Chip: {}, offset: {}",
-                args[1],
-                info.name()?,
-                offset?
-            );
-            return Ok(());
-        }
-    }
-
-    println!("Failed to find line: {}", args[1]);
-    Ok(())
-}
diff --git a/bindings/rust/libgpiod/examples/gpioget.rs b/bindings/rust/libgpiod/examples/gpioget.rs
deleted file mode 100644
index 8e390f3..0000000
--- a/bindings/rust/libgpiod/examples/gpioget.rs
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation of gpioget tool.
-
-use std::env;
-
-use libgpiod::{
-    chip::Chip,
-    line::{self, Direction, Offset},
-    request, Error, Result,
-};
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() < 3 {
-        println!("Usage: {} <chip> <line_offset0> ...", args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    let mut lsettings = line::Settings::new()?;
-    let mut lconfig = line::Config::new()?;
-    let mut offsets = Vec::<Offset>::new();
-
-    for arg in &args[2..] {
-        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
-        offsets.push(offset);
-    }
-
-    lsettings.set_direction(Direction::Input)?;
-    lconfig.add_line_settings(&offsets, lsettings)?;
-
-    let path = format!("/dev/gpiochip{}", args[1]);
-    let chip = Chip::open(&path)?;
-
-    let mut rconfig = request::Config::new()?;
-    rconfig.set_consumer(&args[0])?;
-
-    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
-    let map = request.values()?;
-
-    println!("{:?}", map);
-    Ok(())
-}
diff --git a/bindings/rust/libgpiod/examples/gpioinfo.rs b/bindings/rust/libgpiod/examples/gpioinfo.rs
deleted file mode 100644
index 1fe1ae0..0000000
--- a/bindings/rust/libgpiod/examples/gpioinfo.rs
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation of gpioinfo tool.
-
-use std::env;
-use std::path::Path;
-
-use libgpiod::{
-    chip::Chip,
-    line::{Direction, Offset},
-    Error, Result,
-};
-
-fn line_info(chip: &Chip, offset: Offset) -> Result<()> {
-    let info = chip.line_info(offset)?;
-    let off = info.offset();
-
-    let name = match info.name() {
-        Ok(name) => name,
-        _ => "unused",
-    };
-
-    let consumer = match info.consumer() {
-        Ok(name) => name,
-        _ => "unnamed",
-    };
-
-    let low = if info.is_active_low() {
-        "active-low"
-    } else {
-        "active-high"
-    };
-
-    let dir = match info.direction()? {
-        Direction::AsIs => "None",
-        Direction::Input => "Input",
-        Direction::Output => "Output",
-    };
-
-    println!(
-        "\tline {:>3}\
-              \t{:>10}\
-              \t{:>10}\
-              \t{:>6}\
-              \t{:>14}",
-        off, name, consumer, dir, low
-    );
-
-    Ok(())
-}
-
-fn chip_info(chip: &Chip) -> Result<()> {
-    let info = chip.info()?;
-    let ngpio = info.num_lines();
-
-    println!("GPIO Chip name: {}", info.name()?);
-    println!("\tlabel: {}", info.label()?);
-    println!("\tpath: {}", chip.path()?);
-    println!("\tngpio: {}\n", ngpio);
-
-    println!("\tLine information:");
-
-    for offset in 0..ngpio {
-        line_info(chip, offset as Offset)?;
-    }
-    println!("\n");
-
-    Ok(())
-}
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() > 2 {
-        println!("Usage: {}", args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    if args.len() == 1 {
-        for chip in libgpiod::gpiochip_devices(&Path::new("/dev"))? {
-            chip_info(&chip)?;
-        }
-    } else {
-        let index = args[1]
-            .parse::<u32>()
-            .map_err(|_| Error::InvalidArguments)?;
-        let path = format!("/dev/gpiochip{}", index);
-        if libgpiod::is_gpiochip_device(&path) {
-            let chip = Chip::open(&path)?;
-
-            chip_info(&chip)?;
-        }
-    }
-
-    Ok(())
-}
diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
deleted file mode 100644
index c3564db..0000000
--- a/bindings/rust/libgpiod/examples/gpiomon.rs
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation of the gpiomon tool.
-
-use std::env;
-
-use libgpiod::{
-    chip::Chip,
-    line::{self, Edge, EdgeKind, Offset},
-    request, Error, Result,
-};
-
-fn usage(name: &str) {
-    println!("Usage: {} <chip> <offset0> ...", name);
-}
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() < 3 {
-        usage(&args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    let mut lsettings = line::Settings::new()?;
-    let mut lconfig = line::Config::new()?;
-    let mut offsets = Vec::<Offset>::new();
-
-    for arg in &args[2..] {
-        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
-        offsets.push(offset);
-    }
-
-    lsettings.set_edge_detection(Some(Edge::Both))?;
-    lconfig.add_line_settings(&offsets, lsettings)?;
-
-    let path = format!("/dev/gpiochip{}", args[1]);
-    let chip = Chip::open(&path)?;
-
-    let rconfig = request::Config::new()?;
-
-    let mut buffer = request::Buffer::new(1)?;
-    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
-
-    loop {
-        match request.wait_edge_events(None) {
-            Err(x) => {
-                println!("{:?}", x);
-                return Err(Error::InvalidArguments);
-            }
-
-            Ok(false) => {
-                // This shouldn't happen as the call is blocking.
-                panic!();
-            }
-            Ok(true) => (),
-        }
-
-        let events = request.read_edge_events(&mut buffer)?;
-        for event in events {
-            let event = event?;
-            println!(
-                "line: {} type: {}, time: {:?}",
-                event.line_offset(),
-                match event.event_type()? {
-                    EdgeKind::Rising => "Rising",
-                    EdgeKind::Falling => "Falling",
-                },
-                event.timestamp()
-            );
-        }
-    }
-}
diff --git a/bindings/rust/libgpiod/examples/gpionotify.rs b/bindings/rust/libgpiod/examples/gpionotify.rs
deleted file mode 100644
index fca1086..0000000
--- a/bindings/rust/libgpiod/examples/gpionotify.rs
+++ /dev/null
@@ -1,53 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2023 Linaro Ltd.
-// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-//
-// Simplified Rust implementation of the gpionotify tool.
-
-use std::env;
-
-use libgpiod::{
-    chip::Chip,
-    line::{Offset, InfoChangeKind},
-    Error, Result,
-};
-
-fn usage(name: &str) {
-    println!("Usage: {} <chip> <offset0> ...", name);
-}
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() < 3 {
-        usage(&args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    let mut offsets = Vec::<Offset>::new();
-
-    for arg in &args[2..] {
-        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
-        offsets.push(offset);
-    }
-
-    let path = format!("/dev/gpiochip{}", args[1]);
-    let chip = Chip::open(&path)?;
-
-    for &offset in offsets.iter() {
-        let _info = chip.watch_line_info(offset).unwrap();
-    }
-
-    loop {
-        let event = chip.read_info_event().unwrap();
-        println!(
-            "event: {}, line: {}, timestamp: {:?}",
-            match event.event_type()? {
-                InfoChangeKind::LineRequested => "Line requested",
-                InfoChangeKind::LineReleased => "Line released",
-                InfoChangeKind::LineConfigChanged => "Line config changed",
-            },
-            event.line_info().unwrap().offset(),
-            event.timestamp()
-        );
-    }
-}
diff --git a/bindings/rust/libgpiod/examples/gpioset.rs b/bindings/rust/libgpiod/examples/gpioset.rs
deleted file mode 100644
index 607407d..0000000
--- a/bindings/rust/libgpiod/examples/gpioset.rs
+++ /dev/null
@@ -1,63 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation of the gpioset tool.
-
-use std::env;
-use std::io::{stdin, Read};
-
-use libgpiod::{
-    chip::Chip,
-    line::{self, Direction, Offset, SettingVal, Value},
-    request, Error, Result,
-};
-
-fn usage(name: &str) {
-    println!("Usage: {} <chip> <line_offset0>=<value0> ...", name);
-}
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() < 3 {
-        usage(&args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    let mut lconfig = line::Config::new()?;
-
-    for arg in &args[2..] {
-        let pair: Vec<&str> = arg.split('=').collect();
-        if pair.len() != 2 {
-            usage(&args[0]);
-            return Err(Error::InvalidArguments);
-        }
-
-        let offset = pair[0]
-            .parse::<Offset>()
-            .map_err(|_| Error::InvalidArguments)?;
-        let value = pair[1]
-            .parse::<i32>()
-            .map_err(|_| Error::InvalidArguments)?;
-
-        let mut lsettings = line::Settings::new()?;
-        lsettings.set_prop(&[
-            SettingVal::Direction(Direction::Output),
-            SettingVal::OutputValue(Value::new(value)?),
-        ])?;
-        lconfig.add_line_settings(&[offset], lsettings)?;
-    }
-
-    let path = format!("/dev/gpiochip{}", args[1]);
-    let chip = Chip::open(&path)?;
-
-    let mut rconfig = request::Config::new()?;
-    rconfig.set_consumer(&args[0])?;
-
-    chip.request_lines(Some(&rconfig), &lconfig)?;
-
-    // Wait for keypress, let user verify line status.
-    stdin().read_exact(&mut [0u8]).unwrap();
-
-    Ok(())
-}
diff --git a/bindings/rust/libgpiod/examples/gpiowatch.rs b/bindings/rust/libgpiod/examples/gpiowatch.rs
deleted file mode 100644
index 26a2ed8..0000000
--- a/bindings/rust/libgpiod/examples/gpiowatch.rs
+++ /dev/null
@@ -1,53 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
-// SPDX-FileCopyrightText: 2022 Linaro Ltd.
-// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-//
-// Simplified Rust implementation of the gpiowatch tool.
-
-use std::env;
-
-use libgpiod::{chip::Chip, line::Offset, Error, Result};
-
-fn usage(name: &str) {
-    println!("Usage: {} <chip> <offset0> ...", name);
-}
-
-fn main() -> Result<()> {
-    let args: Vec<String> = env::args().collect();
-    if args.len() < 2 {
-        usage(&args[0]);
-        return Err(Error::InvalidArguments);
-    }
-
-    let path = format!("/dev/gpiochip{}", args[1]);
-    let offset = args[2]
-        .parse::<Offset>()
-        .map_err(|_| Error::InvalidArguments)?;
-
-    let chip = Chip::open(&path)?;
-    let _info = chip.watch_line_info(offset)?;
-
-    match chip.wait_info_event(None) {
-        Err(x) => {
-            println!("{:?}", x);
-            return Err(Error::InvalidArguments);
-        }
-
-        Ok(false) => {
-            // This shouldn't happen as the call is blocking.
-            panic!();
-        }
-        Ok(true) => (),
-    }
-
-    let event = chip.read_info_event()?;
-    println!(
-        "line: {} type: {:?}, time: {:?}",
-        offset,
-        event.event_type()?,
-        event.timestamp()
-    );
-
-    chip.unwatch(offset);
-    Ok(())
-}
diff --git a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
new file mode 100644
index 0000000..3e2f2c7
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of requesting a line intended for bi-directional use as input and then switching to output.
+
+use libgpiod::line;
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offset = 5;
+
+    let mut lsettings = line::Settings::new()?;
+    lsettings.set_direction(line::Direction::Input)?;
+
+    let mut lconfig = line::Config::new()?;
+    lconfig.add_line_settings(&[line_offset], lsettings)?;
+
+    let mut rconfig = libgpiod::request::Config::new()?;
+    rconfig.set_consumer("reconfigure-input-to-output")?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    // request the line initially as an input
+    let mut request = chip.request_lines(Some(&rconfig), &lconfig)?;
+
+    // read the current line value
+    let value = request.value(line_offset)?;
+    println!("{}={:?} (input)", line_offset, value);
+
+    // switch the line to an output and drive it low
+    let mut lsettings = line::Settings::new()?;
+    lsettings.set_direction(line::Direction::Output)?;
+    lsettings.set_output_value(line::Value::InActive)?;
+    lconfig.add_line_settings(&[line_offset], lsettings)?;
+    request.reconfigure_lines(&lconfig)?;
+
+    // report the current driven value
+    let value = request.value(line_offset)?;
+    println!("{}={:?} (output)", line_offset, value);
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
new file mode 100644
index 0000000..b7e6915
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of toggling multiple lines.
+
+use core::time::Duration;
+use libgpiod::line::{self, Offset, Value};
+
+fn toggle_value(value: Value) -> Value {
+    match value {
+        Value::Active => Value::InActive,
+        Value::InActive => Value::Active,
+    }
+}
+
+fn toggle_values(values: &mut [Value]) {
+    for i in values.iter_mut() {
+        *i = toggle_value(*i);
+    }
+}
+
+fn print_values(offsets: &[Offset], values: &[Value]) {
+    for i in 0..offsets.len() {
+        print!("{}={:?} ", offsets[i], values[i]);
+    }
+    println!();
+}
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offsets = [5, 3, 7];
+    let mut values = vec![Value::Active, Value::Active, Value::InActive];
+
+    let mut lsettings = line::Settings::new()?;
+    lsettings.set_direction(line::Direction::Output)?;
+
+    let mut lconfig = line::Config::new()?;
+    lconfig
+        .add_line_settings(&line_offsets, lsettings)?
+        .set_output_values(&values)?;
+
+    let mut rconfig = libgpiod::request::Config::new()?;
+    rconfig.set_consumer("toggle-multiple-line-values")?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let mut req = chip.request_lines(Some(&rconfig), &lconfig)?;
+
+    loop {
+        print_values(&line_offsets, &values);
+        std::thread::sleep(Duration::from_secs(1));
+        toggle_values(&mut values);
+        req.set_values(&values)?;
+    }
+}
diff --git a/bindings/rust/libgpiod/examples/watch_line_info.rs b/bindings/rust/libgpiod/examples/watch_line_info.rs
new file mode 100644
index 0000000..e84ce13
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/watch_line_info.rs
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of watching for info changes on particular lines.
+
+use libgpiod::line::InfoChangeKind;
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offsets = [5, 3, 7];
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    for offset in line_offsets {
+        let _info = chip.watch_line_info(offset)?;
+    }
+
+    loop {
+        // Blocks until at least one event is available.
+        let event = chip.read_info_event()?;
+        println!(
+            "line: {} {:<9} {:?}",
+            event.line_info()?.offset(),
+            match event.event_type()? {
+                InfoChangeKind::LineRequested => "Requested",
+                InfoChangeKind::LineReleased => "Released",
+                InfoChangeKind::LineConfigChanged => "Reconfig",
+            },
+            event.timestamp()
+        );
+    }
+}
diff --git a/bindings/rust/libgpiod/examples/watch_line_rising.rs b/bindings/rust/libgpiod/examples/watch_line_rising.rs
new file mode 100644
index 0000000..81a2407
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/watch_line_rising.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of watching for edges on a single line.
+
+use libgpiod::line;
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offset = 5;
+
+    let mut lsettings = line::Settings::new()?;
+    lsettings.set_edge_detection(Some(line::Edge::Rising))?;
+
+    let mut lconfig = line::Config::new()?;
+    lconfig.add_line_settings(&[line_offset], lsettings)?;
+
+    let mut rconfig = libgpiod::request::Config::new()?;
+    rconfig.set_consumer("watch-line-value")?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
+
+    // A larger buffer is an optimisation for reading bursts of events from the
+    // kernel, but that is not necessary in this case, so 1 is fine.
+    let mut buffer = libgpiod::request::Buffer::new(1)?;
+    loop {
+        // blocks until at least one event is available
+        let events = request.read_edge_events(&mut buffer)?;
+        for event in events {
+            let event = event?;
+            println!(
+                "line: {}  type: {:<7}  event #{}",
+                event.line_offset(),
+                match event.event_type()? {
+                    line::EdgeKind::Rising => "Rising",
+                    line::EdgeKind::Falling => "Falling",
+                },
+                event.line_seqno()
+            );
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
new file mode 100644
index 0000000..3fc88ba
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of watching for edges on multiple lines.
+
+use libgpiod::{
+    line::{self, EdgeKind},
+    request,
+};
+
+fn main() -> libgpiod::Result<()> {
+    // Example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offsets = [5, 3, 7];
+
+    let mut lsettings = line::Settings::new()?;
+    lsettings.set_edge_detection(Some(line::Edge::Both))?;
+
+    let mut lconfig = line::Config::new()?;
+    lconfig.add_line_settings(&line_offsets, lsettings)?;
+
+    let mut rconfig = request::Config::new()?;
+    rconfig.set_consumer("watch-multiple-line-values")?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
+
+    let mut buffer = request::Buffer::new(4)?;
+    loop {
+        // Blocks until at least one event is available.
+        let events = request.read_edge_events(&mut buffer)?;
+        for event in events {
+            let event = event?;
+            println!(
+                "offset: {}  type: {:<7}  event #{}  line event #{}",
+                event.line_offset(),
+                match event.event_type()? {
+                    EdgeKind::Rising => "Rising",
+                    EdgeKind::Falling => "Falling",
+                },
+                event.global_seqno(),
+                event.line_seqno(),
+            );
+        }
+    }
+}
-- 
2.41.0

