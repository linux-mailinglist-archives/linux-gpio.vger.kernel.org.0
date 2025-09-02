Return-Path: <linux-gpio+bounces-25378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA08B400DE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 85DC04E1E96
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF78C29993D;
	Tue,  2 Sep 2025 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NskyW+xv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154D429293D
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816784; cv=none; b=lgBBLqmx1kZo5Kh4EWr2Ww/4pZYm2iOUZLOh3tm0rpubSui/56ioSnTBns7p/irdEz8XuaQSCey5MCrQ+cHp9eNjWqZWQx/N6Zc7hXNJVi0/vX5iw+cqtzYd83JQKzILzYYKAniXeN4MlPZpP6kqo8ESDHSrCP5Z2h8EB75oqFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816784; c=relaxed/simple;
	bh=+2bEhx0xOEbtGQy70k3XAVSt1f2yakoySVyml5FvHFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hrWE3mYYCmRYssPE74hhbgqnmQRz8QTkCjf6NdNPYJaqVds5UgbNLX8Pmgrc2+6ITZFuAnyQv1p1P52W+qI9R/75zuFLuMHbu3+xp8iSsRbKjfFLW7HeJFw1U1fT1WAN78qOKmTgF69gRCFbcJy3hDizuaNVzI6Dynjqc3hhUbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NskyW+xv; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3f453812254so16674845ab.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756816782; x=1757421582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=22euwnE07hu1az63IRz37Ch/pgAYNv6YFsdxtQd6yj8=;
        b=NskyW+xv9EyoK7t5sgXyFpv2uFwszs5MR+1U6dpBR58mc+v8CpbuOSZrnsEMEl9g2u
         AToC2JQHWvnrSC855y4tp1y39j7QNvyoYIytFhb5uaxGVcnvJnonqw1uRgs2e03BhAyl
         oGj9fEyCbO+iHaQWHn+sDsMG95WYIOFNkBJcYdzPrGrrHXtUmnZ2bzWgoWdpuRueJwEA
         pEbwPu8Yt7wSxCBLV9VCezalA9MeyMwjZMhZDm0of5ga7BdD05bdPT4v2CuqXrKwoogb
         iNRBSnPJWkiIlySu3r5jeEBWJqj6NL2nzpK/j/X7b67d/Zf9O/4P+KCwzbeaY1ApZLUa
         uYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816782; x=1757421582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22euwnE07hu1az63IRz37Ch/pgAYNv6YFsdxtQd6yj8=;
        b=DlD3E2j97jAFrOTV3OHut0neCT/LLA7Sp8+8Yj8ytnPxTILgNKTW3M1mRQ2wZXPS5L
         RvLie4ODMau1+LxhPmWPRXCV/zHO7pS1r35387U62S9IGrFjXAea+/4SEb8N+cOsbG4j
         w1JTidTW4cRcE3PtgdATHp8H3qSw+VWNkKDVCTHKVyJz2gSatwZsn4ttnxM4zdf0LWHR
         d80lqh5WZ7YtHe5PaIfWbKQ4HpgsnRD+4N2BK9Cyo8Qs/buppSrs/xAn2JF+6tZXCfLF
         mQXcn85GFvljDO9SuXGxF3XxOlzpcnXrB+QqnDpa9oNQyNvp427rtrGh0eA/OpB4uSFn
         EvHA==
X-Gm-Message-State: AOJu0YzbWBmgDOOagZ63TFuCZNvtsohQqcu5bc58Q0Hi4No0jt/dZ2Ia
	HC0+Ma9jd7dDKC5u5L28hU+/PehvA03rVkQr+V1K8+6rxWmLzUKTBriWusmd+w==
X-Gm-Gg: ASbGnct+Osb8CYiYDs5IS/Qr66S2FEMACxrA2sdbJ967QSs4bP/Yi5Akeur5WVgP9c4
	0wKd6pQhh1Ma6pnVddSlyiqH87bJ8Fo3SQFPsHZCmF7i+3Ydzs77WcV/uV3ofQBVuKR+cmSn9YW
	GATshyZg+q80FMgYMdhprofhxFpXx+gy/oHvI5xC/M4x8TjV7sjf7sQ+wdv82PU8wuTI7jkATBV
	rLoe8IUz6fN8bbXp9CrsOCHbrlsjSI8AEiVYA8/gzkl4eNhsnjhnGiDImLhYwh/myvnnK8iZflB
	UWIwGg7NTAgDxPMm4oBWcpR0DU63Rd1gc4cYElTrebsk8+RKkMUrXjYZfjsjUrCLbIW959bJ9zH
	6w8YLo5SoAhBy5NKqJUgftf4uc3KF54MmaOz3zydWSg+OYKC/dj5e7rKUfyLrVWpTIs/BbAuz64
	VauFjsQ3g=
X-Google-Smtp-Source: AGHT+IFPZ8RWOvlL6H0+t4gaaUuPDtHcsoyPRJ/6XV/UUQktvIFdCrg2G0HojryzouX1rZABTze+7Q==
X-Received: by 2002:a05:6e02:2504:b0:3ea:d47f:5995 with SMTP id e9e14a558f8ab-3f3d60dc5ebmr176206095ab.11.1756816781702;
        Tue, 02 Sep 2025 05:39:41 -0700 (PDT)
Received: from Zephyrus.localdomain ([162.248.234.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f397d35sm3024235173.65.2025.09.02.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:39:41 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@xes-inc.com>,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: parse non-tuple Iterable keys
Date: Tue,  2 Sep 2025 07:39:05 -0500
Message-ID: <20250902123905.6491-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When `chip.request_lines` was modified to allow `Iterable`s instead of
only `tuple`s, the code that checked for duplicate line entries in the
`config` argument was not updated to account for the expanded types.

If the `config` argument had a key that was not a `tuple`, `str`, or
`int`, a `TypeError` would be raised when resolving the line offset.

Refactor the code the resolves IDs to offsets into a separate function
to make the logic a bit clearer and to account for the widened types.

Fixes: 8f62e6c45355 ("bindings: python: loosen type requirements in public API")
Closes: https://github.com/brgl/libgpiod/issues/148
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py               | 23 ++++++++++++++-------
 bindings/python/tests/tests_line_request.py |  4 ++++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 5641343..cccfb03 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -236,6 +236,20 @@ class Chip:
         self._check_closed()
         return cast(_ext.Chip, self._chip).read_info_event()
 
+    def _resolve_config_keys_to_offsets(
+        self,
+        config_keys: Iterable[Union[Iterable[Union[int, str]], int, str]],
+    ) -> list[int]:
+        offsets: list[int] = list()
+        for key in config_keys:
+            # perform strict int/str check since str is also Iterable
+            if isinstance(key, (int, str)):
+                offsets.append(self.line_offset_from_id(key))
+            else:  # key is an iterable with multiple IDs to resolve
+                for item in key:
+                    offsets.append(self.line_offset_from_id(item))
+        return offsets
+
     def request_lines(
         self,
         config: dict[
@@ -271,14 +285,7 @@ class Chip:
 
         # Sanitize lines - don't allow offset repetitions or offset-name conflicts.
         for offset, count in Counter(
-            [
-                self.line_offset_from_id(line)
-                for line in (
-                    lambda t: [
-                        j for i in (t) for j in (i if isinstance(i, tuple) else (i,))
-                    ]
-                )(tuple(config.keys()))
-            ]
+            self._resolve_config_keys_to_offsets(config_keys=config.keys())
         ).items():
             if count != 1:
                 raise ValueError(
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index afee644..217c299 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -101,6 +101,10 @@ class ChipLineRequestWorks(TestCase):
         with self.chip.request_lines(config={(4): None}) as req:
             self.assertEqual(req.offsets, [4])
 
+    def test_request_single_offset_as_frozenset(self) -> None:
+        with self.chip.request_lines(config={frozenset([4]): None}) as req:
+            self.assertEqual(req.offsets, [4])
+
     def test_request_by_name(self) -> None:
         with self.chip.request_lines(config={(1, 2, "foo", "bar"): None}) as req:
             self.assertEqual(req.offsets, [1, 2, 5, 7])
-- 
2.43.0


