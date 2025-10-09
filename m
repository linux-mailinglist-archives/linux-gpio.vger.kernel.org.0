Return-Path: <linux-gpio+bounces-26941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95FBC9317
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F13419E83F0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A315A2E7166;
	Thu,  9 Oct 2025 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKpGv542"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74582E2EFC
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015147; cv=none; b=iKS/NIJcHyoiUqTtHWzsyqx6DdiCH1ZJ+2EdIHS2Xhe9zT3yAR35xKWDbT7o7NXi9BC5Ec9G6Wo/nzKxdyPVyBJ7W85CuUamJwf33c5o2OOLaBWOkeOgmm292cN/sMl/p4HGNX/LyBGBn3scLVYuSQ5pryI/+A1AUWMU+Ry6dP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015147; c=relaxed/simple;
	bh=UzLoTtUzFlZcShuVunvjOZUSjCqU5u8/i2LeH5cXgKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwUDYD4FRGJkVCGKeQFoPIJhXdE2Ihse+H0JMUldK7kdlY2Gd+0MEsPAybaXb2W8pKiYxgJE/duEwtw7/0cvnTJjnn87h3aFgpR7yTY5Gwce3G6TZY04cQ1jB42W7ZG+0X/MDhjcG/Qh7ygRnc2zUJ6VuT+BrBoa9mpqqdEMQTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKpGv542; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-42f61004750so3965085ab.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015145; x=1760619945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLdNY5sSUejZry3f1m/9wjlxUBNea65VYu/OfMo7Wb0=;
        b=LKpGv542sN+3dJ99C0Tyk9Z/LruzISXCgAm2F+/KKnmzse/qmyhwlVj8D8H5oHn8Pd
         WyNPWGfgaI/MaCRMYlZci3+foClRfh+XVRtyuLrkws7UVM1/Rdvpf2SFRt6RzE2POzt2
         kTUeiJO82uApt5jsutx7R87C7/vkqUF00enRATRzadqX63IKx9gGVU0pVC9mNW5/YZ6r
         HdeikqdXCoB5YJhlfLwQzar2n3dJ6H7JtBRldE7wJEN4PESoWjs5giQmb5/iWny9dqom
         wMnLXOOH6khoyRQzTce3m5x2KZSc6PZXvIqaB8qGBNIEn+/jM1RsbhOwuIjj+Fef6baH
         Pudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015145; x=1760619945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLdNY5sSUejZry3f1m/9wjlxUBNea65VYu/OfMo7Wb0=;
        b=hbMzHuX+8zn7KtWMRHayvg6OtNOEDefA9YHXnlR873ehim62CHkOyQFgvLkzJFRUTG
         i3nkU6BMSSaIEU4Jb78PcIgWvJeubiHhhb5Xv8tFzriIXxq9Uyu1Ft/xY2VyjwoTVZ0L
         VqfGuKuLGhy0mBmJxl1uwIyczCnfZ+R8UUc2THL/eS2glE8JsdClzoR4DWysh6ge4qTa
         OLbvcopxh7MPRoQ8ME1BeO+7zdjV8ER+2WTwVgJM0FYAidEQHMjlhrU+f4wqtj6B4Rma
         DuHgBFnFxEVDJXuF2EYZYvLRkft/Jb1UOly4y3LG6qWkDot5MvGPndKJg4EBIXC6k+65
         NZlw==
X-Gm-Message-State: AOJu0Yz51Wq3TurSBoLpXwKg/KngCtwag5WJZ3h3iXsoGgeuYtFybBqH
	T81W9Kguonh3jxq1u3coxNu3Jt4q0FZIfAC95Xv1aXtys6gETodPgZXe8J13IBIn
X-Gm-Gg: ASbGncs+hOJJJI6hLSQFOSa0Rq7q1vsp4oEdWCh8ReGuJDlKk/vG++9qsSVEtZS3uPW
	mLH0nSoBwhXlYiggTJDkWuPDhEX/7KPJpTnjc8EsVRZ/JNSnIkpzdv094CA39U4+PyICh2bi+y1
	4h3MZlasUubaRUjOwXHHWQlwkCl0WFW2S6739jrrtVBsGcSj//C6jxL4jGkmlf0UMuO0CvVLZzV
	zLWQae1V1PT7/aPeKsrxbrHyVmRISUdIsgCiFJ0WElOij46KHk623AXuYfBN6hc8GR3sDCmTJPN
	VDjNGQfD48KjaUaha78f9yE552ReLX4haKrYmNCRrRM59ZKGBG2cEpwT7oLGhrX5Iwgw0Wc4w49
	D368TGd/OkYF9TCdB7DTq1PAZObRoxk+iEQ3TDLUbnTqmuzrDUzjpZPD29Olk5w==
X-Google-Smtp-Source: AGHT+IHjHmy5bMxNdu/CL2sqoTmioA5+xFj2LwUIx2gfmrpRdNDcAiWctbr84BZi9lYxJKOz0YIlVg==
X-Received: by 2002:a05:6e02:1fcb:b0:42d:8695:12f with SMTP id e9e14a558f8ab-42f873fd81cmr61615955ab.23.1760015144453;
        Thu, 09 Oct 2025 06:05:44 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:44 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 8/9] bindings: python: chip: map names for lines requested by offset
Date: Thu,  9 Oct 2025 08:05:14 -0500
Message-ID: <20251009130516.3729433-9-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130516.3729433-1-vfazio@gmail.com>
References: <20251009130516.3729433-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, lines requested by name could also be referred to by offset
when calling LineRequest.reconfigure_lines. However, lines requested by
offset could not be reconfigured by name if they had one.

Now, the name map is populated if the line has a name regardless of if
it's requested by name or offset.

To make behavior as consistent with earlier versions as possible, a line
requested by name always returns the first line on the chip with that
name. If there are duplicate line names and lines are requested by
offset, the first line in the request is mapped to the name. A line
requested by name always overrides a name mapped via an offset request.

If lines 0-3 all have the same name and a config object looks like:
  {("foo", 1, 2): None}
or
  {(1, "foo", 2): None}

Then lines 0-2 are requested and line 0 can be reconfigured by name.

If the config object looks like:
  {(1, 2): None}

Then lines 1 and 2 are requested and line 1 can be reconfigured by name.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py               |  9 ++++++
 bindings/python/tests/tests_line_request.py | 35 ++++++++++++++++++---
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 2e66018..a98fce6 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -302,7 +302,16 @@ class Chip:
                 )
 
             if isinstance(line, str):
+                # lines specifically requested by name overwrite any entries
                 name_map[line] = offset
+            else:
+                name = cast("_ext.Chip", self._chip).get_line_name(offset)
+                # Only track lines with actual names. Names from offsets do not
+                # overwrite existing entries (such as requests by name). So if
+                # multiple lines have the same name, the first in the request
+                # list is the one addressable by name
+                if name and name not in name_map:
+                    name_map[name] = offset
 
             line_cfg.add_line_settings(
                 offsets, _line_settings_to_ext(settings or LineSettings())
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 66e9e8d..aa2cd83 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -71,7 +71,9 @@ class ModuleLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
 
 class ChipLineRequestWorks(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(num_lines=8, line_names={5: "foo", 7: "bar"})
+        self.sim = gpiosim.Chip(
+            num_lines=8, line_names={0: "fizz", 1: "fizz", 5: "foo", 7: "bar"}
+        )
         self.chip = gpiod.Chip(self.sim.dev_path)
 
     def tearDown(self) -> None:
@@ -113,6 +115,16 @@ class ChipLineRequestWorks(TestCase):
         with self.chip.request_lines(config={"foo": None}) as req:
             self.assertEqual(req.offsets, [5])
 
+    def test_request_line_with_duplicate_names_by_offset(self) -> None:
+        with self.chip.request_lines(config={(1, 0): None}) as req:
+            self.assertEqual(req.offsets, [1, 0])
+            self.assertEqual(req.lines, [1, 0])
+
+    def test_request_line_with_duplicate_names_mixed_mode(self) -> None:
+        with self.chip.request_lines(config={(1, "fizz"): None}) as req:
+            self.assertEqual(req.offsets, [1, 0])
+            self.assertEqual(req.lines, [1, "fizz"])
+
 
 class ModuleLineRequestWorks(TestCase):
     def setUp(self) -> None:
@@ -500,11 +512,13 @@ class LineRequestSetOutputValues(TestCase):
 
 class ReconfigureRequestedLines(TestCase):
     def setUp(self) -> None:
-        self.sim = gpiosim.Chip(num_lines=8, line_names={3: "foo", 4: "bar", 6: "baz"})
+        self.sim = gpiosim.Chip(
+            num_lines=8, line_names={2: "fizz", 3: "foo", 4: "bar", 6: "baz", 7: "foo"}
+        )
         self.chip = gpiod.Chip(self.sim.dev_path)
         self.req = self.chip.request_lines(
             {
-                (0, 2, "foo", "baz"): gpiod.LineSettings(
+                (7, 0, 2, "foo", "baz"): gpiod.LineSettings(
                     direction=Direction.OUTPUT, active_low=True, drive=Drive.OPEN_DRAIN
                 )
             }
@@ -530,7 +544,7 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
         self.req.reconfigure_lines(
-            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=Direction.INPUT)}
+            {(0, "fizz", "foo", "baz"): gpiod.LineSettings(direction=Direction.INPUT)}
         )
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
@@ -609,6 +623,19 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
+    def test_reconfigure_duplicate_names_with_offset(self) -> None:
+        info3 = self.chip.get_line_info(3)
+        info7 = self.chip.get_line_info(7)
+        self.assertEqual(info3.direction, Direction.OUTPUT)
+        self.assertEqual(info7.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+            {("foo", 7): gpiod.LineSettings(direction=Direction.INPUT)}
+        )
+        info3 = self.chip.get_line_info(3)
+        info7 = self.chip.get_line_info(7)
+        self.assertEqual(info3.direction, Direction.INPUT)
+        self.assertEqual(info7.direction, Direction.INPUT)
+
 
 class ReleasedLineRequestCannotBeUsed(TestCase):
     def test_using_released_line_request(self) -> None:
-- 
2.43.0


