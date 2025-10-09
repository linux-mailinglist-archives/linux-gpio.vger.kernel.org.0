Return-Path: <linux-gpio+bounces-26937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 875C1BC931A
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1B744FA51D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ABF2E7160;
	Thu,  9 Oct 2025 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIlns6IL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7C2E62BF
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015144; cv=none; b=LPE0Ril02KFE0cYh5cwuSvDpkVQSZwxagOpvbKUwn4HdDAjMngsdmb1HFBhAVPaIiRs29d7PXGylXOC41DxP65cZ5G8VbW5428WaEnK3sQJbN9+UZw9F3B3FMcwAiSk8KQB53b5Ig4wfgwZUDi768DUlycuTbtfrNxpuvgBOEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015144; c=relaxed/simple;
	bh=eq2fhu2buBAaD9fbqHJ8I2zRrArWY4GYZkTI9sNtUr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fc7Q/O1kkMgWiLXFqKZajKCwOGYTvOtsydVZ0TvhLcGJ8frmbZeDN4tMb/kxw4CzHPFr2pSix7WEj/yKrkvrD/Sc0celKKv5FSq0tC/3CM+nr9qYo/Kz6px39ztEDGlGfPDqHOF5yDIdwYZtkbxMECB4a9V5Ohnn+sQM5BDwObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIlns6IL; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-42f94689e73so4260735ab.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015142; x=1760619942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZHku2IAANm3wSbNT6uuDWG0PR35PxfnJVzGrxoHHwI=;
        b=WIlns6ILczGO9qYVFff4XZgN1utGHADY6UN1K/MXQNWe0QKSlpX/mAupEF0AZzVtbN
         RSOdSdpZX/tQSzwz9qB3B/r402b8GZswiRHW5NJ58/d0kG90CLXTh0jZDQBkwbR7V2Sj
         ph34dyy4RCnxJ7wMfWyEjE6L7EO+zjd6+AkOuIBx1m9ZMiCnlYniCpuLxvguZO7oWXgD
         TN0npg+epVQ94ANUsWY/i2IkessNWWcKy+CJdi5BtzJ4ktljaoqr+XnjEZ93V+E8VQGD
         fr8SqvKKZEszpQdj9Z4yE+G3VSSKsZe1I88KhMH8rBbx4B1oUItp7PW3dnaXnsPHVe3x
         BzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015142; x=1760619942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZHku2IAANm3wSbNT6uuDWG0PR35PxfnJVzGrxoHHwI=;
        b=NCc1Cu/brSXfljdEQEaKc2N6AfqJaU2WI78vz72nJfuy+jnW43xd3Fa9+Bmgkjwg+C
         gLCXIpBAD73Gc7x2u9F0Dj/UMzGPPf8Q5YxnrQbejD7q+5btOKhxrKYqU81unu4Z6AIc
         RWNiNP6VVHW+DXa/5qXj8wyobVVp9AnHEjO8MUy9XJm3GDMdhNK1j37OLHknUyq1QhQV
         0maKvjANHIrayziDivJF4ZbQgyzpH6uS65Wnr0ktriu8mIxfangtTof44XozgyX+HwnH
         MEe8YFkhbt/Aqe7hMs4ilGDlmqKP0y3D6IsN/9YS7LYT0XagrX+ZS/oVK5tKTouDNIuy
         QSKA==
X-Gm-Message-State: AOJu0YxW7Rf03qMpzAiKqMDU8imK3JS8sin4jQitpfBGKsChunjsedFc
	lYvPt7DO2XJTUaT1wx2FGHfqygUZAi20Z6II5jRxqyX/cX1XbjS0CPXwHj8fx2ln
X-Gm-Gg: ASbGncuw6+z+fF3wNPJ4ZkaF1tTLGkL7uN6SJWlDfhJFKJQ4wGdl9Tc/4bk4cgjDqgz
	e8efDX+IrXvkSUqeXYqpipYVVkGnDT8Gi7rUERL9t/6uh3/2HTDB/HXpGRYfMJiTLZVf9BRegCx
	1L5pvrnWAZF6mPFZeP6TpyOCnqQhN/XdyKVaNVLjp/VpjYbfUFgglQhB7JweyKDRmPa7QZr0uim
	HI4At+MC8gNM150kmXNkL3n49pGQH0qn7a1giNtaK7RfOKk3IbKXxRqu+FvVYFtbsfCWzQSuX4l
	5ksH6BRS2LI7CL/YJ9dpiNgXsvgGduF0GdZfGy4N8PuJohkcT37tmd7YOHpJSNiPdPGCdUqhXxQ
	Bn+S3L60ORGMVfvt/R2NPrgCx1uoPJ5xQ7eNBtA+m+zuHcqQSVgTdydj5sQHehg==
X-Google-Smtp-Source: AGHT+IGSu4uPbLXULIt12INKaCI/KVLdYGY9aaK+x3Ki40fKAX7btmrxSsOOueCF+gSFG6XmYYguPA==
X-Received: by 2002:a05:6e02:2783:b0:424:866:ec6d with SMTP id e9e14a558f8ab-42f8736d251mr70775125ab.12.1760015141453;
        Thu, 09 Oct 2025 06:05:41 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:40 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 4/9] bindings: python: chip: simplify duplicate checking
Date: Thu,  9 Oct 2025 08:05:10 -0500
Message-ID: <20251009130516.3729433-5-vfazio@gmail.com>
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

Previously, a check was performed to prevent requests that included
duplicative lines.

While this provided quick feedback on erroneous requests, it penalized
callers that had a good config due to the over head of iterating the
config multiple times.

Now, duplicate check is performed as the config object is iterated.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 23662ef..1f4a9bd 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -3,7 +3,6 @@
 
 from __future__ import annotations
 
-from collections import Counter
 from errno import ENOENT
 from typing import TYPE_CHECKING, Optional, Union, cast
 
@@ -236,20 +235,6 @@ class Chip:
         self._check_closed()
         return cast("_ext.Chip", self._chip).read_info_event()
 
-    def _resolve_config_keys_to_offsets(
-        self,
-        config_keys: Iterable[Union[Iterable[Union[int, str]], int, str]],
-    ) -> list[int]:
-        offsets: list[int] = list()
-        for key in config_keys:
-            # perform strict int/str check since str is also Iterable
-            if isinstance(key, (int, str)):
-                offsets.append(self.line_offset_from_id(key))
-            else:  # key is an iterable with multiple IDs to resolve
-                for item in key:
-                    offsets.append(self.line_offset_from_id(item))
-        return offsets
-
     def request_lines(
         self,
         config: dict[
@@ -283,15 +268,6 @@ class Chip:
 
         line_cfg = _ext.LineConfig()
 
-        # Sanitize lines - don't allow offset repetitions or offset-name conflicts.
-        for offset, count in Counter(
-            self._resolve_config_keys_to_offsets(config.keys())
-        ).items():
-            if count != 1:
-                raise ValueError(
-                    f"line must be configured exactly once - offset {offset} repeats"
-                )
-
         # If we have global output values - map line names to offsets
         if output_values:
             mapped_output_values = {
@@ -304,11 +280,18 @@ class Chip:
         name_map = dict()
         requested_lines = list()
         global_output_values = list()
+        seen_offsets = set()
 
         for line, settings in config_iter(config):
             offsets = list()
 
             offset = self.line_offset_from_id(line)
+            # don't allow offset repetitions or offset-name conflicts.
+            if offset in seen_offsets:
+                raise ValueError(
+                    f"line must be configured exactly once - offset {offset} repeats"
+                )
+            seen_offsets.add(offset)
             offsets.append(offset)
             requested_lines.append(line)
 
-- 
2.43.0


