Return-Path: <linux-gpio+bounces-10507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07677988A8B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7681FB23036
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937E61C232D;
	Fri, 27 Sep 2024 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="CF+fIuG9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6771C231A
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463325; cv=none; b=jHyO6wwHwJS7mz6lH2Nm6SnP9IbiGh7Wfoqhlj4ibeGZjHoL2+HLmW9fHC4C0Ev3lVtr9nyq6qXcWBSlntw7hNqETNhhDqLmY2g7f0M8CptAPnRg055RMFmHVGNu1SEBhJTrp8b5GLqfi+4iPQc7wODAYLww3yOgTdwP6qLUkjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463325; c=relaxed/simple;
	bh=FDinvSBMro6zgCM4Nlx85J5kjzX7KxDi/TPZjnTHsvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J9YT9gc9g7bSeTms1uAbQzzhJoBjKHs5f//Dv6Q3GNusZfpFt09aAkgiPchA/BiQEHjp1/PLO48bMXCNomT63b+eTILLs7n7ZuSVokdwRRrDq30ob9b5e8hBSbsmZjwxP61dUMwwiOqU++WBryVxTirWuftVyr9hmZAtY8AfFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=CF+fIuG9; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 3374D20A30;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=FDinvSBMro6zgCM4Nlx85J5kjzX7KxDi/TPZjnTHsvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CF+fIuG9dzC9gPNEA9MMRU5Ksen5x5Gw9xNbydNv/V+F3juVM2ikJQAohGhWeW1UN
	 VPys3GFuNzrYGxGsMd24zwMBkN+E/c8dWSFaEsoFUPjcVAZ2mprZQz/VgJGrnJIu/9
	 h3PlR2Fz18BEI4cikzr3rDn6SWBVX1jtw0U16c84=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 05/22] bindings: python: add type stubs for _ext
Date: Fri, 27 Sep 2024 13:53:41 -0500
Message-Id: <20240927-vfazio-mypy-v1-5-91a7c2e20884@xes-inc.com>
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

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/_ext.pyi | 93 ++++++++++++++++++++++++++++++++++++++++++
 bindings/python/setup.py       |  2 +-
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/_ext.pyi b/bindings/python/gpiod/_ext.pyi
new file mode 100644
index 0000000000000000000000000000000000000000..1beb80dde9f080b729374b9dc69322c01fc37889
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
index 1f04b9939b47dc7b960679b6f24e87a6f2a4e46f..54790dfd88e77762719fce3d9194499e8ff39d73 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -224,7 +224,7 @@ setup(
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

