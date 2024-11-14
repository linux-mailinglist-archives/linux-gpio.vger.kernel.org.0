Return-Path: <linux-gpio+bounces-13009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE079C8D3B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD11282171
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1EEBA53;
	Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="OXncu32V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D2141746
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595891; cv=none; b=foOfhRMvB7zs0KILDCHOnmMl5TyxaJpe+2QS5lP3DjYAAP4hNl7CaxwSYGkXADz/nLlriLGC2CACd6LDBz7u1386m89YoR6kxOYuUW7tQPNE5M6cBK2zj6ZiH4YAUoi966EfI6IajFQKxPGUob56zaTcCTXI3PBfOMMpLr5s+Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595891; c=relaxed/simple;
	bh=deKaW6iusWdqvEUsv4+1CTydFSZ0/TE4CAFl16/OLNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GX6R17jjBFFGNU/k6qTg1Cn51e57ud+gZh9f7rohdfFua9gWgxUHqE/31l+xfKHaPDoQshaEipm3Oz7yehnK7dUaRul+nUc4lYuccPvR8UPSQE09BPQQ+G4Ptgkr37EH0/Tj6IiTw0iYeRmQGEHdAj4C+uHsJuXVDn0AVyLR6oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=OXncu32V; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 45A2D20404;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=deKaW6iusWdqvEUsv4+1CTydFSZ0/TE4CAFl16/OLNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXncu32VpSF8zj5Hxo8RSIv7CwaqVo53PjpPPaMtYskJOzaLLz8levtXZVaMoBTR+
	 g81XHlCGsHrMGq2rdTAWQ1Oawhzxjb6uADfI/SIbsm+BKsHsLj3/ansHUxq+puWilU
	 oYBW85UeBcUK+qQ0BrdfZsyzT+RLlewlOHlfbvI0=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 01/23] bindings: python: clean up imports and exports
Date: Thu, 14 Nov 2024 08:50:54 -0600
Message-Id: <20241114145116.2123714-2-vfazio@xes-inc.com>
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

Remove unused imports and sort the remainder following isort rules.

Update submodules to use lists for `__all__` for ease of re-exporting
public classes from within gpiod.

Place imports used only for the purposes of type checking behind a
TYPE_CHECKING guard.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/__init__.py      | 65 ++++++++++++++++++++++----
 bindings/python/gpiod/chip.py          | 23 +++++----
 bindings/python/gpiod/chip_info.py     |  2 +-
 bindings/python/gpiod/edge_event.py    |  5 +-
 bindings/python/gpiod/info_event.py    |  7 +--
 bindings/python/gpiod/internal.py      |  2 +-
 bindings/python/gpiod/line.py          |  3 +-
 bindings/python/gpiod/line_info.py     |  6 +--
 bindings/python/gpiod/line_request.py  | 18 ++++---
 bindings/python/gpiod/line_settings.py |  7 +--
 10 files changed, 99 insertions(+), 39 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 9cbb8df..aaa0474 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -7,19 +7,66 @@ Python bindings for libgpiod.
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
+# do not re-export line objects, this is not an oversight
+__all__ += (
+    chip.__all__
+    + chip_info.__all__
+    + edge_event.__all__
+    + exception.__all__
+    + info_event.__all__
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
index 92a7314..29c30f5 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -1,22 +1,25 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from collections import Counter
+from errno import ENOENT
+from typing import TYPE_CHECKING, Optional, Union
+
 from . import _ext
-from .chip_info import ChipInfo
 from .exception import ChipClosedError
-from .info_event import InfoEvent
 from .internal import poll_fd
 from .line import Value
-from .line_info import LineInfo
-from .line_settings import LineSettings, _line_settings_to_ext
 from .line_request import LineRequest
-from collections import Counter
-from collections.abc import Iterable
-from datetime import timedelta
-from errno import ENOENT
-from typing import Union, Optional
+from .line_settings import LineSettings, _line_settings_to_ext
+
+if TYPE_CHECKING:
+    from datetime import timedelta
+
+    from .chip_info import ChipInfo
+    from .info_event import InfoEvent
+    from .line_info import LineInfo
 
-__all__ = "Chip"
+__all__ = ["Chip"]
 
 
 class Chip:
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index 92b5e6f..884b910 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -4,7 +4,7 @@
 
 from dataclasses import dataclass
 
-__all__ = "ChipInfo"
+__all__ = ["ChipInfo"]
 
 
 @dataclass(frozen=True, repr=False)
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index bf258c1..a8b2378 100644
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
index 481eae6..7b544aa 100644
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
index 2dddb65..d1e95e4 100644
--- a/bindings/python/gpiod/internal.py
+++ b/bindings/python/gpiod/internal.py
@@ -5,7 +5,7 @@ from datetime import timedelta
 from select import select
 from typing import Optional, Union
 
-__all__ = []
+__all__ = ["poll_fd"]
 
 
 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
index d088fb4..828385c 100644
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
index c196a6a..46e1653 100644
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
index 51e600a..292fa1b 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -1,17 +1,23 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from typing import TYPE_CHECKING, Optional, Union
+
 from . import _ext
-from .edge_event import EdgeEvent
+
 from .exception import RequestReleasedError
 from .internal import poll_fd
-from .line import Value
 from .line_settings import LineSettings, _line_settings_to_ext
-from collections.abc import Iterable
-from datetime import timedelta
-from typing import Optional, Union
 
-__all__ = "LineRequest"
+if TYPE_CHECKING:
+    from collections.abc import Iterable
+    from datetime import timedelta
+
+    from .edge_event import EdgeEvent
+    from .line import Value
+
+
+__all__ = ["LineRequest"]
 
 
 class LineRequest:
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 5e32194..f2811b2 100644
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


