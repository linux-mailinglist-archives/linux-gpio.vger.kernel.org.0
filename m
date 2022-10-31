Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D166134DF
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 12:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiJaLrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 07:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbiJaLrv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 07:47:51 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDC8E0D7
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:47 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so15679855pjk.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC0VO0h74sK2z1Flqq5NajCFm6MxQGoFAhxwQT/0SJ8=;
        b=p1CWOMWwpfXSkEgMRwgoeXZ+ziRpXkR6aJy2GVYXUNzNaUxQ355+SAWWi/GFC3ye/D
         n0tCqM0JNtKQc1gzn8Bj1XZkzqiRCIKQPZUSX2+e/6iVaGO6pBgLOWAhyzNSuZfEdg75
         jcL193Msda46vEBmnGs4Aw7pgroTlWAfr3CI8CU6VFclqV+DKOrYOv6yYnlc2Whyvthz
         D47UVS904CMPROVxXOOoEbotmmP0wpBF1lz34oY1k4eUm3HGYv25Ns1FV9+Dk50J/LO5
         qlD8yE0iKmxwdthOYN8OU8ZZd+D/RJ5rdbzGObzhs2yJCDhXegZKfE1PPFie31mJD3OQ
         s5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aC0VO0h74sK2z1Flqq5NajCFm6MxQGoFAhxwQT/0SJ8=;
        b=RQdRa3hf14MHXdWwi9ngGjyDhpdiEBIQ0rSaN+wumzP1LUG/JqInmomuJJrW3wiTpA
         GCy4kudBqxn+KA5deTt06++N5hc8yAwfOdQ6Z1RFsC3rOZ4Z9C2UtkzX0Ddt6ey6X8yv
         N9cOwxH6kKmBtjn3O2Bb2Wwq27SVM8vEN17BWUxehHJEFGGo2LX742fQq5TtfiWiGGjV
         l2NkjB2EUMu1aujPklaOD/vKZBEARAe0gwFyxnfo8eKoHVWmAExzCdN7eM4m1Wz4qNH9
         WhQr4OdOlUmNDby/QmpybE2Q4QEPX6Jqvs9le0kTCreMvH+eogO5v5Te+zZQXakSAGSq
         dRGA==
X-Gm-Message-State: ACrzQf3IAoJdVVUZRJSUxuC/S6mNi6GxqyZVcJoGHgqRVmbiPXMkdIOW
        JaYFjwWQgcbcGIc6+5H4BcZDMA==
X-Google-Smtp-Source: AMsMyM4wn/4SDwxgPGjrSZCGQHk7/QO+52v5v1V4olqP8uP+TwfEsyCwaymi+TS2vnwwN5qoNqH/uA==
X-Received: by 2002:a17:902:9b8e:b0:187:30ec:67dd with SMTP id y14-20020a1709029b8e00b0018730ec67ddmr283607plp.79.1667216866922;
        Mon, 31 Oct 2022 04:47:46 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id n11-20020a170903404b00b00176e6f553efsm4303957pla.84.2022.10.31.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:46 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod v2][PATCH V8 6/9] bindings: rust: Add examples to libgpiod crate
Date:   Mon, 31 Oct 2022 17:17:14 +0530
Message-Id: <d20a606b5de4c05763f0051110587056f493c639.1667215380.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667215380.git.viresh.kumar@linaro.org>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
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
 .../rust/libgpiod/examples/gpio_events.rs     |  88 ++++++++++++
 .../examples/gpio_threaded_info_events.rs     | 133 ++++++++++++++++++
 bindings/rust/libgpiod/examples/gpiodetect.rs |  31 ++++
 bindings/rust/libgpiod/examples/gpiofind.rs   |  37 +++++
 bindings/rust/libgpiod/examples/gpioget.rs    |  46 ++++++
 bindings/rust/libgpiod/examples/gpioinfo.rs   |  98 +++++++++++++
 bindings/rust/libgpiod/examples/gpiomon.rs    |  75 ++++++++++
 bindings/rust/libgpiod/examples/gpioset.rs    |  64 +++++++++
 bindings/rust/libgpiod/examples/gpiowatch.rs  |  54 +++++++
 9 files changed, 626 insertions(+)
 create mode 100644 bindings/rust/libgpiod/examples/gpio_events.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
 create mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs

diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
new file mode 100644
index 000000000000..77a7d2a5faa1
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpio_events.rs
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation to show handling of events, when the buffer
+// is read into multiple times. Based on gpiomon example.
+
+use std::env;
+
+use libgpiod::{
+    chip::Chip,
+    line::{self, Edge, Offset},
+    request, Error, Result,
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
+    lsettings.set_edge_detection(Some(Edge::Both))?;
+    lconfig.add_line_settings(&offsets, lsettings)?;
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+
+    let mut buffer = request::Buffer::new(1)?;
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
+            let cloned_event = request::Event::event_clone(&event)?;
+
+            // This is required before reading events again into the buffer.
+            drop(event);
+
+            let count = request.read_edge_events(&mut buffer)?;
+            if count == 1 {
+                let event = buffer.event(0)?;
+                println!(
+                    "line: {} type: {:?}, time: {:?}",
+                    cloned_event.line_offset(),
+                    cloned_event.event_type(),
+                    cloned_event.timestamp()
+                );
+                println!(
+                    "line: {} type: {:?}, time: {:?}",
+                    event.line_offset(),
+                    event.event_type(),
+                    event.timestamp()
+                );
+            }
+        }
+    }
+}
diff --git a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
new file mode 100644
index 000000000000..04566f92e66c
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation to show handling of info events, that are
+// generated from another thread.
+
+use std::{
+    env,
+    sync::{
+        mpsc::{self, Receiver, Sender},
+        Arc, Mutex,
+    },
+    thread,
+    time::Duration,
+};
+
+use libgpiod::{
+    chip::Chip,
+    line::{self, Direction, InfoChangeKind, Offset},
+    request, Error, Result,
+};
+
+fn usage(name: &str) {
+    println!("Usage: {} <chip> <offset>", name);
+}
+
+fn request_reconfigure_line(
+    chip: Arc<Mutex<Chip>>,
+    offset: Offset,
+    tx: Sender<()>,
+    rx: Receiver<()>,
+) {
+    thread::spawn(move || {
+        let lconfig = line::Config::new().unwrap();
+        let lsettings = line::Settings::new().unwrap();
+        lconfig.add_line_settings(&[offset], lsettings).unwrap();
+        let rconfig = request::Config::new().unwrap();
+
+        let request = chip
+            .lock()
+            .unwrap()
+            .request_lines(&rconfig, &lconfig)
+            .unwrap();
+
+        // Signal the parent to continue
+        tx.send(()).expect("Could not send signal on channel");
+
+        // Wait for parent to signal
+        rx.recv().expect("Could not receive from channel");
+
+        let lconfig = line::Config::new().unwrap();
+        let mut lsettings = line::Settings::new().unwrap();
+        lsettings.set_direction(Direction::Output).unwrap();
+        lconfig.add_line_settings(&[offset], lsettings).unwrap();
+
+        request.reconfigure_lines(&lconfig).unwrap();
+
+        // Signal the parent to continue
+        tx.send(()).expect("Could not send signal on channel");
+
+        // Wait for parent to signal
+        rx.recv().expect("Could not receive from channel");
+    });
+}
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() != 3 {
+        usage(&args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let offset = args[2]
+        .parse::<Offset>()
+        .map_err(|_| Error::InvalidArguments)?;
+
+    let chip = Arc::new(Mutex::new(Chip::open(&path)?));
+    chip.lock().unwrap().watch_line_info(offset)?;
+
+    // Thread synchronizing mechanism
+    let (tx_main, rx_thread) = mpsc::channel();
+    let (tx_thread, rx_main) = mpsc::channel();
+
+    // Generate events
+    request_reconfigure_line(chip.clone(), offset, tx_thread, rx_thread);
+
+    // Wait for thread to signal
+    rx_main.recv().expect("Could not receive from channel");
+
+    // Line requested event
+    assert!(chip
+        .lock()
+        .unwrap()
+        .wait_info_event(Some(Duration::from_secs(1)))?);
+    let event = chip.lock().unwrap().read_info_event()?;
+    assert_eq!(event.event_type()?, InfoChangeKind::LineRequested);
+
+    // Signal the thread to continue
+    tx_main.send(()).expect("Could not send signal on channel");
+
+    // Wait for thread to signal
+    rx_main.recv().expect("Could not receive from channel");
+
+    // Line changed event
+    assert!(chip
+        .lock()
+        .unwrap()
+        .wait_info_event(Some(Duration::from_millis(10)))?);
+    let event = chip.lock().unwrap().read_info_event()?;
+    assert_eq!(event.event_type()?, InfoChangeKind::LineConfigChanged);
+
+    // Signal the thread to continue
+    tx_main.send(()).expect("Could not send signal on channel");
+
+    // Line released event
+    assert!(chip
+        .lock()
+        .unwrap()
+        .wait_info_event(Some(Duration::from_millis(10)))?);
+    let event = chip.lock().unwrap().read_info_event()?;
+    assert_eq!(event.event_type().unwrap(), InfoChangeKind::LineReleased);
+
+    // No events available
+    assert!(!chip
+        .lock()
+        .unwrap()
+        .wait_info_event(Some(Duration::from_millis(100)))?);
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpiodetect.rs b/bindings/rust/libgpiod/examples/gpiodetect.rs
new file mode 100644
index 000000000000..e1d8f59268b5
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiodetect.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpiodetect tool.
+
+use std::env;
+use std::path::Path;
+
+use libgpiod::{self, Error, Result};
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() > 1 {
+        println!("Usage: {}", args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    for chip in libgpiod::gpiochip_devices(&Path::new("/dev"))? {
+        let info = chip.info()?;
+        println!(
+            "{} [{}] ({})",
+            info.name()?,
+            info.label()?,
+            info.num_lines(),
+        );
+    }
+
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpiofind.rs b/bindings/rust/libgpiod/examples/gpiofind.rs
new file mode 100644
index 000000000000..daaa93cc1bd2
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiofind.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpiofind tool.
+
+use std::env;
+use std::path::Path;
+
+use libgpiod::{self, Error, Result};
+
+fn main() -> Result<()> {
+    let args: Vec<String> = env::args().collect();
+    if args.len() != 2 {
+        println!("Usage: {} <line-name>", args[0]);
+        return Err(Error::InvalidArguments);
+    }
+
+    for chip in libgpiod::gpiochip_devices(&Path::new("/dev"))? {
+        let offset = chip.line_offset_from_name(&args[1]);
+        let info = chip.info()?;
+
+        if offset.is_ok() {
+            println!(
+                "Line {} found: Chip: {}, offset: {}",
+                args[1],
+                info.name()?,
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
index 000000000000..5ae50a4fdead
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioget.rs
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of gpioget tool.
+
+use std::env;
+
+use libgpiod::{
+    chip::Chip,
+    line::{self, Direction, Offset},
+    request, Error, Result,
+};
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
+    lsettings.set_direction(Direction::Input)?;
+    lconfig.add_line_settings(&offsets, lsettings)?;
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+    rconfig.set_consumer(&args[0])?;
+
+    let request = chip.request_lines(&rconfig, &lconfig)?;
+    let map = request.values()?;
+
+    println!("{:?}", map);
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/gpioinfo.rs b/bindings/rust/libgpiod/examples/gpioinfo.rs
new file mode 100644
index 000000000000..f972e4f405d2
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioinfo.rs
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
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
+    chip::Chip,
+    line::{Direction, Offset},
+    Error, Result,
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
+    let info = chip.info()?;
+    let ngpio = info.num_lines();
+
+    println!("GPIO Chip name: {}", info.name()?);
+    println!("\tlabel: {}", info.label()?);
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
+        for chip in libgpiod::gpiochip_devices(&Path::new("/dev"))? {
+            chip_info(&chip)?;
+        }
+    } else {
+        let index = args[1]
+            .parse::<u32>()
+            .map_err(|_| Error::InvalidArguments)?;
+        let path = format!("/dev/gpiochip{}", index);
+        if libgpiod::is_gpiochip_device(&path) {
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
index 000000000000..a03ea31dfd53
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiomon.rs
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpiomon tool.
+
+use std::env;
+
+use libgpiod::{
+    chip::Chip,
+    line::{self, Edge, EdgeKind, Offset},
+    request, Error, Result,
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
+    lsettings.set_edge_detection(Some(Edge::Both))?;
+    lconfig.add_line_settings(&offsets, lsettings)?;
+
+    let path = format!("/dev/gpiochip{}", args[1]);
+    let chip = Chip::open(&path)?;
+
+    let rconfig = request::Config::new()?;
+
+    let mut buffer = request::Buffer::new(1)?;
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
index 000000000000..f72a623ab28c
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpioset.rs
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
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
+    chip::Chip,
+    line::{self, Direction, Offset, SettingVal, Value},
+    request, Error, Result,
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
+    rconfig.set_consumer(&args[0])?;
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
index 000000000000..ea62515b1e0d
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/gpiowatch.rs
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+//
+// Copyright 2022 Linaro Ltd. All Rights Reserved.
+//     Viresh Kumar <viresh.kumar@linaro.org>
+//
+// Simplified Rust implementation of the gpiowatch tool.
+
+use std::env;
+
+use libgpiod::{chip::Chip, line::Offset, Error, Result};
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

