Return-Path: <linux-gpio+bounces-13015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4E9C8D40
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A92DE2820FF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AF3126C03;
	Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="lzBHH952"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CD41746
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595894; cv=none; b=f5LSjGBdleHv9X9BO/WJiLmOka2JEk3nFL6omTuVyko+i+mqkhapz+EC3zgSGcgk67YReXiawUMxjSMC1VpoqfpxsOIqUpMpcx3KG+kBN/sKWWqJy9hNtAnMDEJV4VJ4Y5B9dHWXxENohmFWSdMH5kQCQS3NceX63E+sVYdXtmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595894; c=relaxed/simple;
	bh=bsyn4Ty9/YB3fzPPG34ksDifMc5CgcOfI4R7qtg0GtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IcWxhUCIyk7VM5QJWWz3WTnM3lOHQi/SkGOQ7Rix5UGGlAbZz+7/ag4WzxISvoMyOhoSHdxW/mBgNSCIP9M5Y7QQxF77qDUmt5ZQC86WgwEK4EBYbjfuPrJsbQNNTvkH1nSf0BQDrzG5i6TxXXEZ0JkwQ0HFKEi5rm2h8uGv5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=lzBHH952; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id AD13F20AA0;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=bsyn4Ty9/YB3fzPPG34ksDifMc5CgcOfI4R7qtg0GtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzBHH952xNjyNIrpOcw4BlAwwhUrlXDLp/yhHLCE77Qxr0qxL0wS9Lexp/YyXVsw0
	 QqiiQR5hkHPpGHmOIZyGUHEsBhXAKfbHXrjWMAs0vt47rAx7xIP7gDqMWM2nOeGcul
	 spFu5+mRb61vDpzywAfdLZVETQWogFwxyl7/apEY=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 06/23] bindings: python: add missing method type hints
Date: Thu, 14 Nov 2024 08:50:59 -0600
Message-Id: <20241114145116.2123714-7-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add type hints for all method arguments and return values.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py          | 12 ++++++++++--
 bindings/python/gpiod/chip_info.py     |  2 +-
 bindings/python/gpiod/edge_event.py    |  2 +-
 bindings/python/gpiod/exception.py     |  4 ++--
 bindings/python/gpiod/info_event.py    |  2 +-
 bindings/python/gpiod/line.py          |  2 +-
 bindings/python/gpiod/line_info.py     |  2 +-
 bindings/python/gpiod/line_request.py  | 16 ++++++++++++----
 bindings/python/gpiod/line_settings.py |  4 ++--
 9 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 1db199e..bf38c7f 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from __future__ import annotations
+
 from collections import Counter
 from errno import ENOENT
 from typing import TYPE_CHECKING, Optional, Union
@@ -15,6 +17,7 @@ from .line_settings import LineSettings, _line_settings_to_ext
 if TYPE_CHECKING:
     from collections.abc import Iterable
     from datetime import timedelta
+    from types import TracebackType
 
     from .chip_info import ChipInfo
     from .info_event import InfoEvent
@@ -70,14 +73,19 @@ class Chip:
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
index 884b910..eb585d6 100644
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
index a8b2378..0d401d8 100644
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
index f9a83c2..54208e2 100644
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
index 7b544aa..d9e9564 100644
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
index 828385c..33c7368 100644
--- a/bindings/python/gpiod/line.py
+++ b/bindings/python/gpiod/line.py
@@ -15,7 +15,7 @@ class Value(Enum):
     INACTIVE = _ext.VALUE_INACTIVE
     ACTIVE = _ext.VALUE_ACTIVE
 
-    def __bool__(self):
+    def __bool__(self) -> bool:
         return self == self.ACTIVE
 
 
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index 46e1653..5ea9568 100644
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
index c7b32f3..0846e6b 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from __future__ import annotations
+
 from typing import TYPE_CHECKING, Optional, Union
 
 from . import _ext
@@ -11,6 +13,7 @@ from .line_settings import LineSettings, _line_settings_to_ext
 if TYPE_CHECKING:
     from collections.abc import Iterable
     from datetime import timedelta
+    from types import TracebackType
 
     from .edge_event import EdgeEvent
     from .line import Value
@@ -42,14 +45,19 @@ class LineRequest:
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
@@ -81,7 +89,7 @@ class LineRequest:
         """
         return self.get_values([line])[0]
 
-    def _check_line_name(self, line):
+    def _check_line_name(self, line: Union[int, str]) -> bool:
         if isinstance(line, str):
             if line not in self._name_map:
                 raise ValueError("unknown line name: {}".format(line))
@@ -216,7 +224,7 @@ class LineRequest:
 
         return self._req.read_edge_events(max_events)
 
-    def __str__(self):
+    def __str__(self) -> str:
         """
         Return a user-friendly, human-readable description of this request.
         """
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index f2811b2..6c6518d 100644
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


