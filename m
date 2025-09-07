Return-Path: <linux-gpio+bounces-25712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9745B47BD4
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 16:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 906017A4EE8
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 14:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAE92765C8;
	Sun,  7 Sep 2025 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da2AVEte"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18161C8E6
	for <linux-gpio@vger.kernel.org>; Sun,  7 Sep 2025 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757255380; cv=none; b=PcJjlON3LF/1ta+ArIJpeeOFrIdAEcR54GXYlk+j9kZqHD6Kcge2nFJ+9k9t5FMgTy03buVpzqCQrjFl5HgbLTjXHmydnaq4DRYbAK7SKTyMyx9NGS5s+IV2euPjhztJ3Q3qHn+mXsOsdxY/bKj+N53/cyWR9TCqebz5XXF6yIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757255380; c=relaxed/simple;
	bh=DQDpVF8MYpSztunyi5AIenYICnTY/Ak4epQGp+nEuuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ybcj7vE409YZrZ8Z00JgY+l60iOjA3WbhU11aZ69UAYm4Q9sG+wISe0m5z4XyMkRT1czIxQi36zdP2Cuj68Ok8DfaDmW5bQvumI9zMSwpknoFi1NTKqC6fsbmMc0xrWSPUrygAwt/65lwJQHVbsFaJKBhO2b28h8+WYf+5UxqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da2AVEte; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8876de33c86so201197439f.3
        for <linux-gpio@vger.kernel.org>; Sun, 07 Sep 2025 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757255378; x=1757860178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMgI54HnhVxgNrBT+t3Fy8JTrQWJAyWKk270tkbQhbg=;
        b=da2AVEte8im8J9vIAQd1aaIsl9SNzmcEN+jt7XUJ4ZMTEmoWOHsA5BQ9chnQoYlQU5
         wXGmRYkjY5dTYlLiviMTDIMaKQQ2JhFHSU4HbXdfWJNjabpuSQX6eBAzkVGMNCEC7+5F
         nI1ejf7v6OcFcYW5NkUU7Oh0T36qIFroeDM5e8ITl4jaR2qrZnxYw0dwm7yAYZSgkw7d
         2hNb94VoTPMhkjsxKUO5CtTB7KLVcWbFx6khNncR2EQgR6zGKHs7UV5ueNUS5QapTBPA
         OK1/KxM5rzrY0RgcIpxG3QD7mM8Bx3lxqqO5WtkX77pwDRk7weHVaLbf4II+99mc2HCh
         j6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757255378; x=1757860178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMgI54HnhVxgNrBT+t3Fy8JTrQWJAyWKk270tkbQhbg=;
        b=HiDFQmxTRIAJjqsSyfIYW7xCFBlA7FuKjdLDAvBsP8Rg0aKisY27abX/qlHvfcniAa
         10gwocgqu+wIQBLCHwVtUEkTzgNVmlf9Z9rQzqqtdaHmy9t8+uZc21sPUSwddOrp7oZM
         4O+rkMSe7v+nLYuSkglSzMN+txt1G36x72lBoXqqwsLoH+tRw9U84XT48jpI4jD3wPy/
         AsTQGqmlsaFY/JwEQ8KAtj64rILfXb91rPEh3JrLA8xpbspfxSCC/ufn30DPDmfkpCvX
         UwACRroY/VBHl2cyiS+14ANUAXnUX6T/EDB/NzvaGQwRDSGmgitLYMsFAmbNczZFn8Ji
         Uz0A==
X-Gm-Message-State: AOJu0YzZVHsmSm1o8q10SwJSuDf6x+8iE/YiG50UQjpsdI4VAr5PaRIe
	2nIWuL+EXs1RYFDc/R/O3jcb2p6Yl5WqnF/bG7OVEbYfA97OaYHezSVnvr436w==
X-Gm-Gg: ASbGncuCG3iD2Yv9pUBoyVMI9/v/MEnPRHertwOIcMv6iWphwaDNJTk3c9aCKhyM1Ws
	wOziBPqS4bhqbi3js4wD+CBSnn9WHToQG0zkecwzdBUFhLB/MXxPgUn5StimAUHyL0OzQKgoJkH
	HgKRhFiaMl8VlJXFy+fIcIzUolMOgtfA9KOtcZlT4I9YTfBRe8PV8rb13BUF6CynY+h/lfOXmL8
	3I6xSAmn+9xvFpv1CCsODKJlpmKwu0zn8ETy6NnHaQhmcJJbkKkljuGHGfewjku+W8XZF8oNq9X
	VyqdgVbR9g2tXoaD343Zv7M278BMPrcNOWQBPs+STRxyofBXa9oIMAlApaP+vAobKWB8qOTeba4
	8aaZsOPlPswxyOORVtxEv0WSe2Ixgrt54bFjgX6TSpaairZfXnyylZ97ZKvzLk+miuFDnM/EL
X-Google-Smtp-Source: AGHT+IGYCzvun4wizeQ56wN6C92JrYdFV7aprZoVUCtkFjp+9GJY9VvW+w6rabXnxi2GYANFCOPvdQ==
X-Received: by 2002:a05:6602:1647:b0:887:62ec:21df with SMTP id ca18e2360f4ac-887776a26f6mr738272239f.14.1757255377873;
        Sun, 07 Sep 2025 07:29:37 -0700 (PDT)
Received: from Zephyrus.localdomain ([162.248.234.10])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8876462d2casm311770339f.14.2025.09.07.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 07:29:37 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@xes-inc.com>,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: use quoted types when casting
Date: Sun,  7 Sep 2025 09:29:34 -0500
Message-ID: <20250907142934.1382852-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linter check T006 [0] recommends using quotes around types (making them
strings) when casting values to a type to avoid the overhead of runtime
type evaluation.

This provides a small performance benefit at runtime [1].

  >>> timeit(lambda: cast(gpiod._ext.Request, "a"), number=100000000)
  6.4817840601317585
  >>> timeit(lambda: cast("gpiod._ext.Request", "a"), number=100000000)
  4.369633618975058

This also allows moving some imports behind type checking guards as they
are not required at runtime.

[0]: https://docs.astral.sh/ruff/rules/runtime-cast-value/
[1]: https://github.com/snok/flake8-type-checking/issues/119#issuecomment-2511022212

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py         | 18 +++++++++---------
 bindings/python/gpiod/line_request.py | 16 ++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 5641343..c6f7542 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -101,7 +101,7 @@ class Chip:
         longer be used after this method is called.
         """
         self._check_closed()
-        cast(_ext.Chip, self._chip).close()
+        cast("_ext.Chip", self._chip).close()
         self._chip = None
 
     def get_info(self) -> ChipInfo:
@@ -114,7 +114,7 @@ class Chip:
         self._check_closed()
 
         if not self._info:
-            self._info = cast(_ext.Chip, self._chip).get_info()
+            self._info = cast("_ext.Chip", self._chip).get_info()
 
         return self._info
 
@@ -139,7 +139,7 @@ class Chip:
 
         if not isinstance(id, int):
             try:
-                return cast(_ext.Chip, self._chip).line_offset_from_id(id)
+                return cast("_ext.Chip", self._chip).line_offset_from_id(id)
             except OSError as ex:
                 if ex.errno == ENOENT:
                     try:
@@ -158,7 +158,7 @@ class Chip:
 
     def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
         self._check_closed()
-        return cast(_ext.Chip, self._chip).get_line_info(
+        return cast("_ext.Chip", self._chip).get_line_info(
             self.line_offset_from_id(line), watch
         )
 
@@ -198,7 +198,7 @@ class Chip:
             Offset or name of the line to stop watching.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).unwatch_line_info(
+        return cast("_ext.Chip", self._chip).unwatch_line_info(
             self.line_offset_from_id(line)
         )
 
@@ -234,7 +234,7 @@ class Chip:
           This function may block if there are no available events in the queue.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).read_info_event()
+        return cast("_ext.Chip", self._chip).read_info_event()
 
     def request_lines(
         self,
@@ -328,7 +328,7 @@ class Chip:
         if len(global_output_values):
             line_cfg.set_output_values(global_output_values)
 
-        req_internal = cast(_ext.Chip, self._chip).request_lines(
+        req_internal = cast("_ext.Chip", self._chip).request_lines(
             line_cfg, consumer, event_buffer_size
         )
         request = LineRequest(req_internal)
@@ -374,7 +374,7 @@ class Chip:
         Filesystem path used to open this chip.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).path
+        return cast("_ext.Chip", self._chip).path
 
     @property
     def fd(self) -> int:
@@ -382,4 +382,4 @@ class Chip:
         File descriptor associated with this chip.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).fd
+        return cast("_ext.Chip", self._chip).fd
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 0220ba3..69f86f6 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -8,7 +8,6 @@ from typing import TYPE_CHECKING, Optional, Union, cast
 from . import _ext
 from ._internal import poll_fd
 from .exception import RequestReleasedError
-from .line import Value
 from .line_settings import LineSettings, _line_settings_to_ext
 
 if TYPE_CHECKING:
@@ -17,6 +16,7 @@ if TYPE_CHECKING:
     from types import TracebackType
 
     from .edge_event import EdgeEvent
+    from .line import Value
 
 
 __all__ = ["LineRequest"]
@@ -76,7 +76,7 @@ class LineRequest:
         not be used after a call to this method.
         """
         self._check_released()
-        cast(_ext.Request, self._req).release()
+        cast("_ext.Request", self._req).release()
         self._req = None
 
     def get_value(self, line: Union[int, str]) -> Value:
@@ -122,9 +122,9 @@ class LineRequest:
 
         offsets = [self._line_to_offset(line) for line in lines]
 
-        buf = cast(list[Value], [None] * len(offsets))
+        buf = cast("list[Value]", [None] * len(offsets))
 
-        cast(_ext.Request, self._req).get_values(offsets, buf)
+        cast("_ext.Request", self._req).get_values(offsets, buf)
         return buf
 
     def set_value(self, line: Union[int, str], value: Value) -> None:
@@ -151,7 +151,7 @@ class LineRequest:
 
         mapped = {self._line_to_offset(line): value for line, value in values.items()}
 
-        cast(_ext.Request, self._req).set_values(mapped)
+        cast("_ext.Request", self._req).set_values(mapped)
 
     def reconfigure_lines(
         self,
@@ -186,7 +186,7 @@ class LineRequest:
             settings = line_settings.get(offset) or LineSettings()
             line_cfg.add_line_settings([offset], _line_settings_to_ext(settings))
 
-        cast(_ext.Request, self._req).reconfigure_lines(line_cfg)
+        cast("_ext.Request", self._req).reconfigure_lines(line_cfg)
 
     def wait_edge_events(
         self, timeout: Optional[Union[timedelta, float]] = None
@@ -220,7 +220,7 @@ class LineRequest:
         """
         self._check_released()
 
-        return cast(_ext.Request, self._req).read_edge_events(max_events)
+        return cast("_ext.Request", self._req).read_edge_events(max_events)
 
     def fileno(self) -> int:
         """
@@ -276,4 +276,4 @@ class LineRequest:
         File descriptor associated with this request.
         """
         self._check_released()
-        return cast(_ext.Request, self._req).fd
+        return cast("_ext.Request", self._req).fd
-- 
2.43.0


