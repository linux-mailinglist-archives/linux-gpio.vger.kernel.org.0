Return-Path: <linux-gpio+bounces-13025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A69C8D49
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B81361F2439F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD13013C8F9;
	Thu, 14 Nov 2024 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="P44RjYjS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1796133987
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595896; cv=none; b=MPEfU6qCKiFR9n5RBoD45SjFpauVn8aiaZ4e/vEYgrU5UyzrlNGatvBfBb3vicaqcggY7DEANCHmcOSEh2Z4+m/V8FMcuARViqIiP0LSnwvotGZo8ei3/k+SExs9SgR/ByuCNEdR/2VgKGdnCuyFe+0I5CeYEsyJ7N7rPXYf2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595896; c=relaxed/simple;
	bh=+yW1lNtX3BKFoo/xRbe7YuEAUj8k0bc3UC9pBxL2csI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HCGcE0wLxARaPayJ1y3eQfS7Zm4EmvwaqyytXDlkP8vZlojIdMucPfOm2aoIi8XZ1+LGosuk0rVWuva3s4j7lKOpT9jeKa3STVX6tDMiwG7/2PyXcxt9Vutp9LnY9k3j61tnZOGhdtTd6g/9kK8trNB44V9McnqOt58/XndnunY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=P44RjYjS; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id F079120ABE;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595884; bh=+yW1lNtX3BKFoo/xRbe7YuEAUj8k0bc3UC9pBxL2csI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P44RjYjSstzHBDZJ1t5+Aa00N30YL/RiAQ7ARSP+TleSw5uXyMqUttns7cXkIkczz
	 f/weJP8JcfiZY1RBFGZujKf3yuX6ECVbTXeMj3Psk4yjWIgLGNW2m8cw5I3dkjF6ed
	 bP66j9fn5hVTIhrYgYyhdnwlHg8WWkHWUTANpcAw=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 21/23] bindings: python: tests: ignore purposeful type errors
Date: Thu, 14 Nov 2024 08:51:14 -0600
Message-Id: <20241114145116.2123714-22-vfazio@xes-inc.com>
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

Some of the unit tests intentionally call methods or assign properties
with invalid values to ensure they fail in an expected way.

Type checkers complain for these instances so inform them via directive
that these lines should be ignore for specific errors.

Additionally, some lines that access properties without assigning the
value look like they perform no action to linters.

To appease the linter, read the value into a throw-away variable.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/tests_chip.py         | 12 ++++++------
 bindings/python/tests/tests_chip_info.py    |  6 +++---
 bindings/python/tests/tests_info_event.py   | 12 ++++++------
 bindings/python/tests/tests_line_info.py    |  2 +-
 bindings/python/tests/tests_line_request.py | 16 ++++++++--------
 bindings/python/tests/tests_module.py       |  6 +++---
 6 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index 218f238..9b31e30 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -52,11 +52,11 @@ class ChipConstructor(TestCase):
 
     def test_missing_path(self) -> None:
         with self.assertRaises(TypeError):
-            gpiod.Chip()
+            gpiod.Chip()  # type: ignore[call-arg]
 
     def test_invalid_type_for_path(self) -> None:
         with self.assertRaises(TypeError):
-            gpiod.Chip(4)
+            gpiod.Chip(4)  # type: ignore[arg-type]
 
 
 class ChipBooleanConversion(TestCase):
@@ -85,10 +85,10 @@ class ChipProperties(TestCase):
 
     def test_properties_are_immutable(self) -> None:
         with self.assertRaises(AttributeError):
-            self.chip.path = "foobar"
+            self.chip.path = "foobar"  # type: ignore[misc]
 
         with self.assertRaises(AttributeError):
-            self.chip.fd = 4
+            self.chip.fd = 4  # type: ignore[misc]
 
 
 class ChipDevPathFromLink(TestCase):
@@ -172,7 +172,7 @@ class ClosedChipCannotBeUsed(TestCase):
         chip.close()
 
         with self.assertRaises(gpiod.ChipClosedError):
-            chip.path
+            _ = chip.path
 
     def test_close_chip_and_try_controlled_execution(self) -> None:
         sim = gpiosim.Chip()
@@ -182,7 +182,7 @@ class ClosedChipCannotBeUsed(TestCase):
 
         with self.assertRaises(gpiod.ChipClosedError):
             with chip:
-                chip.fd
+                _ = chip.fd
 
     def test_close_chip_twice(self) -> None:
         sim = gpiosim.Chip(label="foobar")
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
index aabfbee..fdceda9 100644
--- a/bindings/python/tests/tests_chip_info.py
+++ b/bindings/python/tests/tests_chip_info.py
@@ -31,13 +31,13 @@ class ChipInfoProperties(TestCase):
 
     def test_chip_info_properties_are_immutable(self) -> None:
         with self.assertRaises(AttributeError):
-            self.info.name = "foobar"
+            self.info.name = "foobar"  # type: ignore[misc]
 
         with self.assertRaises(AttributeError):
-            self.info.num_lines = 4
+            self.info.num_lines = 4  # type: ignore[misc]
 
         with self.assertRaises(AttributeError):
-            self.info.label = "foobar"
+            self.info.label = "foobar"  # type: ignore[misc]
 
 
 class ChipInfoStringRepresentation(TestCase):
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index 1005647..e726a54 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -29,13 +29,13 @@ class InfoEventDataclassBehavior(TestCase):
                 event = chip.read_info_event()
 
                 with self.assertRaises(FrozenInstanceError):
-                    event.event_type = 4
+                    event.event_type = 4  # type: ignore[misc, assignment]
 
                 with self.assertRaises(FrozenInstanceError):
-                    event.timestamp_ns = 4
+                    event.timestamp_ns = 4  # type: ignore[misc]
 
                 with self.assertRaises(FrozenInstanceError):
-                    event.line_info = 4
+                    event.line_info = 4  # type: ignore[misc, assignment]
 
 
 def request_reconfigure_release_line(chip_path: str, offset: int) -> None:
@@ -76,14 +76,14 @@ class WatchingInfoEventWorks(TestCase):
 
     def test_watch_line_info_no_arguments(self) -> None:
         with self.assertRaises(TypeError):
-            self.chip.watch_line_info()
+            self.chip.watch_line_info()  # type: ignore[call-arg]
 
     def test_watch_line_info_by_line_name(self) -> None:
         self.chip.watch_line_info("foobar")
 
     def test_watch_line_info_invalid_argument_type(self) -> None:
         with self.assertRaises(TypeError):
-            self.chip.watch_line_info(None)
+            self.chip.watch_line_info(None)  # type: ignore[arg-type]
 
     def test_wait_for_event_timeout(self) -> None:
         info = self.chip.watch_line_info(7)
@@ -162,7 +162,7 @@ class UnwatchingLineInfo(TestCase):
 
     def test_unwatch_line_info_no_argument(self) -> None:
         with self.assertRaises(TypeError):
-            self.chip.unwatch_line_info()
+            self.chip.unwatch_line_info()  # type: ignore[call-arg]
 
     def test_unwatch_line_info_by_line_name(self) -> None:
         self.chip.watch_line_info(4)
diff --git a/bindings/python/tests/tests_line_info.py b/bindings/python/tests/tests_line_info.py
index 7bc244d..5eb6cd5 100644
--- a/bindings/python/tests/tests_line_info.py
+++ b/bindings/python/tests/tests_line_info.py
@@ -46,7 +46,7 @@ class GetLineInfo(TestCase):
 
     def test_no_offset(self) -> None:
         with self.assertRaises(TypeError):
-            self.chip.get_line_info()
+            self.chip.get_line_info()  # type: ignore[call-arg]
 
 
 class LinePropertiesCanBeRead(TestCase):
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 76edb1d..bae8815 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -24,10 +24,10 @@ class ChipLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
 
     def test_passing_invalid_types_as_configs(self) -> None:
         with self.assertRaises(AttributeError):
-            self.chip.request_lines("foobar")
+            self.chip.request_lines("foobar")  # type: ignore[arg-type]
 
         with self.assertRaises(AttributeError):
-            self.chip.request_lines(None, "foobar")
+            self.chip.request_lines(None, "foobar")  # type: ignore[arg-type]
 
     def test_offset_out_of_range(self) -> None:
         with self.assertRaises(ValueError):
@@ -39,7 +39,7 @@ class ChipLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
 
     def test_request_no_arguments(self) -> None:
         with self.assertRaises(TypeError):
-            self.chip.request_lines()
+            self.chip.request_lines()  # type: ignore[call-arg]
 
 
 class ModuleLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
@@ -51,10 +51,10 @@ class ModuleLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
 
     def test_passing_invalid_types_as_configs(self) -> None:
         with self.assertRaises(AttributeError):
-            gpiod.request_lines(self.sim.dev_path, "foobar")
+            gpiod.request_lines(self.sim.dev_path, "foobar")  # type: ignore[arg-type]
 
         with self.assertRaises(AttributeError):
-            gpiod.request_lines(self.sim.dev_path, None, "foobar")
+            gpiod.request_lines(self.sim.dev_path, None, "foobar")  # type: ignore[arg-type]
 
     def test_offset_out_of_range(self) -> None:
         with self.assertRaises(ValueError):
@@ -66,7 +66,7 @@ class ModuleLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
 
     def test_request_no_arguments(self) -> None:
         with self.assertRaises(TypeError):
-            gpiod.request_lines()
+            gpiod.request_lines()  # type: ignore[call-arg]
 
 
 class ChipLineRequestWorks(TestCase):
@@ -200,7 +200,7 @@ class LineRequestGettingValues(TestCase):
 
     def test_get_values_invalid_argument_type(self) -> None:
         with self.assertRaises(TypeError):
-            self.req.get_values(True)
+            self.req.get_values(True)  # type: ignore[arg-type]
 
 
 class LineRequestGettingValuesByName(TestCase):
@@ -602,7 +602,7 @@ class ReleasedLineRequestCannotBeUsed(TestCase):
             req.release()
 
             with self.assertRaises(gpiod.RequestReleasedError):
-                req.fd
+                _ = req.fd
 
 
 class LineRequestSurvivesParentChip(TestCase):
diff --git a/bindings/python/tests/tests_module.py b/bindings/python/tests/tests_module.py
index 2718624..efd49db 100644
--- a/bindings/python/tests/tests_module.py
+++ b/bindings/python/tests/tests_module.py
@@ -17,15 +17,15 @@ class IsGPIOChip(TestCase):
 
     def test_is_gpiochip_invalid_argument(self) -> None:
         with self.assertRaises(TypeError):
-            gpiod.is_gpiochip_device(4)
+            gpiod.is_gpiochip_device(4)  # type: ignore[arg-type]
 
     def test_is_gpiochip_superfluous_argument(self) -> None:
         with self.assertRaises(TypeError):
-            gpiod.is_gpiochip_device("/dev/null", 4)
+            gpiod.is_gpiochip_device("/dev/null", 4)  # type: ignore[call-arg]
 
     def test_is_gpiochip_missing_argument(self) -> None:
         with self.assertRaises(TypeError):
-            gpiod.is_gpiochip_device()
+            gpiod.is_gpiochip_device()  # type: ignore[call-arg]
 
     def test_is_gpiochip_good(self) -> None:
         sim = gpiosim.Chip()
-- 
2.34.1


