Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1CB72F34B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 05:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjFNDzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 23:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbjFNDzO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 23:55:14 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3434C3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:12 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b3a6469623so23922025ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714912; x=1689306912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HkwAXXE0/XlVIBZBwL0UjyLcXAB59rNKnEN8CXuAfw=;
        b=VEp9kbZLbN6wBCxR+yU1IYYJXf1lzL02sciqV+Lu9VsffqQ+/wNsuXz6UM9HquhNNQ
         yC8I63B23KbkVQPLwsRnwMBlzFf6acExRTXe2YnoltBXVxLMCx0vZSiFhHirsWMHg3yh
         /geinykXQtNBbT2rhgrVtP8tV7ABmpjFYBmr+A1ApcOADRoOiMIO+cJ2VROracmhQjQN
         Y9+x6F8ZOtFAo1dM1lmcpqtU0ane01cYD/Yz9sqe7CuhfgBTzvkWhrmWSPuhcMIrcLH6
         ra/BlBCa8pOjcIEm/XoIrAETzZPMSBf4/fDJeku1rGb+CsdjHcWTEIAIsUp+AGNSdz6p
         X8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714912; x=1689306912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HkwAXXE0/XlVIBZBwL0UjyLcXAB59rNKnEN8CXuAfw=;
        b=ZVVRcmQ7tswgX6DzD0AOiBmthm7LZYnSbKFxO2L3UCodS80w6/Tr6e5fMfsqUCHZ6y
         vRs/MqUMQ63MA/m4O/DDT5y6Ych9Ia5Yo6LxKHOLf9y2NjrnrnSinj0WWU7VT9MmRVsU
         kdnKsOfnejfNajp4n+Cnmaskxc95/E04tkPOI7MOctJz1iu+Qdv11QlXzh3gc/9QOkqb
         AkPg0tycpU2eemQXOQwgI5SwcDTw7DhSh8T+2RIS0hPWkI7VUBOdI8RfQsZYUNDWqo9M
         vqdBToAPetM2+mrxQBqsMkFsenH0U4LzU4KxgBQrxJUsSvRJ6ckdxdW5nY0voMDczpCG
         Phdg==
X-Gm-Message-State: AC+VfDyhT2D3FsTQin5dSSUjEcG84OLyRhn9eKS/QyLz3m4Aci6WmSf6
        ssfqZvKyDD/ybLamOsBeS2DOUdwOBVA=
X-Google-Smtp-Source: ACHHUZ7lu1JQebA4fJYBG/j80SJc73cfmaQoAnP23iIn5dDhtlk4TaXWb5E8j5mgxKzrI4OxIYifKQ==
X-Received: by 2002:a17:903:124d:b0:1b1:b2fa:1903 with SMTP id u13-20020a170903124d00b001b1b2fa1903mr11876935plh.41.1686714912250;
        Tue, 13 Jun 2023 20:55:12 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001ae6fe84244sm10967412plh.243.2023.06.13.20.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:55:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 3/4] bindings: python: examples: add dedicated examples
Date:   Wed, 14 Jun 2023 11:54:25 +0800
Message-Id: <20230614035426.15097-4-warthog618@gmail.com>
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

Add python equivalents of the core examples.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../python/examples/async_watch_line_value.py | 47 +++++++++++++++++++
 bindings/python/examples/get_line_value.py    | 26 ++++++++++
 bindings/python/examples/toggle_line_value.py | 47 +++++++++++++++++++
 bindings/python/examples/watch_line_value.py  | 42 +++++++++++++++++
 4 files changed, 162 insertions(+)
 create mode 100755 bindings/python/examples/async_watch_line_value.py
 create mode 100755 bindings/python/examples/get_line_value.py
 create mode 100755 bindings/python/examples/toggle_line_value.py
 create mode 100755 bindings/python/examples/watch_line_value.py

diff --git a/bindings/python/examples/async_watch_line_value.py b/bindings/python/examples/async_watch_line_value.py
new file mode 100755
index 0000000..031a988
--- /dev/null
+++ b/bindings/python/examples/async_watch_line_value.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of asynchronously watching for edges on a single line."""
+
+from datetime import timedelta
+import gpiod
+import select
+
+from gpiod.line import Bias, Edge
+
+def edge_type(event):
+    if event.event_type is event.Type.RISING_EDGE:
+        return "Rising "
+    if event.event_type is event.Type.FALLING_EDGE:
+        return "Falling"
+    return "Unknown"
+
+
+def async_watch_line_value():
+    # example configuration - customise to suit your situation
+    chip_path = '/dev/gpiochip0'
+    line_offset = 5
+
+    # assume a button connecting the pin to ground,
+    # so pull it up and provide some debounce.
+    with gpiod.request_lines(
+        chip_path,
+        consumer="async-watch-line-value",
+        config={line_offset: gpiod.LineSettings(edge_detection=Edge.BOTH,
+                                bias=Bias.PULL_UP,
+                                debounce_period=timedelta(milliseconds=10))},
+    ) as request:
+        poll = select.poll()
+        poll.register(request.fd, select.POLLIN)
+        while True:
+            # other fds could be registered with the poll and be handled
+            # separately using the return value (fd, event) from poll()
+            poll.poll()
+            for event in request.read_edge_events():
+                print("offset: %d, type: %s, event #%d" %
+                      (event.line_offset, edge_type(event), event.line_seqno))
+
+
+if __name__ == "__main__":
+    async_watch_line_value()
diff --git a/bindings/python/examples/get_line_value.py b/bindings/python/examples/get_line_value.py
new file mode 100755
index 0000000..da9d060
--- /dev/null
+++ b/bindings/python/examples/get_line_value.py
@@ -0,0 +1,26 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of reading a single line."""
+
+import gpiod
+
+from gpiod.line import Direction
+
+def get_line_value():
+    # example configuration - customise to suit your situation
+    chip_path = '/dev/gpiochip0'
+    line_offset = 5
+
+    with gpiod.request_lines(
+        chip_path,
+        consumer="get-line-value",
+        config={line_offset: gpiod.LineSettings(direction=Direction.INPUT)},
+    ) as request:
+        value = request.get_value(line_offset)
+        print(value)
+
+
+if __name__ == "__main__":
+    get_line_value()
diff --git a/bindings/python/examples/toggle_line_value.py b/bindings/python/examples/toggle_line_value.py
new file mode 100755
index 0000000..ed84d5b
--- /dev/null
+++ b/bindings/python/examples/toggle_line_value.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of toggling a single line."""
+
+import gpiod
+import time
+
+from gpiod.line import Direction, Value
+
+def toggle_value(value):
+    if value == Value.INACTIVE:
+        return Value.ACTIVE
+    return Value.INACTIVE
+
+
+def print_value(value):
+    if value == Value.ACTIVE:
+        print("Active")
+    else:
+        print("Inactive")
+
+
+def toggle_line_value():
+    # example configuration - customise to suit your situation
+    chip_path = '/dev/gpiochip0'
+    line_offset = 5
+
+    value = Value.ACTIVE
+
+    request = gpiod.request_lines(
+        chip_path,
+        consumer="toggle-line-value",
+        config={line_offset: gpiod.LineSettings(direction=Direction.OUTPUT,
+                                                output_value=value)},
+    )
+
+    while True:
+        print_value(value)
+        time.sleep(1)
+        value = toggle_value(value)
+        request.set_value(line_offset, value)
+
+
+if __name__ == "__main__":
+    toggle_line_value()
diff --git a/bindings/python/examples/watch_line_value.py b/bindings/python/examples/watch_line_value.py
new file mode 100755
index 0000000..5747706
--- /dev/null
+++ b/bindings/python/examples/watch_line_value.py
@@ -0,0 +1,42 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+"""Minimal example of watching for edges on a single line."""
+
+from datetime import timedelta
+import gpiod
+
+from gpiod.line import Bias, Edge
+
+def edge_type(event):
+    if event.event_type is event.Type.RISING_EDGE:
+        return "Rising "
+    if event.event_type is event.Type.FALLING_EDGE:
+        return "Falling"
+    return "Unknown"
+
+
+def watch_line_value():
+    # example configuration - customise to suit your situation
+    chip_path = '/dev/gpiochip0'
+    line_offset = 5
+
+    # assume a button connecting the pin to ground,
+    # so pull it up and provide some debounce.
+    with gpiod.request_lines(
+        chip_path,
+        consumer="watch-line-value",
+        config={line_offset: gpiod.LineSettings(edge_detection=Edge.BOTH,
+                                bias=Bias.PULL_UP,
+                                debounce_period=timedelta(milliseconds=10))},
+    ) as request:
+        while True:
+            # blocks until at least one event is available
+            for event in request.read_edge_events():
+                print("offset: %d, type: %s, event #%d" %
+                      (event.line_offset, edge_type(event), event.line_seqno))
+
+
+if __name__ == "__main__":
+    watch_line_value()
-- 
2.40.1

