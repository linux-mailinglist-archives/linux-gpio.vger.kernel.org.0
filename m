Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD5055D5F1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244752AbiF1Imu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 04:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343997AbiF1Imt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 04:42:49 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4572715E
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:36 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so2191198wmb.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wcHmugkVTEnhSgijUOjMLxje3hkGI00SZtIh01pbB64=;
        b=pvvdWfSWqVdf31XjyyDPS5KHCkj7cePl7TNZb/QRm81TZFjy56nIarPx4bpsCSutWm
         4Q/6ufduY4swtt6tvdhCVW5yz0K62v0lMUwXJMM0uG8LaH3rVV6yb7uxLYlQ7dKOCCSz
         wzPRn1i2x6P6ID+dDmata5aZFu3e+yInbHqSuSvGR9Q5mjWHAOrGE/QeRmKWP8I2qRzN
         08eG3IWb3ySnxM4hggt2CZkPqav19evHNVLY3cVpXOabpLkZpQXQugmthB5ytZY+Fr8L
         4tKz5mFzd3mb1iI25CXrXQB9EWW2379mrhz31gnxkoAjjB0o6idCUML7kJ3vRjD7fi1E
         g6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcHmugkVTEnhSgijUOjMLxje3hkGI00SZtIh01pbB64=;
        b=uOrGQ75m1MplRNnRO+2oCehCf4kWgyJfkI9lOD1KIKnaGJk5zbYgJQ7FmJWvf1wGhN
         dIUmVrKzT8eOA7DNE4nrBN5eJ1GW04Oi8DKj7JivzieML+/wEON2Ro/ryLL8lklUVWr1
         QcdOgY02k7Z2hkOAe+Km6MWilHAZAqbSKTjFGAagXxwKe+yziztCGVm0/9Jqd90Xnk1l
         TpkaEWFcVaYRgsf+n6+7F2RZbrBgdDGcSnYH3uscnBuQKVbr8CwoJxR9AMy6Y1A7JeqL
         CXvy88Ufi/kjV5vDhL8ZzAlaSzxzNctvmwA4RZEk7QGg+6Ftif6YpEd1i9gSBdDe6Gjq
         QRvg==
X-Gm-Message-State: AJIora+X8/cYoXprJB4aWH+mT2MA6fo4EVgX4Zfj+kOcbst17ojUeXpr
        yM75pXkmN7izrHhYr8M37ymznQ==
X-Google-Smtp-Source: AGRyM1vw4iZn0VQezBYbIH4wf+I1LinTR3HfPDDcoHeSSkTUOTPSD0n2QFaxV+aRCRVwSyXpFhoKXw==
X-Received: by 2002:a1c:4c13:0:b0:39c:5a6b:8540 with SMTP id z19-20020a1c4c13000000b0039c5a6b8540mr25060494wmf.106.1656405754355;
        Tue, 28 Jun 2022 01:42:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:51e:c065:fa3f:a137])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0021badf3cb26sm15596062wrr.63.2022.06.28.01.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 01:42:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2 4/5] bindings: python: add tests for v2 API
Date:   Tue, 28 Jun 2022 10:42:25 +0200
Message-Id: <20220628084226.472035-5-brgl@bgdev.pl>
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

This adds a python wrapper around libgpiosim and a set of test cases
for the v2 API using python's standard unittest module.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/python/tests/Makefile.am             |  14 +
 bindings/python/tests/cases/__init__.py       |  12 +
 bindings/python/tests/cases/tests_chip.py     | 157 +++++++
 .../python/tests/cases/tests_chip_info.py     |  59 +++
 .../python/tests/cases/tests_edge_event.py    | 279 +++++++++++
 .../python/tests/cases/tests_info_event.py    | 135 ++++++
 .../python/tests/cases/tests_line_config.py   | 254 ++++++++++
 .../python/tests/cases/tests_line_info.py     |  90 ++++
 .../python/tests/cases/tests_line_request.py  | 345 ++++++++++++++
 bindings/python/tests/cases/tests_misc.py     |  53 +++
 .../tests/cases/tests_request_config.py       |  77 ++++
 bindings/python/tests/gpiod_py_test.py        |  25 +
 bindings/python/tests/gpiosimmodule.c         | 434 ++++++++++++++++++
 13 files changed, 1934 insertions(+)
 create mode 100644 bindings/python/tests/Makefile.am
 create mode 100644 bindings/python/tests/cases/__init__.py
 create mode 100644 bindings/python/tests/cases/tests_chip.py
 create mode 100644 bindings/python/tests/cases/tests_chip_info.py
 create mode 100644 bindings/python/tests/cases/tests_edge_event.py
 create mode 100644 bindings/python/tests/cases/tests_info_event.py
 create mode 100644 bindings/python/tests/cases/tests_line_config.py
 create mode 100644 bindings/python/tests/cases/tests_line_info.py
 create mode 100644 bindings/python/tests/cases/tests_line_request.py
 create mode 100644 bindings/python/tests/cases/tests_misc.py
 create mode 100644 bindings/python/tests/cases/tests_request_config.py
 create mode 100755 bindings/python/tests/gpiod_py_test.py
 create mode 100644 bindings/python/tests/gpiosimmodule.c

diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
new file mode 100644
index 0000000..099574f
--- /dev/null
+++ b/bindings/python/tests/Makefile.am
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+dist_bin_SCRIPTS = gpiod_py_test.py
+
+pyexec_LTLIBRARIES = gpiosim.la
+
+gpiosim_la_SOURCES = gpiosimmodule.c
+gpiosim_la_CFLAGS = -I$(top_srcdir)/tests/gpiosim/
+gpiosim_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
+gpiosim_la_LDFLAGS = -module -avoid-version
+gpiosim_la_LIBADD = $(top_builddir)/tests/gpiosim/libgpiosim.la
+gpiosim_la_LIBADD += $(top_builddir)/bindings/python/enum/libpycenum.la
+gpiosim_la_LIBADD += $(PYTHON_LIBS)
diff --git a/bindings/python/tests/cases/__init__.py b/bindings/python/tests/cases/__init__.py
new file mode 100644
index 0000000..6503663
--- /dev/null
+++ b/bindings/python/tests/cases/__init__.py
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from .tests_chip import *
+from .tests_chip_info import *
+from .tests_edge_event import *
+from .tests_info_event import *
+from .tests_line_config import *
+from .tests_line_info import *
+from .tests_line_request import *
+from .tests_misc import *
+from .tests_request_config import *
diff --git a/bindings/python/tests/cases/tests_chip.py b/bindings/python/tests/cases/tests_chip.py
new file mode 100644
index 0000000..844dbfc
--- /dev/null
+++ b/bindings/python/tests/cases/tests_chip.py
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import errno
+import gpiod
+import gpiosim
+import unittest
+
+
+class ChipConstructor(unittest.TestCase):
+    def test_open_existing_chip(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            pass
+
+    def test_open_nonexistent_chip(self):
+        with self.assertRaises(OSError) as ex:
+            gpiod.Chip("/dev/nonexistent")
+
+        self.assertEqual(ex.exception.errno, errno.ENOENT)
+
+    def test_open_not_a_character_device(self):
+        with self.assertRaises(OSError) as ex:
+            gpiod.Chip("/tmp")
+
+        self.assertEqual(ex.exception.errno, errno.ENOTTY)
+
+    def test_open_not_a_gpio_device(self):
+        with self.assertRaises(OSError) as ex:
+            gpiod.Chip("/dev/null")
+
+        self.assertEqual(ex.exception.errno, errno.ENODEV)
+
+    def test_missing_path(self):
+        with self.assertRaises(TypeError):
+            gpiod.Chip()
+
+
+class ChipBooleanConversion(unittest.TestCase):
+    def test_chip_bool(self):
+        sim = gpiosim.Chip()
+        chip = gpiod.Chip(sim.dev_path)
+        self.assertTrue(chip)
+        chip.close()
+        self.assertFalse(chip)
+
+
+class ChipProperties(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip()
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.sim = None
+
+    def test_get_chip_path(self):
+        self.assertEqual(self.sim.dev_path, self.chip.path)
+
+    def test_get_fd(self):
+        self.assertGreaterEqual(self.chip.fd, 0)
+
+    def test_properties_are_immutable(self):
+        with self.assertRaises(AttributeError):
+            self.chip.path = "foobar"
+
+        with self.assertRaises(AttributeError):
+            self.chip.fd = 4
+
+
+class LineOffsetFromName(unittest.TestCase):
+    def test_offset_lookup_good(self):
+        sim = gpiosim.Chip(
+            num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertEqual(chip.get_line_offset_from_name("baz"), 4)
+
+    def test_offset_lookup_bad(self):
+        sim = gpiosim.Chip(
+            num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertIsNone(chip.get_line_offset_from_name("nonexistent"))
+
+    def test_duplicate_names(self):
+        sim = gpiosim.Chip(
+            num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "bar"}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertEqual(chip.get_line_offset_from_name("bar"), 2)
+
+
+class ClosedChipCannotBeUsed(unittest.TestCase):
+    def test_close_chip_and_try_to_use_it(self):
+        sim = gpiosim.Chip(label="foobar")
+
+        chip = gpiod.Chip(sim.dev_path)
+        self.assertEqual(chip.path, sim.dev_path)
+        chip.close()
+
+        with self.assertRaises(gpiod.ChipClosedError):
+            chip.path
+
+    def test_close_chip_and_try_controlled_execution(self):
+        sim = gpiosim.Chip()
+
+        chip = gpiod.Chip(sim.dev_path)
+        self.assertEqual(chip.path, sim.dev_path)
+        chip.close()
+
+        with self.assertRaises(gpiod.ChipClosedError):
+            with chip:
+                chip.fd
+
+
+class StringRepresentation(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4, label="foobar")
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.sim = None
+
+    def test_repr(self):
+        self.assertEqual(repr(self.chip), 'gpiod.Chip("{}")'.format(self.sim.dev_path))
+
+    def test_str(self):
+        info = self.chip.get_info()
+        self.assertEqual(
+            str(self.chip),
+            '<gpiod.Chip path="{}" fd={} info=<gpiod.ChipInfo name="{}" label="foobar" num_lines=4>>'.format(
+                self.sim.dev_path, self.chip.fd, info.name
+            ),
+        )
+
+
+class StringRepresentationClosed(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4, label="foobar")
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.sim = None
+
+    def test_repr_closed(self):
+        self.chip.close()
+        self.assertEqual(repr(self.chip), "<gpiod.Chip CLOSED>")
+
+    def test_str_closed(self):
+        self.chip.close()
+        self.assertEqual(str(self.chip), "<gpiod.Chip CLOSED>")
diff --git a/bindings/python/tests/cases/tests_chip_info.py b/bindings/python/tests/cases/tests_chip_info.py
new file mode 100644
index 0000000..d7c10e0
--- /dev/null
+++ b/bindings/python/tests/cases/tests_chip_info.py
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+import gpiosim
+import unittest
+
+
+class ChipInfoConstructor(unittest.TestCase):
+    def test_chip_info_cannot_be_instantiated(self):
+        with self.assertRaises(TypeError):
+            info = gpiod.ChipInfo()
+
+
+class ChipInfoProperties(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(label="foobar", num_lines=16)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.info = self.chip.get_info()
+
+    def tearDown(self):
+        self.info = None
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_chip_info_name(self):
+        self.assertEqual(self.info.name, self.sim.name)
+
+    def test_chip_info_label(self):
+        self.assertEqual(self.info.label, "foobar")
+
+    def test_chip_info_num_lines(self):
+        self.assertEqual(self.info.num_lines, 16)
+
+    def test_chip_info_properties_are_immutable(self):
+        with self.assertRaises(AttributeError):
+            self.info.name = "foobar"
+
+        with self.assertRaises(AttributeError):
+            self.info.num_lines = 4
+
+        with self.assertRaises(AttributeError):
+            self.info.label = "foobar"
+
+
+class ChipInfoStringRepresentation(unittest.TestCase):
+    def test_chip_info_str(self):
+        sim = gpiosim.Chip(label="foobar", num_lines=16)
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            info = chip.get_info()
+
+            self.assertEqual(
+                str(info),
+                '<gpiod.ChipInfo name="{}" label="foobar" num_lines=16>'.format(
+                    sim.name
+                ),
+            )
diff --git a/bindings/python/tests/cases/tests_edge_event.py b/bindings/python/tests/cases/tests_edge_event.py
new file mode 100644
index 0000000..5292fdc
--- /dev/null
+++ b/bindings/python/tests/cases/tests_edge_event.py
@@ -0,0 +1,279 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import datetime
+import gpiod
+import gpiosim
+import threading
+import time
+import unittest
+
+from functools import partial
+
+Direction = gpiod.Line.Direction
+Edge = gpiod.Line.Edge
+EventType = gpiod.EdgeEvent.Type
+Pull = gpiosim.Chip.Pull
+
+
+class EdgeEventConstructor(unittest.TestCase):
+    def test_edge_event_cannot_be_instantiated(self):
+        with self.assertRaises(TypeError):
+            info = gpiod.EdgeEvent()
+
+
+class EdgeEventBufferConstructor(unittest.TestCase):
+    def test_edge_event_buffer_constructor_default_capacity(self):
+        buf = gpiod.EdgeEventBuffer()
+        self.assertEqual(buf.capacity, 64)
+
+    def test_edge_event_buffer_constructor_set_capacity(self):
+        buf = gpiod.EdgeEventBuffer(256)
+        self.assertEqual(buf.capacity, 256)
+
+    def test_edge_event_buffer_constructor_zero_capacity(self):
+        buf = gpiod.EdgeEventBuffer(0)
+        self.assertEqual(buf.capacity, 64)
+
+    def test_edge_event_buffer_constructor_max_capacity(self):
+        buf = gpiod.EdgeEventBuffer(16 * 64 * 2)
+        self.assertEqual(buf.capacity, 1024)
+
+
+class EdgeEventWaitTimeout(unittest.TestCase):
+    def test_event_wait_timeout(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.request_lines(
+            sim.dev_path,
+            gpiod.RequestConfig(offsets=[0]),
+            gpiod.LineConfig(edge_detection=Edge.BOTH),
+        ) as req:
+            self.assertEqual(
+                req.wait_edge_event(datetime.timedelta(microseconds=10000)), False
+            )
+
+
+class EdgeEventInvalidConfig(unittest.TestCase):
+    def test_output_mode_and_edge_detection(self):
+        sim = gpiosim.Chip()
+
+        with self.assertRaises(ValueError):
+            gpiod.request_lines(
+                sim.dev_path,
+                gpiod.RequestConfig(offsets=[0]),
+                gpiod.LineConfig(direction=Direction.OUTPUT, edge_detection=Edge.BOTH),
+            )
+
+
+class WaitingForEdgeEvents(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.thread = None
+
+    def tearDown(self):
+        if self.thread:
+            self.thread.join()
+        self.sim = None
+
+    def trigger_falling_and_rising_edge(self, offset):
+        time.sleep(0.05)
+        self.sim.set_pull(offset, Pull.PULL_UP)
+        time.sleep(0.05)
+        self.sim.set_pull(offset, Pull.PULL_DOWN)
+
+    def trigger_rising_edge_events_on_two_offsets(self, offset0, offset1):
+        time.sleep(0.05)
+        self.sim.set_pull(offset0, Pull.PULL_UP)
+        time.sleep(0.05)
+        self.sim.set_pull(offset1, Pull.PULL_UP)
+
+    def test_both_edge_events(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[2]),
+            gpiod.LineConfig(edge_detection=Edge.BOTH),
+        ) as req:
+            buf = gpiod.EdgeEventBuffer()
+            self.thread = threading.Thread(
+                target=partial(self.trigger_falling_and_rising_edge, 2)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
+            self.assertEqual(req.read_edge_event(buf), 1)
+            self.assertEqual(len(buf), 1)
+            event = buf[0]
+            self.assertEqual(event.type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 2)
+            ts_rising = event.timestamp_ns
+
+            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
+            self.assertEqual(req.read_edge_event(buf), 1)
+            self.assertEqual(len(buf), 1)
+            event = buf[0]
+            self.assertEqual(event.type, EventType.FALLING_EDGE)
+            self.assertEqual(event.line_offset, 2)
+            ts_falling = event.timestamp_ns
+
+            self.assertGreater(ts_falling, ts_rising)
+
+    def test_rising_edge_event(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[6]),
+            gpiod.LineConfig(edge_detection=Edge.RISING),
+        ) as req:
+            buf = gpiod.EdgeEventBuffer()
+            self.thread = threading.Thread(
+                target=partial(self.trigger_falling_and_rising_edge, 6)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
+            self.assertEqual(req.read_edge_event(buf), 1)
+            self.assertEqual(len(buf), 1)
+            event = buf[0]
+            self.assertEqual(event.type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 6)
+
+            self.assertFalse(
+                req.wait_edge_event(datetime.timedelta(microseconds=10000))
+            )
+
+    def test_falling_edge_event(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[6]),
+            gpiod.LineConfig(edge_detection=Edge.FALLING),
+        ) as req:
+            buf = gpiod.EdgeEventBuffer()
+            self.thread = threading.Thread(
+                target=partial(self.trigger_falling_and_rising_edge, 6)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
+            self.assertEqual(req.read_edge_event(buf), 1)
+            self.assertEqual(len(buf), 1)
+            event = buf[0]
+            self.assertEqual(event.type, EventType.FALLING_EDGE)
+            self.assertEqual(event.line_offset, 6)
+
+            self.assertFalse(
+                req.wait_edge_event(datetime.timedelta(microseconds=10000))
+            )
+
+    def test_sequence_numbers(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[2, 4]),
+            gpiod.LineConfig(edge_detection=Edge.BOTH),
+        ) as req:
+            buf = gpiod.EdgeEventBuffer()
+            self.thread = threading.Thread(
+                target=partial(self.trigger_rising_edge_events_on_two_offsets, 2, 4)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
+            self.assertEqual(req.read_edge_event(buf), 1)
+            self.assertEqual(len(buf), 1)
+            event = buf[0]
+            self.assertEqual(event.type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 2)
+            self.assertEqual(event.global_seqno, 1)
+            self.assertEqual(event.line_seqno, 1)
+
+            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
+            self.assertEqual(req.read_edge_event(buf), 1)
+            self.assertEqual(len(buf), 1)
+            event = buf[0]
+            self.assertEqual(event.type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 4)
+            self.assertEqual(event.global_seqno, 2)
+            self.assertEqual(event.line_seqno, 1)
+
+
+class ReadingMultipleEdgeEvents(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.request = gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[1]),
+            gpiod.LineConfig(edge_detection=Edge.BOTH),
+        )
+        self.line_seqno = 1
+        self.global_seqno = 1
+        self.sim.set_pull(1, Pull.PULL_UP)
+        time.sleep(0.05)
+        self.sim.set_pull(1, Pull.PULL_DOWN)
+        time.sleep(0.05)
+        self.sim.set_pull(1, Pull.PULL_UP)
+        time.sleep(0.05)
+
+    def tearDown(self):
+        self.request.release()
+        self.request = None
+        self.sim = None
+
+    def test_read_multiple_events(self):
+        buf = gpiod.EdgeEventBuffer()
+        self.assertTrue(self.request.wait_edge_event(datetime.timedelta(seconds=1)))
+        self.assertEqual(self.request.read_edge_event(buf), 3)
+        self.assertEqual(len(buf), 3)
+
+        for event in buf:
+            self.assertEqual(event.line_offset, 1)
+            self.assertEqual(event.line_seqno, self.line_seqno)
+            self.assertEqual(event.global_seqno, self.global_seqno)
+            self.line_seqno += 1
+            self.global_seqno += 1
+
+    def test_read_multiple_events_without_buffer(self):
+        self.assertTrue(self.request.wait_edge_event(datetime.timedelta(seconds=1)))
+        events = self.request.read_edge_event(max_events=3)
+        self.assertEqual(len(events), 3)
+
+    def test_read_over_buffer_capacity(self):
+        buf = gpiod.EdgeEventBuffer(2)
+        self.assertTrue(self.request.wait_edge_event(datetime.timedelta(seconds=1)))
+        self.assertEqual(self.request.read_edge_event(buf), 2)
+        self.assertEqual(len(buf), 2)
+
+
+class EdgeEventBufferStringRepresentation(unittest.TestCase):
+    def test_edge_event_buffer_repr(self):
+        buf = gpiod.EdgeEventBuffer(512)
+        self.assertEqual(repr(buf), "gpiod.EdgeEventBuffer(512)")
+
+    def test_edge_event_buffer_str(self):
+        sim = gpiosim.Chip(num_lines=8)
+
+        with gpiod.request_lines(
+            sim.dev_path,
+            gpiod.RequestConfig(offsets=[0, 1, 2, 3]),
+            gpiod.LineConfig(edge_detection=Edge.BOTH),
+        ) as req:
+            buf = gpiod.EdgeEventBuffer()
+
+            sim.set_pull(2, Pull.PULL_UP)
+            time.sleep(0.05)
+            sim.set_pull(2, Pull.PULL_DOWN)
+            time.sleep(0.05)
+            sim.set_pull(1, Pull.PULL_UP)
+            time.sleep(0.05)
+
+            self.assertTrue(req.wait_edge_event(datetime.timedelta(seconds=1)))
+            self.assertEqual(req.read_edge_event(buf), 3)
+
+            # Single event
+            self.assertRegex(
+                str(buf[1]),
+                "<gpiod\.EdgeEvent type=Type\.FALLING_EDGE timestamp_ns=[0-9]+ line_offset=2 global_seqno=2 line_seqno=2>",
+            )
+
+            self.assertRegex(
+                str(buf),
+                "<gpiod\.EdgeEventBuffer capacity=64 num_events=3 events=\[<gpiod\.EdgeEvent type=Type\.RISING_EDGE timestamp_ns=[0-9]+ line_offset=2 global_seqno=1 line_seqno=1>\, <gpiod\.EdgeEvent type=Type\.FALLING_EDGE timestamp_ns=[0-9]+ line_offset=2 global_seqno=2 line_seqno=2>\, <gpiod\.EdgeEvent type=Type\.RISING_EDGE timestamp_ns=[0-9]+ line_offset=1 global_seqno=3 line_seqno=1>\]>",
+            )
diff --git a/bindings/python/tests/cases/tests_info_event.py b/bindings/python/tests/cases/tests_info_event.py
new file mode 100644
index 0000000..3ca42ed
--- /dev/null
+++ b/bindings/python/tests/cases/tests_info_event.py
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import datetime
+import gpiod
+import gpiosim
+import threading
+import time
+import unittest
+
+from functools import partial
+
+Direction = gpiod.Line.Direction
+EventType = gpiod.InfoEvent.Type
+
+
+class InfoEventConstructor(unittest.TestCase):
+    def test_info_event_cannot_be_instantiated(self):
+        with self.assertRaises(TypeError):
+            info = gpiod.InfoEvent()
+
+
+def request_reconfigure_release_line(chip, offset):
+    time.sleep(0.1)
+    with chip.request_lines(
+        gpiod.RequestConfig(offsets=[offset]), gpiod.LineConfig()
+    ) as request:
+        time.sleep(0.1)
+        request.reconfigure_lines(gpiod.LineConfig(direction=Direction.OUTPUT))
+        time.sleep(0.1)
+
+
+class WatchingInfoEventWorks(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.thread = None
+
+    def tearDown(self):
+        if self.thread:
+            self.thread.join()
+            self.thread = None
+
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_watch_line_info_returns_line_info(self):
+        info = self.chip.watch_line_info(7)
+        self.assertEqual(info.offset, 7)
+
+    def test_watch_line_info_offset_out_of_range(self):
+        with self.assertRaises(ValueError):
+            self.chip.watch_line_info(8)
+
+    def test_wait_for_event_timeout(self):
+        info = self.chip.watch_line_info(7)
+        self.assertFalse(
+            self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
+        )
+
+    def test_request_reconfigure_release_events(self):
+        info = self.chip.watch_line_info(7)
+        self.assertEqual(info.direction, Direction.INPUT)
+
+        self.thread = threading.Thread(
+            target=partial(request_reconfigure_release_line, self.chip, 7)
+        )
+        self.thread.start()
+
+        self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
+        event = self.chip.read_info_event()
+        self.assertEqual(event.type, EventType.LINE_REQUESTED)
+        self.assertEqual(event.line_info.offset, 7)
+        self.assertEqual(event.line_info.direction, Direction.INPUT)
+        ts_req = event.timestamp_ns
+
+        self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
+        event = self.chip.read_info_event()
+        self.assertEqual(event.type, EventType.LINE_CONFIG_CHANGED)
+        self.assertEqual(event.line_info.offset, 7)
+        self.assertEqual(event.line_info.direction, Direction.OUTPUT)
+        ts_rec = event.timestamp_ns
+
+        self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
+        event = self.chip.read_info_event()
+        self.assertEqual(event.type, EventType.LINE_RELEASED)
+        self.assertEqual(event.line_info.offset, 7)
+        self.assertEqual(event.line_info.direction, Direction.OUTPUT)
+        ts_rel = event.timestamp_ns
+
+        # No more events.
+        self.assertFalse(
+            self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
+        )
+
+        # Check timestamps are really monotonic.
+        self.assertGreater(ts_rel, ts_rec)
+        self.assertGreater(ts_rec, ts_req)
+
+
+class UnwatchingLineInfo(unittest.TestCase):
+    def test_unwatch_line_info(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            chip.watch_line_info(0)
+            with chip.request_lines(
+                gpiod.RequestConfig(offsets=[0]), gpiod.LineConfig()
+            ) as request:
+                self.assertTrue(chip.wait_info_event(datetime.timedelta(seconds=1)))
+                event = chip.read_info_event()
+                self.assertEqual(event.type, EventType.LINE_REQUESTED)
+                chip.unwatch_line_info(0)
+
+            self.assertFalse(
+                chip.wait_info_event(datetime.timedelta(microseconds=10000))
+            )
+
+
+class InfoEventStringRepresentation(unittest.TestCase):
+    def test_info_event_str(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            chip.watch_line_info(0)
+            with chip.request_lines(
+                gpiod.RequestConfig(offsets=[0]), gpiod.LineConfig()
+            ) as request:
+                self.assertTrue(chip.wait_info_event(datetime.timedelta(seconds=1)))
+                event = chip.read_info_event()
+                self.assertRegex(
+                    str(event),
+                    '<gpiod\.InfoEvent type=Type\.LINE_REQUESTED timestamp_ns=[0-9]+ line_info=<gpiod\.LineInfo offset=0 name="None" used=True consumer="\?" direction=Direction\.INPUT active_low=False bias=Bias\.UNKNOWN drive=Drive\.PUSH_PULL edge_detection=Edge\.NONE event_clock=Clock\.MONOTONIC debounced=False debounce_period=0:00:00>>',
+                )
diff --git a/bindings/python/tests/cases/tests_line_config.py b/bindings/python/tests/cases/tests_line_config.py
new file mode 100644
index 0000000..ee11a8c
--- /dev/null
+++ b/bindings/python/tests/cases/tests_line_config.py
@@ -0,0 +1,254 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import datetime
+import gpiod
+import unittest
+
+
+Property = gpiod.LineConfig.Property
+Direction = gpiod.Line.Direction
+Edge = gpiod.Line.Edge
+Bias = gpiod.Line.Bias
+Drive = gpiod.Line.Drive
+Clock = gpiod.Line.Clock
+Value = gpiod.Line.Value
+
+
+class LineConfigConstructor(unittest.TestCase):
+    def test_no_arguments(self):
+        cfg = gpiod.LineConfig()
+
+        self.assertEqual(
+            cfg.get_props_default(
+                [
+                    Property.DIRECTION,
+                    Property.EDGE_DETECTION,
+                    Property.BIAS,
+                    Property.DRIVE,
+                    Property.ACTIVE_LOW,
+                    Property.DEBOUNCE_PERIOD,
+                    Property.EVENT_CLOCK,
+                    Property.OUTPUT_VALUE,
+                ]
+            ),
+            [
+                Direction.AS_IS,
+                Edge.NONE,
+                Bias.AS_IS,
+                Drive.PUSH_PULL,
+                False,
+                datetime.timedelta(0),
+                Clock.MONOTONIC,
+                Value.INACTIVE,
+            ],
+        )
+
+    def test_default_arguments(self):
+        cfg = gpiod.LineConfig(
+            direction=Direction.OUTPUT,
+            edge_detection=Edge.FALLING,
+            bias=Bias.PULL_DOWN,
+            drive=Drive.OPEN_SOURCE,
+            active_low=True,
+            debounce_period=datetime.timedelta(microseconds=3000),
+            event_clock=Clock.REALTIME,
+            output_value=Value.ACTIVE,
+        )
+
+        self.assertEqual(
+            cfg.get_props_default(
+                [
+                    Property.DIRECTION,
+                    Property.EDGE_DETECTION,
+                    Property.BIAS,
+                    Property.DRIVE,
+                    Property.ACTIVE_LOW,
+                    Property.DEBOUNCE_PERIOD,
+                    Property.EVENT_CLOCK,
+                    Property.OUTPUT_VALUE,
+                ]
+            ),
+            [
+                Direction.OUTPUT,
+                Edge.FALLING,
+                Bias.PULL_DOWN,
+                Drive.OPEN_SOURCE,
+                True,
+                datetime.timedelta(microseconds=3000),
+                Clock.REALTIME,
+                Value.ACTIVE,
+            ],
+        )
+
+    def test_output_value_overrides_from_constructor(self):
+        cfg = gpiod.LineConfig(
+            output_values={0: Value.ACTIVE, 3: Value.INACTIVE, 1: Value.ACTIVE}
+        )
+
+        self.assertEqual(cfg.get_props_offset(0, Property.OUTPUT_VALUE), Value.ACTIVE)
+        self.assertEqual(cfg.get_props_offset(1, Property.OUTPUT_VALUE), Value.ACTIVE)
+        self.assertEqual(cfg.get_props_offset(2, Property.OUTPUT_VALUE), Value.INACTIVE)
+        self.assertEqual(cfg.get_props_offset(3, Property.OUTPUT_VALUE), Value.INACTIVE)
+
+
+class LineConfigOverrides(unittest.TestCase):
+    def setUp(self):
+        self.cfg = gpiod.LineConfig()
+
+    def tearDown(self):
+        self.cfg = None
+
+    def test_direction_override(self):
+        self.cfg.set_props_default(direction=Direction.AS_IS)
+        self.cfg.set_props_override(3, direction=Direction.INPUT)
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.DIRECTION))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.DIRECTION), Direction.INPUT
+        )
+        self.cfg.clear_prop_override(3, Property.DIRECTION)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.DIRECTION))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.DIRECTION), Direction.AS_IS
+        )
+
+    def test_edge_detection_override(self):
+        self.cfg.set_props_default(edge_detection=Edge.NONE)
+        self.cfg.set_props_override(3, edge_detection=Edge.BOTH)
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.EDGE_DETECTION))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.EDGE_DETECTION), Edge.BOTH
+        )
+        self.cfg.clear_prop_override(3, Property.EDGE_DETECTION)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.EDGE_DETECTION))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.EDGE_DETECTION), Edge.NONE
+        )
+
+    def test_bias_override(self):
+        self.cfg.set_props_default(bias=Bias.AS_IS)
+        self.cfg.set_props_override(3, bias=Bias.PULL_DOWN)
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.BIAS))
+        self.assertEqual(self.cfg.get_props_offset(3, Property.BIAS), Bias.PULL_DOWN)
+        self.cfg.clear_prop_override(3, Property.BIAS)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.BIAS))
+        self.assertEqual(self.cfg.get_props_offset(3, Property.BIAS), Bias.AS_IS)
+
+    def test_drive_override(self):
+        self.cfg.set_props_default(drive=Drive.PUSH_PULL)
+        self.cfg.set_props_override(3, drive=Drive.OPEN_DRAIN)
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.DRIVE))
+        self.assertEqual(self.cfg.get_props_offset(3, Property.DRIVE), Drive.OPEN_DRAIN)
+        self.cfg.clear_prop_override(3, Property.DRIVE)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.BIAS))
+        self.assertEqual(self.cfg.get_props_offset(3, Property.DRIVE), Drive.PUSH_PULL)
+
+    def test_active_low_override(self):
+        self.cfg.set_props_default(active_low=False)
+        self.cfg.set_props_override(3, active_low=True)
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.ACTIVE_LOW))
+        self.assertEqual(self.cfg.get_props_offset(3, Property.ACTIVE_LOW), True)
+        self.cfg.clear_prop_override(3, Property.ACTIVE_LOW)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.ACTIVE_LOW))
+        self.assertEqual(self.cfg.get_props_offset(3, Property.ACTIVE_LOW), False)
+
+    def test_debounce_period_override(self):
+        self.cfg.set_props_default(debounce_period=datetime.timedelta())
+        self.cfg.set_props_override(
+            3, debounce_period=datetime.timedelta(microseconds=5000)
+        )
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.DEBOUNCE_PERIOD))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.DEBOUNCE_PERIOD),
+            datetime.timedelta(microseconds=5000),
+        )
+        self.cfg.clear_prop_override(3, Property.DEBOUNCE_PERIOD)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.DEBOUNCE_PERIOD))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.DEBOUNCE_PERIOD), datetime.timedelta()
+        )
+
+    def test_event_clock_override(self):
+        self.cfg.set_props_default(event_clock=Clock.MONOTONIC)
+        self.cfg.set_props_override(3, event_clock=Clock.REALTIME)
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.EVENT_CLOCK))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.EVENT_CLOCK), Clock.REALTIME
+        )
+        self.cfg.clear_prop_override(3, Property.EVENT_CLOCK)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.EVENT_CLOCK))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.EVENT_CLOCK), Clock.MONOTONIC
+        )
+
+    def test_output_value_override(self):
+        self.cfg.set_props_default(output_value=Value.INACTIVE)
+        self.cfg.set_props_override(3, output_value=Value.ACTIVE)
+
+        self.assertTrue(self.cfg.prop_is_overridden(3, Property.OUTPUT_VALUE))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.OUTPUT_VALUE), Value.ACTIVE
+        )
+        self.cfg.clear_prop_override(3, Property.OUTPUT_VALUE)
+        self.assertFalse(self.cfg.prop_is_overridden(3, Property.OUTPUT_VALUE))
+        self.assertEqual(
+            self.cfg.get_props_offset(3, Property.OUTPUT_VALUE), Value.INACTIVE
+        )
+
+
+class LineConfigArgumentBehavior(unittest.TestCase):
+    def setUp(self):
+        self.cfg = gpiod.LineConfig()
+
+    def tearDown(self):
+        self.cfg = None
+
+    def test_set_defaults_no_props(self):
+        self.cfg.set_props_default()
+
+    def test_set_override_no_props_no_offset(self):
+        with self.assertRaises(TypeError):
+            self.cfg.set_props_override()
+
+    def test_set_override_no_props(self):
+        self.cfg.set_props_override(4)
+
+
+class LineConfigStringRepresentation(unittest.TestCase):
+    def setUp(self):
+        self.cfg = gpiod.LineConfig(
+            direction=Direction.OUTPUT,
+            edge_detection=Edge.FALLING,
+            bias=Bias.PULL_DOWN,
+            drive=Drive.OPEN_SOURCE,
+            active_low=True,
+            debounce_period=datetime.timedelta(microseconds=3000),
+            event_clock=Clock.REALTIME,
+            output_value=Value.ACTIVE,
+        )
+
+    def tearDown(self):
+        self.cfg = None
+
+    def test_line_config_str_defaults_only(self):
+        self.assertEqual(
+            str(self.cfg),
+            "<gpiod.LineConfig direction=Direction.OUTPUT edge_detection=Edge.FALLING bias=Bias.PULL_DOWN drive=Drive.OPEN_SOURCE active_low=True debounce_period=0:00:00.003000 event_clock=Clock.REALTIME output_value=Value.ACTIVE>",
+        )
+
+    def test_line_config_str_with_overrides(self):
+        self.cfg.set_props_override(3, direction=Direction.INPUT, bias=Bias.PULL_UP)
+        self.cfg.set_props_override(5, edge_detection=Edge.RISING)
+        self.cfg.set_props_override(1, active_low=True)
+
+        self.assertEqual(
+            str(self.cfg),
+            "<gpiod.LineConfig direction=Direction.OUTPUT edge_detection=Edge.FALLING bias=Bias.PULL_DOWN drive=Drive.OPEN_SOURCE active_low=True debounce_period=0:00:00.003000 event_clock=Clock.REALTIME output_value=Value.ACTIVE overrides={3: direction=Direction.INPUT, 3: bias=Bias.PULL_UP, 5: edge_detection=Edge.RISING, 1: active_low=True}>",
+        )
diff --git a/bindings/python/tests/cases/tests_line_info.py b/bindings/python/tests/cases/tests_line_info.py
new file mode 100644
index 0000000..696d9ee
--- /dev/null
+++ b/bindings/python/tests/cases/tests_line_info.py
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import errno
+import gpiod
+import gpiosim
+import unittest
+
+HogDir = gpiosim.Chip.HogDirection
+Direction = gpiod.Line.Direction
+Bias = gpiod.Line.Bias
+Drive = gpiod.Line.Drive
+Clock = gpiod.Line.Clock
+
+
+class LineInfoConstructor(unittest.TestCase):
+    def test_line_info_cannot_be_instantiated(self):
+        with self.assertRaises(TypeError):
+            info = gpiod.LineInfo()
+
+
+class GetLineInfo(unittest.TestCase):
+    def test_line_info_can_be_retrieved_from_chip(self):
+        sim = gpiosim.Chip(
+            num_lines=4,
+            line_names={0: "foobar"},
+            hogs={0: ("foobar", HogDir.OUTPUT_HIGH)},
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            info = chip.get_line_info(0)
+
+    def test_offset_out_of_range(self):
+        sim = gpiosim.Chip(num_lines=4)
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            with self.assertRaises(ValueError) as ex:
+                info = chip.get_line_info(4)
+
+
+class LinePropertiesCanBeRead(unittest.TestCase):
+    def test_basic_properties(self):
+        sim = gpiosim.Chip(
+            num_lines=8,
+            line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"},
+            hogs={3: ("hog3", HogDir.OUTPUT_HIGH), 4: ("hog4", HogDir.OUTPUT_LOW)},
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            info4 = chip.get_line_info(4)
+            info6 = chip.get_line_info(6)
+
+            self.assertEqual(info4.offset, 4)
+            self.assertEqual(info4.name, "baz")
+            self.assertTrue(info4.used)
+            self.assertEqual(info4.consumer, "hog4")
+            self.assertEqual(info4.direction, Direction.OUTPUT)
+            self.assertFalse(info4.active_low)
+            self.assertEqual(info4.bias, Bias.UNKNOWN)
+            self.assertEqual(info4.drive, Drive.PUSH_PULL)
+            self.assertEqual(info4.event_clock, Clock.MONOTONIC)
+            self.assertFalse(info4.debounced)
+            self.assertEqual(info4.debounce_period.total_seconds(), 0.0)
+
+            self.assertEqual(info6.offset, 6)
+            self.assertEqual(info6.name, None)
+            self.assertFalse(info6.used)
+            self.assertEqual(info6.consumer, None)
+            self.assertEqual(info6.direction, Direction.INPUT)
+            self.assertFalse(info6.active_low)
+            self.assertEqual(info6.bias, Bias.UNKNOWN)
+            self.assertEqual(info6.drive, Drive.PUSH_PULL)
+            self.assertEqual(info6.event_clock, Clock.MONOTONIC)
+            self.assertFalse(info6.debounced)
+            self.assertEqual(info6.debounce_period.total_seconds(), 0.0)
+
+
+class LineInfoStringRepresentation(unittest.TestCase):
+    def test_line_info_str(self):
+        sim = gpiosim.Chip(
+            line_names={0: "foo"}, hogs={0: ("hogger", HogDir.OUTPUT_HIGH)}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            info = chip.get_line_info(0)
+
+            self.assertEqual(
+                str(info),
+                '<gpiod.LineInfo offset=0 name="foo" used=True consumer="hogger" direction=Direction.OUTPUT active_low=False bias=Bias.UNKNOWN drive=Drive.PUSH_PULL edge_detection=Edge.NONE event_clock=Clock.MONOTONIC debounced=False debounce_period=0:00:00>',
+            )
diff --git a/bindings/python/tests/cases/tests_line_request.py b/bindings/python/tests/cases/tests_line_request.py
new file mode 100644
index 0000000..b92d6da
--- /dev/null
+++ b/bindings/python/tests/cases/tests_line_request.py
@@ -0,0 +1,345 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import errno
+import gpiod
+import gpiosim
+import unittest
+
+
+Direction = gpiod.Line.Direction
+Edge = gpiod.Line.Edge
+Bias = gpiod.Line.Bias
+Value = gpiod.Line.Value
+SimVal = gpiosim.Chip.Value
+Pull = gpiosim.Chip.Pull
+
+
+class LineRequestConstructor(unittest.TestCase):
+    def test_line_request_cannot_be_instantiated(self):
+        with self.assertRaises(TypeError):
+            info = gpiod.LineRequest()
+
+
+class ChipLineRequestWorks(unittest.TestCase):
+    def test_chip_line_request(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            with chip.request_lines(
+                gpiod.RequestConfig(offsets=[0]), gpiod.LineConfig()
+            ) as req:
+                pass
+
+
+class ModuleLineRequestWorks(unittest.TestCase):
+    def test_module_line_request(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.request_lines(
+            sim.dev_path, gpiod.RequestConfig(offsets=[0]), gpiod.LineConfig()
+        ) as req:
+            pass
+
+    def test_module_line_request_lines_arg(self):
+        sim = gpiosim.Chip(num_lines=16, line_names={0: "foo", 2: "bar", 5: "xyz"})
+
+        with gpiod.request_lines(sim.dev_path, lines=["foo", "bar", "xyz"]) as req:
+            self.assertEqual(req.offsets, [0, 2, 5])
+
+        with gpiod.request_lines(sim.dev_path, lines=["foo", 9, "xyz", 12]) as req:
+            self.assertEqual(req.offsets, [0, 9, 5, 12])
+
+    def test_module_line_request_direction(self):
+        sim = gpiosim.Chip(num_lines=2)
+
+        with gpiod.request_lines(
+            sim.dev_path, lines=[0, 1], direction=Direction.OUTPUT
+        ) as req:
+            with gpiod.Chip(sim.dev_path) as chip:
+                info = chip.get_line_info(0)
+                self.assertEqual(info.direction, Direction.OUTPUT)
+                self.assertTrue(info.used)
+
+    def test_module_line_request_edge_detection(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.request_lines(
+            sim.dev_path, lines=[0], edge_detection=Edge.BOTH
+        ) as req:
+            sim.set_pull(0, Pull.PULL_UP)
+            self.assertTrue(req.wait_edge_event())
+            self.assertEqual(req.read_edge_event()[0].line_offset, 0)
+
+
+class RequestingLinesFailsWithInvalidArguments(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_passing_invalid_types_as_configs(self):
+        with self.assertRaises(TypeError):
+            self.chip.request_lines("foobar", gpiod.LineConfig())
+
+        with self.assertRaises(TypeError):
+            self.chip.request_lines(gpiod.RequestConfig(offsets=[0]), "foobar")
+
+    def test_no_offsets(self):
+        with self.assertRaises(ValueError):
+            self.chip.request_lines(gpiod.RequestConfig(), gpiod.LineConfig())
+
+    def test_duplicate_offsets(self):
+        with self.assertRaises(OSError) as ex:
+            self.chip.request_lines(
+                gpiod.RequestConfig(offsets=[2, 5, 1, 7, 5]), gpiod.LineConfig()
+            )
+
+        self.assertEqual(ex.exception.errno, errno.EBUSY)
+
+    def test_offset_out_of_range(self):
+        with self.assertRaises(ValueError):
+            self.chip.request_lines(
+                gpiod.RequestConfig(offsets=[1, 0, 4, 8]), gpiod.LineConfig()
+            )
+
+
+class LineRequestPropertiesWork(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=16)
+
+    def tearDown(self):
+        self.sim = None
+
+    def test_property_fd(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[0]),
+            gpiod.LineConfig(direction=Direction.INPUT, edge_detection=Edge.BOTH),
+        ) as req:
+            self.assertGreaterEqual(req.fd, 0)
+
+    def test_property_num_lines(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[0, 2, 3, 5, 6, 8, 12]),
+            gpiod.LineConfig(),
+        ) as req:
+            self.assertEqual(req.num_lines, 7)
+
+    def test_property_offsets(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[1, 6, 12, 4]),
+            gpiod.LineConfig(),
+        ) as req:
+            self.assertEqual(req.offsets, [1, 6, 12, 4])
+
+
+class LineRequestConsumerString(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_custom_consumer(self):
+        with self.chip.request_lines(
+            gpiod.RequestConfig(offsets=[2, 3], consumer="foobar"), gpiod.LineConfig()
+        ) as request:
+            info = self.chip.get_line_info(2)
+            self.assertEqual(info.consumer, "foobar")
+
+    def test_empty_consumer(self):
+        with self.chip.request_lines(
+            gpiod.RequestConfig(offsets=[2, 3], consumer=""), gpiod.LineConfig()
+        ) as request:
+            info = self.chip.get_line_info(2)
+            self.assertEqual(info.consumer, "?")
+
+        with self.chip.request_lines(
+            gpiod.RequestConfig(offsets=[2, 3]), gpiod.LineConfig()
+        ) as request:
+            info = self.chip.get_line_info(2)
+            self.assertEqual(info.consumer, "?")
+
+
+class ReleasedLineRequestCannotBeUsed(unittest.TestCase):
+    def test_using_released_line_request(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            req = chip.request_lines(
+                gpiod.RequestConfig(offsets=[0]), gpiod.LineConfig()
+            )
+            req.release()
+
+            with self.assertRaises(gpiod.RequestReleasedError):
+                req.fd
+
+
+class LineRequestReadingValues(unittest.TestCase):
+
+    OFFSETS = [7, 1, 0, 6, 2]
+    PULLS = [Pull.PULL_UP, Pull.PULL_UP, Pull.PULL_DOWN, Pull.PULL_UP, Pull.PULL_DOWN]
+
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+
+        for i in range(5):
+            self.sim.set_pull(self.OFFSETS[i], self.PULLS[i])
+
+        self.request = gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=self.OFFSETS),
+            gpiod.LineConfig(),
+        )
+
+    def tearDown(self):
+        self.request.release()
+        self.request = None
+        self.sim = None
+
+    def test_get_all_values(self):
+        self.assertEqual(
+            self.request.get_values(),
+            [Value.ACTIVE, Value.ACTIVE, Value.INACTIVE, Value.ACTIVE, Value.INACTIVE],
+        )
+
+    def test_get_single_value(self):
+        self.assertEqual(self.request.get_values(6), Value.ACTIVE)
+        self.assertEqual(self.request.get_value(6), Value.ACTIVE)
+
+    def test_get_single_value_active_low(self):
+        self.request.reconfigure_lines(gpiod.LineConfig(active_low=True))
+        self.assertEqual(self.request.get_values(6), Value.INACTIVE)
+
+    def test_get_subset_of_values(self):
+        self.assertEqual(
+            self.request.get_values([7, 0, 2]),
+            [Value.ACTIVE, Value.INACTIVE, Value.INACTIVE],
+        )
+
+
+class LineRequestSetValuesAtRequestTime(unittest.TestCase):
+
+    OFFSETS = [0, 1, 3, 4]
+
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.req_cfg = gpiod.RequestConfig(offsets=self.OFFSETS)
+        self.line_cfg = gpiod.LineConfig(
+            direction=Direction.OUTPUT, output_value=Value.ACTIVE
+        )
+
+    def tearDown(self):
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_default_output_value(self):
+        with self.chip.request_lines(self.req_cfg, self.line_cfg) as request:
+            self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(2), SimVal.INACTIVE)
+            self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(4), SimVal.ACTIVE)
+
+    def test_overridden_output_value(self):
+        self.line_cfg.set_props_override(1, output_value=Value.INACTIVE)
+
+        with self.chip.request_lines(self.req_cfg, self.line_cfg) as request:
+            self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+            self.assertEqual(self.sim.get_value(2), SimVal.INACTIVE)
+            self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(4), SimVal.ACTIVE)
+
+
+class LineRequestSetValuesAfterRequesting(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.request = gpiod.request_lines(
+            self.sim.dev_path,
+            gpiod.RequestConfig(offsets=[0, 1, 3, 4]),
+            gpiod.LineConfig(direction=Direction.OUTPUT, output_value=Value.INACTIVE),
+        )
+
+    def tearDown(self):
+        self.request.release()
+        self.request = None
+        self.sim = None
+
+    def test_set_single_line(self):
+        self.request.set_value(1, Value.ACTIVE)
+
+        self.assertEqual(self.sim.get_value(0), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
+        self.assertEqual(self.sim.get_value(3), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(4), SimVal.INACTIVE)
+
+    def test_set_subset_of_lines(self):
+        self.request.set_values({0: Value.ACTIVE, 3: Value.ACTIVE, 4: Value.ACTIVE})
+
+        self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
+        self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
+        self.assertEqual(self.sim.get_value(4), SimVal.ACTIVE)
+
+    def test_set_all_lines(self):
+        self.request.set_values(
+            [Value.ACTIVE, Value.INACTIVE, Value.INACTIVE, Value.ACTIVE]
+        )
+
+        self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
+        self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(3), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(4), SimVal.ACTIVE)
+
+
+class LineRequestStringRepresentation(unittest.TestCase):
+    def test_str(self):
+        sim = gpiosim.Chip(num_lines=8)
+
+        with gpiod.request_lines(
+            sim.dev_path, gpiod.RequestConfig(offsets=[3, 5, 1, 7]), gpiod.LineConfig()
+        ) as req:
+            self.assertRegex(
+                str(req),
+                "<gpiod.LineRequest num_lines=4 offsets=\[3, 5, 1, 7\] fd=[0-9]+>",
+            )
+
+    def test_str_released(self):
+        sim = gpiosim.Chip(num_lines=8)
+        request = gpiod.request_lines(
+            sim.dev_path, gpiod.RequestConfig(offsets=[3, 5, 1, 7]), gpiod.LineConfig()
+        )
+        request.release()
+        self.assertEqual(str(request), "<gpiod.LineRequest RELEASED>")
+
+
+class LineRequestArgumentValidation(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_release_takes_no_arguments(self):
+        req = self.chip.request_lines(
+            gpiod.RequestConfig(offsets=[0, 2]), gpiod.LineConfig()
+        )
+
+        with self.assertRaises(TypeError):
+            req.release(3, "foobar")
diff --git a/bindings/python/tests/cases/tests_misc.py b/bindings/python/tests/cases/tests_misc.py
new file mode 100644
index 0000000..910829a
--- /dev/null
+++ b/bindings/python/tests/cases/tests_misc.py
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+import gpiosim
+import os
+import re
+import unittest
+
+
+class LinkGuard:
+    def __init__(self, src, dst):
+        self.src = src
+        self.dst = dst
+
+    def __enter__(self):
+        os.symlink(self.src, self.dst)
+
+    def __exit__(self, type, val, tb):
+        os.unlink(self.dst)
+
+
+class IsGPIOChip(unittest.TestCase):
+    def test_is_gpiochip_bad(self):
+        self.assertFalse(gpiod.is_gpiochip_device("/dev/null"))
+        self.assertFalse(gpiod.is_gpiochip_device("/dev/nonexistent"))
+
+    def test_is_gpiochip_good(self):
+        sim = gpiosim.Chip()
+
+        self.assertTrue(gpiod.is_gpiochip_device(sim.dev_path))
+
+    def test_is_gpiochip_link_good(self):
+        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        sim = gpiosim.Chip()
+
+        with LinkGuard(sim.dev_path, link):
+            self.assertTrue(gpiod.is_gpiochip_device(link))
+
+    def test_is_gpiochip_link_bad(self):
+        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+
+        with LinkGuard("/dev/null", link):
+            self.assertFalse(gpiod.is_gpiochip_device(link))
+
+
+class VersionString(unittest.TestCase):
+    def test_version_string(self):
+        self.assertTrue(
+            re.match(
+                "^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$", gpiod.__version__
+            )
+        )
diff --git a/bindings/python/tests/cases/tests_request_config.py b/bindings/python/tests/cases/tests_request_config.py
new file mode 100644
index 0000000..a83b0eb
--- /dev/null
+++ b/bindings/python/tests/cases/tests_request_config.py
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+import unittest
+
+
+class RequestConfigConstructor(unittest.TestCase):
+    def test_no_arguments(self):
+        cfg = gpiod.RequestConfig()
+        self.assertEqual(cfg.consumer, None)
+        self.assertEqual(cfg.offsets, None)
+        self.assertEqual(cfg.event_buffer_size, 0)
+
+    def test_set_default_settings_in_constructor(self):
+        cfg = gpiod.RequestConfig(
+            consumer="foobar", offsets=[0, 1, 2, 3], event_buffer_size=1024
+        )
+        self.assertEqual(cfg.consumer, "foobar")
+        self.assertEqual(cfg.offsets, [0, 1, 2, 3])
+        self.assertEqual(cfg.event_buffer_size, 1024)
+
+    def test_invalid_types_passed_to_constructor(self):
+        with self.assertRaises(TypeError):
+            gpiod.RequestConfig(consumer=42)
+
+        with self.assertRaises(TypeError):
+            gpiod.RequestConfig(offsets="foobar")
+
+        with self.assertRaises(TypeError):
+            gpiod.RequestConfig(event_buffer_size=(0, 1, 2))
+
+
+class RequestConfigPropertiesGetSet(unittest.TestCase):
+    def setUp(self):
+        self.cfg = gpiod.RequestConfig()
+
+    def tearDown(self):
+        self.cfg = None
+
+    def test_set_consumer(self):
+        self.cfg.consumer = "foobar"
+        self.assertEqual(self.cfg.consumer, "foobar")
+
+    def test_set_offsets(self):
+        self.cfg.offsets = [0, 3, 5, 7]
+        self.assertEqual(self.cfg.offsets, [0, 3, 5, 7])
+
+    def test_set_offsets_tuple(self):
+        self.cfg.offsets = (4, 5, 7, 8)
+        self.assertEqual(self.cfg.offsets, [4, 5, 7, 8])
+
+    def test_set_event_buffer_size(self):
+        self.cfg.event_buffer_size = 2048
+        self.assertEqual(self.cfg.event_buffer_size, 2048)
+
+
+class RequestConfigStringRepresentation(unittest.TestCase):
+    def setUp(self):
+        self.cfg = gpiod.RequestConfig(
+            consumer="foobar", offsets=[0, 1, 2, 3], event_buffer_size=1024
+        )
+
+    def tearDown(self):
+        self.cfg = None
+
+    def test_repr(self):
+        self.assertEqual(
+            repr(self.cfg),
+            'gpiod.RequestConfig(consumer="foobar", offsets=[0, 1, 2, 3], event_buffer_size=1024)',
+        )
+
+    def test_str(self):
+        self.assertEqual(
+            str(self.cfg),
+            '<gpiod.RequestConfig consumer="foobar" offsets=[0, 1, 2, 3] event_buffer_size=1024>',
+        )
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
new file mode 100755
index 0000000..6a49461
--- /dev/null
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -0,0 +1,25 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import os
+import unittest
+
+from cases import *
+from packaging import version
+
+
+def check_kernel(major, minor, release):
+    current = os.uname().release.split("-")[0]
+    required = "{}.{}.{}".format(major, minor, release)
+    if version.parse(current) < version.parse(required):
+        raise NotImplementedError(
+            "linux kernel version must be at least {} - got {}".format(
+                required, current
+            )
+        )
+
+
+if __name__ == "__main__":
+    check_kernel(5, 17, 4)
+    unittest.main()
diff --git a/bindings/python/tests/gpiosimmodule.c b/bindings/python/tests/gpiosimmodule.c
new file mode 100644
index 0000000..d696dc6
--- /dev/null
+++ b/bindings/python/tests/gpiosimmodule.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <gpiosim.h>
+#include <Python.h>
+#include <stdio.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "../enum/enum.h"
+
+typedef struct {
+	PyObject_HEAD
+	struct gpiosim_dev *dev;
+	struct gpiosim_bank *bank;
+} chip_object;
+
+struct module_state {
+	struct gpiosim_ctx *sim_ctx;
+};
+
+static void free_module_state(void *mod)
+{
+	struct module_state *state = PyModule_GetState((PyObject *)mod);
+
+	if (state->sim_ctx)
+		gpiosim_ctx_unref(state->sim_ctx);
+}
+
+static PyModuleDef module_def = {
+	PyModuleDef_HEAD_INIT,
+	.m_name = "gpiosim",
+	.m_size = sizeof(struct module_state),
+	.m_free = free_module_state,
+};
+
+static const PyCEnum_EnumVal pull_enum_vals[] = {
+	{
+		.name = "PULL_UP",
+		.value = GPIOSIM_PULL_UP,
+	},
+	{
+		.name = "PULL_DOWN",
+		.value = GPIOSIM_PULL_DOWN,
+	},
+	{ }
+};
+
+static const PyCEnum_EnumVal hog_direction_enum_vals[] = {
+	{
+		.name = "INPUT",
+		.value = GPIOSIM_HOG_DIR_INPUT,
+	},
+	{
+		.name = "OUTPUT_HIGH",
+		.value = GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+	},
+	{
+		.name = "OUTPUT_LOW",
+		.value = GPIOSIM_HOG_DIR_OUTPUT_LOW,
+	},
+	{ }
+};
+
+static const PyCEnum_EnumVal value_enum_vals[] = {
+	{
+		.name = "ACTIVE",
+		.value = GPIOSIM_VALUE_ACTIVE,
+	},
+	{
+		.name = "INACTIVE",
+		.value = GPIOSIM_VALUE_INACTIVE,
+	},
+	{ }
+};
+
+static const PyCEnum_EnumDef chip_enums[] = {
+	{
+		.name = "Pull",
+		.values = pull_enum_vals,
+	},
+	{
+		.name = "HogDirection",
+		.values = hog_direction_enum_vals,
+	},
+	{
+		.name = "Value",
+		.values = value_enum_vals,
+	},
+	{ }
+};
+
+static int chip_set_line_names(chip_object *self, PyObject *names)
+{
+	PyObject *key, *value;
+	unsigned int offset;
+	Py_ssize_t pos = 0;
+	const char *name;
+	int ret;
+
+	while (PyDict_Next(names, &pos, &key, &value)) {
+		if (PyErr_Occurred())
+			return -1;
+
+		offset = PyLong_AsUnsignedLong(key);
+		if (PyErr_Occurred())
+			return -1;
+
+		name = PyUnicode_AsUTF8(value);
+		if (!name)
+			return -1;
+
+		ret = gpiosim_bank_set_line_name(self->bank, offset, name);
+		if (ret)
+			return -1;
+	}
+
+	return 0;
+}
+
+static int map_hog_direction(PyObject *val)
+{
+	PyObject *mod, *dict, *type;
+
+	mod = PyState_FindModule(&module_def);
+	if (!mod)
+		return -1;
+
+	dict = PyModule_GetDict(mod);
+	if (!dict)
+		return -1;
+
+	type = PyDict_GetItemString(dict, "Chip");
+	if (!type)
+		return -1;
+
+	return PyCEnum_MapPyToC(type, "HogDirection", val);
+}
+
+static int chip_set_hogs(chip_object *self, PyObject *hogs)
+{
+	PyObject *key, *value, *name_obj, *dir_obj;
+	unsigned int offset;
+	Py_ssize_t pos = 0;
+	const char *name;
+	int ret, dir;
+
+	while (PyDict_Next(hogs, &pos, &key, &value)) {
+		if (PyErr_Occurred())
+			return -1;
+
+		offset = PyLong_AsUnsignedLong(key);
+		if (PyErr_Occurred())
+			return -1;
+
+		if (PyTuple_Size(value) != 2) {
+			PyErr_SetString(PyExc_ValueError,
+					"hog tuple must be of the form: (name, direction)");
+			return -1;
+		}
+
+		name_obj = PyTuple_GetItem(value, 0);
+		if (!name_obj)
+			return -1;
+
+		dir_obj = PyTuple_GetItem(value, 1);
+		if (!dir_obj)
+			return -1;
+
+		name = PyUnicode_AsUTF8(name_obj);
+		if (!name)
+			return -1;
+
+		dir = map_hog_direction(dir_obj);
+		if (dir < 0)
+			return -1;
+
+		ret = gpiosim_bank_hog_line(self->bank, offset, name, dir);
+		if (ret)
+			return -1;
+	}
+
+	return 0;
+}
+
+static int chip_parse_init_args(chip_object *self,
+				PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"label",
+		"num_lines",
+		"line_names",
+		"hogs",
+		NULL
+	};
+
+	PyObject *line_names = NULL, *hogs = NULL;
+	size_t num_lines = 1;
+	char *label = NULL;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|$sIOO", kwlist,
+					  &label, &num_lines,
+					  &line_names, &hogs);
+	if (!ret)
+		return -1;
+
+	if (label) {
+		ret = gpiosim_bank_set_label(self->bank, label);
+		if (ret) {
+			PyErr_SetFromErrno(PyExc_OSError);
+			return -1;
+		}
+	}
+
+	if (num_lines > 1) {
+		ret = gpiosim_bank_set_num_lines(self->bank, num_lines);
+		if (ret) {
+			PyErr_SetFromErrno(PyExc_OSError);
+			return -1;
+		}
+	}
+
+	if (line_names) {
+		ret = chip_set_line_names(self, line_names);
+		if (ret)
+			return -1;
+	}
+
+	if (hogs) {
+		ret = chip_set_hogs(self, hogs);
+		if (ret)
+			return -1;
+	}
+
+	return 0;
+}
+
+static int chip_init(chip_object *self, PyObject *args, PyObject *kwargs)
+{
+	struct module_state *state;
+	PyObject *mod;
+	int ret;
+
+	mod = PyState_FindModule(&module_def);
+	if (!mod)
+		return -1;
+
+	state = PyModule_GetState(mod);
+
+	self->dev = gpiosim_dev_new(state->sim_ctx);
+	if (!self->dev) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		return -1;
+	}
+
+	self->bank = gpiosim_bank_new(self->dev);
+	if (!self->bank) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		return -1;
+	}
+
+	ret = chip_parse_init_args(self, args, kwargs);
+	if (ret)
+		return -1;
+
+	ret = gpiosim_dev_enable(self->dev);
+	if (ret) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		return -1;
+	}
+
+	return 0;
+}
+
+static void chip_finalize(chip_object *self)
+{
+	if (self->bank)
+		gpiosim_bank_unref(self->bank);
+
+	if (self->dev) {
+		if (gpiosim_dev_is_live(self->dev))
+			gpiosim_dev_disable(self->dev);
+
+		gpiosim_dev_unref(self->dev);
+	}
+}
+
+static void chip_dealloc(PyObject *self)
+{
+	int ret;
+
+	ret = PyObject_CallFinalizerFromDealloc(self);
+	if (ret < 0)
+		return;
+
+	PyObject_Del(self);
+}
+
+static PyObject *chip_dev_path(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(gpiosim_bank_get_dev_path(self->bank));
+}
+
+static PyObject *chip_name(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(gpiosim_bank_get_chip_name(self->bank));
+}
+
+static PyGetSetDef chip_getset[] = {
+	{
+		.name = "dev_path",
+		.get = (getter)chip_dev_path,
+	},
+	{
+		.name = "name",
+		.get = (getter)chip_name,
+	},
+	{ }
+};
+
+static PyObject *chip_get_value(chip_object *self, PyObject *args)
+{
+	unsigned int offset;
+	int ret, val;
+
+	ret = PyArg_ParseTuple(args, "I", &offset);
+	if (!ret)
+		return NULL;
+
+	val = gpiosim_bank_get_value(self->bank, offset);
+
+	return PyCEnum_MapCToPy((PyObject *)self, "Value", val);
+}
+
+static PyObject *chip_set_pull(chip_object *self, PyObject *args)
+{
+	unsigned int offset;
+	int ret, mapped;
+	PyObject *pull;
+
+	ret = PyArg_ParseTuple(args, "IO", &offset, &pull);
+	if (!ret)
+		return NULL;
+
+	mapped = PyCEnum_MapPyToC((PyObject *)self, "Pull", pull);
+	if (mapped < 0) {
+		PyErr_SetString(PyExc_ValueError, "invalid pull value");
+		return NULL;
+	}
+
+	ret = gpiosim_bank_set_pull(self->bank, offset, mapped);
+	if (ret) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		return NULL;
+	}
+
+	Py_RETURN_NONE;
+}
+
+static PyMethodDef chip_methods[] = {
+	{
+		.ml_name = "get_value",
+		.ml_meth = (PyCFunction)chip_get_value,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "set_pull",
+		.ml_meth = (PyCFunction)chip_set_pull,
+		.ml_flags = METH_VARARGS,
+	},
+	{ }
+};
+
+static PyTypeObject chip_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiosim.Chip",
+	.tp_basicsize = sizeof(chip_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)chip_init,
+	.tp_finalize = (destructor)chip_finalize,
+	.tp_dealloc = (destructor)chip_dealloc,
+	.tp_methods = chip_methods,
+	.tp_getset = chip_getset,
+};
+
+PyMODINIT_FUNC PyInit_gpiosim(void)
+{
+	struct module_state *state;
+	PyObject *module;
+	int ret;
+
+	module = PyModule_Create(&module_def);
+	if (!module)
+		return NULL;
+
+	ret = PyState_AddModule(module, &module_def);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	state = PyModule_GetState(module);
+
+	state->sim_ctx = gpiosim_ctx_new();
+	if (!state->sim_ctx) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	ret = PyType_Ready(&chip_type);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	Py_INCREF(&chip_type);
+	ret = PyModule_AddObject(module, "Chip", (PyObject *)&chip_type);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	ret = PyCEnum_AddEnumsToType(chip_enums, &chip_type);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	return module;
+}
-- 
2.34.1

