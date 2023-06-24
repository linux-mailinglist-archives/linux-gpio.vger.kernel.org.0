Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139EF73C6E6
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jun 2023 07:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjFXFVS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jun 2023 01:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjFXFVQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Jun 2023 01:21:16 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D372733
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:14 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-38c35975545so1118417b6e.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584073; x=1690176073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0XxIdKP6YSPnKmbL1Qrle97TLgnfbHKq1CXdrdENFM=;
        b=G8FXGK0P96oryfpIglC1Bb85bt4TYw+cDXSJ2IZas1Bj5A3Yy64znjuAeaAFhSZ7P2
         WZ0Fry/kNWDHgcZO6bu99lAp7zTDJGEpEWaqo9cTMdN4Q2kcgJtJIvfLzHPD1qx36Gy1
         2ZaribO9QpsUmLepdYHcvPjFFB85b+ZTI5IElgfIetwi7QLXGdGchC+PXKp5wmWA7UTL
         c4/b9HNz7m3I4YOjwghwvrWAb3gMvgCoW9c05X7NxlGCdmAeURivsPXdh2jHa0MtLsDc
         sqsZAtAxIvfavZ+MYdnA7dqOsSC/4hbdYGQXtytIo+OvBQXpSJP3VitYBTij7gUDMxw+
         Ui6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584073; x=1690176073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0XxIdKP6YSPnKmbL1Qrle97TLgnfbHKq1CXdrdENFM=;
        b=YUspVRxT7Mq3pF6cw4YcycPaNL82saIMCLMMUduAlBpwALn5PsAeeXoxyB+vobib6/
         oW00/eGGT3wg7auRCh27M3NcEZDEoRt2jZxcPM3QoEAngpY8rhXG1U3H0DObnhqyGFWM
         ivJEx0G6h8A8mKGakPRI0kWsqtAyHsAQsdDGUFOOzZosNUGmmsKJv4NeiWFF1lElOS1o
         PX9sEpi/MGylCj7OW9VpPJ2g/4q4IlmQEmx9L12TJ43PGpGN6+sF5zmp3t1N9uruy6a4
         zyqqL3XRQSYc7BSFMWiHTI7CvQQYG7c9dATElCiL2KHTlg6f3wWAU/5K0RK4D3ckTNw2
         0bdA==
X-Gm-Message-State: AC+VfDwW6tPsVqjHiKheIRbV0rtXjJfwx8tgUnIpaiC7Le6RJ/z3GkCG
        YsFJoFEKYFSAHMnx9i3wODEB/YePvf4=
X-Google-Smtp-Source: ACHHUZ5V2uV3/NPMFLYfMEPIHch4pkG9qSYcvJkHdPTd7CHPRpGw4L5eOPQf4hN/WLDLne9jp6i4OQ==
X-Received: by 2002:a05:6808:3af:b0:39a:6c25:d60 with SMTP id n15-20020a05680803af00b0039a6c250d60mr14118100oie.29.1687584073378;
        Fri, 23 Jun 2023 22:21:13 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00256dff5f8e3sm487103pjb.49.2023.06.23.22.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:21:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/4] bindings: python: examples: replace tools examples with use case examples
Date:   Sat, 24 Jun 2023 13:20:51 +0800
Message-ID: <20230624052054.13206-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230624052054.13206-1-warthog618@gmail.com>
References: <20230624052054.13206-1-warthog618@gmail.com>
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

Replace tool examples with use case examples drawn from the tools.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/examples/Makefile.am          | 18 +++----
 bindings/python/examples/find_line_by_name.py | 37 +++++++++++++++
 bindings/python/examples/get_chip_info.py     | 20 ++++++++
 bindings/python/examples/get_line_info.py     | 29 ++++++++++++
 .../examples/get_multiple_line_values.py      | 29 ++++++++++++
 bindings/python/examples/gpiodetect.py        | 15 ------
 bindings/python/examples/gpiofind.py          | 20 --------
 bindings/python/examples/gpioget.py           | 29 ------------
 bindings/python/examples/gpioinfo.py          | 28 -----------
 bindings/python/examples/gpiomon.py           | 26 ----------
 bindings/python/examples/gpionotify.py        | 21 ---------
 bindings/python/examples/gpioset.py           | 36 --------------
 bindings/python/examples/helpers.py           | 15 ------
 .../examples/reconfigure_input_to_output.py   | 39 +++++++++++++++
 .../examples/toggle_multiple_line_values.py   | 47 +++++++++++++++++++
 bindings/python/examples/watch_line_info.py   | 23 +++++++++
 bindings/python/examples/watch_line_rising.py | 31 ++++++++++++
 .../examples/watch_multiple_line_values.py    | 42 +++++++++++++++++
 18 files changed, 307 insertions(+), 198 deletions(-)
 create mode 100755 bindings/python/examples/find_line_by_name.py
 create mode 100755 bindings/python/examples/get_chip_info.py
 create mode 100755 bindings/python/examples/get_line_info.py
 create mode 100755 bindings/python/examples/get_multiple_line_values.py
 delete mode 100755 bindings/python/examples/gpiodetect.py
 delete mode 100755 bindings/python/examples/gpiofind.py
 delete mode 100755 bindings/python/examples/gpioget.py
 delete mode 100755 bindings/python/examples/gpioinfo.py
 delete mode 100755 bindings/python/examples/gpiomon.py
 delete mode 100755 bindings/python/examples/gpionotify.py
 delete mode 100755 bindings/python/examples/gpioset.py
 delete mode 100644 bindings/python/examples/helpers.py
 create mode 100755 bindings/python/examples/reconfigure_input_to_output.py
 create mode 100755 bindings/python/examples/toggle_multiple_line_values.py
 create mode 100755 bindings/python/examples/watch_line_info.py
 create mode 100755 bindings/python/examples/watch_line_rising.py
 create mode 100755 bindings/python/examples/watch_multiple_line_values.py

diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
index c8c1c98..52abafc 100644
--- a/bindings/python/examples/Makefile.am
+++ b/bindings/python/examples/Makefile.am
@@ -3,13 +3,15 @@
 
 EXTRA_DIST = \
 	async_watch_line_value.py \
+	find_line_by_name.py \
+	get_chip_info.py \
+	get_line_info.py \
 	get_line_value.py \
-	gpiodetect.py \
-	gpiofind.py \
-	gpioget.py \
-	gpioinfo.py \
-	gpiomon.py \
-	gpionotify.py \
-	gpioset.py \
+	get_multiple_line_values.py \
+	reconfigure_input_to_output.py \
 	toggle_line_value.py \
-	watch_line_value.py
+	toggle_multiple_line_values.py \
+	watch_line_requests.py \
+	watch_line_value.py \
+	watch_line_rising.py \
+	watch_multiple_line_values.py
diff --git a/bindings/python/examples/find_line_by_name.py b/bindings/python/examples/find_line_by_name.py
new file mode 100755
index 0000000..ac798a9
--- /dev/null
+++ b/bindings/python/examples/find_line_by_name.py
@@ -0,0 +1,37 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of finding a line with the given name."""
+
+import gpiod
+import os
+
+
+def generate_gpio_chips():
+    for entry in os.scandir("/dev/"):
+        if gpiod.is_gpiochip_device(entry.path):
+            yield entry.path
+
+
+def find_line_by_name(line_name):
+    # Names are not guaranteed unique, so this finds the first line with
+    # the given name.
+    for path in generate_gpio_chips():
+        with gpiod.Chip(path) as chip:
+            try:
+                offset = chip.line_offset_from_id(line_name)
+                print("{}: {} {}".format(line_name, chip.get_info().name, offset))
+                return
+            except OSError:
+                # An OSError is raised if the name is not found.
+                continue
+
+    print("line '{}' not found".format(line_name))
+
+
+if __name__ == "__main__":
+    try:
+        find_line_by_name("GPIO19")
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/get_chip_info.py b/bindings/python/examples/get_chip_info.py
new file mode 100755
index 0000000..7dc76fb
--- /dev/null
+++ b/bindings/python/examples/get_chip_info.py
@@ -0,0 +1,20 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of reading the info for a chip."""
+
+import gpiod
+
+
+def get_chip_info(chip_path):
+    with gpiod.Chip(chip_path) as chip:
+        info = chip.get_info()
+        print("{} [{}] ({} lines)".format(info.name, info.label, info.num_lines))
+
+
+if __name__ == "__main__":
+    try:
+        get_chip_info("/dev/gpiochip0")
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/get_line_info.py b/bindings/python/examples/get_line_info.py
new file mode 100755
index 0000000..cd4ebcc
--- /dev/null
+++ b/bindings/python/examples/get_line_info.py
@@ -0,0 +1,29 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of reading the info for a line."""
+
+import gpiod
+
+
+def get_line_info(chip_path, line_offset):
+    with gpiod.Chip(chip_path) as chip:
+        info = chip.get_line_info(line_offset)
+        is_input = info.direction == gpiod.line.Direction.INPUT
+        print(
+            "line {:>3}: {:>12} {:>12} {:>8} {:>10}".format(
+                info.offset,
+                info.name or "unnamed",
+                info.consumer or "unused",
+                "input" if is_input else "output",
+                "active-low" if info.active_low else "active-high",
+            )
+        )
+
+
+if __name__ == "__main__":
+    try:
+        get_line_info("/dev/gpiochip0", 3)
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/get_multiple_line_values.py b/bindings/python/examples/get_multiple_line_values.py
new file mode 100755
index 0000000..46cf0b2
--- /dev/null
+++ b/bindings/python/examples/get_multiple_line_values.py
@@ -0,0 +1,29 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of reading multiple lines."""
+
+import gpiod
+
+from gpiod.line import Direction
+
+
+def get_multiple_line_values(chip_path, line_offsets):
+    with gpiod.request_lines(
+        chip_path,
+        consumer="get-multiple-line-values",
+        config={tuple(line_offsets): gpiod.LineSettings(direction=Direction.INPUT)},
+    ) as request:
+        vals = request.get_values()
+
+        for offset, val in zip(line_offsets, vals):
+            print("{}={} ".format(offset, val), end="")
+        print()
+
+
+if __name__ == "__main__":
+    try:
+        get_multiple_line_values("/dev/gpiochip0", [5, 3, 7])
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
deleted file mode 100755
index dc98b03..0000000
--- a/bindings/python/examples/gpiodetect.py
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-"""Reimplementation of the gpiodetect tool in Python."""
-
-import gpiod
-import os
-
-from helpers import gpio_chips
-
-if __name__ == "__main__":
-    for chip in gpio_chips():
-        info = chip.get_info()
-        print("{} [{}] ({} lines)".format(info.name, info.label, info.num_lines))
diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
deleted file mode 100755
index d41660d..0000000
--- a/bindings/python/examples/gpiofind.py
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-"""Reimplementation of the gpiofind tool in Python."""
-
-import gpiod
-import os
-import sys
-
-if __name__ == "__main__":
-    for entry in os.scandir("/dev/"):
-        if gpiod.is_gpiochip_device(entry.path):
-            with gpiod.Chip(entry.path) as chip:
-                offset = chip.line_offset_from_id(sys.argv[1])
-                if offset is not None:
-                    print("{} {}".format(chip.get_info().name, offset))
-                    sys.exit(0)
-
-    sys.exit(1)
diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
deleted file mode 100755
index bf7e0a6..0000000
--- a/bindings/python/examples/gpioget.py
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-"""Simplified reimplementation of the gpioget tool in Python."""
-
-import gpiod
-import sys
-
-from gpiod.line import Direction
-
-if __name__ == "__main__":
-    if len(sys.argv) < 3:
-        raise TypeError("usage: gpioget.py <gpiochip> <offset1> <offset2> ...")
-
-    path = sys.argv[1]
-    lines = [int(line) if line.isdigit() else line for line in sys.argv[2:]]
-
-    request = gpiod.request_lines(
-        path,
-        consumer="gpioget.py",
-        config={tuple(lines): gpiod.LineSettings(direction=Direction.INPUT)},
-    )
-
-    vals = request.get_values()
-
-    for val in vals:
-        print("{} ".format(val.value), end="")
-    print()
diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
deleted file mode 100755
index 3996dcf..0000000
--- a/bindings/python/examples/gpioinfo.py
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-"""Simplified reimplementation of the gpioinfo tool in Python."""
-
-import gpiod
-import os
-
-from helpers import gpio_chips
-
-if __name__ == "__main__":
-    for chip in gpio_chips():
-        cinfo = chip.get_info()
-        print("{} - {} lines:".format(cinfo.name, cinfo.num_lines))
-
-        for offset in range(0, cinfo.num_lines):
-            linfo = chip.get_line_info(offset)
-            is_input = linfo.direction == gpiod.line.Direction.INPUT
-            print(
-                "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
-                    linfo.offset,
-                    linfo.name or "unnamed",
-                    linfo.consumer or "unused",
-                    "input" if is_input else "output",
-                    "active-low" if linfo.active_low else "active-high",
-                )
-            )
diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
deleted file mode 100755
index 702d7c8..0000000
--- a/bindings/python/examples/gpiomon.py
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-"""Simplified reimplementation of the gpiomon tool in Python."""
-
-import gpiod
-import sys
-
-from gpiod.line import Edge
-
-if __name__ == "__main__":
-    if len(sys.argv) < 3:
-        raise TypeError("usage: gpiomon.py <gpiochip> <offset1> <offset2> ...")
-
-    path = sys.argv[1]
-    lines = [int(line) if line.isdigit() else line for line in sys.argv[2:]]
-
-    with gpiod.request_lines(
-        path,
-        consumer="gpiomon.py",
-        config={tuple(lines): gpiod.LineSettings(edge_detection=Edge.BOTH)},
-    ) as request:
-        while True:
-            for event in request.read_edge_events():
-                print(event)
diff --git a/bindings/python/examples/gpionotify.py b/bindings/python/examples/gpionotify.py
deleted file mode 100755
index 4e50515..0000000
--- a/bindings/python/examples/gpionotify.py
+++ /dev/null
@@ -1,21 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-"""Simplified reimplementation of the gpionotify tool in Python."""
-
-import gpiod
-import sys
-
-if __name__ == "__main__":
-    if len(sys.argv) < 3:
-        raise TypeError("usage: gpionotify.py <gpiochip> <offset1> <offset2> ...")
-
-    path = sys.argv[1]
-
-    with gpiod.Chip(path) as chip:
-        for line in sys.argv[2:]:
-            chip.watch_line_info(line)
-
-        while True:
-            print(chip.read_info_event())
diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
deleted file mode 100755
index e6a516c..0000000
--- a/bindings/python/examples/gpioset.py
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-"""Simplified reimplementation of the gpioset tool in Python."""
-
-import gpiod
-import sys
-
-from gpiod.line import Direction, Value
-
-if __name__ == "__main__":
-    if len(sys.argv) < 3:
-        raise TypeError(
-            "usage: gpioset.py <gpiochip> <offset1>=<value1> <offset2>=<value2> ..."
-        )
-
-    path = sys.argv[1]
-
-    def parse_value(arg):
-        x, y = arg.split("=")
-        return (x, Value(int(y)))
-
-    def make_settings(val):
-        return gpiod.LineSettings(direction=Direction.OUTPUT, output_value=val)
-
-    lvs = [parse_value(arg) for arg in sys.argv[2:]]
-    config = dict((l, make_settings(v)) for (l, v) in lvs)
-
-    request = gpiod.request_lines(
-        path,
-        consumer="gpioset.py",
-        config=config,
-    )
-
-    input()
diff --git a/bindings/python/examples/helpers.py b/bindings/python/examples/helpers.py
deleted file mode 100644
index 8b91173..0000000
--- a/bindings/python/examples/helpers.py
+++ /dev/null
@@ -1,15 +0,0 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-import gpiod
-import os
-
-
-def gpio_chips():
-    for path in [
-        entry.path
-        for entry in os.scandir("/dev/")
-        if gpiod.is_gpiochip_device(entry.path)
-    ]:
-        with gpiod.Chip(path) as chip:
-            yield chip
diff --git a/bindings/python/examples/reconfigure_input_to_output.py b/bindings/python/examples/reconfigure_input_to_output.py
new file mode 100755
index 0000000..0f2e358
--- /dev/null
+++ b/bindings/python/examples/reconfigure_input_to_output.py
@@ -0,0 +1,39 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Example of a bi-directional line requested as input and then switched to output."""
+
+import gpiod
+
+from gpiod.line import Direction, Value
+
+
+def reconfigure_input_to_output(chip_path, line_offset):
+    # request the line initially as an input
+    with gpiod.request_lines(
+        chip_path,
+        consumer="reconfigure-input-to-output",
+        config={line_offset: gpiod.LineSettings(direction=Direction.INPUT)},
+    ) as request:
+        # read the current line value
+        value = request.get_value(line_offset)
+        print("{}={} (input)".format(line_offset, value))
+        # switch the line to an output and drive it low
+        request.reconfigure_lines(
+            config={
+                line_offset: gpiod.LineSettings(
+                    direction=Direction.OUTPUT, output_value=Value.INACTIVE
+                )
+            }
+        )
+        # report the current driven value
+        value = request.get_value(line_offset)
+        print("{}={} (output)".format(line_offset, value))
+
+
+if __name__ == "__main__":
+    try:
+        reconfigure_input_to_output("/dev/gpiochip0", 5)
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/toggle_multiple_line_values.py b/bindings/python/examples/toggle_multiple_line_values.py
new file mode 100755
index 0000000..12b968d
--- /dev/null
+++ b/bindings/python/examples/toggle_multiple_line_values.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of toggling multiple lines."""
+
+import gpiod
+import time
+
+from gpiod.line import Direction, Value
+
+
+def toggle_value(value):
+    if value == Value.INACTIVE:
+        return Value.ACTIVE
+    return Value.INACTIVE
+
+
+def toggle_multiple_line_values(chip_path, line_values):
+    value_str = {Value.ACTIVE: "Active", Value.INACTIVE: "Inactive"}
+
+    request = gpiod.request_lines(
+        chip_path,
+        consumer="toggle-multiple-line-values",
+        config={
+            tuple(line_values.keys()): gpiod.LineSettings(direction=Direction.OUTPUT)
+        },
+        output_values=line_values,
+    )
+
+    while True:
+        print(
+            " ".join("{}={}".format(l, value_str[v]) for (l, v) in line_values.items())
+        )
+        time.sleep(1)
+        for l, v in line_values.items():
+            line_values[l] = toggle_value(v)
+        request.set_values(line_values)
+
+
+if __name__ == "__main__":
+    try:
+        toggle_multiple_line_values(
+            "/dev/gpiochip0", {5: Value.ACTIVE, 3: Value.ACTIVE, 7: Value.INACTIVE}
+        )
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/watch_line_info.py b/bindings/python/examples/watch_line_info.py
new file mode 100755
index 0000000..e49a669
--- /dev/null
+++ b/bindings/python/examples/watch_line_info.py
@@ -0,0 +1,23 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of watching for info changes on particular lines."""
+
+import gpiod
+
+
+def watch_line_info(chip_path, line_offsets):
+    with gpiod.Chip(chip_path) as chip:
+        for offset in line_offsets:
+            chip.watch_line_info(offset)
+
+        while True:
+            print(chip.read_info_event())
+
+
+if __name__ == "__main__":
+    try:
+        watch_line_info("/dev/gpiochip0", [5, 3, 7])
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/watch_line_rising.py b/bindings/python/examples/watch_line_rising.py
new file mode 100755
index 0000000..2350d76
--- /dev/null
+++ b/bindings/python/examples/watch_line_rising.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of watching for rising edges on a single line."""
+
+import gpiod
+
+from gpiod.line import Edge
+
+
+def watch_line_rising(chip_path, line_offset):
+    with gpiod.request_lines(
+        chip_path,
+        consumer="watch-line-rising",
+        config={line_offset: gpiod.LineSettings(edge_detection=Edge.RISING)},
+    ) as request:
+        while True:
+            # Blocks until at least one event is available
+            for event in request.read_edge_events():
+                print(
+                    "line: %d  type: Rising   event #%d"
+                    % (event.line_offset, event.line_seqno)
+                )
+
+
+if __name__ == "__main__":
+    try:
+        watch_line_rising("/dev/gpiochip0", 5)
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/watch_multiple_line_values.py b/bindings/python/examples/watch_multiple_line_values.py
new file mode 100755
index 0000000..658ecee
--- /dev/null
+++ b/bindings/python/examples/watch_multiple_line_values.py
@@ -0,0 +1,42 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of watching for edges on multiple lines."""
+
+import gpiod
+
+from gpiod.line import Edge
+
+
+def edge_type(event):
+    if event.event_type is event.Type.RISING_EDGE:
+        return "Rising"
+    if event.event_type is event.Type.FALLING_EDGE:
+        return "Falling"
+    return "Unknown"
+
+
+def watch_multiple_line_values(chip_path, line_offsets):
+    with gpiod.request_lines(
+        chip_path,
+        consumer="watch-multiple-line-values",
+        config={tuple(line_offsets): gpiod.LineSettings(edge_detection=Edge.BOTH)},
+    ) as request:
+        while True:
+            for event in request.read_edge_events():
+                print(
+                    "offset: {}  type: {:<7}  event #{}  line event #{}".format(
+                        event.line_offset,
+                        edge_type(event),
+                        event.global_seqno,
+                        event.line_seqno,
+                    )
+                )
+
+
+if __name__ == "__main__":
+    try:
+        watch_multiple_line_values("/dev/gpiochip0", [5, 3, 7])
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
-- 
2.41.0

