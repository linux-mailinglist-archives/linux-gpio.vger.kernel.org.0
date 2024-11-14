Return-Path: <linux-gpio+bounces-13027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA79C8D4B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 508F11F2416F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5113413CA8D;
	Thu, 14 Nov 2024 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="cu9gY9F3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D426F307
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595897; cv=none; b=RWAeuxA+bLx5YPWdbLOM+BS/h9TfxdNPY9K0XJusjbSjRdwAr0b+FLtoauOrl0Ir0GqOrFCggqmkt9AHWqtBqrmySkB4l6J+36WtppK0tUAddJfIdC+AN5IgC9kmLI3wEY/JuJgIyO2L7fP0InQCm7Ctq4Vqd82Ex2li3AmPCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595897; c=relaxed/simple;
	bh=GqsbHIiZILytSGfI3bEakJVjHTB/n+zOG9o/ML+KvC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u8Rjin3FSVpJ1oCDBmxgzUA/T4l5QoC9nqObR/8YtHo396huGPUdZFWloFMmDBQgql5ZwoHUOHHEA9j3fBoVUasEJkouX4CP/HRRZ4bPGYKSyIQsUEJSX0YpTmWFlOsFbf+e6OutMhPZAhqRjn6aTRp0NpnsTxgD/oEnl0h4Pyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=cu9gY9F3; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id DBF6220ABD;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=GqsbHIiZILytSGfI3bEakJVjHTB/n+zOG9o/ML+KvC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cu9gY9F3GDz+VXHmlQHKswhxHPzXw3pvbJOR2+RuUQ8WOXja0RMPxFPCScBMpuD1x
	 lBJUE6h4v5Pz2lJkaH4VtQPUr3RcEzgJnROV4AyKYSvE71o3GgsBxSnMJLrc/hqn3x
	 +1lYCtJQFUqDyVAaL7twGK2F1Ufg9KP0GQK6/mWs=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 20/23] bindings: python: tests: add type hints to internal members
Date: Thu, 14 Nov 2024 08:51:13 -0600
Message-Id: <20241114145116.2123714-21-vfazio@xes-inc.com>
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

Add type hints for internal members of the test cases so type checkers
can ensure the code properly constrains to these types and accounts for
scenarios where the values are `None`.

In most cases, the type checker is allowed to assume the inferred type
upon assignment.

An example is any test case that creates a `Chip` as part of its `setUp`
method. Many of these tests subsequently set the reference to `None` in
`tearDown` to free up resources to be collected by the GC.

If the member was "properly" typed to be `Optional`, all references in
the unit tests would need to be guarded by an assert or a cast or
ignored by the type checker. This is noisy and doesn't add value since
for the life of the test it should always be a valid reference.

Instead, allow `tearDown` to violate the inferred type and inform the
type checker to ignore the assignment via directive.

If the tests are ever changed to set the member to something other than
the inferred type outside of `tearDown`, explicit type hints and proper
checks should be added.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/tests_chip.py       |  6 +++---
 bindings/python/tests/tests_chip_info.py  |  6 +++---
 bindings/python/tests/tests_edge_event.py |  5 +++--
 bindings/python/tests/tests_info_event.py | 11 ++++++-----
 bindings/python/tests/tests_line_info.py  |  4 ++--
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index 9c8f875..218f238 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -75,7 +75,7 @@ class ChipProperties(TestCase):
 
     def tearDown(self) -> None:
         self.chip.close()
-        self.sim = None
+        self.sim = None  # type: ignore[assignment]
 
     def test_get_chip_path(self) -> None:
         self.assertEqual(self.sim.dev_path, self.chip.path)
@@ -200,7 +200,7 @@ class StringRepresentation(TestCase):
 
     def tearDown(self) -> None:
         self.chip.close()
-        self.sim = None
+        self.sim = None  # type: ignore[assignment]
 
     def test_repr(self) -> None:
         self.assertEqual(repr(self.chip), 'gpiod.Chip("{}")'.format(self.sim.dev_path))
@@ -224,7 +224,7 @@ class StringRepresentationClosed(TestCase):
         self.chip = gpiod.Chip(self.sim.dev_path)
 
     def tearDown(self) -> None:
-        self.sim = None
+        self.sim = None  # type: ignore[assignment]
 
     def test_repr_closed(self) -> None:
         self.chip.close()
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
index acb0da9..aabfbee 100644
--- a/bindings/python/tests/tests_chip_info.py
+++ b/bindings/python/tests/tests_chip_info.py
@@ -15,10 +15,10 @@ class ChipInfoProperties(TestCase):
         self.info = self.chip.get_info()
 
     def tearDown(self) -> None:
-        self.info = None
+        self.info = None  # type: ignore[assignment]
         self.chip.close()
-        self.chip = None
-        self.sim = None
+        self.chip = None  # type: ignore[assignment]
+        self.sim = None  # type: ignore[assignment]
 
     def test_chip_info_name(self) -> None:
         self.assertEqual(self.info.name, self.sim.name)
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index f80d6a5..d7766ec 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -5,6 +5,7 @@ import time
 from datetime import timedelta
 from functools import partial
 from threading import Thread
+from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -54,13 +55,13 @@ class EdgeEventInvalidConfig(TestCase):
 class WaitingForEdgeEvents(TestCase):
     def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
-        self.thread = None
+        self.thread: Optional[Thread] = None
 
     def tearDown(self) -> None:
         if self.thread:
             self.thread.join()
             del self.thread
-        self.sim = None
+        self.sim = None  # type: ignore[assignment]
 
     def trigger_falling_and_rising_edge(self, offset: int) -> None:
         time.sleep(0.05)
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index 7e12b8e..1005647 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -7,6 +7,7 @@ import threading
 import time
 from dataclasses import FrozenInstanceError
 from functools import partial
+from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -51,7 +52,7 @@ class WatchingInfoEventWorks(TestCase):
     def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
         self.chip = gpiod.Chip(self.sim.dev_path)
-        self.thread = None
+        self.thread: Optional[threading.Thread] = None
 
     def tearDown(self) -> None:
         if self.thread:
@@ -59,8 +60,8 @@ class WatchingInfoEventWorks(TestCase):
             self.thread = None
 
         self.chip.close()
-        self.chip = None
-        self.sim = None
+        self.chip = None  # type: ignore[assignment]
+        self.sim = None  # type: ignore[assignment]
 
     def test_watch_line_info_returns_line_info(self) -> None:
         info = self.chip.watch_line_info(7)
@@ -138,8 +139,8 @@ class UnwatchingLineInfo(TestCase):
 
     def tearDown(self) -> None:
         self.chip.close()
-        self.chip = None
-        self.sim = None
+        self.chip = None  # type: ignore[assignment]
+        self.sim = None  # type: ignore[assignment]
 
     def test_unwatch_line_info(self) -> None:
         self.chip.watch_line_info(0)
diff --git a/bindings/python/tests/tests_line_info.py b/bindings/python/tests/tests_line_info.py
index 9828349..7bc244d 100644
--- a/bindings/python/tests/tests_line_info.py
+++ b/bindings/python/tests/tests_line_info.py
@@ -22,8 +22,8 @@ class GetLineInfo(TestCase):
 
     def tearDown(self) -> None:
         self.chip.close()
-        self.chip = None
-        self.sim = None
+        self.chip = None  # type: ignore[assignment]
+        self.sim = None  # type: ignore[assignment]
 
     def test_get_line_info_by_offset(self) -> None:
         self.chip.get_line_info(0)
-- 
2.34.1


