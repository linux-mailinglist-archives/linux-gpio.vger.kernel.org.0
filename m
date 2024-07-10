Return-Path: <linux-gpio+bounces-8170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D03E92D214
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 14:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB05F1F25029
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 12:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A727192465;
	Wed, 10 Jul 2024 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f2/43aAW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8561922F8
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616250; cv=none; b=i8vforhkNrJaU0KUUW9KcuhhcbvoDgTCILa7Zy1o57SoWF3QLNnabjMtB4F3b76bOatCOXUCmq53IUghmrGKuZwjQ/1+rYKoUopAld9o+hNFkDRr9Ve+EgcXyH1lCt21TtZaev2jBJBiUuox8f1UrXgrIVMD580mXBxUTc1M6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616250; c=relaxed/simple;
	bh=mXATVwPEk7UYK5T45yRSX/AmjGb7sfW+E8DIBjs8f74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUuXmOuptQpbHkZvcaCjLk7v6cdOxwKl0yKbbp7OdXxT4rUylDUsLE7anonlEyP2fsCQX8ju+JZqLEN4/+mKIODVLop/j47t/kWbHcng7sdwf9S0QxQ/SJvKp2K7EIcvjC3utjfDzvjzJNpCAYgc5N6O1+w11SFKZyLWoGXch80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f2/43aAW; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea2f58448so8088213e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720616247; x=1721221047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNXqWR3SzVEiokTh+pyWprWaaZ+CshWIgCgK6X8PJMY=;
        b=f2/43aAWje9zIGksX4M/20lyy5lFoppKGd7bmLyfO9GE2YfM7MexMFI3EbRCtrUc4K
         GqAmW9QaMZL7/qaHfg/KvSU2sl6XpIZhib/dLNhnxg/37G8+fVWACD/f+eK3H85Be2Yh
         qxu2HC5pV6DF7aH8CqRuBg6gXIHRl52TZ98vBRoQqjr2CIn1d5ug9Y0gNMebppwBygpT
         5oGJO4C0stiADIhC3PrpcOv2nzdDv2syQU3DCK7NmBiYDoQik3+yM/TcNEkA+YbW4Op/
         erkKd46MKPGCQPO9C5KQ/tTuPTrv2HHwAHS/mQfR9q4ZY+uf2GI+6N9VAJ0iQvtAube8
         8yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720616247; x=1721221047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNXqWR3SzVEiokTh+pyWprWaaZ+CshWIgCgK6X8PJMY=;
        b=kQOmRjIodvsP0Jm1t/EO7XuGBrYb0GOl0PFhvOLJsQWypFA7Z6pwAIfBwvXYdn3ll9
         wtUE1k9kT85d7nCXUqHNAwvg0vcKh4r71AECBzMnTQregkozQxdCQW4k1i1NWQ1hXvWw
         t9cMdXa1ZRqI4igZdYD6xAWrJVOshV0nu2jxE6i08B2AyLPdkI9zUXNcy3iJZTbRrl0O
         hgjJJENhg/89K2UCDBUiroBmNwDbwf9XjlB7XpvJ062EFaZp1xvt5U5VXk9c8GfvIvKj
         YE6sTyx2mva1LUwmQgdPHgl8I+8wMCcBcx+e7mWGYxonIiO6YoMBZTlJkZV9fNC+GEbI
         Nk4Q==
X-Gm-Message-State: AOJu0YyUxqmkZM4feky3KrGB+4RkL1WhKR5BY064HUjCGOty/G1ZpcgU
	vJfSa5q75EO5YHOwUW9f7qcodwZ0bHI9XUuTOPrAME/n6iRFwPB5+utcwbqGD0E=
X-Google-Smtp-Source: AGHT+IHmbAW4e/O7btALU4TCz/KFup8xzPkJkZsCN8uz1p9FcSTTqDmbeJS+tdNIXtp8xJT5qM0vrw==
X-Received: by 2002:a05:6512:31d0:b0:52c:e11e:d493 with SMTP id 2adb3069b0e04-52eb9991646mr3641095e87.26.1720616247344;
        Wed, 10 Jul 2024 05:57:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5d33:75a6:b07c:5579])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7416bcsm81426675e9.43.2024.07.10.05.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:57:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Chuang Zhu <git@chuang.cz>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 2/2] bindings: python: tests: add a new test case
Date: Wed, 10 Jul 2024 14:57:19 +0200
Message-ID: <20240710125719.33655-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710125719.33655-1-brgl@bgdev.pl>
References: <20240710125719.33655-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuang Zhu <git@chuang.cz>

Add a test-case for line request by name with multiple entries.

Signed-off-by: Chuang Zhu <git@chuang.cz>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[Bartosz:
  - tweak the commit message
  - improve the test class name
  - extend the test assertion to test the 'baz' line too]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/tests/tests_line_request.py | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 79167f1..c79a324 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -310,6 +310,40 @@ class LineRequestComplexConfig(TestCase):
                 self.assertEqual(chip.get_line_info(3).edge_detection, Edge.BOTH)
 
 
+class LineRequestMixedConfigByName(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(
+            num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz", 0: "xyz"}
+        )
+        self.req = gpiod.request_lines(
+            self.sim.dev_path,
+            {
+                ("baz", "bar"): gpiod.LineSettings(direction=Direction.OUTPUT),
+                ("foo", "xyz"): gpiod.LineSettings(direction=Direction.INPUT),
+            },
+        )
+
+    def tearDown(self):
+        self.req.release()
+        del self.req
+        del self.sim
+
+    def test_set_values_by_name(self):
+        self.req.set_values({"bar": Value.ACTIVE, "baz": Value.INACTIVE})
+
+        self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
+
+    def test_get_values_by_name(self):
+        self.sim.set_pull(0, Pull.UP)
+        self.sim.set_pull(2, Pull.DOWN)
+
+        self.assertEqual(
+            self.req.get_values(["foo", "xyz", "baz"]),
+            [Value.INACTIVE, Value.ACTIVE, Value.INACTIVE],
+        )
+
+
 class RepeatingLinesInRequestConfig(TestCase):
     def setUp(self):
         self.sim = gpiosim.Chip(num_lines=4, line_names={0: "foo", 2: "bar"})
-- 
2.43.0


