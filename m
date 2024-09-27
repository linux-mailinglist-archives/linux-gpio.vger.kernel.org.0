Return-Path: <linux-gpio+bounces-10526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5887988AAC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 21:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55EB31F22F5D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 19:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BDB1C231B;
	Fri, 27 Sep 2024 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="NfCBKj/Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3E014AD25
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463907; cv=none; b=FhroWrLOo5joasFLvFXaA4ldTTOGNbRzMhKSEDvgJMbjGxosqzQMNYQMErrNkE7+KNp2gI7l0BZXjouUavURDQQAD7WZ2G/GsQEpk3OU3HU2Gq5OQmbrQzULH4lS5NSUoPpcH2fm5TKlklx7GXH3BMDVxAhzkxlWwJCPE2oJVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463907; c=relaxed/simple;
	bh=IVRrzf2822jXGkzbisnDzJLeRRdoWwlHT9/l+efyS+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=amlG3+9PaOV6DjWCu3XRsTosfGBSCEyR0x2qE7cF0rR++wvvh9ye22nLlSwukt6Z5wz79qVFXdtmWxlZgV7o9c7aQ2yfxx5lWIYs1IbqzIp91Fsv2YTV72xeB+Y+gSDvb+e5AuUof4V7/J2r+P4tHdGJSFGIpla9NiWlRSO5Ank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=NfCBKj/Y; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id C9BC92035F;
	Fri, 27 Sep 2024 13:55:15 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463315; bh=IVRrzf2822jXGkzbisnDzJLeRRdoWwlHT9/l+efyS+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NfCBKj/YFrOj7lggtkcAXJLwAIaWPUuzv2dASCMqrhM+v/q03jzsPVqs7zEUg60Ve
	 58LlJcO49sBzBzPNWv4XToq+sWNKo73eo/9lbEqHrbOy9si2DY6x5Fk+9oFP+TWE7/
	 FPDa5Etzocj7xfNoPqNKMqJFcm1TpcFOehTtZZ2c=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 01/22] bindings: python: clean up imports and exports
Date: Fri, 27 Sep 2024 13:53:37 -0500
Message-Id: <20240927-vfazio-mypy-v1-1-91a7c2e20884@xes-inc.com>
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

Remove unused imports and sort the remainder following isort rules.

Update submodules to use lists for `__all__` for ease of re-exporting
public classes from within gpiod.

Also, fix instances where `line` wasn't imported via a relative import.
The library now consistently uses relative imports for submodules.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/__init__.py      | 66 +++++++++++++++++++++++++++++-----
 bindings/python/gpiod/chip.py          | 15 ++++----
 bindings/python/gpiod/chip_info.py     |  2 +-
 bindings/python/gpiod/edge_event.py    |  5 +--
 bindings/python/gpiod/info_event.py    |  7 ++--
 bindings/python/gpiod/internal.py      |  2 +-
 bindings/python/gpiod/line.py          |  3 +-
 bindings/python/gpiod/line_info.py     |  6 ++--
 bindings/python/gpiod/line_request.py  |  9 ++---
 bindings/python/gpiod/line_settings.py |  7 ++--
 10 files changed, 87 insertions(+), 35 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 9cbb8dfb7b7b8aff4b2f6429fd831d582058c1b6..4d916f7f1a4eabd8ad1b2844262c20ed01a0798c 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -7,19 +7,67 @@ Python bindings for libgpiod.
 This module wraps the native C API of libgpiod in a set of python classes.
 """
 
-from . import _ext
-from . import line
-from .chip import Chip
-from .chip_info import ChipInfo
-from .edge_event import EdgeEvent
-from .exception import ChipClosedError, RequestReleasedError
-from .info_event import InfoEvent
-from .line_request import LineRequest
-from .line_settings import LineSettings
+from . import (
+    _ext,
+    chip,
+    chip_info,
+    edge_event,
+    exception,
+    info_event,
+    line,
+    line_info,
+    line_request,
+    line_settings,
+    version,
+)
+from .chip import *
+from .chip_info import *
+from .edge_event import *
+from .exception import *
+from .info_event import *
+from .line import *
+from .line_info import *
+from .line_request import *
+from .line_settings import *
 from .version import __version__
 
 api_version = _ext.api_version
 
+# public submodules
+__all__ = [
+    "chip",
+    "chip_info",
+    "edge_event",
+    "exception",
+    "info_event",
+    "line",
+    "line_info",
+    "line_request",
+    "line_settings",
+    "version",
+]
+
+# re-export public submodule exports
+__all__ += (
+    chip.__all__
+    + chip_info.__all__
+    + edge_event.__all__
+    + exception.__all__
+    + info_event.__all__
+    + line.__all__
+    + line_info.__all__
+    + line_request.__all__
+    + line_settings.__all__
+)
+
+# module methods/attributes
+__all__ += [
+    "__version__",
+    "api_version",
+    "is_gpiochip_device",
+    "request_lines",
+]
+
 
 def is_gpiochip_device(path: str) -> bool:
     """
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 0a5ac6daac5e44499896958f3453845bf269af2e..257a31eba8d19634fd14e3b1d33a1345a0363946 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -1,6 +1,11 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from collections import Counter
+from datetime import timedelta
+from errno import ENOENT
+from typing import Optional, Union
+
 from . import _ext
 from .chip_info import ChipInfo
 from .exception import ChipClosedError
@@ -8,16 +13,10 @@ from .info_event import InfoEvent
 from .internal import poll_fd
 from .line import Value
 from .line_info import LineInfo
-from .line_settings import LineSettings, _line_settings_to_ext
 from .line_request import LineRequest
-from collections import Counter
-from collections.abc import Iterable
-from datetime import timedelta
-from errno import ENOENT
-from select import select
-from typing import Union, Optional
+from .line_settings import LineSettings, _line_settings_to_ext
 
-__all__ = "Chip"
+__all__ = ["Chip"]
 
 
 class Chip:
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index 92b5e6f23c7117eaaa3e73ed27305116de7b0af2..884b910681abbc2069673669539d068a93f6aa72 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -4,7 +4,7 @@
 
 from dataclasses import dataclass
 
-__all__ = "ChipInfo"
+__all__ = ["ChipInfo"]
 
 
 @dataclass(frozen=True, repr=False)
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index bf258c1472abc7b0faa40ed6533c68cefcd85b6b..a8b2378f9e3a9bdfabd8dde60d5c30fc73766f4c 100644
--- a/bindings/python/gpiod/edge_event.py
+++ b/bindings/python/gpiod/edge_event.py
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from . import _ext
 from dataclasses import dataclass
 from enum import Enum
 
-__all__ = "EdgeEvent"
+from . import _ext
+
+__all__ = ["EdgeEvent"]
 
 
 @dataclass(frozen=True, init=False, repr=False)
diff --git a/bindings/python/gpiod/info_event.py b/bindings/python/gpiod/info_event.py
index 481eae6c376bc6cb418e03be84511b0de811ff91..7b544aa6436b34613a71ee06d9b675a63ad16989 100644
--- a/bindings/python/gpiod/info_event.py
+++ b/bindings/python/gpiod/info_event.py
@@ -1,12 +1,13 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from . import _ext
-from .line_info import LineInfo
 from dataclasses import dataclass
 from enum import Enum
 
-__all__ = "InfoEvent"
+from . import _ext
+from .line_info import LineInfo
+
+__all__ = ["InfoEvent"]
 
 
 @dataclass(frozen=True, init=False, repr=False)
diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/internal.py
index 2dddb65027ab6a3f8b590a65050203d3189fb8c8..d1e95e4ade3146f596643d52207b367e332e6f7e 100644
--- a/bindings/python/gpiod/internal.py
+++ b/bindings/python/gpiod/internal.py
@@ -5,7 +5,7 @@ from datetime import timedelta
 from select import select
 from typing import Optional, Union
 
-__all__ = []
+__all__ = ["poll_fd"]
 
 
 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
index d088fb4631cc9f2bf102b6fe9a6ed5dad1eb4420..828385cbd84a95f207e808fe77022caad4056916 100644
--- a/bindings/python/gpiod/line.py
+++ b/bindings/python/gpiod/line.py
@@ -2,9 +2,10 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 
-from . import _ext
 from enum import Enum
 
+from . import _ext
+
 __all__ = ["Value", "Direction", "Bias", "Drive", "Edge", "Clock"]
 
 
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index c196a6aedeb48223ff5aec27b415c3ac690a84b1..46e16533802e9c8ff57a697e5b51b8b028d0c061 100644
--- a/bindings/python/gpiod/line_info.py
+++ b/bindings/python/gpiod/line_info.py
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from . import _ext
 from dataclasses import dataclass
 from datetime import timedelta
-from gpiod.line import Direction, Bias, Drive, Edge, Clock
 
-__all__ = "LineInfo"
+from .line import Bias, Clock, Direction, Drive, Edge
+
+__all__ = ["LineInfo"]
 
 
 @dataclass(frozen=True, init=False, repr=False)
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 51e600a2ee5854f11f12d41ef561ec7bcdeb5908..e48830450dcb5b7fa6c7983a0fe074cd9bd32ab7 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -1,17 +1,18 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from collections.abc import Iterable
+from datetime import timedelta
+from typing import Optional, Union
+
 from . import _ext
 from .edge_event import EdgeEvent
 from .exception import RequestReleasedError
 from .internal import poll_fd
 from .line import Value
 from .line_settings import LineSettings, _line_settings_to_ext
-from collections.abc import Iterable
-from datetime import timedelta
-from typing import Optional, Union
 
-__all__ = "LineRequest"
+__all__ = ["LineRequest"]
 
 
 class LineRequest:
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 5e3219438c2812c449d4da84a97ebc420f2b2352..f2811b288f4e832802217e9249a71a4db0eb1a2d 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -1,12 +1,13 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from . import _ext
 from dataclasses import dataclass
 from datetime import timedelta
-from gpiod.line import Direction, Bias, Drive, Edge, Clock, Value
 
-__all__ = "LineSettings"
+from . import _ext
+from .line import Bias, Clock, Direction, Drive, Edge, Value
+
+__all__ = ["LineSettings"]
 
 
 @dataclass(repr=False)

-- 
2.34.1

