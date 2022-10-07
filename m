Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7661B5F7A07
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 16:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiJGOzi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 10:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiJGOzg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 10:55:36 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2418189837
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 07:55:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o5so3051639wms.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Oct 2022 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0s015QV2cXfHm7a9+FPAMlFzAOHko/hG+yRidT642s=;
        b=cAHH15kmLRlLVa3MCH+udqwrMAf1g2gycFWUjeiC8FE+31YVjyb5gYzx7EHacpHZst
         HNAHmyAcLP2gmY0k5vqaLch311XlQxPWUE16p31aZLp0tLT+IDy+Bc6TX5nGNU/NylVA
         DtAcWFiXepQQhYXZZDvFSXOsGv6b3VvvwYSAqAhteMq2Mk3YMJV+qeIxjuAT7HnsL4R3
         1Aio8spnYx5OifvSrPUSN5tTuTKnqmbbluLjH+ZvIIyd113loxTlzjVDhu2z52QBq/Oq
         4zFk3zXa4wRpt260qA23ergG/LaACEHOxmp73v0NK79nMTaxXtFq+ZDCRjGuIeHPkPzN
         D1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0s015QV2cXfHm7a9+FPAMlFzAOHko/hG+yRidT642s=;
        b=pEzdG32CLpgbANmzxhyKVzoI+ypj8961eOYu4y4aKvYeFBbRAgMoKkqCWLpoj6pmAA
         PV2D5EM7HyQ2kQKkvf0BUD6o92dVtR4VKlcu2XTtC/E7+jzt2SeEoGzwA2wcn1vXJzmp
         1n4SI6poW9cY/0E1oqyUGytX7Wuavo6vtiaC+8hF6A59fJ7+Mfx5g+Jjox63e2OBPnRF
         SyU4B4ms+UN56SY4sFxD+yerESZ9lBS2q19PTDmJPCAR35YLHbZIgW4+eHZz61aR7DOO
         8zbMYoJtk4sr9hRuVtn3+KBgZDUT5enc/orQWCabdO3i6HzMBfhOnCk5Nt+571dcCuIP
         eglA==
X-Gm-Message-State: ACrzQf0a4R1oz/aEpLNoJ2rZT7tJXLj4yIpvcAocjZL9VbQS7H4e28Qj
        EALqDeyMiaMZZu7ikQL7TOKBLQ==
X-Google-Smtp-Source: AMsMyM6eWKakqAxVK04EeMSahcdiiFWRWQtgd+adAMfOlRgqQYKkJ9FCQHGSnF/QPeSxBD8Wewvocw==
X-Received: by 2002:a05:600c:5490:b0:3b4:8db0:5547 with SMTP id iv16-20020a05600c549000b003b48db05547mr3492618wmb.77.1665154528010;
        Fri, 07 Oct 2022 07:55:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5a9e:bab6:45e8:abe8])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d50c8000000b0022e36c1113fsm2294707wrt.13.2022.10.07.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:55:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Date:   Fri,  7 Oct 2022 16:55:19 +0200
Message-Id: <20221007145521.329614-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007145521.329614-1-brgl@bgdev.pl>
References: <20221007145521.329614-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the regular set of example programs implemented using libgpiod
python bindings.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/python/examples/Makefile.am   | 10 +++++++
 bindings/python/examples/gpiodetect.py | 17 ++++++++++++
 bindings/python/examples/gpiofind.py   | 20 ++++++++++++++
 bindings/python/examples/gpioget.py    | 31 +++++++++++++++++++++
 bindings/python/examples/gpioinfo.py   | 35 ++++++++++++++++++++++++
 bindings/python/examples/gpiomon.py    | 28 +++++++++++++++++++
 bindings/python/examples/gpioset.py    | 37 ++++++++++++++++++++++++++
 7 files changed, 178 insertions(+)
 create mode 100644 bindings/python/examples/Makefile.am
 create mode 100755 bindings/python/examples/gpiodetect.py
 create mode 100755 bindings/python/examples/gpiofind.py
 create mode 100755 bindings/python/examples/gpioget.py
 create mode 100755 bindings/python/examples/gpioinfo.py
 create mode 100755 bindings/python/examples/gpiomon.py
 create mode 100755 bindings/python/examples/gpioset.py

diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
new file mode 100644
index 0000000..f42b80e
--- /dev/null
+++ b/bindings/python/examples/Makefile.am
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+EXTRA_DIST = \
+	gpiodetect.py \
+	gpiofind.py \
+	gpioget.py \
+	gpioinfo.py \
+	gpiomon.py \
+	gpioset.py
diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
new file mode 100755
index 0000000..c32014f
--- /dev/null
+++ b/bindings/python/examples/gpiodetect.py
@@ -0,0 +1,17 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
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
index 0000000..2f30445
--- /dev/null
+++ b/bindings/python/examples/gpiofind.py
@@ -0,0 +1,20 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
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
+                offset = chip.map_line(sys.argv[1])
+                if offset is not None:
+                    print("{} {}".format(chip.get_info().name, offset))
+                    sys.exit(0)
+
+    sys.exit(1)
diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
new file mode 100755
index 0000000..d441535
--- /dev/null
+++ b/bindings/python/examples/gpioget.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+"""Simplified reimplementation of the gpioget tool in Python."""
+
+import gpiod
+import sys
+
+from gpiod.line import Direction
+
+if __name__ == "__main__":
+    if len(sys.argv) < 3:
+        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
+
+    path = sys.argv[1]
+    lines = []
+    for line in sys.argv[2:]:
+        lines.append(int(line) if line.isdigit() else line)
+
+    request = gpiod.request_lines(
+        path,
+        consumer="gpioget.py",
+        config={tuple(lines): gpiod.LineSettings(direction=Direction.INPUT)},
+    )
+
+    vals = request.get_values()
+
+    for val in vals:
+        print("{} ".format(val.value), end="")
+    print()
diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
new file mode 100755
index 0000000..e8c7d46
--- /dev/null
+++ b/bindings/python/examples/gpioinfo.py
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
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
+                            if direction == gpiod.line.Direction.INPUT
+                            else "output",
+                            "active-low" if active_low else "active-high",
+                        )
+                    )
diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
new file mode 100755
index 0000000..e0db16f
--- /dev/null
+++ b/bindings/python/examples/gpiomon.py
@@ -0,0 +1,28 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+"""Simplified reimplementation of the gpiomon tool in Python."""
+
+import gpiod
+import sys
+
+from gpiod.line import Edge
+
+if __name__ == "__main__":
+    if len(sys.argv) < 3:
+        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2> ...")
+
+    path = sys.argv[1]
+    lines = []
+    for line in sys.argv[2:]:
+        lines.append(int(line) if line.isdigit() else line)
+
+    with gpiod.request_lines(
+        path,
+        consumer="gpiomon.py",
+        config={tuple(lines): gpiod.LineSettings(edge_detection=Edge.BOTH)},
+    ) as request:
+        while True:
+            for event in request.read_edge_event():
+                print(event)
diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
new file mode 100755
index 0000000..f0b0681
--- /dev/null
+++ b/bindings/python/examples/gpioset.py
@@ -0,0 +1,37 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+"""Simplified reimplementation of the gpioset tool in Python."""
+
+import gpiod
+import sys
+
+from gpiod.line import Direction, Value
+
+if __name__ == "__main__":
+    if len(sys.argv) < 3:
+        raise TypeError(
+            "usage: gpioset.py <gpiochip> <offset1>=<value1> <offset2>=<value2> ..."
+        )
+
+    path = sys.argv[1]
+    values = dict()
+    lines = []
+    for arg in sys.argv[2:]:
+        arg = arg.split("=")
+        key = int(arg[0]) if arg[0].isdigit() else arg[0]
+        val = int(arg[1])
+
+        lines.append(key)
+        values[key] = Value(val)
+
+    request = gpiod.request_lines(
+        path,
+        consumer="gpioset.py",
+        config={tuple(lines): gpiod.LineSettings(direction=Direction.OUTPUT)},
+    )
+
+    vals = request.set_values(values)
+
+    input()
-- 
2.34.1

