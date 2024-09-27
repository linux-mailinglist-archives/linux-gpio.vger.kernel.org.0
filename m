Return-Path: <linux-gpio+bounces-10529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A6988AAF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 21:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05414281390
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 19:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF5B1C1ABE;
	Fri, 27 Sep 2024 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="DON98RAj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC61C1742
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463908; cv=none; b=dEC5kbAIMCMnNbrLUJG7+xd8gptgbw0FHU/QlkcdX5H2g1hyjdo1NwTMBe/OmREPLVZcD+Q17cmZL8uVaTYzmD7u2hL85dvj0xEFVjnxgoguEmRlOyf8vZQUQeHp+tSqFmMotsHv6gtsq6HERj71Ad6Le1EXb8k1yOP7IVa1Td4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463908; c=relaxed/simple;
	bh=e49BiRZg0WTyzNuT+UYtHBN4t5gZknpOMpzbsCd02cM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEbHf64FHRM/rWSBOECxJoLgwVPIIGAywqa7QBHNo6P4vhRYn//RK2kbvOg0uWVdBXmRplXiMb8mILXgKD6qxHzmVfvPgHg6fdJYmbLUhKl5cI/PZQBfLT7sGsw6OzXNxdpKQeh9L/ZgkNy7mkFwej46NXUt3IYdq2VC4dDEhmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=DON98RAj; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 1A2E9207A8;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=e49BiRZg0WTyzNuT+UYtHBN4t5gZknpOMpzbsCd02cM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DON98RAj1UMtm5gdLbu50iGNoJ4ttpi1IuWRU6twwTBa44VkU+9PafidNeIHiafqr
	 rJBJBiPnV6eH533V5CkhXTyllGs2DVkVNC1F2lFk39Qviz3bf8nrJwGE7mBt1A80df
	 Q8KF9nsUrYAZJCr0JseglJxg93KhfvjXXOmlgyRI=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 04/22] bindings: python: add missing method type annotations
Date: Fri, 27 Sep 2024 13:53:40 -0500
Message-Id: <20240927-vfazio-mypy-v1-4-91a7c2e20884@xes-inc.com>
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

Explicitly define the arguments for `gpiod.request_lines` so there is a
clearer linkage with the underlying `Chip.request_lines` interface.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/__init__.py      | 17 +++++++++++++++--
 bindings/python/gpiod/chip.py          | 12 ++++++++++--
 bindings/python/gpiod/chip_info.py     |  2 +-
 bindings/python/gpiod/edge_event.py    |  2 +-
 bindings/python/gpiod/exception.py     |  4 ++--
 bindings/python/gpiod/info_event.py    |  2 +-
 bindings/python/gpiod/line.py          |  2 +-
 bindings/python/gpiod/line_info.py     |  2 +-
 bindings/python/gpiod/line_request.py  | 16 ++++++++++++----
 bindings/python/gpiod/line_settings.py |  4 ++--
 10 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 4d916f7f1a4eabd8ad1b2844262c20ed01a0798c..3cf39d61f64c3888584cd2518787b8e17e185ed2 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -7,6 +7,8 @@ Python bindings for libgpiod.
 This module wraps the native C API of libgpiod in a set of python classes.
 """
 
+from typing import Optional, Union
+
 from . import (
     _ext,
     chip,
@@ -83,7 +85,13 @@ def is_gpiochip_device(path: str) -> bool:
     return _ext.is_gpiochip_device(path)
 
 
-def request_lines(path: str, *args, **kwargs) -> LineRequest:
+def request_lines(
+    path: str,
+    config: dict[Union[tuple[Union[int, str], ...], int, str], Optional[LineSettings]],
+    consumer: Optional[str] = None,
+    event_buffer_size: Optional[int] = None,
+    output_values: Optional[dict[Union[int, str], line.Value]] = None,
+) -> LineRequest:
     """
     Open a GPIO chip pointed to by 'path', request lines according to the
     configuration arguments, close the chip and return the request object.
@@ -99,4 +107,9 @@ def request_lines(path: str, *args, **kwargs) -> LineRequest:
       Returns a new LineRequest object.
     """
     with Chip(path) as chip:
-        return chip.request_lines(*args, **kwargs)
+        return chip.request_lines(
+            config=config,
+            consumer=consumer,
+            event_buffer_size=event_buffer_size,
+            output_values=output_values,
+        )
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 93556b6ea6aa35b9ad6dc0cb840c33cb95170048..75cc337e74bc965a30962b39a1584b13b4c4b067 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -1,9 +1,12 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from __future__ import annotations
+
 from collections import Counter
 from datetime import timedelta
 from errno import ENOENT
+from types import TracebackType
 from typing import Optional, Union
 
 from . import _ext
@@ -66,14 +69,19 @@ class Chip:
         """
         return True if self._chip else False
 
-    def __enter__(self):
+    def __enter__(self) -> Chip:
         """
         Controlled execution enter callback.
         """
         self._check_closed()
         return self
 
-    def __exit__(self, exc_type, exc_value, traceback) -> None:
+    def __exit__(
+        self,
+        exc_type: Optional[type[BaseException]],
+        exc_value: Optional[BaseException],
+        traceback: Optional[TracebackType],
+    ) -> None:
         """
         Controlled execution exit callback.
         """
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index 884b910681abbc2069673669539d068a93f6aa72..eb585d6d7efa26492163dc0a731ba263d0232099 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -17,7 +17,7 @@ class ChipInfo:
     label: str
     num_lines: int
 
-    def __str__(self):
+    def __str__(self) -> str:
         return '<ChipInfo name="{}" label="{}" num_lines={}>'.format(
             self.name, self.label, self.num_lines
         )
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index a8b2378f9e3a9bdfabd8dde60d5c30fc73766f4c..0d401d896a79dc5204e7ea86f202e37acbd24758 100644
--- a/bindings/python/gpiod/edge_event.py
+++ b/bindings/python/gpiod/edge_event.py
@@ -39,7 +39,7 @@ class EdgeEvent:
         object.__setattr__(self, "global_seqno", global_seqno)
         object.__setattr__(self, "line_seqno", line_seqno)
 
-    def __str__(self):
+    def __str__(self) -> str:
         return "<EdgeEvent type={} timestamp_ns={} line_offset={} global_seqno={} line_seqno={}>".format(
             self.event_type,
             self.timestamp_ns,
diff --git a/bindings/python/gpiod/exception.py b/bindings/python/gpiod/exception.py
index f9a83c27b73c4ac3a0f4fac1c1b4421b22545645..54208e2ccd9996c0d3256a48ca6ef924a7cce027 100644
--- a/bindings/python/gpiod/exception.py
+++ b/bindings/python/gpiod/exception.py
@@ -9,7 +9,7 @@ class ChipClosedError(Exception):
     Error raised when an already closed chip is used.
     """
 
-    def __init__(self):
+    def __init__(self) -> None:
         super().__init__("I/O operation on closed chip")
 
 
@@ -18,5 +18,5 @@ class RequestReleasedError(Exception):
     Error raised when a released request is used.
     """
 
-    def __init__(self):
+    def __init__(self) -> None:
         super().__init__("GPIO lines have been released")
diff --git a/bindings/python/gpiod/info_event.py b/bindings/python/gpiod/info_event.py
index 7b544aa6436b34613a71ee06d9b675a63ad16989..d9e9564e21338cd8d1e28c567fa2ed2ac29ceb00 100644
--- a/bindings/python/gpiod/info_event.py
+++ b/bindings/python/gpiod/info_event.py
@@ -30,7 +30,7 @@ class InfoEvent:
         object.__setattr__(self, "timestamp_ns", timestamp_ns)
         object.__setattr__(self, "line_info", line_info)
 
-    def __str__(self):
+    def __str__(self) -> str:
         return "<InfoEvent type={} timestamp_ns={} line_info={}>".format(
             self.event_type, self.timestamp_ns, self.line_info
         )
diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
index 828385cbd84a95f207e808fe77022caad4056916..33c73682d2b3231c0754f398ad0a3f2a99854399 100644
--- a/bindings/python/gpiod/line.py
+++ b/bindings/python/gpiod/line.py
@@ -15,7 +15,7 @@ class Value(Enum):
     INACTIVE = _ext.VALUE_INACTIVE
     ACTIVE = _ext.VALUE_ACTIVE
 
-    def __bool__(self):
+    def __bool__(self) -> bool:
         return self == self.ACTIVE
 
 
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index 46e16533802e9c8ff57a697e5b51b8b028d0c061..5ea9568fd5c963c77f53c56ef748ac1e80872ed9 100644
--- a/bindings/python/gpiod/line_info.py
+++ b/bindings/python/gpiod/line_info.py
@@ -58,7 +58,7 @@ class LineInfo:
             self, "debounce_period", timedelta(microseconds=debounce_period_us)
         )
 
-    def __str__(self):
+    def __str__(self) -> str:
         return '<LineInfo offset={} name="{}" used={} consumer="{}" direction={} active_low={} bias={} drive={} edge_detection={} event_clock={} debounced={} debounce_period={}>'.format(
             self.offset,
             self.name,
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index f4e3f06d984d751d842b3c0e77a8db2e0e9a7a60..f94b6b50d72486da1446abcda8282a8dc6d6e620 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -1,8 +1,11 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from __future__ import annotations
+
 from collections.abc import Iterable
 from datetime import timedelta
+from types import TracebackType
 from typing import Optional, Union
 
 from . import _ext
@@ -38,14 +41,19 @@ class LineRequest:
         """
         return True if self._req else False
 
-    def __enter__(self):
+    def __enter__(self) -> LineRequest:
         """
         Controlled execution enter callback.
         """
         self._check_released()
         return self
 
-    def __exit__(self, exc_type, exc_value, traceback):
+    def __exit__(
+        self,
+        exc_type: Optional[type[BaseException]],
+        exc_value: Optional[BaseException],
+        traceback: Optional[TracebackType],
+    ) -> None:
         """
         Controlled execution exit callback.
         """
@@ -77,7 +85,7 @@ class LineRequest:
         """
         return self.get_values([line])[0]
 
-    def _check_line_name(self, line):
+    def _check_line_name(self, line: Union[int, str]) -> bool:
         if isinstance(line, str):
             if line not in self._name_map:
                 raise ValueError("unknown line name: {}".format(line))
@@ -212,7 +220,7 @@ class LineRequest:
 
         return self._req.read_edge_events(max_events)
 
-    def __str__(self):
+    def __str__(self) -> str:
         """
         Return a user-friendly, human-readable description of this request.
         """
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index f2811b288f4e832802217e9249a71a4db0eb1a2d..6c6518dbc958423393790a39d69e94802eda8547 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -27,7 +27,7 @@ class LineSettings:
 
     # __repr__ generated by @dataclass uses repr for enum members resulting in
     # an unusable representation as those are of the form: <NAME: $value>
-    def __repr__(self):
+    def __repr__(self) -> str:
         return "gpiod.LineSettings(direction=gpiod.line.{}, edge_detection=gpiod.line.{}, bias=gpiod.line.{}, drive=gpiod.line.{}, active_low={}, debounce_period={}, event_clock=gpiod.line.{}, output_value=gpiod.line.{})".format(
             str(self.direction),
             str(self.edge_detection),
@@ -39,7 +39,7 @@ class LineSettings:
             str(self.output_value),
         )
 
-    def __str__(self):
+    def __str__(self) -> str:
         return "<LineSettings direction={} edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={}>".format(
             self.direction,
             self.edge_detection,

-- 
2.34.1

