Return-Path: <linux-gpio+bounces-34369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJY4NV1vyWlDyAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 20:28:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A535397E
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 20:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D1C1300D479
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 18:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDB438551C;
	Sun, 29 Mar 2026 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMUdLhWv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994952DEA93
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774808921; cv=none; b=MDZzXhWmBp7RVM4zO5y7nXk53/qsepUfw3qw8MD6Kl8pmtnPGK0km6FnDQr+AtUrRmcxp2VINQZTfmXEWKPbp7iSQ//qtad6qt6UMTzm5D6d972DsE0Hik0ACdk67/xMmn7HbzwMXd27ERaBPrlcNi1BYceWkdw9jBk/zpod6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774808921; c=relaxed/simple;
	bh=WkFkH8fM+J/LnlXbLmAUr6qMVWX8cGdP1Xs8X/u5nxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYv8ng8re/XSwgePXvUPZgh1EeipeVytXzN4CqOw0mWarPq5q45twFNgZDjnuVM728dKuGit9RUuLRDSlX16+NgkyZOmK2hMwcgE5jLdbrA2kN18xGa1j6Fc5nsfZZ5nyWai+i4RYtUiZQAzgx2maSWzi4xQQ0ygIeRQIeDxWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMUdLhWv; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-67e00a230adso2384301eaf.3
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 11:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774808918; x=1775413718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg0uMy/jx2NSn6EVJetGifZ0Mlgvuk8yNhBJ8hBLp1o=;
        b=TMUdLhWvWuRen8zHfdp+30IMMfoida9lh+Gd0KMWDfny0GEkJaSVag47ogNx4ppNJy
         z8w1EFLThPKqC4k8rsiQouu5NLWKJP+ZXT84Xp1NGtYtb2ugs/ooyywlsM/fKssp4LNg
         0EXMoSsbzbN7tegUi004sXdDWUgpxmzGNmFg6WqLYDco5AFVHvwocBWDymqugUP/iPqz
         Y1bkUA/hYmZ33m5igrY9b9pIf2EP3JDfYaxwWx0ugKXbkeMz2nYbMQHvS6WdRv+YJ1Cz
         SEsfRDSjaY50txvRIlau8PFK+fe7jtBVnXDqtTC0rHh1/+i8dR0u6ZHFx0ar1A2mh3eJ
         6tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774808918; x=1775413718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg0uMy/jx2NSn6EVJetGifZ0Mlgvuk8yNhBJ8hBLp1o=;
        b=hcF/bTZ15MQ8D7X07m6jlFyZDnXtVSj5owSJifYLtB8WbAUogoGgePhwqiigIGvo69
         jpOVx9No+eKRals4AwlAE8vstgmZwnpOsyRjWd+owmjqf/fLdvDE3k9QefrcGw/F9lxC
         a5FKC7vfPlX982RGWaBFueKezMbIgfOTH5fO7kcOy2KwcnBmt2izDQNGfaD5w7jb4lTy
         yvwq/hf5sY6PNCJXg0wijJqtLB3feLh5PUbMJ4XT1lGTwgNVaAtl0VMzx630s8cc28KH
         /FK698QIPDHvBWKuVlog7TA7+NF40YMwEVNWzXpMoSf2LaRL68StH6Dq7QgskAWAB9kS
         zmBg==
X-Gm-Message-State: AOJu0YzZFdwkJ3EwPd9HwzQsSH5gjL89Q9j3+uagTzjHURM83pnY5m0u
	m52bnAWmFO8Cw/xYnsolO4dTJa6/+GwU/+jmxBDsOEB6ZG++acMSHnuDK2WLeg==
X-Gm-Gg: ATEYQzyGAr5dhF9wVP97unm95yL8ZWuZntuJEPyBRlMUiK5VB191IU4akZ+rlgdvpGu
	QVOoTCVnjr7THC9NGso+eG69UMYnPlAtuH0U4rBJWDgzVzHQI0eJYCsN5CXG4WWiKASRmTic+SE
	d3muqJmv/hbaAQ+hjHUMYT8pUZjhC++JAfTNhTQi0ip3s/fPZffv54VW9BE5M/eeMM+0RnS4+SU
	Y2JkNOUOOc4lwc+g2Smx4tcKX2sPdoc4eE6soPtq53bcLP2l9jp6rkdq/s5OOZLkrJi9D0q+iDm
	ptHF7tA9FMCh6XRgYuyNfxFIMp0u7mLMIhp8WuqDiKyYvCvBa7v3aTUFes2RTe/gtxds5G0blGU
	S0w8vuZxqpVh7lXCStTgdzmcdvfjl/oweD6ZPSx0KpKV9dl6uoB7rM/QWwgn8MmQfY6G+qF80v1
	3+xbIMdvF5LmDeGF4dAZttTisiYQbDdhlRoxLkXmLJrcPMwybGTY9/5MwJTV/PWA==
X-Received: by 2002:a05:6820:81c1:b0:67b:c368:1364 with SMTP id 006d021491bc7-67e1862686cmr5437622eaf.25.1774808918159;
        Sun, 29 Mar 2026 11:28:38 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e231ea41dsm3549796eaf.15.2026.03.29.11.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:28:37 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: drop python 3.9 support
Date: Sun, 29 Mar 2026 13:28:32 -0500
Message-ID: <20260329182832.39824-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34369-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 231A535397E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

* Update pyproject.toml to require Python 3.10+ for runtime
* Update mypy's target version to 3.10 syntax
* Drop ruff's target version as it's inferred by the project's
  requires-python value
* Remove the linter settings that ignored UP007 & UP0045
* Update type annotations to conform to active linter rules

Closes: https://github.com/brgl/libgpiod/issues/151
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/__init__.py         |  9 +++---
 bindings/python/gpiod/_ext.pyi            | 10 +++----
 bindings/python/gpiod/_internal.py        | 10 +++----
 bindings/python/gpiod/chip.py             | 36 ++++++++++-------------
 bindings/python/gpiod/line_request.py     | 36 ++++++++++-------------
 bindings/python/pyproject.toml            | 10 ++-----
 bindings/python/tests/gpiosim/chip.py     |  9 +++---
 bindings/python/tests/helpers.py          |  8 ++---
 bindings/python/tests/tests_edge_event.py |  5 ++--
 bindings/python/tests/tests_info_event.py |  3 +-
 configure.ac                              |  2 +-
 11 files changed, 59 insertions(+), 79 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 854e41f..be1b6b0 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -8,7 +8,6 @@ This module wraps the native C API of libgpiod in a set of python classes.
 """
 
 from collections.abc import Iterable
-from typing import Optional, Union
 
 from . import (
     _ext,
@@ -87,10 +86,10 @@ def is_gpiochip_device(path: str) -> bool:
 
 def request_lines(
     path: str,
-    config: dict[Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]],
-    consumer: Optional[str] = None,
-    event_buffer_size: Optional[int] = None,
-    output_values: Optional[dict[Union[int, str], line.Value]] = None,
+    config: dict[Iterable[int | str] | int | str, LineSettings | None],
+    consumer: str | None = None,
+    event_buffer_size: int | None = None,
+    output_values: dict[int | str, line.Value] | None = None,
 ) -> LineRequest:
     """
     Open a GPIO chip pointed to by 'path', request lines according to the
diff --git a/bindings/python/gpiod/_ext.pyi b/bindings/python/gpiod/_ext.pyi
index 31fd352..873c23f 100644
--- a/bindings/python/gpiod/_ext.pyi
+++ b/bindings/python/gpiod/_ext.pyi
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2024 Vincent Fazio <vfazio@gmail.com>
 
-from typing import Optional
-
 from .chip_info import ChipInfo
 from .edge_event import EdgeEvent
 from .info_event import InfoEvent
@@ -32,7 +30,7 @@ class Request:
     def get_values(self, offsets: list[int], values: list[Value]) -> None: ...
     def set_values(self, values: dict[int, Value]) -> None: ...
     def reconfigure_lines(self, line_cfg: LineConfig) -> None: ...
-    def read_edge_events(self, max_events: Optional[int]) -> list[EdgeEvent]: ...
+    def read_edge_events(self, max_events: int | None) -> list[EdgeEvent]: ...
     @property
     def chip_name(self) -> str: ...
     @property
@@ -47,12 +45,12 @@ class Chip:
     def get_info(self) -> ChipInfo: ...
     def line_offset_from_id(self, id: str) -> int: ...
     def get_line_info(self, offset: int, watch: bool) -> LineInfo: ...
-    def get_line_name(self, offset: int) -> Optional[str]: ...
+    def get_line_name(self, offset: int) -> str | None: ...
     def request_lines(
         self,
         line_cfg: LineConfig,
-        consumer: Optional[str],
-        event_buffer_size: Optional[int],
+        consumer: str | None,
+        event_buffer_size: int | None,
     ) -> Request: ...
     def read_info_event(self) -> InfoEvent: ...
     def close(self) -> None: ...
diff --git a/bindings/python/gpiod/_internal.py b/bindings/python/gpiod/_internal.py
index ee15796..b81f970 100644
--- a/bindings/python/gpiod/_internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -5,7 +5,7 @@ from __future__ import annotations
 
 from datetime import timedelta
 from select import select
-from typing import TYPE_CHECKING, Optional, Union
+from typing import TYPE_CHECKING
 
 if TYPE_CHECKING:
     from collections.abc import Generator, Iterable
@@ -15,8 +15,8 @@ if TYPE_CHECKING:
 __all__ = ["poll_fd", "config_iter"]
 
 
-def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
-    sec: Union[float, None]
+def poll_fd(fd: int, timeout: timedelta | float | None = None) -> bool:
+    sec: float | None
     if isinstance(timeout, timedelta):
         sec = timeout.total_seconds()
     else:
@@ -27,8 +27,8 @@ def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
 
 
 def config_iter(
-    config: dict[Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]],
-) -> Generator[tuple[Union[int, str], Optional[LineSettings]]]:
+    config: dict[Iterable[int | str] | int | str, LineSettings | None],
+) -> Generator[tuple[int | str, LineSettings | None]]:
     for key, settings in config.items():
         if isinstance(key, int) or isinstance(key, str):
             yield key, settings
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index a98fce6..8113fa9 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -4,7 +4,7 @@
 from __future__ import annotations
 
 from errno import ENOENT
-from typing import TYPE_CHECKING, Optional, Union, cast
+from typing import TYPE_CHECKING, cast
 
 from . import _ext
 from ._internal import config_iter, poll_fd
@@ -60,8 +60,8 @@ class Chip:
           path:
             Path to the GPIO character device file.
         """
-        self._chip: Union[_ext.Chip, None] = _ext.Chip(path)
-        self._info: Union[ChipInfo, None] = None
+        self._chip: _ext.Chip | None = _ext.Chip(path)
+        self._info: ChipInfo | None = None
 
     def __bool__(self) -> bool:
         """
@@ -81,9 +81,9 @@ class Chip:
 
     def __exit__(
         self,
-        exc_type: Optional[type[BaseException]],
-        exc_value: Optional[BaseException],
-        traceback: Optional[TracebackType],
+        exc_type: type[BaseException] | None,
+        exc_value: BaseException | None,
+        traceback: TracebackType | None,
     ) -> None:
         """
         Controlled execution exit callback.
@@ -117,7 +117,7 @@ class Chip:
 
         return self._info
 
-    def line_offset_from_id(self, id: Union[str, int]) -> int:
+    def line_offset_from_id(self, id: str | int) -> int:
         """
         Map a line's identifier to its offset within the chip.
 
@@ -155,13 +155,13 @@ class Chip:
 
         return offset
 
-    def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
+    def _get_line_info(self, line: int | str, watch: bool) -> LineInfo:
         self._check_closed()
         return cast("_ext.Chip", self._chip).get_line_info(
             self.line_offset_from_id(line), watch
         )
 
-    def get_line_info(self, line: Union[int, str]) -> LineInfo:
+    def get_line_info(self, line: int | str) -> LineInfo:
         """
         Get the snapshot of information about the line at given offset.
 
@@ -174,7 +174,7 @@ class Chip:
         """
         return self._get_line_info(line, watch=False)
 
-    def watch_line_info(self, line: Union[int, str]) -> LineInfo:
+    def watch_line_info(self, line: int | str) -> LineInfo:
         """
         Get the snapshot of information about the line at given offset and
         start watching it for future changes.
@@ -188,7 +188,7 @@ class Chip:
         """
         return self._get_line_info(line, watch=True)
 
-    def unwatch_line_info(self, line: Union[int, str]) -> None:
+    def unwatch_line_info(self, line: int | str) -> None:
         """
         Stop watching a line for status changes.
 
@@ -201,9 +201,7 @@ class Chip:
             self.line_offset_from_id(line)
         )
 
-    def wait_info_event(
-        self, timeout: Optional[Union[timedelta, float]] = None
-    ) -> bool:
+    def wait_info_event(self, timeout: timedelta | float | None = None) -> bool:
         """
         Wait for line status change events on any of the watched lines on the
         chip.
@@ -237,12 +235,10 @@ class Chip:
 
     def request_lines(
         self,
-        config: dict[
-            Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]
-        ],
-        consumer: Optional[str] = None,
-        event_buffer_size: Optional[int] = None,
-        output_values: Optional[dict[Union[int, str], Value]] = None,
+        config: dict[Iterable[int | str] | int | str, LineSettings | None],
+        consumer: str | None = None,
+        event_buffer_size: int | None = None,
+        output_values: dict[int | str, Value] | None = None,
     ) -> LineRequest:
         """
         Request a set of lines for exclusive usage.
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index deb48a7..0287791 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -4,7 +4,7 @@
 from __future__ import annotations
 
 import warnings
-from typing import TYPE_CHECKING, Optional, Union, cast
+from typing import TYPE_CHECKING, cast
 
 from . import _ext
 from ._internal import config_iter, poll_fd
@@ -33,11 +33,11 @@ class LineRequest:
         Note: LineRequest objects can only be instantiated by a Chip parent.
         LineRequest.__init__() is not part of stable API.
         """
-        self._req: Union[_ext.Request, None] = req
+        self._req: _ext.Request | None = req
         self._chip_name: str
         self._offsets: list[int]
         self._name_map: dict[str, int]
-        self._lines: list[Union[int, str]]
+        self._lines: list[int | str]
 
     def __bool__(self) -> bool:
         """
@@ -57,9 +57,9 @@ class LineRequest:
 
     def __exit__(
         self,
-        exc_type: Optional[type[BaseException]],
-        exc_value: Optional[BaseException],
-        traceback: Optional[TracebackType],
+        exc_type: type[BaseException] | None,
+        exc_value: BaseException | None,
+        traceback: TracebackType | None,
     ) -> None:
         """
         Controlled execution exit callback.
@@ -79,7 +79,7 @@ class LineRequest:
         cast("_ext.Request", self._req).release()
         self._req = None
 
-    def get_value(self, line: Union[int, str]) -> Value:
+    def get_value(self, line: int | str) -> Value:
         """
         Get a single GPIO line value.
 
@@ -92,16 +92,14 @@ class LineRequest:
         """
         return self.get_values([line])[0]
 
-    def _line_to_offset(self, line: Union[int, str]) -> int:
+    def _line_to_offset(self, line: int | str) -> int:
         if isinstance(line, int):
             return line
         if (_line := self._name_map.get(line)) is None:
             raise ValueError(f"unknown line name: {line}")
         return _line
 
-    def get_values(
-        self, lines: Optional[Iterable[Union[int, str]]] = None
-    ) -> list[Value]:
+    def get_values(self, lines: Iterable[int | str] | None = None) -> list[Value]:
         """
         Get values of a set of GPIO lines.
 
@@ -124,7 +122,7 @@ class LineRequest:
         cast("_ext.Request", self._req).get_values(offsets, buf)
         return buf
 
-    def set_value(self, line: Union[int, str], value: Value) -> None:
+    def set_value(self, line: int | str, value: Value) -> None:
         """
         Set the value of a single GPIO line.
 
@@ -136,7 +134,7 @@ class LineRequest:
         """
         self.set_values({line: value})
 
-    def set_values(self, values: dict[Union[int, str], Value]) -> None:
+    def set_values(self, values: dict[int | str, Value]) -> None:
         """
         Set the values of a subset of GPIO lines.
 
@@ -152,9 +150,7 @@ class LineRequest:
 
     def reconfigure_lines(
         self,
-        config: dict[
-            Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]
-        ],
+        config: dict[Iterable[int | str] | int | str, LineSettings | None],
     ) -> None:
         """
         Reconfigure requested lines.
@@ -196,9 +192,7 @@ class LineRequest:
 
         cast("_ext.Request", self._req).reconfigure_lines(line_cfg)
 
-    def wait_edge_events(
-        self, timeout: Optional[Union[timedelta, float]] = None
-    ) -> bool:
+    def wait_edge_events(self, timeout: timedelta | float | None = None) -> bool:
         """
         Wait for edge events on any of the requested lines.
 
@@ -215,7 +209,7 @@ class LineRequest:
 
         return poll_fd(self.fd, timeout)
 
-    def read_edge_events(self, max_events: Optional[int] = None) -> list[EdgeEvent]:
+    def read_edge_events(self, max_events: int | None = None) -> list[EdgeEvent]:
         """
         Read a number of edge events from a line request.
 
@@ -271,7 +265,7 @@ class LineRequest:
         return self._offsets
 
     @property
-    def lines(self) -> list[Union[int, str]]:
+    def lines(self) -> list[int | str]:
         """
         List of requested lines. Lines requested by name are listed as such.
         """
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 1c3549c..d919b88 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -11,7 +11,7 @@ dynamic = ["version"]
 description = "Python bindings for libgpiod"
 readme = "README.md"
 license = "LGPL-2.1-or-later"
-requires-python = ">=3.9.0"
+requires-python = ">=3.10"
 authors = [
   {name = "Bartosz Golaszewski", email = "brgl@bgdev.pl"},
 ]
@@ -22,7 +22,6 @@ classifiers = [
   "Programming Language :: Python",
   "Programming Language :: Python :: 3",
   "Programming Language :: Python :: 3 :: Only",
-  "Programming Language :: Python :: 3.9",
   "Programming Language :: Python :: 3.10",
   "Programming Language :: Python :: 3.11",
   "Programming Language :: Python :: 3.12",
@@ -46,7 +45,7 @@ include = ["gpiod"]
 namespaces = false
 
 [tool.mypy]
-python_version = "3.9"
+python_version = "3.10"
 files = [
   "gpiod/",
   "tests/",
@@ -57,7 +56,7 @@ module = "gpiod.line.*"
 strict_equality = false # Ignore Enum comparison-overlap: https://github.com/python/mypy/issues/17317
 
 [tool.ruff]
-target-version = "py39"
+target-version = "py310"
 include = [
   "gpiod/**/*.py",
   "gpiod/**/*.pyi",
@@ -72,9 +71,6 @@ ignore=[
   "B904",
   # Never enforce line length violations. Let the formatter handle it: https://docs.astral.sh/ruff/formatter/#conflicting-lint-rules
   "E501",
-  # Ignore new Union (|) syntax until we require 3.10+
-  "UP007",
-  "UP045",
 ]
 
 [tool.ruff.lint.per-file-ignores]
diff --git a/bindings/python/tests/gpiosim/chip.py b/bindings/python/tests/gpiosim/chip.py
index 691bfe1..7fd0042 100644
--- a/bindings/python/tests/gpiosim/chip.py
+++ b/bindings/python/tests/gpiosim/chip.py
@@ -2,7 +2,6 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from enum import Enum
-from typing import Optional
 
 from . import _ext
 
@@ -27,10 +26,10 @@ class Chip:
 
     def __init__(
         self,
-        label: Optional[str] = None,
-        num_lines: Optional[int] = None,
-        line_names: Optional[dict[int, str]] = None,
-        hogs: Optional[dict[int, tuple[str, Direction]]] = None,
+        label: str | None = None,
+        num_lines: int | None = None,
+        line_names: dict[int, str] | None = None,
+        hogs: dict[int, tuple[str, Direction]] | None = None,
     ):
         self._chip = _ext.Chip()
 
diff --git a/bindings/python/tests/helpers.py b/bindings/python/tests/helpers.py
index ad272a1..4abd8b2 100644
--- a/bindings/python/tests/helpers.py
+++ b/bindings/python/tests/helpers.py
@@ -4,7 +4,7 @@
 from __future__ import annotations
 
 import os
-from typing import TYPE_CHECKING, Optional
+from typing import TYPE_CHECKING
 
 if TYPE_CHECKING:
     from types import TracebackType
@@ -20,8 +20,8 @@ class LinkGuard:
 
     def __exit__(
         self,
-        type: Optional[type[BaseException]],
-        val: Optional[BaseException],
-        tb: Optional[TracebackType],
+        type: type[BaseException] | None,
+        val: BaseException | None,
+        tb: TracebackType | None,
     ) -> None:
         os.unlink(self.dst)
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index bf1685c..4efed2a 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -6,7 +6,6 @@ from datetime import timedelta
 from functools import partial
 from select import select
 from threading import Thread
-from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -56,7 +55,7 @@ class EdgeEventInvalidConfig(TestCase):
 class WaitingForEdgeEvents(TestCase):
     def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8)
-        self.thread: Optional[Thread] = None
+        self.thread: Thread | None = None
 
     def tearDown(self) -> None:
         if self.thread:
@@ -208,7 +207,7 @@ class PollLineRequestObject(TestCase):
         self.request = gpiod.request_lines(
             self.sim.dev_path, {2: gpiod.LineSettings(edge_detection=Edge.BOTH)}
         )
-        self.thread: Optional[Thread] = None
+        self.thread: Thread | None = None
 
     def tearDown(self) -> None:
         if self.thread:
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index 31dc952..e32ef19 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -8,7 +8,6 @@ import time
 from dataclasses import FrozenInstanceError
 from functools import partial
 from select import select
-from typing import Optional
 from unittest import TestCase
 
 import gpiod
@@ -53,7 +52,7 @@ class WatchingInfoEventWorks(TestCase):
     def setUp(self) -> None:
         self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
         self.chip = gpiod.Chip(self.sim.dev_path)
-        self.thread: Optional[threading.Thread] = None
+        self.thread: threading.Thread | None = None
 
     def tearDown(self) -> None:
         if self.thread:
diff --git a/configure.ac b/configure.ac
index 61a010f..c1bae2a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -234,7 +234,7 @@ AM_CONDITIONAL([WITH_BINDINGS_PYTHON], [test "x$with_bindings_python" = xtrue])
 
 if test "x$with_bindings_python" = xtrue
 then
-	AM_PATH_PYTHON([3.9], [],
+	AM_PATH_PYTHON([3.10], [],
 		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
 fi
 
-- 
2.43.0


