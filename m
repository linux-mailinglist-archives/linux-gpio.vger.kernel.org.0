Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B95533EC7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 16:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244720AbiEYOH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 10:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244813AbiEYOHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 10:07:33 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D484FAE249
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 07:07:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id x12so6043347wrg.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 07:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WM+2+khe8XhMLb01hXpCGQgmyMdFqDLFRBm2fCn/04Q=;
        b=MdG9aGIIsYZxBdR6x6bYBD512rdRA0s1hV4E6j0jgeVqzHKQoWvU9DRoMzCIxcJLvM
         12VY0IMjbqBjPMCZKuEwKqfA0i1ibW2NRQrzaNcg8um2qrRlpTGAaRLX2FyE/a+i4at6
         48mtKVTs4cYdLitXU4qMG4RFXdK9ptnzP6pgO4Cgduq7gzsrEAi1jofrImLbEoGt0MLx
         BGq4ocEDFj6NcmyVSd58sJUZsz3nMk8DaA4JpZB3N88FHjussg81mfDPULqSnPnaOrir
         C9wNGzyu/5QSYdDYPatmxIvkf+LYEtYHFPxEbgkbW4W97Eyjnj6jrBFm//NldU3otpux
         qoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WM+2+khe8XhMLb01hXpCGQgmyMdFqDLFRBm2fCn/04Q=;
        b=tbodJXO2ZSpKsRSdyirdgPxf5nOag9sqYTHXm52Ln/R/p2man9+446kXH9c/L8rUz/
         YeOW5RCWhURO3iCJkKrQ7DxnkPFlRQu8MTtnNzJ/QoNffK1Tyoqauh5iEWn6UE0SgAh9
         HoBPNoenBImLqsvM1fZPQAUVE1Lr2Fn1VT/O5NKsZdE/NtA8KQv9LNiMoOO3UtUDaykr
         cs8h4/xPr5jUFuW/pi7fQCHLUtxQdMDKW3ae2wM+8NqKJtTr/jELZTCe6MU/Jhe4facN
         71N6jeom8r2eoVjh5uv2rKcpbqA+I+TQRtBnClcfsCPwW2iJWo6wDkuVV6qXmrkq/spH
         HeKA==
X-Gm-Message-State: AOAM531Bq85yEZcS3rFmgCXTaqTTfNDiiRf2L40bP8CcD44Pp6iZiM+k
        Q2iuePUF49ZF2eRuXDAMF/gLBQ==
X-Google-Smtp-Source: ABdhPJz+hwMmzKc5PAW3P8tJY+sMIJKWGCNuqXuwjpCU3SOSeFQ46X81lv5+dYt5ePCDSlcMoh2z7A==
X-Received: by 2002:a05:6000:1ac8:b0:20f:d565:e75b with SMTP id i8-20020a0560001ac800b0020fd565e75bmr14817765wry.601.1653487647318;
        Wed, 25 May 2022 07:07:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fb4f:2824:ee44:5505])
        by smtp.gmail.com with ESMTPSA id k42-20020a05600c1caa00b003973435c517sm2859570wms.0.2022.05.25.07.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:07:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2 API
Date:   Wed, 25 May 2022 16:07:02 +0200
Message-Id: <20220525140704.94983-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525140704.94983-1-brgl@bgdev.pl>
References: <20220525140704.94983-1-brgl@bgdev.pl>
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

