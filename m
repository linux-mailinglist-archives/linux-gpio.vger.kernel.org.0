Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E02AC73AF81
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjFWEkK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjFWEkJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:40:09 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E242128
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:40:08 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a04cb10465so155242b6e.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495208; x=1690087208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X00U/c2a3nAqsZ7vytz9mK2p+5PhIFXIomdlvmJivo=;
        b=h7fScYj95euSbBNJ4kqmngRo8/uRzdmSfCgaUZxnZJGdaBh0klmWi0rYMZC41FY9c4
         2s8+T9Ee7VshtmqKN132fi7b3GvviHscZK1fFvxrh7nD0Pg1aFEJnOxgaswSSFKo1xqF
         skjJ/Pliru/vCvWPMbB7eaOyKBS8j7OtPMDvIBKvFgWdRvWAwmSgQjZiucXuxq3lc60f
         wk2SFleZ1MKMEIsP5ESHYQdG+WzpsXqVZ9GYYUgDZVOTVxaQkobaer6Uk4iglyiWVJJ2
         y2SAiqeVQKSCZfPcYO5yzT9EP+XVcyL+hxN9S22JZNA5oETFcWBTf5g9FSQV+ALmaW/4
         KYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495208; x=1690087208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X00U/c2a3nAqsZ7vytz9mK2p+5PhIFXIomdlvmJivo=;
        b=Vf9rQ5qhBV8tbfrCS82Zv5H3d5l7ECJ1ghAMW3ss9EtVON7IMEdMNg30ea/yRA1k5A
         PzGvTlPYIlH6ZZQfPqVwL/6r0u210grnXZTqIuqGc7vHXSkvsUMtMzec7M+Dm58FANHr
         sXaqRdXI31GXxWtUxmXFD0DxBzjPG0HpngIyOKIfgLMGx9fkmfuylNs0TLsD25MV+P7q
         gQnfZXfBw2sKZtiPjs8sJ8fQ4EhpkyOF5t/oaSij2XTrO5FbbYgc2+YGkiT/OGacva8u
         56l7q9WLL+aQaBZaG3DBvZxfurPIVdhjdevOmDifysMt9OMp5erPViF3RjOhw0E3nmKw
         buOg==
X-Gm-Message-State: AC+VfDx0KA9HYpGNnqDvxGn0jmTskEtgVLb1uu7Lz+c+tRaYe3lPryMl
        cbV5Ly7xzt7eIwKNZDWM9reAQ2VIniI=
X-Google-Smtp-Source: ACHHUZ5Wem9dy2NQBeVFjYs+NIlFDgTr58X5XEb/HElhN7WDhqIZ6fuYnegtN04QLguDCvtjBcJ4KQ==
X-Received: by 2002:a54:4111:0:b0:3a0:6949:c884 with SMTP id l17-20020a544111000000b003a06949c884mr2852166oic.34.1687495208072;
        Thu, 22 Jun 2023 21:40:08 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:40:07 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 5/8] bindings: python: examples: consistency cleanup
Date:   Fri, 23 Jun 2023 12:38:58 +0800
Message-ID: <20230623043901.16764-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
References: <20230623043901.16764-1-warthog618@gmail.com>
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

A collection of minor changes to be more consistent with other examples:
 - capitalize comments
 - add line offset to value outputs
 - drop comma from edge event outputs
 - improve behaviour if run on a platform that does not match the
   example configuration
 - use with to cleanup request in toggle_line_value.py

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../python/examples/async_watch_line_value.py | 15 ++++----
 bindings/python/examples/get_line_value.py    | 13 ++++---
 bindings/python/examples/toggle_line_value.py | 34 +++++++------------
 bindings/python/examples/watch_line_value.py  | 19 +++++------
 4 files changed, 35 insertions(+), 46 deletions(-)

diff --git a/bindings/python/examples/async_watch_line_value.py b/bindings/python/examples/async_watch_line_value.py
index ed09ec9..ea8314f 100755
--- a/bindings/python/examples/async_watch_line_value.py
+++ b/bindings/python/examples/async_watch_line_value.py
@@ -19,12 +19,8 @@ def edge_type(event):
     return "Unknown"
 
 
-def async_watch_line_value():
-    # example configuration - customise to suit your situation
-    chip_path = "/dev/gpiochip0"
-    line_offset = 5
-
-    # assume a button connecting the pin to ground,
+def async_watch_line_value(chip_path, line_offset):
+    # Assume a button connecting the pin to ground,
     # so pull it up and provide some debounce.
     with gpiod.request_lines(
         chip_path,
@@ -40,7 +36,7 @@ def async_watch_line_value():
         poll = select.poll()
         poll.register(request.fd, select.POLLIN)
         while True:
-            # other fds could be registered with the poll and be handled
+            # Other fds could be registered with the poll and be handled
             # separately using the return value (fd, event) from poll()
             poll.poll()
             for event in request.read_edge_events():
@@ -51,4 +47,7 @@ def async_watch_line_value():
 
 
 if __name__ == "__main__":
-    async_watch_line_value()
+    try:
+        async_watch_line_value("/dev/gpiochip0", 5)
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/get_line_value.py b/bindings/python/examples/get_line_value.py
index ab733df..f3ca13b 100755
--- a/bindings/python/examples/get_line_value.py
+++ b/bindings/python/examples/get_line_value.py
@@ -9,19 +9,18 @@ import gpiod
 from gpiod.line import Direction
 
 
-def get_line_value():
-    # example configuration - customise to suit your situation
-    chip_path = "/dev/gpiochip0"
-    line_offset = 5
-
+def get_line_value(chip_path, line_offset):
     with gpiod.request_lines(
         chip_path,
         consumer="get-line-value",
         config={line_offset: gpiod.LineSettings(direction=Direction.INPUT)},
     ) as request:
         value = request.get_value(line_offset)
-        print(value)
+        print("{}={}".format(line_offset, value))
 
 
 if __name__ == "__main__":
-    get_line_value()
+    try:
+        get_line_value("/dev/gpiochip0", 5)
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/toggle_line_value.py b/bindings/python/examples/toggle_line_value.py
index 46e52f9..e0de8fb 100755
--- a/bindings/python/examples/toggle_line_value.py
+++ b/bindings/python/examples/toggle_line_value.py
@@ -16,21 +16,11 @@ def toggle_value(value):
     return Value.INACTIVE
 
 
-def print_value(value):
-    if value == Value.ACTIVE:
-        print("Active")
-    else:
-        print("Inactive")
-
-
-def toggle_line_value():
-    # example configuration - customise to suit your situation
-    chip_path = "/dev/gpiochip0"
-    line_offset = 5
-
+def toggle_line_value(chip_path, line_offset):
+    value_str = {Value.ACTIVE: "Active", Value.INACTIVE: "Inactive"}
     value = Value.ACTIVE
 
-    request = gpiod.request_lines(
+    with gpiod.request_lines(
         chip_path,
         consumer="toggle-line-value",
         config={
@@ -38,14 +28,16 @@ def toggle_line_value():
                 direction=Direction.OUTPUT, output_value=value
             )
         },
-    )
-
-    while True:
-        print_value(value)
-        time.sleep(1)
-        value = toggle_value(value)
-        request.set_value(line_offset, value)
+    ) as request:
+        while True:
+            print("{}={}".format(line_offset, value_str[value]))
+            time.sleep(1)
+            value = toggle_value(value)
+            request.set_value(line_offset, value)
 
 
 if __name__ == "__main__":
-    toggle_line_value()
+    try:
+        toggle_line_value("/dev/gpiochip0", 5)
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
diff --git a/bindings/python/examples/watch_line_value.py b/bindings/python/examples/watch_line_value.py
index 42fc0bd..841bf40 100755
--- a/bindings/python/examples/watch_line_value.py
+++ b/bindings/python/examples/watch_line_value.py
@@ -12,18 +12,14 @@ from gpiod.line import Bias, Edge
 
 def edge_type(event):
     if event.event_type is event.Type.RISING_EDGE:
-        return "Rising "
+        return "Rising"
     if event.event_type is event.Type.FALLING_EDGE:
         return "Falling"
     return "Unknown"
 
 
-def watch_line_value():
-    # example configuration - customise to suit your situation
-    chip_path = "/dev/gpiochip0"
-    line_offset = 5
-
-    # assume a button connecting the pin to ground,
+def watch_line_value(chip_path, line_offset):
+    # Assume a button connecting the pin to ground,
     # so pull it up and provide some debounce.
     with gpiod.request_lines(
         chip_path,
@@ -37,13 +33,16 @@ def watch_line_value():
         },
     ) as request:
         while True:
-            # blocks until at least one event is available
+            # Blocks until at least one event is available
             for event in request.read_edge_events():
                 print(
-                    "offset: %d, type: %s, event #%d"
+                    "line: %d  type: %-7s  event #%d"
                     % (event.line_offset, edge_type(event), event.line_seqno)
                 )
 
 
 if __name__ == "__main__":
-    watch_line_value()
+    try:
+        watch_line_value("/dev/gpiochip0", 5)
+    except OSError as ex:
+        print(ex, "\nCustomise the example configuration to suit your situation")
-- 
2.41.0

