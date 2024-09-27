Return-Path: <linux-gpio+bounces-10518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C00988A95
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D394B22E73
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5D41C2337;
	Fri, 27 Sep 2024 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="CEQrtyMk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624881C233F
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463329; cv=none; b=uTADHHhktH+JXis5Q1RzZjWybYQoCIg8+8SywnWfLo2rYSHjQxAiGVqoF6h+vMMajB5CS79kfM4kBFC2epHMkwRkneZDd8+IVuzS3ipwXOZdnCM5xIxtdNQvcIPGka8PxdpwAVy0vCbmW+s4MvhwgIyEA7HcDs8pDS+pdOFQoX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463329; c=relaxed/simple;
	bh=g3Y99R0h2yatq0LeTDa8NE58aE8IF1GFOfiF5D6xGBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbIis5sAfrc7wBZPKQ16g0kcAjL82CqsUfoNk5DenR0H3Sa2xXAFn+og0zHJ+TZeN3yqs/picPqMTkgZc4eRxFd9PrtnXxNWqDNAGuqNfKSTWGLVaxIUw3UuYqy+X0dukCwXoTuUHWXZ7cgdG6CV1JCIN57qhapkkBllcB6vJ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=CEQrtyMk; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 34D4D2183A;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=g3Y99R0h2yatq0LeTDa8NE58aE8IF1GFOfiF5D6xGBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CEQrtyMkEg8QJ9AlrLPtPE69xq9vPWWbk93LiY0Rgl2mMsO7VRlbQ2VyfrlOjZeOG
	 H+Hz3L78jnFdc4a5LdiODc+khS3FgS2qyuvm1NoGWulVVKPojRH3EZ3M86ZHeXSp6N
	 PvFnyLQ3tZgBzqrW6tuxK/bosHVaFhTbfRRYarbQ=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 16/22] bindings: python: tests: make EventType private to prevent export
Date: Fri, 27 Sep 2024 13:53:52 -0500
Message-Id: <20240927-vfazio-mypy-v1-16-91a7c2e20884@xes-inc.com>
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
 bindings/python/tests/tests_edge_event.py | 14 +++++++-------
 bindings/python/tests/tests_info_event.py | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index 7e7fada38cf2a983172aaa9c8400fbfe0d3b7a7d..c24d344fdbd6a1b9eda9497afab8a61c5ecb8f09 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -12,7 +12,7 @@ from gpiod.line import Direction, Edge
 
 from . import gpiosim
 
-EventType = gpiod.EdgeEvent.Type
+_EventType = gpiod.EdgeEvent.Type
 Pull = gpiosim.Chip.Pull
 
 
@@ -87,7 +87,7 @@ class WaitingForEdgeEvents(TestCase):
             events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
-            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.event_type, _EventType.RISING_EDGE)
             self.assertEqual(event.line_offset, 2)
             ts_rising = event.timestamp_ns
 
@@ -95,7 +95,7 @@ class WaitingForEdgeEvents(TestCase):
             events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
-            self.assertEqual(event.event_type, EventType.FALLING_EDGE)
+            self.assertEqual(event.event_type, _EventType.FALLING_EDGE)
             self.assertEqual(event.line_offset, 2)
             ts_falling = event.timestamp_ns
 
@@ -114,7 +114,7 @@ class WaitingForEdgeEvents(TestCase):
             events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
-            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.event_type, _EventType.RISING_EDGE)
             self.assertEqual(event.line_offset, 6)
 
             self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
@@ -132,7 +132,7 @@ class WaitingForEdgeEvents(TestCase):
             events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
-            self.assertEqual(event.event_type, EventType.FALLING_EDGE)
+            self.assertEqual(event.event_type, _EventType.FALLING_EDGE)
             self.assertEqual(event.line_offset, 6)
 
             self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
@@ -150,7 +150,7 @@ class WaitingForEdgeEvents(TestCase):
             events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
-            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.event_type, _EventType.RISING_EDGE)
             self.assertEqual(event.line_offset, 2)
             self.assertEqual(event.global_seqno, 1)
             self.assertEqual(event.line_seqno, 1)
@@ -159,7 +159,7 @@ class WaitingForEdgeEvents(TestCase):
             events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
-            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.event_type, _EventType.RISING_EDGE)
             self.assertEqual(event.line_offset, 4)
             self.assertEqual(event.global_seqno, 2)
             self.assertEqual(event.line_seqno, 1)
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index bbdbc0fa6e69c59a32d67d00f5e785105c90e840..1976f4be8b9a63942275875ada00472402524350 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -14,7 +14,7 @@ from gpiod.line import Direction
 
 from . import gpiosim
 
-EventType = gpiod.InfoEvent.Type
+_EventType = gpiod.InfoEvent.Type
 
 
 class InfoEventDataclassBehavior(TestCase):
@@ -101,7 +101,7 @@ class WatchingInfoEventWorks(TestCase):
 
         self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
         event = self.chip.read_info_event()
-        self.assertEqual(event.event_type, EventType.LINE_REQUESTED)
+        self.assertEqual(event.event_type, _EventType.LINE_REQUESTED)
         self.assertEqual(event.line_info.offset, 7)
         self.assertEqual(event.line_info.direction, Direction.INPUT)
         ts_req = event.timestamp_ns
@@ -109,14 +109,14 @@ class WatchingInfoEventWorks(TestCase):
         # Check that we can use a float directly instead of datetime.timedelta.
         self.assertTrue(self.chip.wait_info_event(1.0))
         event = self.chip.read_info_event()
-        self.assertEqual(event.event_type, EventType.LINE_CONFIG_CHANGED)
+        self.assertEqual(event.event_type, _EventType.LINE_CONFIG_CHANGED)
         self.assertEqual(event.line_info.offset, 7)
         self.assertEqual(event.line_info.direction, Direction.OUTPUT)
         ts_rec = event.timestamp_ns
 
         self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
         event = self.chip.read_info_event()
-        self.assertEqual(event.event_type, EventType.LINE_RELEASED)
+        self.assertEqual(event.event_type, _EventType.LINE_RELEASED)
         self.assertEqual(event.line_info.offset, 7)
         self.assertEqual(event.line_info.direction, Direction.OUTPUT)
         ts_rel = event.timestamp_ns
@@ -146,7 +146,7 @@ class UnwatchingLineInfo(TestCase):
         with self.chip.request_lines(config={0: None}) as request:
             self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
             event = self.chip.read_info_event()
-            self.assertEqual(event.event_type, EventType.LINE_REQUESTED)
+            self.assertEqual(event.event_type, _EventType.LINE_REQUESTED)
             self.chip.unwatch_line_info(0)
 
         self.assertFalse(

-- 
2.34.1

