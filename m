Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB4672F34E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 05:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238340AbjFNDzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 23:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbjFNDzZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 23:55:25 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECCD10F8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:23 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-66619138c1eso530724b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714923; x=1689306923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPwzMuSfmHAFDh0ZW1HFnTv+VfQxV64Bk2kl986R1Ek=;
        b=V6Lwc9Qc0D68pSDfY0aanlTjfOsdrFka7JhvM+AfGfxZHLoZz3M+wlsC6RUGYuH1Pt
         zm3cavKo00SWtBZh+GTz0WQ2WkPeT6h9zEJTBEQU3a2BredQfDhoaYCy65yuMoJBZu/0
         NE/8R8VtGxcywcf4LYBvZ7a/4UcyUkYJ8akp6rxkDiQK3U4Pf4HnAwM03zRxBzUSf9Sw
         PmyBwUYYEo/QamlQiZNWNloSitMXA9owrIq2pWsCm1RvSUl9yYJxNzCec0wRP8R92jjj
         6ACFdeuVBaY02DsFcuJepXOvGhP72nWzhgIyY+rK3o0tK0NIVdZkZGBVo7ghekQwSvC0
         CLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714923; x=1689306923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPwzMuSfmHAFDh0ZW1HFnTv+VfQxV64Bk2kl986R1Ek=;
        b=NzmZV1msiTyyrDsmjCi5Pj1zCjPLn0TQCBG4Jos7Bbb6ZKOSSdeEGXhl4bxubleFmY
         W7+c0YNn9a4IJp+EEcoC9AFZA6CMMeTGUKMm8LpnBL1bcGWMdYgWUt5LnUkTBjHqPUL+
         8XOBCt9awQVh+rHRl30RwI0FoNld3Ia/8NJ1sYmHUxacelLREsDItkDHWtCVUHwQTH3w
         lQVTb/gd0zSGqcTR42e8G7qnR1+h5wn4tr1tpg9G12Z3XM6MingPi6y0axCQPOL+7onm
         XixEZNreppAhQOKAeVcZW2AO356aUUT4izfd+yJZSFpDMuBGtT76Opp4OC0qDGtWISOx
         N+EQ==
X-Gm-Message-State: AC+VfDwx4Gro6TuGUiNEbXNYJMuys2mVwEXaOycevf+v3YAxoLpovhff
        7PO5ZW1/GRBe0b0nnXFjsorTkr/hWzI=
X-Google-Smtp-Source: ACHHUZ52gT2UXVDK4cAKTj0BVc+igiigh5BPdCIVY5AIqPMPewRiGCymepUh10uXDDdPtZPrJ8v39g==
X-Received: by 2002:a05:6a20:1d8:b0:10c:7916:f9f6 with SMTP id 24-20020a056a2001d800b0010c7916f9f6mr551641pzz.52.1686714922770;
        Tue, 13 Jun 2023 20:55:22 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001ae6fe84244sm10967412plh.243.2023.06.13.20.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:55:22 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 4/4] bindings: rust: examples: add dedicated examples
Date:   Wed, 14 Jun 2023 11:54:26 +0800
Message-Id: <20230614035426.15097-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614035426.15097-1-warthog618@gmail.com>
References: <20230614035426.15097-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add rust equivalents of the core examples.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../rust/libgpiod/examples/get_line_value.rs  | 28 +++++++++++
 .../libgpiod/examples/toggle_line_value.rs    | 43 ++++++++++++++++
 .../libgpiod/examples/watch_line_value.rs     | 50 +++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 bindings/rust/libgpiod/examples/get_line_value.rs
 create mode 100644 bindings/rust/libgpiod/examples/toggle_line_value.rs
 create mode 100644 bindings/rust/libgpiod/examples/watch_line_value.rs

diff --git a/bindings/rust/libgpiod/examples/get_line_value.rs b/bindings/rust/libgpiod/examples/get_line_value.rs
new file mode 100644
index 0000000..732fb71
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/get_line_value.rs
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of reading a single line.
+
+use libgpiod::line;
+
+fn main() -> libgpiod::Result<()> {
+    // example configuration - customize to suit your situation
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
+    rconfig.set_consumer("get-line-value")?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let request = chip.request_lines(Some(&rconfig), &lconfig)?;
+
+    let value = request.value(line_offset)?;
+    println!("{:?}", value);
+    Ok(())
+}
diff --git a/bindings/rust/libgpiod/examples/toggle_line_value.rs b/bindings/rust/libgpiod/examples/toggle_line_value.rs
new file mode 100644
index 0000000..cd7038e
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/toggle_line_value.rs
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of toggling a single line.
+
+use libgpiod::line;
+use std::time::Duration;
+
+fn toggle_value(value: line::Value) -> line::Value {
+    match value {
+        line::Value::Active => line::Value::InActive,
+        line::Value::InActive => line::Value::Active,
+    }
+}
+
+fn main() -> libgpiod::Result<()> {
+    // example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offset = 5;
+
+    let mut value = line::Value::Active;
+
+    let mut settings = line::Settings::new()?;
+    settings
+        .set_direction(line::Direction::Output)?
+        .set_output_value(value)?;
+
+    let mut lconfig = line::Config::new()?;
+    lconfig.add_line_settings(&[line_offset], settings)?;
+
+    let mut rconfig = libgpiod::request::Config::new()?;
+    rconfig.set_consumer("toggle-line-value")?;
+
+    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let mut req = chip.request_lines(Some(&rconfig), &lconfig)?;
+
+    loop {
+        println!("{:?}", value);
+        std::thread::sleep(Duration::from_secs(1));
+        value = toggle_value(value);
+        req.set_value(line_offset, value)?;
+    }
+}
diff --git a/bindings/rust/libgpiod/examples/watch_line_value.rs b/bindings/rust/libgpiod/examples/watch_line_value.rs
new file mode 100644
index 0000000..5a95b6a
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/watch_line_value.rs
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+//
+// Minimal example of watching for edges on a single line.
+
+use libgpiod::line;
+use std::time::Duration;
+
+fn main() -> libgpiod::Result<()> {
+    // example configuration - customize to suit your situation
+    let chip_path = "/dev/gpiochip0";
+    let line_offset = 5;
+
+    let mut lsettings = line::Settings::new()?;
+    // assume a button connecting the pin to ground,
+    // so pull it up and provide some debounce.
+    lsettings
+        .set_edge_detection(Some(line::Edge::Both))?
+        .set_bias(Some(line::Bias::PullUp))?
+        .set_debounce_period(Duration::from_millis(10));
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
+    // a larger buffer is an optimisation for reading bursts of events from the
+    // kernel, but that is not necessary in this case, so 1 is fine.
+    let mut buffer = libgpiod::request::Buffer::new(1)?;
+    loop {
+        // blocks until at least one event is available
+        let events = request.read_edge_events(&mut buffer)?;
+        for event in events {
+            let event = event?;
+            println!(
+                "line: {}, type: {}, event #{}",
+                event.line_offset(),
+                match event.event_type()? {
+                    line::EdgeKind::Rising => "Rising ",
+                    line::EdgeKind::Falling => "Falling",
+                },
+                event.line_seqno()
+            );
+        }
+    }
+}
-- 
2.40.1

