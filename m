Return-Path: <linux-gpio+bounces-7703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C50F91783D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27524281446
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74578145FEB;
	Wed, 26 Jun 2024 05:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOhA4EKe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEF413A88A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 05:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380349; cv=none; b=FmZdLSmZ2Pv7JF4Kg80J6LV7haAHbDWI5ZDA3jyo4T6xBcox9ixHB5AHw8C9w7Dw3xmXvfO8CIhOPSVKup9vjtqxTvg26xmCsFGIx7kgGt+277QF3v/hwJQayUuLoJKW7e4g8oGN6moKMIjCoIz96MH95spwy2gbUaN0RVE+NkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380349; c=relaxed/simple;
	bh=MeMfu367/5cTcGcy3hiEtQ6Cgy2S13CUdYI5Fp3I9uA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GJOhCQt12OPDbbgsuvDGdliRBG8wa6B9+lh9nkGdNeJ5LDohjsEOdPG2+SUnO+Y63kUWl1lev4dGTeAzjhCTKUO+1NBBpOuV3R+nqqaHOnWg+apz4YSAbGD0RZkn7v/SVx8YdgIf3DkrVbMYx8sZPMz8HLqAhwzYd10tv+1pHnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOhA4EKe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c70c372755so5006231a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 22:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719380347; x=1719985147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHbbhYphv1rn2xxMEGHnkWsU6wFQsZJUelXBc9q19C4=;
        b=iOhA4EKeiV6bfFUyKW6gfonubCrgOCtuzLn+iLxc14lVHPylln8qM3/3JfgXe3Ej+8
         NNzG/+pcZHN0TNpMpVLdDEzkSqN6riiaElM2xpsci54AiNUDqrcqmnc/Dntokf7U/lxb
         9TLzqeabVP8BNTPrMQIynpJQz9QuDWJCfzHI7LDHGGXFJ7Aq2vD6jffsPoy28WdbuCWm
         LdHDJLRka9mwkEv86TB7DBG9C6EkfZ+soHm4kOkSeKOQgLefXQlDwn+El2jLyA+04qXs
         Q4xIsYyyIChq/Gc5SJoEFuU6N/lZOQVeIQRAiV04xoX/k16t9KwAfN4CWkQ/RvRn6mr/
         6MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719380347; x=1719985147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHbbhYphv1rn2xxMEGHnkWsU6wFQsZJUelXBc9q19C4=;
        b=PSu8nZze9SGJlS+eLawGwm3XYdmz7DGMt942i3eJ62dXrjqNPZ0mgQG04LDTiEOrdD
         Jyr7YDu9UelnYluCf4y4GgvtmKCM23GBz0/1FRZtfmbzWQKt2XHKXvOJXar/thMbItaD
         U7S9z/PvGl7bEsXLfOTRo4XCW+UzwmBMH52cI5+IIYNzmOxSWyhf3Fuh/+t2R0V0CqoY
         3LFcnkN17lAYb+Vna2xvWGXoCK4QFUFK195eAe53BY8SKnuIHaeujye8P7Jk+6dW9/hU
         J9S5rnPfDsSaE9Nc74Ei5lhyW1FKmRQ0NynfxBq5rxs296i7iZ7SF2DjzRUpZcKwM4f0
         Q8Xg==
X-Gm-Message-State: AOJu0Yxn+sZH7tTAKXbECdcl7UIYT+7gla5jB22qCLAaeq5pBLbpnC+D
	bTCcJxfPiIL3zfxC59PjWkWgrXcbHzmiAAq9B9VJQBdZhIr9U5gYmtBpMA==
X-Google-Smtp-Source: AGHT+IGMxIdQW40RENsICTouBM2EV3vk99OsDAwNGkpbyUU/WONFoVzZb/KYwRIu3zutmt1HV6Z+jA==
X-Received: by 2002:a17:90a:2f41:b0:2c7:db01:c9ad with SMTP id 98e67ed59e1d1-2c8612a60f5mr7768786a91.18.1719380346895;
        Tue, 25 Jun 2024 22:39:06 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8d7b4f821sm674370a91.0.2024.06.25.22.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:39:06 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 3/3] bindings: python: tests: add coverage of kernel reconfigure as-is behaviour
Date: Wed, 26 Jun 2024 13:38:08 +0800
Message-Id: <20240626053808.179457-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626053808.179457-1-warthog618@gmail.com>
References: <20240626053808.179457-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel's handling of reconfigure with default values, as is the
case for providing a None value as the settings to the Python bindings'
reconfigure_lines(), resets any flags set to non-default values when the
line is requested to their default values.  While the flags are cleared,
the kernel makes no corresponding change to the electrical settings -
though subsequent calls to get and set values will apply the updated
flags.

The tests for missing or None settings are extended to demonstrate the
issue for active_low and drive flags, though the issue applies to all
flags.

The tests fail unless the kernel is patched to ignore reconfiguration
of lines without direction set.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/tests/tests_line_request.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 2f375d6..79167f1 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -5,7 +5,7 @@ import errno
 import gpiod
 
 from . import gpiosim
-from gpiod.line import Direction, Edge, Value
+from gpiod.line import Direction, Drive, Edge, Value
 from unittest import TestCase
 
 Pull = gpiosim.Chip.Pull
@@ -462,7 +462,9 @@ class ReconfigureRequestedLines(TestCase):
         self.sim = gpiosim.Chip(num_lines=8, line_names={3: "foo", 4: "bar", 6: "baz"})
         self.chip = gpiod.Chip(self.sim.dev_path)
         self.req = self.chip.request_lines(
-            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=Direction.OUTPUT)}
+            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=Direction.OUTPUT,
+                                                      active_low=True,
+                                                      drive=Drive.OPEN_DRAIN)}
         )
 
     def tearDown(self):
@@ -511,6 +513,8 @@ class ReconfigureRequestedLines(TestCase):
     def test_reconfigure_with_default(self):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
+        self.assertTrue(info.active_low)
+        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
         self.req.reconfigure_lines({
             0: gpiod.LineSettings(direction=Direction.INPUT),
             2: None,
@@ -520,10 +524,14 @@ class ReconfigureRequestedLines(TestCase):
         self.assertEqual(info.direction, Direction.INPUT)
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
+        self.assertTrue(info.active_low)
+        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
 
     def test_reconfigure_missing_offsets(self):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
+        self.assertTrue(info.active_low)
+        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
         self.req.reconfigure_lines(
                 {(6, 0): gpiod.LineSettings(direction=Direction.INPUT)}
             )
@@ -531,6 +539,8 @@ class ReconfigureRequestedLines(TestCase):
         self.assertEqual(info.direction, Direction.INPUT)
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
+        self.assertTrue(info.active_low)
+        self.assertEqual(info.drive, Drive.OPEN_DRAIN)
 
     def test_reconfigure_extra_offsets(self):
         info = self.chip.get_line_info(2)
-- 
2.39.2


