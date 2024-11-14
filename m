Return-Path: <linux-gpio+bounces-13014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 236DF9C8D3F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D185228218B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A1582488;
	Thu, 14 Nov 2024 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="o7Lkw8Fp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678536AF5
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595893; cv=none; b=FZru+egeR/Gm5QFekubYOqVMJ6FWLpRXDWqDAEMl2FtCbX6k9SI45HmY6IoqKvRnO1PK/sKDRCcnprx5WQnO6q/Y48R2iQQqnNbXIOWJpJVf6eoyiHRo0YCzGqZrAA3qMlEULNsWjmhSTJmyc9PzeMeCnc5qosiMxfENHySaql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595893; c=relaxed/simple;
	bh=xUk2IRbdq+lHQV9yq/xb4NnV3hZjtrZmx/NDMoTL+wo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OHK7kbq56g88kU00H7TuHPUk2SF3ND1exhUJK7m3KIqFblRFErARniuwY+iXlT5arPh3luNcUl38evANimOovqUA1IAFORv/r8zgcLjnjR1wkH0vgxNcH3gD5jFGN77i3IaUiCuos81KyapRONB0iprktu4+Bg80ita3vFm71vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=o7Lkw8Fp; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 981B120A9C;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=xUk2IRbdq+lHQV9yq/xb4NnV3hZjtrZmx/NDMoTL+wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7Lkw8FpYBBGSB0v4AksQ0bzeG4f2i7Y3DHZGfyIniZ7EFs/Zp5qhlHpypXIbcCRy
	 mK3J1GJg1+aL2YV2TLJ7Euf7rhGZeRZ/AjSvOgkqF2D/VQCulFkAE1NynbNv7kwD55
	 M3+nys9fa7Lcxivc1WsNx2dsLNc4H+ebtNt3gO3c=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 05/23] bindings: python: add type stub for the _ext module
Date: Thu, 14 Nov 2024 08:50:58 -0600
Message-Id: <20241114145116.2123714-6-vfazio@xes-inc.com>
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

Add a type stub for the compiled external module so that types and
methods used from the module are accurately type checked.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/_ext.pyi | 93 ++++++++++++++++++++++++++++++++++
 bindings/python/setup.py       |  2 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 bindings/python/gpiod/_ext.pyi

diff --git a/bindings/python/gpiod/_ext.pyi b/bindings/python/gpiod/_ext.pyi
new file mode 100644
index 0000000..1beb80d
--- /dev/null
+++ b/bindings/python/gpiod/_ext.pyi
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2024 Vincent Fazio <vfazio@gmail.com>
+
+from typing import Optional
+
+from .chip_info import ChipInfo
+from .edge_event import EdgeEvent
+from .info_event import InfoEvent
+from .line import Value
+from .line_info import LineInfo
+
+class LineSettings:
+    def __init__(
+        self,
+        direction: int,
+        edge_detection: int,
+        bias: int,
+        drive: int,
+        active_low: bool,
+        debounce_period: int,
+        event_clock: int,
+        output_value: int,
+    ) -> None: ...
+
+class LineConfig:
+    def __init__(self) -> None: ...
+    def add_line_settings(self, offsets: list[int], settings: LineSettings) -> None: ...
+    def set_output_values(self, global_output_values: list[Value]) -> None: ...
+
+class Request:
+    def release(self) -> None: ...
+    def get_values(self, offsets: list[int], values: list[Value]) -> None: ...
+    def set_values(self, values: dict[int, Value]) -> None: ...
+    def reconfigure_lines(self, line_cfg: LineConfig) -> None: ...
+    def read_edge_events(self, max_events: Optional[int]) -> list[EdgeEvent]: ...
+    @property
+    def chip_name(self) -> str: ...
+    @property
+    def num_lines(self) -> int: ...
+    @property
+    def offsets(self) -> list[int]: ...
+    @property
+    def fd(self) -> int: ...
+
+class Chip:
+    def __init__(self, path: str) -> None: ...
+    def get_info(self) -> ChipInfo: ...
+    def line_offset_from_id(self, id: str) -> int: ...
+    def get_line_info(self, offset: int, watch: bool) -> LineInfo: ...
+    def request_lines(
+        self,
+        line_cfg: LineConfig,
+        consumer: Optional[str],
+        event_buffer_size: Optional[int],
+    ) -> Request: ...
+    def read_info_event(self) -> InfoEvent: ...
+    def close(self) -> None: ...
+    def unwatch_line_info(self, line: int) -> None: ...
+    @property
+    def path(self) -> str: ...
+    @property
+    def fd(self) -> int: ...
+
+def is_gpiochip_device(path: str) -> bool: ...
+
+api_version: str
+
+# enum constants
+BIAS_AS_IS: int
+BIAS_DISABLED: int
+BIAS_PULL_DOWN: int
+BIAS_PULL_UP: int
+BIAS_UNKNOWN: int
+CLOCK_HTE: int
+CLOCK_MONOTONIC: int
+CLOCK_REALTIME: int
+DIRECTION_AS_IS: int
+DIRECTION_INPUT: int
+DIRECTION_OUTPUT: int
+DRIVE_OPEN_DRAIN: int
+DRIVE_OPEN_SOURCE: int
+DRIVE_PUSH_PULL: int
+EDGE_BOTH: int
+EDGE_EVENT_TYPE_FALLING: int
+EDGE_EVENT_TYPE_RISING: int
+EDGE_FALLING: int
+EDGE_NONE: int
+EDGE_RISING: int
+INFO_EVENT_TYPE_LINE_CONFIG_CHANGED: int
+INFO_EVENT_TYPE_LINE_RELEASED: int
+INFO_EVENT_TYPE_LINE_REQUESTED: int
+VALUE_ACTIVE: int
+VALUE_INACTIVE: int
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 7ab783f..0d518af 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -228,7 +228,7 @@ setup(
     name="gpiod",
     url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git",
     packages=find_packages(exclude=["tests", "tests.*"]),
-    package_data={"gpiod": ["py.typed"]},
+    package_data={"gpiod": ["py.typed", "_ext.pyi"]},
     python_requires=">=3.9.0",
     ext_modules=[gpiod_ext],
     cmdclass={"build_ext": build_ext, "sdist": sdist},
-- 
2.34.1


