Return-Path: <linux-gpio+bounces-26942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A24BC9320
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC46C4FA71D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3FA2E7648;
	Thu,  9 Oct 2025 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VadjaSTq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66D2E6CD4
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015148; cv=none; b=stRBzPZpzkZXVsdiE/bKt5NN9OFZnohr/6IGqwoeQ7sN/vdBH4U0e7o62nfkq+PDb3akUKRWa8h+fmKSDeefb5yAR4uGM1k87qjxgGKPNYZRWsBkR8RZoDUoBbLLeXGbVE1pUnHTkW5zDIATQPobZM94UY0MOBVG2HGLhvtuXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015148; c=relaxed/simple;
	bh=ba57nUkplctZfbyN0pnAMf//XjM7wgWS0AQGFEbZIvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f56HewqB2sbLmJRBXuD1JGgdlbU4WXANeaWFXCrEtDpI+3UPNpMdO6Qza8JZ9KW1ug55XP0WY3NxbzzakeefOQMNZZwHAgG7z5YBIm7znhWcgKwjKt9s4SyTVqxDISfycc16j++6XjSWA0B0f1ag6UlZkAR5J5pXYHQ3Aji4Wsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VadjaSTq; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-4248b34fc8eso10657935ab.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015145; x=1760619945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP0hMOgMUOCJcZOVP5pU6LPt2CNUr/qAYBlohFWR4pI=;
        b=VadjaSTqMB6UJSLS2jj2525mODsqUmFg1KqIGNsn/6gkFdA/InIYEwjQ+Wa6ez4Fhq
         PTfGQk+LHW7iDV4iiEyu17vCHwhiw91GhNxRsmv8zm1wQ5ACjZw1GF+qCBysFdSRNF2y
         SG60WU4C9BbIqI9QRxVbL00H5WPXxjwLtdJ8xWTGVXGsGseoUFNmnlF3uknd8QXZqwv5
         tS9EcTz5B6SEb/guZytyFPRuph7LvLafKtrtwr49vdvrUYBQ4N2YdWwkJST0XAqrrNCM
         D5ixh+qNXck9Iuj4oImgJ9gDf4GGQ7wVCDlHkriXmnkHR0GJ1EMn0VqEPmhVQMxeMak6
         COqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015146; x=1760619946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uP0hMOgMUOCJcZOVP5pU6LPt2CNUr/qAYBlohFWR4pI=;
        b=b5/cLWB5Wtfa34cv1kzAl1aTYMcHL6U9sB8VuZKj9ok0YCoFTticUOYwkMAaCLN0AS
         P3CEMiwo+pUySVctCbl5Wz5MskbMu1gErd4bKkusu00ufUu2xzopcJVES0U6V96dW8kc
         4jB1q0I9npXyefpB3oBNwAQR9iDn9LloUS/Nu4SX9IOaeFxifSl6wDWBSXZyzL28kxjR
         LxOF1a5CS0BN4W6wD1wnSDEd2Xu1mLxf8oPn2OQzB5xTxlWeceeEBLMWh5wL6I/X2aVF
         x7ta3ewgnnFZBTtCiycsNZthUeYRAAAfXWqloMtAu3RXuIgrAz6tvfNH8jaxGYIus/UE
         pGcw==
X-Gm-Message-State: AOJu0Yz7J3CiCv6rvLm/jMj9sqE+daR5ho6DlRODUp1H0c0ZAb/HbydD
	T+0KBiNkw6w8R++yrtK5jEweE+vuw77T0lp3mwlTNzEBeVifpGUqSi/wkeNAL6sn
X-Gm-Gg: ASbGncuhkf4GWzi4hUBmVv7fhG7UFl6iuj6G1TXHQHaS3LHrqK3LmjLlGZNdfb2euGG
	Ln04hufEIrMBXBCVXG/T0vvZF8NzRticO+LzN3ttKqUR5OafxDnKSQHD6WIw6LTR/sPipKge8DX
	aEBxKy9IOnprJzPUdVILKTHUKl9q52dZvBFZOTNU93aPtIJSmQzTTXR3wDeoUpUGxJUP60/tW3t
	VrVsO3zYQ25cDKQlqIx2Lr28yErxhkDzrau3izd13WpT1zojynnJRd4RLrCAHHO3EnKsXLauWxz
	czcL3r0lk2y+6CWeny+uHaOUWnit8JUg93Bgb8+VTbFsgq9GPGKqDddLb+BuCAjhy+mV7CjYuB/
	kPaWdVMunm4Or5zM1H9KCxUsatTXm4IVRtON81VjVu3OEW9kiY0k=
X-Google-Smtp-Source: AGHT+IFFPmOMshhgjIB3Ginjqw8MPmF/u8CT1shEugu05aYMNMYioOT8YtEHQMN00IM/E/Fs67Hk1Q==
X-Received: by 2002:a05:6e02:218f:b0:3e5:4e4f:65df with SMTP id e9e14a558f8ab-42f8736957fmr73844865ab.9.1760015145528;
        Thu, 09 Oct 2025 06:05:45 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:44 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 9/9] bindings: python: line_request: warn on unknown lines when reconfiguring
Date: Thu,  9 Oct 2025 08:05:15 -0500
Message-ID: <20251009130516.3729433-10-vfazio@gmail.com>
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

Previously, attempting to reconfigure a line that was not included in
the original request provided no feedback to the caller that there was
invalid data in the request.

Now, emit a warning when an unknown offset or line name is encountered.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/line_request.py       | 14 ++++++++--
 bindings/python/tests/tests_line_request.py | 29 ++++++++++++++-------
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 629df3c..deb48a7 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -3,6 +3,7 @@
 
 from __future__ import annotations
 
+import warnings
 from typing import TYPE_CHECKING, Optional, Union, cast
 
 from . import _ext
@@ -173,12 +174,21 @@ class LineRequest:
         for line, settings in config_iter(config):
             try:
                 offset = self._line_to_offset(line)
-                line_settings[offset] = settings
+                if offset in self.offsets:
+                    line_settings[offset] = settings
+                else:
+                    warnings.warn(
+                        f"Line offset '{offset}' was not included in original request.",
+                        stacklevel=2,
+                    )
             except ValueError:
                 # _line_to_offset will raise a ValueError when it encounters
                 # an unrecognized line name. Ignore these like we do offsets
                 # that were not in the original request.
-                pass
+                warnings.warn(
+                    f"Line name '{line}' was not included in original request.",
+                    stacklevel=2,
+                )
 
         for offset in self.offsets:
             settings = line_settings.get(offset) or LineSettings()
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index aa2cd83..8cb0f2c 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+import warnings
 from unittest import TestCase
 
 import gpiod
@@ -604,22 +605,30 @@ class ReconfigureRequestedLines(TestCase):
     def test_reconfigure_extra_offsets(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
-        self.req.reconfigure_lines(
-            {(0, 2, 3, 6, 5): gpiod.LineSettings(direction=Direction.INPUT)}
-        )
+        with warnings.catch_warnings(record=True) as w:
+            self.req.reconfigure_lines(
+                {(0, 2, 3, 6, 5): gpiod.LineSettings(direction=Direction.INPUT)}
+            )
+            assert len(w) == 1
+            assert issubclass(w[0].category, UserWarning)
+            assert "Line offset '5'" in str(w[0].message)
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
     def test_reconfigure_extra_names(self) -> None:
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
-        self.req.reconfigure_lines(
-            {
-                (0, 2, "foo", "baz", "buzz"): gpiod.LineSettings(
-                    direction=Direction.INPUT
-                )
-            }
-        )
+        with warnings.catch_warnings(record=True) as w:
+            self.req.reconfigure_lines(
+                {
+                    (0, 2, "foo", "baz", "buzz"): gpiod.LineSettings(
+                        direction=Direction.INPUT
+                    )
+                }
+            )
+            assert len(w) == 1
+            assert issubclass(w[0].category, UserWarning)
+            assert "Line name 'buzz'" in str(w[0].message)
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
-- 
2.43.0


