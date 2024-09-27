Return-Path: <linux-gpio+bounces-10522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C3988A99
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E1A1F21F6C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D941C2431;
	Fri, 27 Sep 2024 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Fs6nEMui"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F271C231C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463329; cv=none; b=bCP42eSIj1CU5nIopgMXQV1U/cpW7xLLKnmdz1KoK5jjVAwmW8RfgJofwEceMDM10MDQp0AfeLCIQsG3SjrE7rt0hYdIn30P0ks/RGfO60b9wSHu3rmhOCuEuXo8M5abWdb/MJQSnlJfo/F4cpUMdp62ueaaNHR8FlIZLKSxAsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463329; c=relaxed/simple;
	bh=lvXyXdy0hx9zA2Fk9QricScjcp3Drs+CDsP8uEgtRlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8gffr2YC1JTHkJnE36Uu0Ifes0GSe/oZNm54TzHjBOC6qTPBorZCL4fcgEimXmxjKv31bzPtyrp4CEXkAkHWBX9JqtPQjlUGtf8+jcxgWVApRvb19sT49pNA8I5MsvPPsCBdBPw6UZNxQIwB/r99r7oD7th+QaygXDkTg0y5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Fs6nEMui; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 937FE22ADB;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=lvXyXdy0hx9zA2Fk9QricScjcp3Drs+CDsP8uEgtRlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fs6nEMuiaGhj2OUVDOod9rxJhoOn7tWDI8pxpY+pXQSBrCOjUFKR4sr0RZ7DjjhzK
	 fJhPjIWT1E9jq1lnik/7+BhA4zJT3OzE4X5Nn/W45C49rDyxmD9eyIfKJ/dzI0sdRy
	 O9RJf97iSGeJmdtIvlH8TmP2+KLC4zlYv6nIvvHo=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 20/22] bindings: python: tests: annotate internal members
Date: Fri, 27 Sep 2024 13:53:56 -0500
Message-Id: <20240927-vfazio-mypy-v1-20-91a7c2e20884@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/tests_chip.py       | 10 +++++++---
 bindings/python/tests/tests_chip_info.py  | 13 ++++++++++---
 bindings/python/tests/tests_edge_event.py | 11 +++++++++--
 bindings/python/tests/tests_info_event.py | 30 +++++++++++++++++++++++++-----
 bindings/python/tests/tests_line_info.py  | 13 +++++++++++--
 5 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index 89d5df4341eceefbc0eed9b880ac641caa682af5..b719f6ba402c962b3ba8029cef61ed28fd1a525a 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -3,6 +3,7 @@
 
 import errno
 import os
+from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -70,7 +71,7 @@ class ChipBooleanConversion(TestCase):
 
 class ChipProperties(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip()
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip()
         self.chip = gpiod.Chip(self.sim.dev_path)
 
     def tearDown(self) -> None:
@@ -78,6 +79,7 @@ class ChipProperties(TestCase):
         self.sim = None
 
     def test_get_chip_path(self) -> None:
+        assert self.sim
         self.assertEqual(self.sim.dev_path, self.chip.path)
 
     def test_get_fd(self) -> None:
@@ -195,7 +197,7 @@ class ClosedChipCannotBeUsed(TestCase):
 
 class StringRepresentation(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(num_lines=4, label="foobar")
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip(num_lines=4, label="foobar")
         self.chip = gpiod.Chip(self.sim.dev_path)
 
     def tearDown(self) -> None:
@@ -203,12 +205,14 @@ class StringRepresentation(TestCase):
         self.sim = None
 
     def test_repr(self) -> None:
+        assert self.sim
         self.assertEqual(repr(self.chip), 'gpiod.Chip("{}")'.format(self.sim.dev_path))
 
         cmp = eval(repr(self.chip))
         self.assertEqual(self.chip.path, cmp.path)
 
     def test_str(self) -> None:
+        assert self.sim
         info = self.chip.get_info()
         self.assertEqual(
             str(self.chip),
@@ -220,7 +224,7 @@ class StringRepresentation(TestCase):
 
 class StringRepresentationClosed(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(num_lines=4, label="foobar")
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip(num_lines=4, label="foobar")
         self.chip = gpiod.Chip(self.sim.dev_path)
 
     def tearDown(self) -> None:
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
index 99259af307fa25bc3ff39574a1bea1cc9dc254a6..463f07ab8edeec7dde8dacc4829b86dd3b1d6ebd 100644
--- a/bindings/python/tests/tests_chip_info.py
+++ b/bindings/python/tests/tests_chip_info.py
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -10,26 +11,32 @@ from . import gpiosim
 
 class ChipInfoProperties(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(label="foobar", num_lines=16)
-        self.chip = gpiod.Chip(self.sim.dev_path)
-        self.info = self.chip.get_info()
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip(label="foobar", num_lines=16)
+        self.chip: Optional[gpiod.Chip] = gpiod.Chip(self.sim.dev_path)
+        self.info: Optional[gpiod.ChipInfo] = self.chip.get_info()
 
     def tearDown(self) -> None:
+        assert self.chip
         self.info = None
         self.chip.close()
         self.chip = None
         self.sim = None
 
     def test_chip_info_name(self) -> None:
+        assert self.sim
+        assert self.info
         self.assertEqual(self.info.name, self.sim.name)
 
     def test_chip_info_label(self) -> None:
+        assert self.info
         self.assertEqual(self.info.label, "foobar")
 
     def test_chip_info_num_lines(self) -> None:
+        assert self.info
         self.assertEqual(self.info.num_lines, 16)
 
     def test_chip_info_properties_are_immutable(self) -> None:
+        assert self.info
         with self.assertRaises(AttributeError):
             self.info.name = "foobar"  # type: ignore[misc]
 
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index f80d6a52680c48405b935fca8e47e2a2817a2fac..fc938f0492811631a1d3855f1c41203d3bc4a4fc 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -5,6 +5,7 @@ import time
 from datetime import timedelta
 from functools import partial
 from threading import Thread
+from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -53,8 +54,8 @@ class EdgeEventInvalidConfig(TestCase):
 
 class WaitingForEdgeEvents(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(num_lines=8)
-        self.thread = None
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip(num_lines=8)
+        self.thread: Optional[Thread] = None
 
     def tearDown(self) -> None:
         if self.thread:
@@ -63,6 +64,7 @@ class WaitingForEdgeEvents(TestCase):
         self.sim = None
 
     def trigger_falling_and_rising_edge(self, offset: int) -> None:
+        assert self.sim
         time.sleep(0.05)
         self.sim.set_pull(offset, Pull.UP)
         time.sleep(0.05)
@@ -71,12 +73,14 @@ class WaitingForEdgeEvents(TestCase):
     def trigger_rising_edge_events_on_two_offsets(
         self, offset0: int, offset1: int
     ) -> None:
+        assert self.sim
         time.sleep(0.05)
         self.sim.set_pull(offset0, Pull.UP)
         time.sleep(0.05)
         self.sim.set_pull(offset1, Pull.UP)
 
     def test_both_edge_events(self) -> None:
+        assert self.sim
         with gpiod.request_lines(
             self.sim.dev_path, {2: gpiod.LineSettings(edge_detection=Edge.BOTH)}
         ) as req:
@@ -104,6 +108,7 @@ class WaitingForEdgeEvents(TestCase):
             self.assertGreater(ts_falling, ts_rising)
 
     def test_rising_edge_event(self) -> None:
+        assert self.sim
         with gpiod.request_lines(
             self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=Edge.RISING)}
         ) as req:
@@ -122,6 +127,7 @@ class WaitingForEdgeEvents(TestCase):
             self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
 
     def test_falling_edge_event(self) -> None:
+        assert self.sim
         with gpiod.request_lines(
             self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=Edge.FALLING)}
         ) as req:
@@ -140,6 +146,7 @@ class WaitingForEdgeEvents(TestCase):
             self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
 
     def test_sequence_numbers(self) -> None:
+        assert self.sim
         with gpiod.request_lines(
             self.sim.dev_path, {(2, 4): gpiod.LineSettings(edge_detection=Edge.BOTH)}
         ) as req:
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index 1e6ab941799047c7e5383a6d0a2512c669655d19..3328335d478ff694e8b2ff3189738475af0a783e 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -7,6 +7,7 @@ import threading
 import time
 from dataclasses import FrozenInstanceError
 from functools import partial
+from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -49,48 +50,60 @@ def request_reconfigure_release_line(chip_path: str, offset: int) -> None:
 
 class WatchingInfoEventWorks(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
-        self.chip = gpiod.Chip(self.sim.dev_path)
-        self.thread = None
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip(
+            num_lines=8, line_names={4: "foobar"}
+        )
+        self.chip: Optional[gpiod.Chip] = gpiod.Chip(self.sim.dev_path)
+        self.thread: Optional[threading.Thread] = None
 
     def tearDown(self) -> None:
         if self.thread:
             self.thread.join()
             self.thread = None
 
+        assert self.chip
         self.chip.close()
         self.chip = None
         self.sim = None
 
     def test_watch_line_info_returns_line_info(self) -> None:
+        assert self.chip
         info = self.chip.watch_line_info(7)
         self.assertEqual(info.offset, 7)
 
     def test_watch_line_info_keyword_argument(self) -> None:
+        assert self.chip
         info = self.chip.watch_line_info(line=7)
 
     def test_watch_line_info_offset_out_of_range(self) -> None:
+        assert self.chip
         with self.assertRaises(ValueError):
             self.chip.watch_line_info(8)
 
     def test_watch_line_info_no_arguments(self) -> None:
+        assert self.chip
         with self.assertRaises(TypeError):
             self.chip.watch_line_info()  # type: ignore[call-arg]
 
     def test_watch_line_info_by_line_name(self) -> None:
+        assert self.chip
         self.chip.watch_line_info("foobar")
 
     def test_watch_line_info_invalid_argument_type(self) -> None:
+        assert self.chip
         with self.assertRaises(TypeError):
             self.chip.watch_line_info(None)  # type: ignore[arg-type]
 
     def test_wait_for_event_timeout(self) -> None:
+        assert self.chip
         info = self.chip.watch_line_info(7)
         self.assertFalse(
             self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
         )
 
     def test_request_reconfigure_release_events(self) -> None:
+        assert self.chip
+        assert self.sim
         info = self.chip.watch_line_info(7)
         self.assertEqual(info.direction, Direction.INPUT)
 
@@ -133,15 +146,19 @@ class WatchingInfoEventWorks(TestCase):
 
 class UnwatchingLineInfo(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
-        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip(
+            num_lines=8, line_names={4: "foobar"}
+        )
+        self.chip: Optional[gpiod.Chip] = gpiod.Chip(self.sim.dev_path)
 
     def tearDown(self) -> None:
+        assert self.chip
         self.chip.close()
         self.chip = None
         self.sim = None
 
     def test_unwatch_line_info(self) -> None:
+        assert self.chip
         self.chip.watch_line_info(0)
         with self.chip.request_lines(config={0: None}) as request:
             self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
@@ -154,16 +171,19 @@ class UnwatchingLineInfo(TestCase):
         )
 
     def test_unwatch_not_watched_line(self) -> None:
+        assert self.chip
         with self.assertRaises(OSError) as ex:
             self.chip.unwatch_line_info(2)
 
         self.assertEqual(ex.exception.errno, errno.EBUSY)
 
     def test_unwatch_line_info_no_argument(self) -> None:
+        assert self.chip
         with self.assertRaises(TypeError):
             self.chip.unwatch_line_info()  # type: ignore[call-arg]
 
     def test_unwatch_line_info_by_line_name(self) -> None:
+        assert self.chip
         self.chip.watch_line_info(4)
         with self.chip.request_lines(config={4: None}) as request:
             self.assertIsNotNone(self.chip.read_info_event())
diff --git a/bindings/python/tests/tests_line_info.py b/bindings/python/tests/tests_line_info.py
index 33d38a6de486447d326e8e3cb73934898ea2aba2..7215221ac1fb3b2a0730c189321cdea498da8226 100644
--- a/bindings/python/tests/tests_line_info.py
+++ b/bindings/python/tests/tests_line_info.py
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -13,38 +14,46 @@ HogDir = gpiosim.Chip.Direction
 
 class GetLineInfo(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(
+        self.sim: Optional[gpiosim.Chip] = gpiosim.Chip(
             num_lines=4,
             line_names={0: "foobar"},
         )
 
-        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.chip: Optional[gpiod.Chip] = gpiod.Chip(self.sim.dev_path)
 
     def tearDown(self) -> None:
+        assert self.chip
         self.chip.close()
         self.chip = None
         self.sim = None
 
     def test_get_line_info_by_offset(self) -> None:
+        assert self.chip
         self.chip.get_line_info(0)
 
     def test_get_line_info_by_offset_keyword(self) -> None:
+        assert self.chip
         self.chip.get_line_info(line=0)
 
     def test_get_line_info_by_name(self) -> None:
+        assert self.chip
         self.chip.get_line_info("foobar")
 
     def test_get_line_info_by_name_keyword(self) -> None:
+        assert self.chip
         self.chip.get_line_info(line="foobar")
 
     def test_get_line_info_by_offset_string(self) -> None:
+        assert self.chip
         self.chip.get_line_info("2")
 
     def test_offset_out_of_range(self) -> None:
+        assert self.chip
         with self.assertRaises(ValueError) as ex:
             self.chip.get_line_info(4)
 
     def test_no_offset(self) -> None:
+        assert self.chip
         with self.assertRaises(TypeError):
             self.chip.get_line_info()  # type: ignore[call-arg]
 

-- 
2.34.1

