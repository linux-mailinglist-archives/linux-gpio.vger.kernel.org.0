Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5EB055D35D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244295AbiF1Imn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 04:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244752AbiF1Imm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 04:42:42 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2BF2DA98
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:35 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so6276864wmp.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WM+2+khe8XhMLb01hXpCGQgmyMdFqDLFRBm2fCn/04Q=;
        b=dE0skRP0Smchfj9EbR5uq0EcVYPeL+4jnC+rVJb1ImR9IcQ9WZeDvnZpcI/bobaPDv
         8toS9s/3JdHyqeaAODxkzEEamhd2vOJYMf1fOP7wV5NrkoY9lrY7YqTOZC44Vd49S1d2
         N6AHKHzl9QHY6mZ39rsagCuuJ+xB/hZIirbcsIwi8Asp6w2xJg5oIixFO4ZTay+hFDoq
         vzcLU3Al9mF8iR0iCKKzHwWEXh4GRp7uIc/bA6h+1ATqSMfLR9EqLMImg3bPique13wS
         e0vJGktOkvSSa08be8ZgNompc0BW1Pj1tkQDE5JxkOpV23ca+AM4Sk3km1fdQhHHBNVF
         nK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WM+2+khe8XhMLb01hXpCGQgmyMdFqDLFRBm2fCn/04Q=;
        b=0mDvSEtDRp9g9xgMQeu0yTjdtRMNrjGqbPEpTi0HTuSGCF4j/PtlvhQP9cm1VcPvaV
         Vt7DsLmF3ieJ/VuphlmdRw0x4DSp773JW7IxtrnicxlDO0mKjzXqDp6ffmxLNVtMG3Xi
         emRO5xHePAq2RlebLs2KGZcRN5fvsCbe5peOxt6umDY1b2wh5qQO0Fz+v/Q1EoQwSJwO
         nULlxwwC6hoD9gl3A0E7izkWB6Nc4DBi5BdDN99BL5IH2IIHuG9FAtlpSj6VUWrQL2Z3
         sZuX3Ml+MG8ENTtx/srdJlxnhKe67ihXeNVrcEBU3gsTos5sFw1ZPzLZZV5CihLm06ex
         +LJg==
X-Gm-Message-State: AJIora82Ts+6FqAmnE5VCAt8tc9Vk0nycq1jrzUlQbHub2cn4POiSyd1
        +uGh6YAVogsOVET1bJILBHwbXg==
X-Google-Smtp-Source: AGRyM1vIy+PynOKoq8L41mXglDmpTiE7fmJo8S79HTO+W0p6TgwYG9q1FwFeHdH6DABIYv11LEJOow==
X-Received: by 2002:a1c:ed08:0:b0:39c:80b1:b0b3 with SMTP id l8-20020a1ced08000000b0039c80b1b0b3mr20576808wmh.134.1656405753509;
        Tue, 28 Jun 2022 01:42:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:51e:c065:fa3f:a137])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0021badf3cb26sm15596062wrr.63.2022.06.28.01.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 01:42:32 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2 3/5] bindings: python: add examples for v2 API
Date:   Tue, 28 Jun 2022 10:42:24 +0200
Message-Id: <20220628084226.472035-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628084226.472035-1-brgl@bgdev.pl>
References: <20220628084226.472035-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the usual set of reimplementations of gpio-tools using the new
python module.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/python/examples/Makefile.am   | 10 ++++++++
 bindings/python/examples/gpiodetect.py | 17 +++++++++++++
 bindings/python/examples/gpiofind.py   | 20 +++++++++++++++
 bindings/python/examples/gpioget.py    | 31 +++++++++++++++++++++++
 bindings/python/examples/gpioinfo.py   | 35 ++++++++++++++++++++++++++
 bindings/python/examples/gpiomon.py    | 31 +++++++++++++++++++++++
 bindings/python/examples/gpioset.py    | 35 ++++++++++++++++++++++++++
 7 files changed, 179 insertions(+)
 create mode 100644 bindings/python/examples/Makefile.am
 create mode 100755 bindings/python/examples/gpiodetect.py
 create mode 100755 bindings/python/examples/gpiofind.py
 create mode 100755 bindings/python/examples/gpioget.py
 create mode 100755 bindings/python/examples/gpioinfo.py
 create mode 100755 bindings/python/examples/gpiomon.py
 create mode 100755 bindings/python/examples/gpioset.py

diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
new file mode 100644
index 0000000..4169469
--- /dev/null
+++ b/bindings/python/examples/Makefile.am
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+EXTRA_DIST =				\
+		gpiodetect.py		\
+		gpiofind.py		\
+		gpioget.py		\
+		gpioinfo.py		\
+		gpiomon.py		\
+		gpioset.py
diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
new file mode 100755
index 0000000..08e586b
--- /dev/null
+++ b/bindings/python/examples/gpiodetect.py
@@ -0,0 +1,17 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+"""Reimplementation of the gpiodetect tool in Python."""
+
+import gpiod
+import os
+
+if __name__ == "__main__":
+    for entry in os.scandir("/dev/"):
+        if gpiod.is_gpiochip_device(entry.path):
+            with gpiod.Chip(entry.path) as chip:
+                info = chip.get_info()
+                print(
+                    "{} [{}] ({} lines)".format(info.name, info.label, info.num_lines)
+                )
diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
new file mode 100755
index 0000000..e488a49
--- /dev/null
+++ b/bindings/python/examples/gpiofind.py
@@ -0,0 +1,20 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+"""Reimplementation of the gpiofind tool in Python."""
+
+import gpiod
+import os
+import sys
+
+if __name__ == "__main__":
+    for entry in os.scandir("/dev/"):
+        if gpiod.is_gpiochip_device(entry.path):
+            with gpiod.Chip(entry.path) as chip:
+                offset = chip.get_line_offset_from_name(sys.argv[1])
+                if offset is not None:
+                    print("{} {}".format(chip.get_info().name, offset))
+                    sys.exit(0)
+
+    sys.exit(1)
diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
new file mode 100755
index 0000000..c509f38
--- /dev/null
+++ b/bindings/python/examples/gpioget.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+"""Simplified reimplementation of the gpioget tool in Python."""
+
+import gpiod
+import sys
+
+Direction = gpiod.Line.Direction
+Value = gpiod.Line.Value
+
+if __name__ == "__main__":
+    if len(sys.argv) < 3:
+        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
+
+    path = sys.argv[1]
+    offsets = []
+    for off in sys.argv[2:]:
+        offsets.append(int(off))
+
+    with gpiod.request_lines(
+        path,
+        gpiod.RequestConfig(offsets=offsets, consumer="gpioget.py"),
+        gpiod.LineConfig(direction=Direction.INPUT),
+    ) as request:
+        vals = request.get_values()
+
+        for val in vals:
+            print("0" if val == Value.INACTIVE else "1", end=" ")
+        print()
diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
new file mode 100755
index 0000000..3097d10
--- /dev/null
+++ b/bindings/python/examples/gpioinfo.py
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+"""Simplified reimplementation of the gpioinfo tool in Python."""
+
+import gpiod
+import os
+
+if __name__ == "__main__":
+    for entry in os.scandir("/dev/"):
+        if gpiod.is_gpiochip_device(entry.path):
+            with gpiod.Chip(entry.path) as chip:
+                cinfo = chip.get_info()
+                print("{} - {} lines:".format(cinfo.name, cinfo.num_lines))
+
+                for offset in range(0, cinfo.num_lines):
+                    linfo = chip.get_line_info(offset)
+                    offset = linfo.offset
+                    name = linfo.name
+                    consumer = linfo.consumer
+                    direction = linfo.direction
+                    active_low = linfo.active_low
+
+                    print(
+                        "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
+                            offset,
+                            "unnamed" if name is None else name,
+                            "unused" if consumer is None else consumer,
+                            "input"
+                            if direction == gpiod.Line.Direction.INPUT
+                            else "output",
+                            "active-low" if active_low else "active-high",
+                        )
+                    )
diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
new file mode 100755
index 0000000..b0f4b88
--- /dev/null
+++ b/bindings/python/examples/gpiomon.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+"""Simplified reimplementation of the gpiomon tool in Python."""
+
+import gpiod
+import sys
+
+Edge = gpiod.Line.Edge
+
+if __name__ == "__main__":
+    if len(sys.argv) < 3:
+        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2> ...")
+
+    path = sys.argv[1]
+    offsets = []
+    for off in sys.argv[2:]:
+        offsets.append(int(off))
+
+    buf = gpiod.EdgeEventBuffer()
+
+    with gpiod.request_lines(
+        path,
+        gpiod.RequestConfig(offsets=offsets, consumer="gpiomon.py"),
+        gpiod.LineConfig(edge_detection=Edge.BOTH),
+    ) as request:
+        while True:
+            request.read_edge_event(buf)
+            for event in buf:
+                print(event)
diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
new file mode 100755
index 0000000..3a8f8cc
--- /dev/null
+++ b/bindings/python/examples/gpioset.py
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+"""Simplified reimplementation of the gpioset tool in Python."""
+
+import gpiod
+import sys
+
+Value = gpiod.Line.Value
+
+if __name__ == "__main__":
+    if len(sys.argv) < 3:
+        raise TypeError("usage: gpioset.py <gpiochip> <offset1>=<value1> ...")
+
+    path = sys.argv[1]
+    values = dict()
+    for arg in sys.argv[2:]:
+        arg = arg.split("=")
+        key = int(arg[0])
+        val = int(arg[1])
+
+        if val == 1:
+            values[key] = Value.ACTIVE
+        elif val == 0:
+            values[key] = Value.INACTIVE
+        else:
+            raise ValueError("{} is an invalid value for GPIO lines".format(val))
+
+    with gpiod.request_lines(
+        path,
+        gpiod.RequestConfig(offsets=values.keys(), consumer="gpioset.py"),
+        gpiod.LineConfig(direction=gpiod.Line.Direction.OUTPUT, output_values=values),
+    ) as request:
+        input()
-- 
2.34.1

