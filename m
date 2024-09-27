Return-Path: <linux-gpio+bounces-10521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BAD988A96
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0414B1F2292D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48DE1C242E;
	Fri, 27 Sep 2024 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="MaXa9902"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20451C2323
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463329; cv=none; b=NViDG9ukaOuP7Uin8udf65N/lOMAnoSBrusOQUQ9yR3B4hkhyNOyCpqX+Y5cJaUGGfUKRUqJTdp1X8NNMXJHcBDaOvYCUnCGTSTuk1zdxZ4lgGxEovFXepbJvFxBVu3q77F+USr0G7xDFvHuvCHvV6SaH/VoFe20Ihs0Y/Tsbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463329; c=relaxed/simple;
	bh=/x8Rs9BWHy1aC8uDHr6soOcZ3jOw21eTjTe5cSbL4As=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EL5syT2e/bHjtp2jm1rgvU/kXF+hibbyhM8nIglU6CfJqO1j9ogb6qJ7S7UJLlgJrzMjlvMcRMRpHzGmCGkuAWvmVw2wsgccvrd4mNv+wK0LT3Kj7w2bMYvWNlr68fXjWYe/XPEq1JDlA76rYPbBAKyvSSBnsgjJ4TSFhi4njI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=MaXa9902; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 7CBA222AD9;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=/x8Rs9BWHy1aC8uDHr6soOcZ3jOw21eTjTe5cSbL4As=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MaXa9902bEsqYkYCaylhZyjI1wBgVshHSQ3sWBpIfIo3nqyK4cln7tmAcSvSIe+zw
	 FLqKof2+8n+LgYBgJ6lt33uwZ3u+NkTe+/nfYI+epU/FK9HZQHPSq/rLVuv46dLeIK
	 fr+m6VCS+wHbRT5CEaDOHL2VH9Q0q8ZTO8oo3OdY=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 19/22] bindings: python: tests: ignore purposeful type errors
Date: Fri, 27 Sep 2024 13:53:55 -0500
Message-Id: <20240927-vfazio-mypy-v1-19-91a7c2e20884@xes-inc.com>
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
 bindings/python/tests/tests_chip.py         | 12 ++++++------
 bindings/python/tests/tests_chip_info.py    |  6 +++---
 bindings/python/tests/tests_info_event.py   | 12 ++++++------
 bindings/python/tests/tests_line_info.py    |  2 +-
 bindings/python/tests/tests_line_request.py | 16 ++++++++--------
 bindings/python/tests/tests_module.py       |  6 +++---
 6 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index 9c8f87579469e684ed3b6a5dbcef35e0856127ba..89d5df4341eceefbc0eed9b880ac641caa682af5 100644
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
index acb0da9d1f302186a2a6bca3e2f5a46abd3ebc51..99259af307fa25bc3ff39574a1bea1cc9dc254a6 100644
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
index 7e12b8e33f1a425423a1b2f30dd5af9a331906e9..1e6ab941799047c7e5383a6d0a2512c669655d19 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -28,13 +28,13 @@ class InfoEventDataclassBehavior(TestCase):
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
@@ -75,14 +75,14 @@ class WatchingInfoEventWorks(TestCase):
 
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
@@ -161,7 +161,7 @@ class UnwatchingLineInfo(TestCase):
 
     def test_unwatch_line_info_no_argument(self) -> None:
         with self.assertRaises(TypeError):
-            self.chip.unwatch_line_info()
+            self.chip.unwatch_line_info()  # type: ignore[call-arg]
 
     def test_unwatch_line_info_by_line_name(self) -> None:
         self.chip.watch_line_info(4)
diff --git a/bindings/python/tests/tests_line_info.py b/bindings/python/tests/tests_line_info.py
index 9828349810eed0e3fa755f8557ec314d3e86ed7a..33d38a6de486447d326e8e3cb73934898ea2aba2 100644
--- a/bindings/python/tests/tests_line_info.py
+++ b/bindings/python/tests/tests_line_info.py
@@ -46,7 +46,7 @@ class GetLineInfo(TestCase):
 
     def test_no_offset(self) -> None:
         with self.assertRaises(TypeError):
-            self.chip.get_line_info()
+            self.chip.get_line_info()  # type: ignore[call-arg]
 
 
 class LinePropertiesCanBeRead(TestCase):
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 76edb1d273f103c1b2f72974f5364728f121b05b..bae8815b98654145c26071c4fc40816469313192 100644
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
index 2718624c7e0dd41259c7006e37d48f52cc279b1d..efd49db59e6567b9bc5ee0096ccce3281ac466f3 100644
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

