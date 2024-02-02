Return-Path: <linux-gpio+bounces-2895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D01068470D7
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 14:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F403C1C268AE
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 13:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E51D210F;
	Fri,  2 Feb 2024 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AxK0s7W2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD115A8
	for <linux-gpio@vger.kernel.org>; Fri,  2 Feb 2024 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706879295; cv=none; b=MyDkbls70uAmNCe7gwhsibT/IxU2vSXoX1eX+1uwmu5IOL1xGlzFgVdFVr50SoeYVwwZmw5T9pVgA6scOGlt2M/oJW4rwyXJb8jZLmCUSjeZw0oBMMGHS4C0nlcQXIU5LHyou6sLYT32Tce9fhOwrYN6XnVD0yPiG1cEneD8j6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706879295; c=relaxed/simple;
	bh=SuAH+sLE4yMjt/0E/pLSGR1zOGo5Qkdq0L6rjQDWWy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C2OyiBUm0ilV3jwFnuAS/6gDc+M0nRIs5yDgh6bB1pOFw91btoWk3FAqHGDJOrjS3xr43cuWU7cwYhR+9/iViroXfYbjskUVAly1KFSQObJS3+GszRmdXkKFn9pId7qTY78PPC/+nw8MK3y+40zpQjFXYcULPBqBYUp33lEj/hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AxK0s7W2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40ef6da20feso4462085e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Feb 2024 05:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706879292; x=1707484092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hmXDrvKKf3NDkcneDs13uRED22XHzQGSUVI2kT54Qbk=;
        b=AxK0s7W2V0M5BZ6DOee7vnOwqtZ3Hl10NfPKfLMroyij/ZI9tzk1P1nRqFVxRAX9MP
         74q077DcVj60djvZnZ2y3VmTVzMT+dnLcn4LK0VNVeW81ibJaJobLvRM5ldEh9dpC2t+
         pcF+BEW+5xg4Vrj0KCiXk+ocFT3Mia2khUvXMEGMYX81k/ho+7tAEqwMworwIqk18ByE
         tkRYJYaULH0+NQJ1mTDzzBprE+K+lFaWHKRssdptBEfB4zEY016dTdjfROH+J7b3AxmN
         ZcPTXG/i9VPYuhe0maZkIV2RqaKaAYHo845bnzI9oS7JzeXw69DAzhe7O8dARt8t7XpR
         6oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706879292; x=1707484092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmXDrvKKf3NDkcneDs13uRED22XHzQGSUVI2kT54Qbk=;
        b=LtWn2F3+I3P4+qeQs06dmuGUTiS7TejtOQ5fK4yYDPLYEIw2fYNT9xeMzem9GBPn3J
         RYHoPEIn7Z34UfPsE+8PuL/3fbWSvakyj5qNpE1XqF9fQhkhayLHZF2OjmRhgFkSzhKx
         3BC3ZFZ9sz3HlCXKVdh0mm8Zy62B+xPUX1mkpY7/qAplBPNMwlgDM1hv22pJ3fPua9eK
         /5cFkr6K1RSJS+7+ewaAr8Bke/yUy5+yVppvAnq7DOP6qjcaXJ+jfGi0mdmtEfCv92TC
         TrG0KtEaVrTGkeRiCwUY4sPAl49TV0GqoeerSjozxG7dOjl6DfNSBgO/1fN0l1ccrtWx
         Gbyw==
X-Gm-Message-State: AOJu0YyOE1H02u57mP3OpwEoSOuUA7x0T6WwxprwIarkw1RlegOv/9lv
	ROkIqLnxXH16gx9nvV6PPZMfocVprqB3rai9tNFUQzqcOqycZL0qdKto7bgvSMo=
X-Google-Smtp-Source: AGHT+IFyd009s7fIo/MhpcphBp5UsSBjFk677Bt7GAdyTvnfbKP+wXKp1+6TWYJAgidky/q2PnlKNA==
X-Received: by 2002:a05:600c:3595:b0:40f:c5c9:17cb with SMTP id p21-20020a05600c359500b0040fc5c917cbmr1795622wmq.17.1706879291591;
        Fri, 02 Feb 2024 05:08:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVjJ6EAGOLSsylyE6NJTNzCEWjO+3R4Oqd8XzCPZBdi5J7u+KChJAV+QoxevsPd3nCPj5Y1y/Vg4D5G9RjJGWxKcrpU3orLZvcXSSTVi1nIBuR5o1R6b5fUKrhXqQjuNFloK4t6ubstouilcW/lHLXpQCbpB0L7khBEqp1eKipCgA==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9e2f:25f4:4dc8:d42d])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b0040fb30f17e8sm7464354wmo.38.2024.02.02.05.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 05:08:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Robert Thomas <rob.thomas@raspberrypi.com>
Subject: [libgpiod][PATCH] bindings: python: fix __repr__() implementations
Date: Fri,  2 Feb 2024 14:08:06 +0100
Message-Id: <20240202130806.36334-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The __repr__() function should - if possible - return a valid Python
expression that can be used to instantiate a new object when evaluated.

LineSettings.__repr__() is missing comas between arguments. Both Chip and
LineSettings also don't prefix the returned string with 'gpiod.'. Fix
both functions and add more test cases - including actually using the
strings returned by __repr__() to create new objects and compare their
contents.

Reported-by: Robert Thomas <rob.thomas@raspberrypi.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py                | 2 +-
 bindings/python/gpiod/line_settings.py       | 2 +-
 bindings/python/tests/tests_chip.py          | 5 ++++-
 bindings/python/tests/tests_line_settings.py | 9 ++++++---
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index b3d8e61..19c62cd 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -333,7 +333,7 @@ class Chip:
         if not self._chip:
             return "<Chip CLOSED>"
 
-        return 'Chip("{}")'.format(self.path)
+        return 'gpiod.Chip("{}")'.format(self.path)
 
     def __str__(self) -> str:
         """
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 458fd81..41712cc 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -27,7 +27,7 @@ class LineSettings:
     # __repr__ generated by @dataclass uses repr for enum members resulting in
     # an unusable representation as those are of the form: <NAME: $value>
     def __repr__(self):
-        return "LineSettings(direction={}, edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={})".format(
+        return "gpiod.LineSettings(direction={}, edge_detection={}, bias={}, drive={}, active_low={}, debounce_period={}, event_clock={}, output_value={})".format(
             str(self.direction),
             str(self.edge_detection),
             str(self.bias),
diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index 8db4cdb..bd4ae34 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -202,7 +202,10 @@ class StringRepresentation(TestCase):
         self.sim = None
 
     def test_repr(self):
-        self.assertEqual(repr(self.chip), 'Chip("{}")'.format(self.sim.dev_path))
+        self.assertEqual(repr(self.chip), 'gpiod.Chip("{}")'.format(self.sim.dev_path))
+
+        cmp = eval(repr(self.chip))
+        self.assertEqual(self.chip.path, cmp.path)
 
     def test_str(self):
         info = self.chip.get_info()
diff --git a/bindings/python/tests/tests_line_settings.py b/bindings/python/tests/tests_line_settings.py
index 36dda6d..c6ca720 100644
--- a/bindings/python/tests/tests_line_settings.py
+++ b/bindings/python/tests/tests_line_settings.py
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+import datetime
 import gpiod
 
 from . import gpiosim
-from datetime import timedelta
 from gpiod.line import Direction, Edge, Bias, Drive, Value, Clock
 from unittest import TestCase
 
@@ -47,7 +47,7 @@ class LineSettingsAttributes(TestCase):
         settings.direction = Direction.INPUT
         settings.edge_detection = Edge.BOTH
         settings.bias = Bias.DISABLED
-        settings.debounce_period = timedelta(microseconds=3000)
+        settings.debounce_period = datetime.timedelta(microseconds=3000)
         settings.event_clock = Clock.HTE
 
         self.assertEqual(settings.direction, Direction.INPUT)
@@ -69,9 +69,12 @@ class LineSettingsStringRepresentation(TestCase):
     def test_repr(self):
         self.assertEqual(
             repr(self.settings),
-            "LineSettings(direction=Direction.OUTPUT, edge_detection=Edge.NONE bias=Bias.AS_IS drive=Drive.OPEN_SOURCE active_low=True debounce_period=datetime.timedelta(0) event_clock=Clock.MONOTONIC output_value=Value.INACTIVE)",
+            "gpiod.LineSettings(direction=Direction.OUTPUT, edge_detection=Edge.NONE, bias=Bias.AS_IS, drive=Drive.OPEN_SOURCE, active_low=True, debounce_period=datetime.timedelta(0), event_clock=Clock.MONOTONIC, output_value=Value.INACTIVE)",
         )
 
+        cmp = eval(repr(self.settings))
+        self.assertEqual(self.settings, cmp)
+
     def test_str(self):
         self.assertEqual(
             str(self.settings),
-- 
2.40.1


