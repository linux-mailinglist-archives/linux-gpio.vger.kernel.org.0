Return-Path: <linux-gpio+bounces-13030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A09C8D4E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410AC2825D8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B0654720;
	Thu, 14 Nov 2024 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="itZuNDWO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A99436AF5
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595898; cv=none; b=GmuvUtlW3aIu0ipkg9/woyk5BsbOT8pIk1fEhZGo+Fe8VFPu13kzFnqmce97Xk5ZZ6lRo9qBPzt96J3DwChQhRpyUGwXS+2tl42vFevAVQkpsy71RBGbwTN6z1QW+iLpFGiFw6TMoNZwnDBYqFs4qIQdNLQAWpXBLFX35B/2zwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595898; c=relaxed/simple;
	bh=vpgqjTRjvH2hDTv+KIRi22Hv4ChI0YVrwWYMdkJw4JQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KR2kVVULnsPivajmCRVb8oV7Zu5jBxkLkp2OeEONkKJdlIx+Gap9LpvXN7W+AL0xXBOl/GiMEU44mK8Ugi/ZdFEzxlGyj7r3RKNHa4e+mjVnJNitPH4vt4e95jZqxKdEYTXeEuco20PGW55G0u/IyT17FgZxCSC5MfwALK5WbDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=itZuNDWO; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 85D3020AB8;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=vpgqjTRjvH2hDTv+KIRi22Hv4ChI0YVrwWYMdkJw4JQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=itZuNDWOhP8+SGxZnSNgagTcMjMyOt/9JdTMcDd1kMjFfPCSHNO3L0zYgj9LDqigw
	 zR65HpacjswNZ0DaYBebtgsTC+Agd/9FlhocmS/Q8k8ACzj+NdGdyfYOodmD2FD7Iw
	 FFccKe1fOB0WeKyQpPuIlKRWaru5Q1uvcbAGmjsE=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 16/23] bindings: python: tests: clean up imports and exports
Date: Thu, 14 Nov 2024 08:51:09 -0600
Message-Id: <20241114145116.2123714-17-vfazio@xes-inc.com>
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

Update the submodules to use `__all__` to advertise available imports.

Remove an unnecessary blank line in the VersionString class to abide by
the ruff formatter's rules (compatible with black's formatting).

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/__init__.py            |  2 --
 bindings/python/tests/__main__.py            |  5 ++---
 bindings/python/tests/gpiosim/__init__.py    |  2 ++
 bindings/python/tests/gpiosim/chip.py        |  3 ++-
 bindings/python/tests/procname/__init__.py   |  2 ++
 bindings/python/tests/tests_chip.py          |  5 +++--
 bindings/python/tests/tests_chip_info.py     |  3 ++-
 bindings/python/tests/tests_edge_event.py    |  9 +++++----
 bindings/python/tests/tests_info_event.py    | 10 +++++-----
 bindings/python/tests/tests_line.py          |  3 ++-
 bindings/python/tests/tests_line_info.py     | 12 ++++++------
 bindings/python/tests/tests_line_request.py  |  6 +++---
 bindings/python/tests/tests_line_settings.py |  7 +++----
 bindings/python/tests/tests_module.py        |  7 +++----
 14 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/bindings/python/tests/__init__.py b/bindings/python/tests/__init__.py
index 02f4e8d..2374e81 100644
--- a/bindings/python/tests/__init__.py
+++ b/bindings/python/tests/__init__.py
@@ -2,8 +2,6 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 import os
-import unittest
-
 from distutils.version import LooseVersion
 
 required_kernel_version = LooseVersion("5.19.0")
diff --git a/bindings/python/tests/__main__.py b/bindings/python/tests/__main__.py
index ea4143f..8b4260d 100644
--- a/bindings/python/tests/__main__.py
+++ b/bindings/python/tests/__main__.py
@@ -4,17 +4,16 @@
 
 import unittest
 
+from . import procname
 from .tests_chip import *
 from .tests_chip_info import *
 from .tests_edge_event import *
 from .tests_info_event import *
 from .tests_line import *
 from .tests_line_info import *
+from .tests_line_request import *
 from .tests_line_settings import *
 from .tests_module import *
-from .tests_line_request import *
-
-from . import procname
 
 procname.set_process_name("python-gpiod")
 
diff --git a/bindings/python/tests/gpiosim/__init__.py b/bindings/python/tests/gpiosim/__init__.py
index f65e413..64a1551 100644
--- a/bindings/python/tests/gpiosim/__init__.py
+++ b/bindings/python/tests/gpiosim/__init__.py
@@ -2,3 +2,5 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from .chip import Chip
+
+__all__ = ["Chip"]
diff --git a/bindings/python/tests/gpiosim/chip.py b/bindings/python/tests/gpiosim/chip.py
index 6af883e..691bfe1 100644
--- a/bindings/python/tests/gpiosim/chip.py
+++ b/bindings/python/tests/gpiosim/chip.py
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from . import _ext
 from enum import Enum
 from typing import Optional
 
+from . import _ext
+
 
 class Chip:
     """
diff --git a/bindings/python/tests/procname/__init__.py b/bindings/python/tests/procname/__init__.py
index af6abdd..436ff40 100644
--- a/bindings/python/tests/procname/__init__.py
+++ b/bindings/python/tests/procname/__init__.py
@@ -2,3 +2,5 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from ._ext import set_process_name
+
+__all__ = ["set_process_name"]
diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index bd4ae34..9110beb 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -2,12 +2,13 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 import errno
-import gpiod
 import os
+from unittest import TestCase
+
+import gpiod
 
 from . import gpiosim
 from .helpers import LinkGuard
-from unittest import TestCase
 
 
 class ChipConstructor(TestCase):
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
index d392ec3..9474f38 100644
--- a/bindings/python/tests/tests_chip_info.py
+++ b/bindings/python/tests/tests_chip_info.py
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from unittest import TestCase
+
 import gpiod
 
 from . import gpiosim
-from unittest import TestCase
 
 
 class ChipInfoProperties(TestCase):
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index 68ab17e..7e7fada 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -1,16 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-import gpiod
 import time
-
-from . import gpiosim
 from datetime import timedelta
 from functools import partial
-from gpiod.line import Direction, Edge
 from threading import Thread
 from unittest import TestCase
 
+import gpiod
+from gpiod.line import Direction, Edge
+
+from . import gpiosim
+
 EventType = gpiod.EdgeEvent.Type
 Pull = gpiosim.Chip.Pull
 
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index a226e52..bbdbc0f 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -3,17 +3,17 @@
 
 import datetime
 import errno
-import gpiod
 import threading
 import time
-import unittest
-
-from . import gpiosim
 from dataclasses import FrozenInstanceError
 from functools import partial
-from gpiod.line import Direction
 from unittest import TestCase
 
+import gpiod
+from gpiod.line import Direction
+
+from . import gpiosim
+
 EventType = gpiod.InfoEvent.Type
 
 
diff --git a/bindings/python/tests/tests_line.py b/bindings/python/tests/tests_line.py
index 70aa09b..2182567 100644
--- a/bindings/python/tests/tests_line.py
+++ b/bindings/python/tests/tests_line.py
@@ -1,9 +1,10 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2024 Kent Gibson <warthog618@gmail.com>
 
-from gpiod.line import Value
 from unittest import TestCase
 
+from gpiod.line import Value
+
 
 class LineValue(TestCase):
     def test_cast_bool(self):
diff --git a/bindings/python/tests/tests_line_info.py b/bindings/python/tests/tests_line_info.py
index 2779e7a..79281a8 100644
--- a/bindings/python/tests/tests_line_info.py
+++ b/bindings/python/tests/tests_line_info.py
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-import errno
+from unittest import TestCase
+
 import gpiod
-import unittest
+from gpiod.line import Bias, Clock, Direction, Drive
 
 from . import gpiosim
-from gpiod.line import Direction, Bias, Drive, Clock
 
 HogDir = gpiosim.Chip.Direction
 
 
-class GetLineInfo(unittest.TestCase):
+class GetLineInfo(TestCase):
     def setUp(self):
         self.sim = gpiosim.Chip(
             num_lines=4,
@@ -49,7 +49,7 @@ class GetLineInfo(unittest.TestCase):
             self.chip.get_line_info()
 
 
-class LinePropertiesCanBeRead(unittest.TestCase):
+class LinePropertiesCanBeRead(TestCase):
     def test_basic_properties(self):
         sim = gpiosim.Chip(
             num_lines=8,
@@ -86,7 +86,7 @@ class LinePropertiesCanBeRead(unittest.TestCase):
             self.assertEqual(info6.debounce_period.total_seconds(), 0.0)
 
 
-class LineInfoStringRepresentation(unittest.TestCase):
+class LineInfoStringRepresentation(TestCase):
     def test_line_info_str(self):
         sim = gpiosim.Chip(
             line_names={0: "foo"}, hogs={0: ("hogger", HogDir.OUTPUT_HIGH)}
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 285c9f1..c3e86c5 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-import errno
+from unittest import TestCase
+
 import gpiod
+from gpiod.line import Clock, Direction, Drive, Edge, Value
 
 from . import gpiosim
-from gpiod.line import Clock, Direction, Drive, Edge, Value
-from unittest import TestCase
 
 Pull = gpiosim.Chip.Pull
 SimVal = gpiosim.Chip.Value
diff --git a/bindings/python/tests/tests_line_settings.py b/bindings/python/tests/tests_line_settings.py
index 83be3d9..832ac8a 100644
--- a/bindings/python/tests/tests_line_settings.py
+++ b/bindings/python/tests/tests_line_settings.py
@@ -2,12 +2,11 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 import datetime
-import gpiod
-
-from . import gpiosim
-from gpiod.line import Direction, Edge, Bias, Drive, Value, Clock
 from unittest import TestCase
 
+import gpiod
+from gpiod.line import Bias, Clock, Direction, Drive, Edge, Value
+
 
 class LineSettingsConstructor(TestCase):
     def test_default_values(self):
diff --git a/bindings/python/tests/tests_module.py b/bindings/python/tests/tests_module.py
index c6f07a6..f46729f 100644
--- a/bindings/python/tests/tests_module.py
+++ b/bindings/python/tests/tests_module.py
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-import gpiod
 import os
-import unittest
+from unittest import TestCase
+
+import gpiod
 
 from . import gpiosim
 from .helpers import LinkGuard
-from unittest import TestCase
 
 
 class IsGPIOChip(TestCase):
@@ -50,7 +50,6 @@ class IsGPIOChip(TestCase):
 
 
 class VersionString(TestCase):
-
     VERSION_PATTERN = "^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)?$"
 
     def test_api_version_string(self):
-- 
2.34.1


