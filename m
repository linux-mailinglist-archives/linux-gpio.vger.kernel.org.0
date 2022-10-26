Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F3D60E0C0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 14:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbiJZMej (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 08:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbiJZMei (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 08:34:38 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C59C7B
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:34:32 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id g12so13282132wrs.10
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed35r+8e2UWFR1Gc7OgvEUoElRfatwpjeaiZ3ukvVQY=;
        b=SXcHAXhKzfZAeMzdJLD8JvtAatwDkuQcX73U7YTeQNGsDWzOiU+lSqp5Pzazp5OAYF
         uBld/4xUVfoOiWVaue0DFp7nE5u08O1z78gNjLvyWKK6foLMolM2R/t2jx8GN0QEatdS
         nA9ZX6n0AxnGflE0IaqCcTNa7xN2L6938oly5oSzOWoRXFgipXKtvbC1HTAS4LwEf50N
         UdpRuuQHW93OVbICOWakCJFrOy17EGjWRf6cFRePiNlAICZrHWdNBXSHjPj0nBgZkylr
         cD9ASIY++8t3j3Fw9tEotrcES+xdhhvDYvKO281KQa+uA7ZZPNT2ORAknQTUx49QRVbR
         bEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed35r+8e2UWFR1Gc7OgvEUoElRfatwpjeaiZ3ukvVQY=;
        b=u1upWdb5OcARjUM8P3zTZxTbAJvdU+Q+4wgGEt1Ng9GKzRAY9KqrMM9Pe6z0pn7VkJ
         yTxV5FLOMGFa5zULadXEu8xam5/E97fhy8wuWDS2W+XMyuqMUu35coDpg6hq22kAs8RS
         KD7a6FvrOitz7Vbk241CxcIb6Vj0A7XeZCev+VjuCAAWPvCT40jBTA9cv0Ety6QhylQl
         qGksRbUyicLzBYEagQ5DRY8ufgIE//8x+YemL2/F+NBpRTe/BNCZBB9T+/IlliEe1GQc
         uefFmUnPq36fY5TY34Kg3C22dg5F6EO8Ljba/VAbeT5nLSCCGz3Q9F1tjOHz3JGrz7zl
         yKKg==
X-Gm-Message-State: ACrzQf3Vm1IZ154ETvDvN3m4koPGnvo8P22rUD0y0wj3Kl1XtG9h4gOK
        JtJVIsPGtaYIDXIqnhCX9Z83UQ==
X-Google-Smtp-Source: AMsMyM5+GJOl7OAkY5k6ADN3w4lL2mFBAerJKk5J34oynHKcMyFuhBSl+8P916OhF021QNI3TDcnMg==
X-Received: by 2002:adf:a40c:0:b0:22e:47fe:7ea3 with SMTP id d12-20020adfa40c000000b0022e47fe7ea3mr28024888wra.248.1666787671352;
        Wed, 26 Oct 2022 05:34:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7417:89f0:c4ec:a9c2])
        by smtp.gmail.com with ESMTPSA id t20-20020a0560001a5400b0022584c82c80sm5095880wry.19.2022.10.26.05.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 05:34:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v4 2/4] bindings: python: add examples
Date:   Wed, 26 Oct 2022 14:34:23 +0200
Message-Id: <20221026123425.498912-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026123425.498912-1-brgl@bgdev.pl>
References: <20221026123425.498912-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 bindings/python/examples/gpiodetect.py | 15 +++++++++++
 bindings/python/examples/gpiofind.py   | 20 ++++++++++++++
 bindings/python/examples/gpioget.py    | 29 +++++++++++++++++++++
 bindings/python/examples/gpioinfo.py   | 28 ++++++++++++++++++++
 bindings/python/examples/gpiomon.py    | 26 +++++++++++++++++++
 bindings/python/examples/gpioset.py    | 36 ++++++++++++++++++++++++++
 bindings/python/examples/helpers.py    | 15 +++++++++++
 8 files changed, 179 insertions(+)
 create mode 100644 bindings/python/examples/Makefile.am
 create mode 100755 bindings/python/examples/gpiodetect.py
 create mode 100755 bindings/python/examples/gpiofind.py
 create mode 100755 bindings/python/examples/gpioget.py
 create mode 100755 bindings/python/examples/gpioinfo.py
 create mode 100755 bindings/python/examples/gpiomon.py
 create mode 100755 bindings/python/examples/gpioset.py
 create mode 100644 bindings/python/examples/helpers.py

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
index 0000000..dc98b03
--- /dev/null
+++ b/bindings/python/examples/gpiodetect.py
@@ -0,0 +1,15 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+"""Reimplementation of the gpiodetect tool in Python."""
+
+import gpiod
+import os
+
+from helpers import gpio_chips
+
+if __name__ == "__main__":
+    for chip in gpio_chips():
+        info = chip.get_info()
+        print("{} [{}] ({} lines)".format(info.name, info.label, info.num_lines))
diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
new file mode 100755
index 0000000..d41660d
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
+                offset = chip.line_offset_from_id(sys.argv[1])
+                if offset is not None:
+                    print("{} {}".format(chip.get_info().name, offset))
+                    sys.exit(0)
+
+    sys.exit(1)
diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
new file mode 100755
index 0000000..bf7e0a6
--- /dev/null
+++ b/bindings/python/examples/gpioget.py
@@ -0,0 +1,29 @@
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
+    lines = [int(line) if line.isdigit() else line for line in sys.argv[2:]]
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
index 0000000..3996dcf
--- /dev/null
+++ b/bindings/python/examples/gpioinfo.py
@@ -0,0 +1,28 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+"""Simplified reimplementation of the gpioinfo tool in Python."""
+
+import gpiod
+import os
+
+from helpers import gpio_chips
+
+if __name__ == "__main__":
+    for chip in gpio_chips():
+        cinfo = chip.get_info()
+        print("{} - {} lines:".format(cinfo.name, cinfo.num_lines))
+
+        for offset in range(0, cinfo.num_lines):
+            linfo = chip.get_line_info(offset)
+            is_input = linfo.direction == gpiod.line.Direction.INPUT
+            print(
+                "\tline {:>3}: {:>18} {:>12} {:>8} {:>10}".format(
+                    linfo.offset,
+                    linfo.name or "unnamed",
+                    linfo.consumer or "unused",
+                    "input" if is_input else "output",
+                    "active-low" if linfo.active_low else "active-high",
+                )
+            )
diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
new file mode 100755
index 0000000..58d47a5
--- /dev/null
+++ b/bindings/python/examples/gpiomon.py
@@ -0,0 +1,26 @@
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
+    lines = [int(line) if line.isdigit() else line for line in sys.argv[2:]]
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
index 0000000..372a9a8
--- /dev/null
+++ b/bindings/python/examples/gpioset.py
@@ -0,0 +1,36 @@
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
+
+    def parse_value(arg):
+        x, y = arg.split("=")
+        return (x, Value(int(y)))
+
+    lvs = [parse_value(arg) for arg in sys.argv[2:]]
+    lines = [x[0] for x in lvs]
+    values = dict(lvs)
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
diff --git a/bindings/python/examples/helpers.py b/bindings/python/examples/helpers.py
new file mode 100644
index 0000000..8b91173
--- /dev/null
+++ b/bindings/python/examples/helpers.py
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+import os
+
+
+def gpio_chips():
+    for path in [
+        entry.path
+        for entry in os.scandir("/dev/")
+        if gpiod.is_gpiochip_device(entry.path)
+    ]:
+        with gpiod.Chip(path) as chip:
+            yield chip
-- 
2.34.1

