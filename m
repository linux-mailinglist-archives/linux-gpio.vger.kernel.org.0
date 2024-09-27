Return-Path: <linux-gpio+bounces-10517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA9988A94
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E77D1F22E35
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231BB1C2333;
	Fri, 27 Sep 2024 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="FDNbIl4R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F451C2337
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463328; cv=none; b=NCG70a+S3ix5hxPGd0KJXIqi0HSwpCtpuQTr0/mVySlTnds6CvymMU7erMQ1oYX/HL9M06hK53EC/+OnWRp8RL9r4bGa2pnXKUME+BIqEbu026OkaAIuN9vLgcMsd291gIG5DcufAKvkR3yoK3JpQvU0FLZKRCdBtv+syfmgStk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463328; c=relaxed/simple;
	bh=6ORqKrlpUSMK2pUwLJRXBgyhhpVE3Mc0Oew+WLQbskU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+O/8wnLfViE+RknwMp3YgWrgPzfigRL/43olSJveH1oYo4MSJwurtxqsD3CkMKxsSkmTvdZWgukbLtBNoBQf+TSAuiWMDEd6mxCO+IMXTAY3ysz2/CIiyspjujybN++AGxnqugeBmDMZ3YYP/QyPYA7rkMCJWDRjwCzBaCcWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=FDNbIl4R; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 1DE5E21830;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=6ORqKrlpUSMK2pUwLJRXBgyhhpVE3Mc0Oew+WLQbskU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDNbIl4RkUpXAaJGGZ7NFvwyGg67OJMafoFr4rlpNpMFdjhfyajbn4pdo9/V9P6z4
	 mISamDpuW3SCEBtQfQwTDhZykbZfPcIgjNGl67xpXg4Om4qI2TmZ/1GquxFDmUfLlZ
	 +r3Iffx1KJT3M04oZDZAWgktzhDeQlzzW4uWLMpg=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 15/22] bindings: python: tests: clean up imports and exports
Date: Fri, 27 Sep 2024 13:53:51 -0500
Message-Id: <20240927-vfazio-mypy-v1-15-91a7c2e20884@xes-inc.com>
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
index 02f4e8d59c9aa426ca23a8ff2be4aa8aed8784c2..2374e8155373efbd94d5c66dcfdffa7cc23be9f6 100644
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
index ea4143f53de5ac7d6202508216c7021ad3673b37..8b4260dfeeb39495b9b98fb096f8d3559e7ad7d3 100644
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
index f65e413a6e8a578607f24c179f34308228dd5cea..64a15511df70863a14e134c1986ea625f4701dd6 100644
--- a/bindings/python/tests/gpiosim/__init__.py
+++ b/bindings/python/tests/gpiosim/__init__.py
@@ -2,3 +2,5 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from .chip import Chip
+
+__all__ = ["Chip"]
diff --git a/bindings/python/tests/gpiosim/chip.py b/bindings/python/tests/gpiosim/chip.py
index 6af883ee3152aee2976e674647a218d34d4dbf7e..691bfe13084b3fcc109dffc64866fb901d7d8069 100644
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
index af6abdd2586a95c83234ac9a6f445e3e33e71866..436ff406fec30f7711dd1bb3f95024a6c530d45a 100644
--- a/bindings/python/tests/procname/__init__.py
+++ b/bindings/python/tests/procname/__init__.py
@@ -2,3 +2,5 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from ._ext import set_process_name
+
+__all__ = ["set_process_name"]
diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index bd4ae34cd618a972417e314b36ed527675627fbc..9110bebf3596557fbacb3c7620e931982f9dc957 100644
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
index d392ec3beaf027326ae91952b917f0d6aae61fd0..9474f38be3d33e60529e0e24fb4f10cb99ce9d5c 100644
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
index 68ab17eae7be301cbca8d6d83f90a03df0aeea53..7e7fada38cf2a983172aaa9c8400fbfe0d3b7a7d 100644
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
index a226e52a282347f7514a46f854a9dd5a06a50be8..bbdbc0fa6e69c59a32d67d00f5e785105c90e840 100644
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
index 70aa09bda2033bab7d7e59ea4ff48b2b783da468..218256711b2b248f692f07b9ae99e462f03c6965 100644
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
index 2779e7a7353c95b35f78ab96311a418af41ffdbc..79281a82932a32bdb8c89f2aac7b15eb28eafd9d 100644
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
index 285c9f1e6f43c9623880e91923b0019575adf768..c3e86c56be63f7e449c07e7833cb7080ee42b0ac 100644
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
index 83be3d9a90b9391ffe9cb3fb09c1a4a2042468c6..832ac8a2377ddb25f5a5ab5c1732d1a9d5c5dff1 100644
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
index c6f07a618b2c19e6afae9b1bf48747b086c8919a..f46729feda86962d17907bc8b6b4e710fec3087e 100644
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

