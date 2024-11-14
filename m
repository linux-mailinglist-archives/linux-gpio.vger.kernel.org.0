Return-Path: <linux-gpio+bounces-13023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E99C8D47
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B441F2468A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F0513B288;
	Thu, 14 Nov 2024 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Q5sT6LpH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D202126BED
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595896; cv=none; b=gr7qhfbNf6k5pKJd7ms8fjqPTbWfprjwCRvr/UOt59YC1LpWyidzh1o1f0F8/jB+IWuJFEQt5VTRtJIxMWecu8Ke6Y32ZW7DccanRAKI2Fnfa2JJJ+F9VnWAGxVQhsd7Kut/YfXC9lhgEX/baKM/6B6IyxogpGdc/GJQbraTt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595896; c=relaxed/simple;
	bh=McWFR3uOMhE5eTI/8tBCKLAIlJJG+8U1ZkAEI8sdYZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NsQ5OBHj+Z9yOYDG//MKbkKIVsGhFX5Ec+FXnAEZySrzFlL479XAXcX/lxPQbz66aIJtCWrPLYnnrCkn4luBYdJHqRr1zoWW/Tf8cOCrbs9Whic4XQKDlVrdcu5x6p4RWfl7FeNSLZ5lTij8fzwEz1yM7ujXjSdpKjuSQ7XLOpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Q5sT6LpH; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 9B33720AB9;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=McWFR3uOMhE5eTI/8tBCKLAIlJJG+8U1ZkAEI8sdYZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5sT6LpHIPfLdYKYpvD5V9T6VYaxK2kDZtTc5Brs3mM4yrBXI03Hh+Fwuxvb0OzS5
	 u9LFMZzUECxcXZmZbjfDntHOjPWVKE++2ry39rMuqvRoXMRxpdwsbF1QBr/WMji1DE
	 aM5fTqPvddfWzQ1YjiLUGSyjwfn0Ao02AVr+s8PE=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 17/23] bindings: python: tests: make EventType private to prevent export
Date: Thu, 14 Nov 2024 08:51:10 -0600
Message-Id: <20241114145116.2123714-18-vfazio@xes-inc.com>
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

Previously, both tests_edge_event and tests_info_event had a public
module level EventType member.

The __main__ module for unittests does a star import from both modules
which led to an import conflict between the two.

It is not necessary to import EventType to run unit tests.

Now, EventType is private to avoid being imported via star syntax.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/tests_edge_event.py | 14 +++++++-------
 bindings/python/tests/tests_info_event.py | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index 7e7fada..c24d344 100644
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
index bbdbc0f..1976f4b 100644
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


