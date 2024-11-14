Return-Path: <linux-gpio+bounces-13029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7509C8D4D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECC7A1F24579
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD3213CFA8;
	Thu, 14 Nov 2024 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="wjm6zCXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E5E126BF1
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595897; cv=none; b=CHwRCQ2aX7ZdLTkQwV25w47d1feHrwrBPzsrd1T8mogq+4XIZZv+cf9IYG4rYvQj5huVPVY8Uw/OWBX9o2Pe5weUI6S0dgCcW6qWRw0X+WedSPe2tsHAOWVyzXxGzf6mGL8kntF6+ZOx4H++v14LGicitI6LSwiQHP+xCOC+qxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595897; c=relaxed/simple;
	bh=7HA9sQuSQo3p0uarotgms2137a1fkpcp4fR2Kq5iGiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f7wUuxq4C+U5HPpM/aR3q0i57Pil5QLnLXdX7xBIZ13lupESDdPoS/IFl61n5GECUohe6bIorK7jlgncx2NcqWF1xFSBP5xgrHbU9aBx6MY9kHfZQ3HY6ZtINpQ+o8Ze13tMM4pDPArCmPflxttXvtb/clgvaxjFMELaqoUAo5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=wjm6zCXj; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id C4C9020ABB;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=7HA9sQuSQo3p0uarotgms2137a1fkpcp4fR2Kq5iGiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wjm6zCXj0IXNixrbuJ+UJYIIvg1Bf5A0mmNES6KW0dkycaGmis9dgyZz0JJggayIu
	 60Lxv54o7T/xIzNpUUNK89aAN+L4Q0F/fpk9SZA2EWF5ZgkPGEysgVx99UsJ89H3Od
	 k7hIR0lyoPMi8/Ppy8mWxo3LHX26d5QQsSTqJOdM=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 19/23] bindings: python: tests: add missing method type hints
Date: Thu, 14 Nov 2024 08:51:12 -0600
Message-Id: <20241114145116.2123714-20-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add type hints for all method arguments and return values.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/helpers.py             |  17 +-
 bindings/python/tests/tests_chip.py          |  68 +++----
 bindings/python/tests/tests_chip_info.py     |  14 +-
 bindings/python/tests/tests_edge_event.py    |  32 ++--
 bindings/python/tests/tests_info_event.py    |  38 ++--
 bindings/python/tests/tests_line.py          |   2 +-
 bindings/python/tests/tests_line_info.py     |  22 +--
 bindings/python/tests/tests_line_request.py  | 184 +++++++++----------
 bindings/python/tests/tests_line_settings.py |  12 +-
 bindings/python/tests/tests_module.py        |  20 +-
 10 files changed, 211 insertions(+), 198 deletions(-)

diff --git a/bindings/python/tests/helpers.py b/bindings/python/tests/helpers.py
index f9a15e8..2126901 100644
--- a/bindings/python/tests/helpers.py
+++ b/bindings/python/tests/helpers.py
@@ -1,16 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from __future__ import annotations
+
 import os
+from typing import TYPE_CHECKING, Optional
+
+if TYPE_CHECKING:
+    from types import TracebackType
 
 
 class LinkGuard:
-    def __init__(self, src, dst):
+    def __init__(self, src: str, dst: str) -> None:
         self.src = src
         self.dst = dst
 
-    def __enter__(self):
+    def __enter__(self) -> None:
         os.symlink(self.src, self.dst)
 
-    def __exit__(self, type, val, tb):
+    def __exit__(
+        self,
+        type: Optional[type[BaseException]],
+        val: Optional[BaseException],
+        tb: Optional[TracebackType],
+    ) -> None:
         os.unlink(self.dst)
diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index 9110beb..9c8f875 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -12,19 +12,19 @@ from .helpers import LinkGuard
 
 
 class ChipConstructor(TestCase):
-    def test_open_existing_chip(self):
+    def test_open_existing_chip(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.Chip(sim.dev_path):
             pass
 
-    def test_open_existing_chip_with_keyword(self):
+    def test_open_existing_chip_with_keyword(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.Chip(path=sim.dev_path):
             pass
 
-    def test_open_chip_by_link(self):
+    def test_open_chip_by_link(self) -> None:
         link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
         sim = gpiosim.Chip()
 
@@ -32,35 +32,35 @@ class ChipConstructor(TestCase):
             with gpiod.Chip(link):
                 pass
 
-    def test_open_nonexistent_chip(self):
+    def test_open_nonexistent_chip(self) -> None:
         with self.assertRaises(OSError) as ex:
             gpiod.Chip("/dev/nonexistent")
 
         self.assertEqual(ex.exception.errno, errno.ENOENT)
 
-    def test_open_not_a_character_device(self):
+    def test_open_not_a_character_device(self) -> None:
         with self.assertRaises(OSError) as ex:
             gpiod.Chip("/tmp")
 
         self.assertEqual(ex.exception.errno, errno.ENOTTY)
 
-    def test_open_not_a_gpio_device(self):
+    def test_open_not_a_gpio_device(self) -> None:
         with self.assertRaises(OSError) as ex:
             gpiod.Chip("/dev/null")
 
         self.assertEqual(ex.exception.errno, errno.ENODEV)
 
-    def test_missing_path(self):
+    def test_missing_path(self) -> None:
         with self.assertRaises(TypeError):
             gpiod.Chip()
 
-    def test_invalid_type_for_path(self):
+    def test_invalid_type_for_path(self) -> None:
         with self.assertRaises(TypeError):
             gpiod.Chip(4)
 
 
 class ChipBooleanConversion(TestCase):
-    def test_chip_bool(self):
+    def test_chip_bool(self) -> None:
         sim = gpiosim.Chip()
         chip = gpiod.Chip(sim.dev_path)
         self.assertTrue(chip)
@@ -69,21 +69,21 @@ class ChipBooleanConversion(TestCase):
 
 
 class ChipProperties(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip()
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         self.sim = None
 
-    def test_get_chip_path(self):
+    def test_get_chip_path(self) -> None:
         self.assertEqual(self.sim.dev_path, self.chip.path)
 
-    def test_get_fd(self):
+    def test_get_fd(self) -> None:
         self.assertGreaterEqual(self.chip.fd, 0)
 
-    def test_properties_are_immutable(self):
+    def test_properties_are_immutable(self) -> None:
         with self.assertRaises(AttributeError):
             self.chip.path = "foobar"
 
@@ -92,7 +92,7 @@ class ChipProperties(TestCase):
 
 
 class ChipDevPathFromLink(TestCase):
-    def test_dev_path_open_by_link(self):
+    def test_dev_path_open_by_link(self) -> None:
         sim = gpiosim.Chip()
         link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
 
@@ -102,7 +102,7 @@ class ChipDevPathFromLink(TestCase):
 
 
 class ChipMapLine(TestCase):
-    def test_lookup_by_name_good(self):
+    def test_lookup_by_name_good(self) -> None:
         sim = gpiosim.Chip(
             num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
         )
@@ -110,7 +110,7 @@ class ChipMapLine(TestCase):
         with gpiod.Chip(sim.dev_path) as chip:
             self.assertEqual(chip.line_offset_from_id("baz"), 4)
 
-    def test_lookup_by_name_good_keyword_argument(self):
+    def test_lookup_by_name_good_keyword_argument(self) -> None:
         sim = gpiosim.Chip(
             num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
         )
@@ -118,7 +118,7 @@ class ChipMapLine(TestCase):
         with gpiod.Chip(sim.dev_path) as chip:
             self.assertEqual(chip.line_offset_from_id(id="baz"), 4)
 
-    def test_lookup_bad_name(self):
+    def test_lookup_bad_name(self) -> None:
         sim = gpiosim.Chip(
             num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
         )
@@ -127,21 +127,21 @@ class ChipMapLine(TestCase):
             with self.assertRaises(FileNotFoundError):
                 chip.line_offset_from_id("nonexistent")
 
-    def test_lookup_bad_offset(self):
+    def test_lookup_bad_offset(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.Chip(sim.dev_path) as chip:
             with self.assertRaises(ValueError):
                 chip.line_offset_from_id(4)
 
-    def test_lookup_bad_offset_as_string(self):
+    def test_lookup_bad_offset_as_string(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.Chip(sim.dev_path) as chip:
             with self.assertRaises(ValueError):
                 chip.line_offset_from_id("4")
 
-    def test_duplicate_names(self):
+    def test_duplicate_names(self) -> None:
         sim = gpiosim.Chip(
             num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "bar"}
         )
@@ -149,14 +149,14 @@ class ChipMapLine(TestCase):
         with gpiod.Chip(sim.dev_path) as chip:
             self.assertEqual(chip.line_offset_from_id("bar"), 2)
 
-    def test_integer_offsets(self):
+    def test_integer_offsets(self) -> None:
         sim = gpiosim.Chip(num_lines=8, line_names={1: "foo", 2: "bar", 6: "baz"})
 
         with gpiod.Chip(sim.dev_path) as chip:
             self.assertEqual(chip.line_offset_from_id(4), 4)
             self.assertEqual(chip.line_offset_from_id(1), 1)
 
-    def test_offsets_as_string(self):
+    def test_offsets_as_string(self) -> None:
         sim = gpiosim.Chip(num_lines=8, line_names={1: "foo", 2: "bar", 7: "6"})
 
         with gpiod.Chip(sim.dev_path) as chip:
@@ -165,7 +165,7 @@ class ChipMapLine(TestCase):
 
 
 class ClosedChipCannotBeUsed(TestCase):
-    def test_close_chip_and_try_to_use_it(self):
+    def test_close_chip_and_try_to_use_it(self) -> None:
         sim = gpiosim.Chip(label="foobar")
 
         chip = gpiod.Chip(sim.dev_path)
@@ -174,7 +174,7 @@ class ClosedChipCannotBeUsed(TestCase):
         with self.assertRaises(gpiod.ChipClosedError):
             chip.path
 
-    def test_close_chip_and_try_controlled_execution(self):
+    def test_close_chip_and_try_controlled_execution(self) -> None:
         sim = gpiosim.Chip()
 
         chip = gpiod.Chip(sim.dev_path)
@@ -184,7 +184,7 @@ class ClosedChipCannotBeUsed(TestCase):
             with chip:
                 chip.fd
 
-    def test_close_chip_twice(self):
+    def test_close_chip_twice(self) -> None:
         sim = gpiosim.Chip(label="foobar")
         chip = gpiod.Chip(sim.dev_path)
         chip.close()
@@ -194,21 +194,21 @@ class ClosedChipCannotBeUsed(TestCase):
 
 
 class StringRepresentation(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=4, label="foobar")
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         self.sim = None
 
-    def test_repr(self):
+    def test_repr(self) -> None:
         self.assertEqual(repr(self.chip), 'gpiod.Chip("{}")'.format(self.sim.dev_path))
 
         cmp = eval(repr(self.chip))
         self.assertEqual(self.chip.path, cmp.path)
 
-    def test_str(self):
+    def test_str(self) -> None:
         info = self.chip.get_info()
         self.assertEqual(
             str(self.chip),
@@ -219,17 +219,17 @@ class StringRepresentation(TestCase):
 
 
 class StringRepresentationClosed(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=4, label="foobar")
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.sim = None
 
-    def test_repr_closed(self):
+    def test_repr_closed(self) -> None:
         self.chip.close()
         self.assertEqual(repr(self.chip), "<Chip CLOSED>")
 
-    def test_str_closed(self):
+    def test_str_closed(self) -> None:
         self.chip.close()
         self.assertEqual(str(self.chip), "<Chip CLOSED>")
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
index 9474f38..acb0da9 100644
--- a/bindings/python/tests/tests_chip_info.py
+++ b/bindings/python/tests/tests_chip_info.py
@@ -9,27 +9,27 @@ from . import gpiosim
 
 
 class ChipInfoProperties(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(label="foobar", num_lines=16)
         self.chip = gpiod.Chip(self.sim.dev_path)
         self.info = self.chip.get_info()
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.info = None
         self.chip.close()
         self.chip = None
         self.sim = None
 
-    def test_chip_info_name(self):
+    def test_chip_info_name(self) -> None:
         self.assertEqual(self.info.name, self.sim.name)
 
-    def test_chip_info_label(self):
+    def test_chip_info_label(self) -> None:
         self.assertEqual(self.info.label, "foobar")
 
-    def test_chip_info_num_lines(self):
+    def test_chip_info_num_lines(self) -> None:
         self.assertEqual(self.info.num_lines, 16)
 
-    def test_chip_info_properties_are_immutable(self):
+    def test_chip_info_properties_are_immutable(self) -> None:
         with self.assertRaises(AttributeError):
             self.info.name = "foobar"
 
@@ -41,7 +41,7 @@ class ChipInfoProperties(TestCase):
 
 
 class ChipInfoStringRepresentation(TestCase):
-    def test_chip_info_str(self):
+    def test_chip_info_str(self) -> None:
         sim = gpiosim.Chip(label="foobar", num_lines=16)
 
         with gpiod.Chip(sim.dev_path) as chip:
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index c24d344..f80d6a5 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -17,7 +17,7 @@ Pull = gpiosim.Chip.Pull
 
 
 class EdgeEventWaitTimeout(TestCase):
-    def test_event_wait_timeout(self):
+    def test_event_wait_timeout(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.request_lines(
@@ -26,7 +26,7 @@ class EdgeEventWaitTimeout(TestCase):
         ) as req:
             self.assertEqual(req.wait_edge_events(timedelta(microseconds=10000)), False)
 
-    def test_event_wait_timeout_float(self):
+    def test_event_wait_timeout_float(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.request_lines(
@@ -37,7 +37,7 @@ class EdgeEventWaitTimeout(TestCase):
 
 
 class EdgeEventInvalidConfig(TestCase):
-    def test_output_mode_and_edge_detection(self):
+    def test_output_mode_and_edge_detection(self) -> None:
         sim = gpiosim.Chip()
 
         with self.assertRaises(ValueError):
@@ -52,29 +52,31 @@ class EdgeEventInvalidConfig(TestCase):
 
 
 class WaitingForEdgeEvents(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
         self.thread = None
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         if self.thread:
             self.thread.join()
             del self.thread
         self.sim = None
 
-    def trigger_falling_and_rising_edge(self, offset):
+    def trigger_falling_and_rising_edge(self, offset: int) -> None:
         time.sleep(0.05)
         self.sim.set_pull(offset, Pull.UP)
         time.sleep(0.05)
         self.sim.set_pull(offset, Pull.DOWN)
 
-    def trigger_rising_edge_events_on_two_offsets(self, offset0, offset1):
+    def trigger_rising_edge_events_on_two_offsets(
+        self, offset0: int, offset1: int
+    ) -> None:
         time.sleep(0.05)
         self.sim.set_pull(offset0, Pull.UP)
         time.sleep(0.05)
         self.sim.set_pull(offset1, Pull.UP)
 
-    def test_both_edge_events(self):
+    def test_both_edge_events(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, {2: gpiod.LineSettings(edge_detection=Edge.BOTH)}
         ) as req:
@@ -101,7 +103,7 @@ class WaitingForEdgeEvents(TestCase):
 
             self.assertGreater(ts_falling, ts_rising)
 
-    def test_rising_edge_event(self):
+    def test_rising_edge_event(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=Edge.RISING)}
         ) as req:
@@ -119,7 +121,7 @@ class WaitingForEdgeEvents(TestCase):
 
             self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
 
-    def test_falling_edge_event(self):
+    def test_falling_edge_event(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=Edge.FALLING)}
         ) as req:
@@ -137,7 +139,7 @@ class WaitingForEdgeEvents(TestCase):
 
             self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
 
-    def test_sequence_numbers(self):
+    def test_sequence_numbers(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, {(2, 4): gpiod.LineSettings(edge_detection=Edge.BOTH)}
         ) as req:
@@ -166,7 +168,7 @@ class WaitingForEdgeEvents(TestCase):
 
 
 class ReadingMultipleEdgeEvents(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
         self.request = gpiod.request_lines(
             self.sim.dev_path, {1: gpiod.LineSettings(edge_detection=Edge.BOTH)}
@@ -180,12 +182,12 @@ class ReadingMultipleEdgeEvents(TestCase):
         self.sim.set_pull(1, Pull.UP)
         time.sleep(0.05)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.request.release()
         del self.request
         del self.sim
 
-    def test_read_multiple_events(self):
+    def test_read_multiple_events(self) -> None:
         self.assertTrue(self.request.wait_edge_events(timedelta(seconds=1)))
         events = self.request.read_edge_events()
         self.assertEqual(len(events), 3)
@@ -199,7 +201,7 @@ class ReadingMultipleEdgeEvents(TestCase):
 
 
 class EdgeEventStringRepresentation(TestCase):
-    def test_edge_event_str(self):
+    def test_edge_event_str(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.request_lines(
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index 1976f4b..7e12b8e 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -18,7 +18,7 @@ _EventType = gpiod.InfoEvent.Type
 
 
 class InfoEventDataclassBehavior(TestCase):
-    def test_info_event_props_are_frozen(self):
+    def test_info_event_props_are_frozen(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.Chip(sim.dev_path) as chip:
@@ -37,7 +37,7 @@ class InfoEventDataclassBehavior(TestCase):
                     event.line_info = 4
 
 
-def request_reconfigure_release_line(chip_path, offset):
+def request_reconfigure_release_line(chip_path: str, offset: int) -> None:
     time.sleep(0.1)
     with gpiod.request_lines(chip_path, config={offset: None}) as request:
         time.sleep(0.1)
@@ -48,12 +48,12 @@ def request_reconfigure_release_line(chip_path, offset):
 
 
 class WatchingInfoEventWorks(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
         self.chip = gpiod.Chip(self.sim.dev_path)
         self.thread = None
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         if self.thread:
             self.thread.join()
             self.thread = None
@@ -62,35 +62,35 @@ class WatchingInfoEventWorks(TestCase):
         self.chip = None
         self.sim = None
 
-    def test_watch_line_info_returns_line_info(self):
+    def test_watch_line_info_returns_line_info(self) -> None:
         info = self.chip.watch_line_info(7)
         self.assertEqual(info.offset, 7)
 
-    def test_watch_line_info_keyword_argument(self):
+    def test_watch_line_info_keyword_argument(self) -> None:
         info = self.chip.watch_line_info(line=7)
 
-    def test_watch_line_info_offset_out_of_range(self):
+    def test_watch_line_info_offset_out_of_range(self) -> None:
         with self.assertRaises(ValueError):
             self.chip.watch_line_info(8)
 
-    def test_watch_line_info_no_arguments(self):
+    def test_watch_line_info_no_arguments(self) -> None:
         with self.assertRaises(TypeError):
             self.chip.watch_line_info()
 
-    def test_watch_line_info_by_line_name(self):
+    def test_watch_line_info_by_line_name(self) -> None:
         self.chip.watch_line_info("foobar")
 
-    def test_watch_line_info_invalid_argument_type(self):
+    def test_watch_line_info_invalid_argument_type(self) -> None:
         with self.assertRaises(TypeError):
             self.chip.watch_line_info(None)
 
-    def test_wait_for_event_timeout(self):
+    def test_wait_for_event_timeout(self) -> None:
         info = self.chip.watch_line_info(7)
         self.assertFalse(
             self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
         )
 
-    def test_request_reconfigure_release_events(self):
+    def test_request_reconfigure_release_events(self) -> None:
         info = self.chip.watch_line_info(7)
         self.assertEqual(info.direction, Direction.INPUT)
 
@@ -132,16 +132,16 @@ class WatchingInfoEventWorks(TestCase):
 
 
 class UnwatchingLineInfo(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         self.chip = None
         self.sim = None
 
-    def test_unwatch_line_info(self):
+    def test_unwatch_line_info(self) -> None:
         self.chip.watch_line_info(0)
         with self.chip.request_lines(config={0: None}) as request:
             self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
@@ -153,17 +153,17 @@ class UnwatchingLineInfo(TestCase):
             self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
         )
 
-    def test_unwatch_not_watched_line(self):
+    def test_unwatch_not_watched_line(self) -> None:
         with self.assertRaises(OSError) as ex:
             self.chip.unwatch_line_info(2)
 
         self.assertEqual(ex.exception.errno, errno.EBUSY)
 
-    def test_unwatch_line_info_no_argument(self):
+    def test_unwatch_line_info_no_argument(self) -> None:
         with self.assertRaises(TypeError):
             self.chip.unwatch_line_info()
 
-    def test_unwatch_line_info_by_line_name(self):
+    def test_unwatch_line_info_by_line_name(self) -> None:
         self.chip.watch_line_info(4)
         with self.chip.request_lines(config={4: None}) as request:
             self.assertIsNotNone(self.chip.read_info_event())
@@ -175,7 +175,7 @@ class UnwatchingLineInfo(TestCase):
 
 
 class InfoEventStringRepresentation(TestCase):
-    def test_info_event_str(self):
+    def test_info_event_str(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.Chip(sim.dev_path) as chip:
diff --git a/bindings/python/tests/tests_line.py b/bindings/python/tests/tests_line.py
index 2182567..c96f6de 100644
--- a/bindings/python/tests/tests_line.py
+++ b/bindings/python/tests/tests_line.py
@@ -7,6 +7,6 @@ from gpiod.line import Value
 
 
 class LineValue(TestCase):
-    def test_cast_bool(self):
+    def test_cast_bool(self) -> None:
         self.assertTrue(bool(Value.ACTIVE))
         self.assertFalse(bool(Value.INACTIVE))
diff --git a/bindings/python/tests/tests_line_info.py b/bindings/python/tests/tests_line_info.py
index 79281a8..9828349 100644
--- a/bindings/python/tests/tests_line_info.py
+++ b/bindings/python/tests/tests_line_info.py
@@ -12,7 +12,7 @@ HogDir = gpiosim.Chip.Direction
 
 
 class GetLineInfo(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(
             num_lines=4,
             line_names={0: "foobar"},
@@ -20,37 +20,37 @@ class GetLineInfo(TestCase):
 
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         self.chip = None
         self.sim = None
 
-    def test_get_line_info_by_offset(self):
+    def test_get_line_info_by_offset(self) -> None:
         self.chip.get_line_info(0)
 
-    def test_get_line_info_by_offset_keyword(self):
+    def test_get_line_info_by_offset_keyword(self) -> None:
         self.chip.get_line_info(line=0)
 
-    def test_get_line_info_by_name(self):
+    def test_get_line_info_by_name(self) -> None:
         self.chip.get_line_info("foobar")
 
-    def test_get_line_info_by_name_keyword(self):
+    def test_get_line_info_by_name_keyword(self) -> None:
         self.chip.get_line_info(line="foobar")
 
-    def test_get_line_info_by_offset_string(self):
+    def test_get_line_info_by_offset_string(self) -> None:
         self.chip.get_line_info("2")
 
-    def test_offset_out_of_range(self):
+    def test_offset_out_of_range(self) -> None:
         with self.assertRaises(ValueError) as ex:
             self.chip.get_line_info(4)
 
-    def test_no_offset(self):
+    def test_no_offset(self) -> None:
         with self.assertRaises(TypeError):
             self.chip.get_line_info()
 
 
 class LinePropertiesCanBeRead(TestCase):
-    def test_basic_properties(self):
+    def test_basic_properties(self) -> None:
         sim = gpiosim.Chip(
             num_lines=8,
             line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"},
@@ -87,7 +87,7 @@ class LinePropertiesCanBeRead(TestCase):
 
 
 class LineInfoStringRepresentation(TestCase):
-    def test_line_info_str(self):
+    def test_line_info_str(self) -> None:
         sim = gpiosim.Chip(
             line_names={0: "foo"}, hogs={0: ("hogger", HogDir.OUTPUT_HIGH)}
         )
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index c3e86c5..76edb1d 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -13,78 +13,78 @@ SimVal = gpiosim.Chip.Value
 
 
 class ChipLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         del self.chip
         del self.sim
 
-    def test_passing_invalid_types_as_configs(self):
+    def test_passing_invalid_types_as_configs(self) -> None:
         with self.assertRaises(AttributeError):
             self.chip.request_lines("foobar")
 
         with self.assertRaises(AttributeError):
             self.chip.request_lines(None, "foobar")
 
-    def test_offset_out_of_range(self):
+    def test_offset_out_of_range(self) -> None:
         with self.assertRaises(ValueError):
             self.chip.request_lines(config={(1, 0, 4, 8): None})
 
-    def test_line_name_not_found(self):
+    def test_line_name_not_found(self) -> None:
         with self.assertRaises(FileNotFoundError):
             self.chip.request_lines(config={"foo": None})
 
-    def test_request_no_arguments(self):
+    def test_request_no_arguments(self) -> None:
         with self.assertRaises(TypeError):
             self.chip.request_lines()
 
 
 class ModuleLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         del self.sim
 
-    def test_passing_invalid_types_as_configs(self):
+    def test_passing_invalid_types_as_configs(self) -> None:
         with self.assertRaises(AttributeError):
             gpiod.request_lines(self.sim.dev_path, "foobar")
 
         with self.assertRaises(AttributeError):
             gpiod.request_lines(self.sim.dev_path, None, "foobar")
 
-    def test_offset_out_of_range(self):
+    def test_offset_out_of_range(self) -> None:
         with self.assertRaises(ValueError):
             gpiod.request_lines(self.sim.dev_path, config={(1, 0, 4, 8): None})
 
-    def test_line_name_not_found(self):
+    def test_line_name_not_found(self) -> None:
         with self.assertRaises(FileNotFoundError):
             gpiod.request_lines(self.sim.dev_path, config={"foo": None})
 
-    def test_request_no_arguments(self):
+    def test_request_no_arguments(self) -> None:
         with self.assertRaises(TypeError):
             gpiod.request_lines()
 
 
 class ChipLineRequestWorks(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8, line_names={5: "foo", 7: "bar"})
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         del self.chip
         del self.sim
 
-    def test_request_with_positional_arguments(self):
+    def test_request_with_positional_arguments(self) -> None:
         with self.chip.request_lines({(0, 5, 3, 1): None}, "foobar", 32) as req:
             self.assertEqual(req.offsets, [0, 5, 3, 1])
             self.assertEqual(self.chip.get_line_info(0).consumer, "foobar")
 
-    def test_request_with_keyword_arguments(self):
+    def test_request_with_keyword_arguments(self) -> None:
         with self.chip.request_lines(
             config={(0, 5, 6): None},
             consumer="foobar",
@@ -93,31 +93,31 @@ class ChipLineRequestWorks(TestCase):
             self.assertEqual(req.offsets, [0, 5, 6])
             self.assertEqual(self.chip.get_line_info(0).consumer, "foobar")
 
-    def test_request_single_offset_as_int(self):
+    def test_request_single_offset_as_int(self) -> None:
         with self.chip.request_lines(config={4: None}) as req:
             self.assertEqual(req.offsets, [4])
 
-    def test_request_single_offset_as_tuple(self):
+    def test_request_single_offset_as_tuple(self) -> None:
         with self.chip.request_lines(config={(4): None}) as req:
             self.assertEqual(req.offsets, [4])
 
-    def test_request_by_name(self):
+    def test_request_by_name(self) -> None:
         with self.chip.request_lines(config={(1, 2, "foo", "bar"): None}) as req:
             self.assertEqual(req.offsets, [1, 2, 5, 7])
 
-    def test_request_single_line_by_name(self):
+    def test_request_single_line_by_name(self) -> None:
         with self.chip.request_lines(config={"foo": None}) as req:
             self.assertEqual(req.offsets, [5])
 
 
 class ModuleLineRequestWorks(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8, line_names={5: "foo", 7: "bar"})
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         del self.sim
 
-    def test_request_with_positional_arguments(self):
+    def test_request_with_positional_arguments(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, {(0, 5, 3, 1): None}, "foobar", 32
         ) as req:
@@ -125,7 +125,7 @@ class ModuleLineRequestWorks(TestCase):
             with gpiod.Chip(self.sim.dev_path) as chip:
                 self.assertEqual(chip.get_line_info(5).consumer, "foobar")
 
-    def test_request_with_keyword_arguments(self):
+    def test_request_with_keyword_arguments(self) -> None:
         with gpiod.request_lines(
             path=self.sim.dev_path,
             config={(0, 5, 6): None},
@@ -136,15 +136,15 @@ class ModuleLineRequestWorks(TestCase):
             with gpiod.Chip(self.sim.dev_path) as chip:
                 self.assertEqual(chip.get_line_info(5).consumer, "foobar")
 
-    def test_request_single_offset_as_int(self):
+    def test_request_single_offset_as_int(self) -> None:
         with gpiod.request_lines(path=self.sim.dev_path, config={4: None}) as req:
             self.assertEqual(req.offsets, [4])
 
-    def test_request_single_offset_as_tuple(self):
+    def test_request_single_offset_as_tuple(self) -> None:
         with gpiod.request_lines(path=self.sim.dev_path, config={(4): None}) as req:
             self.assertEqual(req.offsets, [4])
 
-    def test_request_by_name(self):
+    def test_request_by_name(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, {(1, 2, "foo", "bar"): None}
         ) as req:
@@ -152,29 +152,29 @@ class ModuleLineRequestWorks(TestCase):
 
 
 class LineRequestGettingValues(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
         self.req = gpiod.request_lines(
             self.sim.dev_path,
             {(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.INPUT)},
         )
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.req.release()
         del self.req
         del self.sim
 
-    def test_get_single_value(self):
+    def test_get_single_value(self) -> None:
         self.sim.set_pull(1, Pull.UP)
 
         self.assertEqual(self.req.get_values([1]), [Value.ACTIVE])
 
-    def test_get_single_value_helper(self):
+    def test_get_single_value_helper(self) -> None:
         self.sim.set_pull(1, Pull.UP)
 
         self.assertEqual(self.req.get_value(1), Value.ACTIVE)
 
-    def test_get_values_for_subset_of_lines(self):
+    def test_get_values_for_subset_of_lines(self) -> None:
         self.sim.set_pull(0, Pull.UP)
         self.sim.set_pull(1, Pull.DOWN)
         self.sim.set_pull(3, Pull.UP)
@@ -183,7 +183,7 @@ class LineRequestGettingValues(TestCase):
             self.req.get_values([0, 1, 3]), [Value.ACTIVE, Value.INACTIVE, Value.ACTIVE]
         )
 
-    def test_get_all_values(self):
+    def test_get_all_values(self) -> None:
         self.sim.set_pull(0, Pull.DOWN)
         self.sim.set_pull(1, Pull.UP)
         self.sim.set_pull(2, Pull.UP)
@@ -194,29 +194,29 @@ class LineRequestGettingValues(TestCase):
             [Value.INACTIVE, Value.ACTIVE, Value.ACTIVE, Value.ACTIVE],
         )
 
-    def test_get_values_invalid_offset(self):
+    def test_get_values_invalid_offset(self) -> None:
         with self.assertRaises(ValueError):
             self.req.get_values([9])
 
-    def test_get_values_invalid_argument_type(self):
+    def test_get_values_invalid_argument_type(self) -> None:
         with self.assertRaises(TypeError):
             self.req.get_values(True)
 
 
 class LineRequestGettingValuesByName(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz"})
         self.req = gpiod.request_lines(
             self.sim.dev_path,
             {(0, "baz", "bar", "foo"): gpiod.LineSettings(direction=Direction.INPUT)},
         )
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.req.release()
         del self.req
         del self.sim
 
-    def test_get_values_by_name(self):
+    def test_get_values_by_name(self) -> None:
         self.sim.set_pull(1, Pull.UP)
         self.sim.set_pull(2, Pull.DOWN)
         self.sim.set_pull(3, Pull.UP)
@@ -226,58 +226,58 @@ class LineRequestGettingValuesByName(TestCase):
             [Value.INACTIVE, Value.ACTIVE, Value.ACTIVE],
         )
 
-    def test_get_values_by_bad_name(self):
+    def test_get_values_by_bad_name(self) -> None:
         with self.assertRaises(ValueError):
             self.req.get_values(["xyz"])
 
 
 class LineRequestSettingValues(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
         self.req = gpiod.request_lines(
             self.sim.dev_path,
             {(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
         )
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.req.release()
         del self.req
         del self.sim
 
-    def test_set_single_value(self):
+    def test_set_single_value(self) -> None:
         self.req.set_values({1: Value.ACTIVE})
         self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
 
-    def test_set_single_value_helper(self):
+    def test_set_single_value_helper(self) -> None:
         self.req.set_value(1, Value.ACTIVE)
         self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
 
-    def test_set_values_for_subset_of_lines(self):
+    def test_set_values_for_subset_of_lines(self) -> None:
         self.req.set_values({0: Value.ACTIVE, 1: Value.INACTIVE, 3: Value.ACTIVE})
 
         self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
         self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
         self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
 
-    def test_set_values_invalid_offset(self):
+    def test_set_values_invalid_offset(self) -> None:
         with self.assertRaises(ValueError):
             self.req.set_values({9: Value.ACTIVE})
 
 
 class LineRequestSettingValuesByName(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz"})
         self.req = gpiod.request_lines(
             self.sim.dev_path,
             {(0, "baz", "bar", "foo"): gpiod.LineSettings(direction=Direction.OUTPUT)},
         )
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.req.release()
         del self.req
         del self.sim
 
-    def test_set_values_by_name(self):
+    def test_set_values_by_name(self) -> None:
         self.req.set_values(
             {"foo": Value.INACTIVE, "bar": Value.ACTIVE, 1: Value.ACTIVE}
         )
@@ -286,13 +286,13 @@ class LineRequestSettingValuesByName(TestCase):
         self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
         self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
 
-    def test_set_values_by_bad_name(self):
+    def test_set_values_by_bad_name(self) -> None:
         with self.assertRaises(ValueError):
             self.req.set_values({"xyz": Value.ACTIVE})
 
 
 class LineRequestComplexConfig(TestCase):
-    def test_complex_config(self):
+    def test_complex_config(self) -> None:
         sim = gpiosim.Chip(num_lines=8)
 
         with gpiod.Chip(sim.dev_path) as chip:
@@ -314,7 +314,7 @@ class LineRequestComplexConfig(TestCase):
 
 
 class LineRequestMixedConfigByName(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(
             num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz", 0: "xyz"}
         )
@@ -326,18 +326,18 @@ class LineRequestMixedConfigByName(TestCase):
             },
         )
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.req.release()
         del self.req
         del self.sim
 
-    def test_set_values_by_name(self):
+    def test_set_values_by_name(self) -> None:
         self.req.set_values({"bar": Value.ACTIVE, "baz": Value.INACTIVE})
 
         self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
         self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
 
-    def test_get_values_by_name(self):
+    def test_get_values_by_name(self) -> None:
         self.sim.set_pull(0, Pull.UP)
         self.sim.set_pull(2, Pull.DOWN)
 
@@ -348,40 +348,40 @@ class LineRequestMixedConfigByName(TestCase):
 
 
 class RepeatingLinesInRequestConfig(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=4, line_names={0: "foo", 2: "bar"})
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         del self.chip
         del self.sim
 
-    def test_offsets_repeating_within_the_same_tuple(self):
+    def test_offsets_repeating_within_the_same_tuple(self) -> None:
         with self.assertRaises(ValueError):
             self.chip.request_lines({(0, 1, 2, 1): None})
 
-    def test_offsets_repeating_in_different_tuples(self):
+    def test_offsets_repeating_in_different_tuples(self) -> None:
         with self.assertRaises(ValueError):
             self.chip.request_lines({(0, 1, 2): None, (3, 4, 0): None})
 
-    def test_offset_and_name_conflict_in_the_same_tuple(self):
+    def test_offset_and_name_conflict_in_the_same_tuple(self) -> None:
         with self.assertRaises(ValueError):
             self.chip.request_lines({(2, "bar"): None})
 
-    def test_offset_and_name_conflict_in_different_tuples(self):
+    def test_offset_and_name_conflict_in_different_tuples(self) -> None:
         with self.assertRaises(ValueError):
             self.chip.request_lines({(0, 1, 2): None, (4, 5, "bar"): None})
 
 
 class LineRequestPropertiesWork(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=16, line_names={0: "foo", 2: "bar", 5: "baz"})
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         del self.sim
 
-    def test_property_fd(self):
+    def test_property_fd(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path,
             config={
@@ -392,19 +392,19 @@ class LineRequestPropertiesWork(TestCase):
         ) as req:
             self.assertGreaterEqual(req.fd, 0)
 
-    def test_property_num_lines(self):
+    def test_property_num_lines(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, config={(0, 2, 3, 5, 6, 8, 12): None}
         ) as req:
             self.assertEqual(req.num_lines, 7)
 
-    def test_property_offsets(self):
+    def test_property_offsets(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, config={(1, 6, 12, 4): None}
         ) as req:
             self.assertEqual(req.offsets, [1, 6, 12, 4])
 
-    def test_property_lines(self):
+    def test_property_lines(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path, config={("foo", 1, "bar", 4, "baz"): None}
         ) as req:
@@ -412,43 +412,43 @@ class LineRequestPropertiesWork(TestCase):
 
 
 class LineRequestConsumerString(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=4)
         self.chip = gpiod.Chip(self.sim.dev_path)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         del self.chip
         del self.sim
 
-    def test_custom_consumer(self):
+    def test_custom_consumer(self) -> None:
         with self.chip.request_lines(
             consumer="foobar", config={(2, 3): None}
         ) as request:
             info = self.chip.get_line_info(2)
             self.assertEqual(info.consumer, "foobar")
 
-    def test_empty_consumer(self):
+    def test_empty_consumer(self) -> None:
         with self.chip.request_lines(consumer="", config={(2, 3): None}) as request:
             info = self.chip.get_line_info(2)
             self.assertEqual(info.consumer, "?")
 
-    def test_default_consumer(self):
+    def test_default_consumer(self) -> None:
         with self.chip.request_lines(config={(2, 3): None}) as request:
             info = self.chip.get_line_info(2)
             self.assertEqual(info.consumer, "?")
 
 
 class LineRequestSetOutputValues(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(
             num_lines=4, line_names={0: "foo", 1: "bar", 2: "baz", 3: "xyz"}
         )
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         del self.sim
 
-    def test_request_with_globally_set_output_values(self):
+    def test_request_with_globally_set_output_values(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path,
             config={(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
@@ -464,7 +464,7 @@ class LineRequestSetOutputValues(TestCase):
             self.assertEqual(self.sim.get_value(2), SimVal.ACTIVE)
             self.assertEqual(self.sim.get_value(3), SimVal.INACTIVE)
 
-    def test_request_with_globally_set_output_values_with_mapping(self):
+    def test_request_with_globally_set_output_values_with_mapping(self) -> None:
         with gpiod.request_lines(
             self.sim.dev_path,
             config={(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
@@ -475,7 +475,7 @@ class LineRequestSetOutputValues(TestCase):
             self.assertEqual(self.sim.get_value(2), SimVal.ACTIVE)
             self.assertEqual(self.sim.get_value(3), SimVal.INACTIVE)
 
-    def test_request_with_globally_set_output_values_bad_mapping(self):
+    def test_request_with_globally_set_output_values_bad_mapping(self) -> None:
         with self.assertRaises(FileNotFoundError):
             with gpiod.request_lines(
                 self.sim.dev_path,
@@ -484,7 +484,7 @@ class LineRequestSetOutputValues(TestCase):
             ) as request:
                 pass
 
-    def test_request_with_globally_set_output_values_bad_offset(self):
+    def test_request_with_globally_set_output_values_bad_offset(self) -> None:
         with self.assertRaises(ValueError):
             with gpiod.request_lines(
                 self.sim.dev_path,
@@ -495,7 +495,7 @@ class LineRequestSetOutputValues(TestCase):
 
 
 class ReconfigureRequestedLines(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8, line_names={3: "foo", 4: "bar", 6: "baz"})
         self.chip = gpiod.Chip(self.sim.dev_path)
         self.req = self.chip.request_lines(
@@ -506,14 +506,14 @@ class ReconfigureRequestedLines(TestCase):
             }
         )
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         self.chip.close()
         del self.chip
         self.req.release()
         del self.req
         del self.sim
 
-    def test_reconfigure_by_offsets(self):
+    def test_reconfigure_by_offsets(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.req.reconfigure_lines(
@@ -522,7 +522,7 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
-    def test_reconfigure_by_names(self):
+    def test_reconfigure_by_names(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.req.reconfigure_lines(
@@ -531,7 +531,7 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
-    def test_reconfigure_by_misordered_offsets(self):
+    def test_reconfigure_by_misordered_offsets(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.req.reconfigure_lines(
@@ -540,7 +540,7 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
-    def test_reconfigure_by_misordered_names(self):
+    def test_reconfigure_by_misordered_names(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.req.reconfigure_lines(
@@ -549,7 +549,7 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
-    def test_reconfigure_with_default(self):
+    def test_reconfigure_with_default(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.assertTrue(info.active_low)
@@ -568,7 +568,7 @@ class ReconfigureRequestedLines(TestCase):
         self.assertTrue(info.active_low)
         self.assertEqual(info.drive, Drive.OPEN_DRAIN)
 
-    def test_reconfigure_missing_offsets(self):
+    def test_reconfigure_missing_offsets(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.assertTrue(info.active_low)
@@ -583,7 +583,7 @@ class ReconfigureRequestedLines(TestCase):
         self.assertTrue(info.active_low)
         self.assertEqual(info.drive, Drive.OPEN_DRAIN)
 
-    def test_reconfigure_extra_offsets(self):
+    def test_reconfigure_extra_offsets(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.req.reconfigure_lines(
@@ -594,7 +594,7 @@ class ReconfigureRequestedLines(TestCase):
 
 
 class ReleasedLineRequestCannotBeUsed(TestCase):
-    def test_using_released_line_request(self):
+    def test_using_released_line_request(self) -> None:
         sim = gpiosim.Chip()
 
         with gpiod.Chip(sim.dev_path) as chip:
@@ -606,7 +606,7 @@ class ReleasedLineRequestCannotBeUsed(TestCase):
 
 
 class LineRequestSurvivesParentChip(TestCase):
-    def test_line_request_survives_parent_chip(self):
+    def test_line_request_survives_parent_chip(self) -> None:
         sim = gpiosim.Chip()
 
         chip = gpiod.Chip(sim.dev_path)
@@ -624,13 +624,13 @@ class LineRequestSurvivesParentChip(TestCase):
 
 
 class LineRequestStringRepresentation(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
 
-    def tearDown(self):
+    def tearDown(self) -> None:
         del self.sim
 
-    def test_str(self):
+    def test_str(self) -> None:
         with gpiod.Chip(self.sim.dev_path) as chip:
             with chip.request_lines(config={(2, 6, 4, 1): None}) as req:
                 self.assertEqual(
@@ -640,7 +640,7 @@ class LineRequestStringRepresentation(TestCase):
                     ),
                 )
 
-    def test_str_released(self):
+    def test_str_released(self) -> None:
         req = gpiod.request_lines(self.sim.dev_path, config={(2, 6, 4, 1): None})
         req.release()
         self.assertEqual(str(req), "<LineRequest RELEASED>")
diff --git a/bindings/python/tests/tests_line_settings.py b/bindings/python/tests/tests_line_settings.py
index 832ac8a..66e01df 100644
--- a/bindings/python/tests/tests_line_settings.py
+++ b/bindings/python/tests/tests_line_settings.py
@@ -9,7 +9,7 @@ from gpiod.line import Bias, Clock, Direction, Drive, Edge, Value
 
 
 class LineSettingsConstructor(TestCase):
-    def test_default_values(self):
+    def test_default_values(self) -> None:
         settings = gpiod.LineSettings()
 
         self.assertEqual(settings.direction, Direction.AS_IS)
@@ -21,7 +21,7 @@ class LineSettingsConstructor(TestCase):
         self.assertEqual(settings.event_clock, Clock.MONOTONIC)
         self.assertEqual(settings.output_value, Value.INACTIVE)
 
-    def test_keyword_arguments(self):
+    def test_keyword_arguments(self) -> None:
         settings = gpiod.LineSettings(
             direction=Direction.INPUT,
             edge_detection=Edge.BOTH,
@@ -40,7 +40,7 @@ class LineSettingsConstructor(TestCase):
 
 
 class LineSettingsAttributes(TestCase):
-    def test_line_settings_attributes_are_mutable(self):
+    def test_line_settings_attributes_are_mutable(self) -> None:
         settings = gpiod.LineSettings()
 
         settings.direction = Direction.INPUT
@@ -60,12 +60,12 @@ class LineSettingsAttributes(TestCase):
 
 
 class LineSettingsStringRepresentation(TestCase):
-    def setUp(self):
+    def setUp(self) -> None:
         self.settings = gpiod.LineSettings(
             direction=Direction.OUTPUT, drive=Drive.OPEN_SOURCE, active_low=True
         )
 
-    def test_repr(self):
+    def test_repr(self) -> None:
         self.assertEqual(
             repr(self.settings),
             "gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT, edge_detection=gpiod.line.Edge.NONE, bias=gpiod.line.Bias.AS_IS, drive=gpiod.line.Drive.OPEN_SOURCE, active_low=True, debounce_period=datetime.timedelta(0), event_clock=gpiod.line.Clock.MONOTONIC, output_value=gpiod.line.Value.INACTIVE)",
@@ -74,7 +74,7 @@ class LineSettingsStringRepresentation(TestCase):
         cmp = eval(repr(self.settings))
         self.assertEqual(self.settings, cmp)
 
-    def test_str(self):
+    def test_str(self) -> None:
         self.assertEqual(
             str(self.settings),
             "<LineSettings direction=Direction.OUTPUT edge_detection=Edge.NONE bias=Bias.AS_IS drive=Drive.OPEN_SOURCE active_low=True debounce_period=0:00:00 event_clock=Clock.MONOTONIC output_value=Value.INACTIVE>",
diff --git a/bindings/python/tests/tests_module.py b/bindings/python/tests/tests_module.py
index f46729f..2718624 100644
--- a/bindings/python/tests/tests_module.py
+++ b/bindings/python/tests/tests_module.py
@@ -11,38 +11,38 @@ from .helpers import LinkGuard
 
 
 class IsGPIOChip(TestCase):
-    def test_is_gpiochip_bad(self):
+    def test_is_gpiochip_bad(self) -> None:
         self.assertFalse(gpiod.is_gpiochip_device("/dev/null"))
         self.assertFalse(gpiod.is_gpiochip_device("/dev/nonexistent"))
 
-    def test_is_gpiochip_invalid_argument(self):
+    def test_is_gpiochip_invalid_argument(self) -> None:
         with self.assertRaises(TypeError):
             gpiod.is_gpiochip_device(4)
 
-    def test_is_gpiochip_superfluous_argument(self):
+    def test_is_gpiochip_superfluous_argument(self) -> None:
         with self.assertRaises(TypeError):
             gpiod.is_gpiochip_device("/dev/null", 4)
 
-    def test_is_gpiochip_missing_argument(self):
+    def test_is_gpiochip_missing_argument(self) -> None:
         with self.assertRaises(TypeError):
             gpiod.is_gpiochip_device()
 
-    def test_is_gpiochip_good(self):
+    def test_is_gpiochip_good(self) -> None:
         sim = gpiosim.Chip()
         self.assertTrue(gpiod.is_gpiochip_device(sim.dev_path))
 
-    def test_is_gpiochip_good_keyword_argument(self):
+    def test_is_gpiochip_good_keyword_argument(self) -> None:
         sim = gpiosim.Chip()
         self.assertTrue(gpiod.is_gpiochip_device(path=sim.dev_path))
 
-    def test_is_gpiochip_link_good(self):
+    def test_is_gpiochip_link_good(self) -> None:
         link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
         sim = gpiosim.Chip()
 
         with LinkGuard(sim.dev_path, link):
             self.assertTrue(gpiod.is_gpiochip_device(link))
 
-    def test_is_gpiochip_link_bad(self):
+    def test_is_gpiochip_link_bad(self) -> None:
         link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
 
         with LinkGuard("/dev/null", link):
@@ -52,8 +52,8 @@ class IsGPIOChip(TestCase):
 class VersionString(TestCase):
     VERSION_PATTERN = "^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)?$"
 
-    def test_api_version_string(self):
+    def test_api_version_string(self) -> None:
         self.assertRegex(gpiod.api_version, VersionString.VERSION_PATTERN)
 
-    def test_module_version(self):
+    def test_module_version(self) -> None:
         self.assertRegex(gpiod.__version__, VersionString.VERSION_PATTERN)
-- 
2.34.1


