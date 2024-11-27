Return-Path: <linux-gpio+bounces-13326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B89DAA58
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 16:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D441678CD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 15:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AE61FCF6D;
	Wed, 27 Nov 2024 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0vAmF/FN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045861442E8
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732719946; cv=none; b=feFTDIl4TlIC1qFx+ey8c2M6sBRWwKjqOfHnH536JG72b4nT328gJ+UPXL7ot+Snz7Y43cYHXEkYtPS9SPfx0zong9ti2YJrUHwKwQWyDUiXTg5FmSsblvbmD5q702T84fp55OfocAaDc8X/il1FIxEeHVEU7hzIhNDyVbRIEmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732719946; c=relaxed/simple;
	bh=ZtIZIYeVPB0qztgEfmHMwg6qqjX71qq75ZFIq7AHPq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1nfqvR7yj+TABMsvNl+BS0RwsiIyYiU1FRQA53+Ck5o4qYUYFlOFuUD7U0ECaJpqywDupJIRSFjHhyFbBuZ42/dgA29JUJk/2Sf4Mys9i4H0WWYdgaLH2YfQNvu/2RgekwkZrsD7gVOQR2DQhe9+Yc+//diGuN+seWZGe5q7oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0vAmF/FN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3824aef833bso4946845f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732719942; x=1733324742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3X5H8BIOZrHzO0tHJ+BPyQ/2wAyK0HZluCX19kRLhw=;
        b=0vAmF/FN+dZWPL4g0WdRbx16vJRpuzz6bNJ4Czb6SzIzgb+GSg+tyJ17+8TmflZ1I/
         LlLVODAdOmJP2y+dNXr3wPoVinOvumyGV8Bh03uEB0I6dauPPVlGxFsE4rpfvbWW0vTo
         FmwjTO5W/VyUc+0HM3Rb/6Q/5pz6ZhHgdo98TwoQ0VXFUdwbVIj9YcwY78OdgfHRRMKt
         z9ufH4gg4BF35QCYe8wAnz4aQunks5S93G1hhRY/MP4/h+NLufEUi1e09WlSnWqMyIl8
         7S57su0h8LWATkGe4XMQ2EuWojhClK7mdZPjIMc5znkIWbZMiGU47cHVm+cywPjFdN1v
         yeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732719942; x=1733324742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3X5H8BIOZrHzO0tHJ+BPyQ/2wAyK0HZluCX19kRLhw=;
        b=AQ3EwiYh+TXJEeAG0wgSiSm00640x/UJVX86UuWIvell4Mv32OXE4kiFzUR5oWpfv0
         XeXCS7jAKaIalYf0CZX6k8zUVzejBrdErGXMoZP+URvIvQ6Qxhma4E/WmsrsgF6Rpxid
         FMCAKOIg6Ka42/dboPiAndlk5XIBYCTMVNvMiP60g3r7cB26911G1VJ0eTEFptf9iqAQ
         r/QXlMlutAv0dXpCCAIP6VNoUGi6qtT7tRAO/4eymdN37CCwo4r9NRPc0tesa5dgifCK
         VmOxmAh+XGmcFjlRxMDaR4es2AyK5l50H7qcgINGAcw9KTh3Y5ePjZBWMlFe50J6k418
         SyiA==
X-Gm-Message-State: AOJu0YzkugU8noVojR7sWuDc+cgmhkUJXnutwiKYAEQvECLJW8RotLPV
	ftLlGrfkM/ixMtx0WaNXgSeZXTOOXGm0MXDUbznQYBGb/oI/BVCKF8gDETkyzsk9cKNvg9DDPEy
	J
X-Gm-Gg: ASbGncvF1SKbuBrNvvMoL5wVgD8kif82W1YkG+e35la+0OW7nt5opngRJZvmJJzZLbX
	knVDLpPJ+hXriGqq++PofVkuDJccSuEXcPXWawqbVuwG8xyi6SheiLfzNOtCugNa9jXmWJGsPEk
	a2YpXHnGgRLHKsdZ/LAQAO47+4sS41tsP+MCGqcZbvAtSkhOlG1Wn2Zznq/EaOuSsIGm50kWAyb
	EjYxhtPq9iIgqh6MaGffhUFdXrcHq0VO+z80HfKJrpNOIDkvQ==
X-Google-Smtp-Source: AGHT+IGXxJaQOJa8xRcJJft2GesEpvO5PLc7M5KjEXN9cgNK7NlfxdFz+pJ3tj7g8q4xfTkgoAo3WA==
X-Received: by 2002:a05:6000:2d83:b0:382:38e6:1ee4 with SMTP id ffacd0b85a97d-385c6ebadf9mr2057260f8f.25.1732719931386;
        Wed, 27 Nov 2024 07:05:31 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fecd:58cc:bc05:528d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm16475161f8f.91.2024.11.27.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 07:05:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: fix license tags
Date: Wed, 27 Nov 2024 16:05:29 +0100
Message-ID: <20241127150529.126896-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Several files under bindings/python/ have wrong license tags.

In general:
- Makefiles should be covered by GPL
- all python sources under bindings/python/gpiod/ and
  bindings/python/tests/ that are part of importable modules should be
  licensed under LGPL
- executable examples should be licensed under GPL

Reported-by: Vincent Fazio <vfazio@xes-inc.com>
Closes: https://github.com/brgl/libgpiod/issues/110
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Kent, Vincent:

This patch doesn't really relicense the code. It just makes the
licensing consistent across the python bindings. However - as the only
two authors of the affected files other than me - could you please leave
your acks?

 bindings/python/gpiod/Makefile.am            | 2 +-
 bindings/python/gpiod/_internal.py           | 2 +-
 bindings/python/gpiod/ext/Makefile.am        | 2 +-
 bindings/python/tests/Makefile.am            | 2 +-
 bindings/python/tests/gpiosim/Makefile.am    | 2 +-
 bindings/python/tests/gpiosim/__init__.py    | 2 +-
 bindings/python/tests/helpers.py             | 2 +-
 bindings/python/tests/system/Makefile.am     | 2 +-
 bindings/python/tests/system/__init__.py     | 2 +-
 bindings/python/tests/tests_line.py          | 2 +-
 bindings/python/tests/tests_line_settings.py | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/bindings/python/gpiod/Makefile.am b/bindings/python/gpiod/Makefile.am
index 49addcc..7e37b8d 100644
--- a/bindings/python/gpiod/Makefile.am
+++ b/bindings/python/gpiod/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 SUBDIRS = ext
diff --git a/bindings/python/gpiod/_internal.py b/bindings/python/gpiod/_internal.py
index c9b5d28..37f6661 100644
--- a/bindings/python/gpiod/_internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from datetime import timedelta
diff --git a/bindings/python/gpiod/ext/Makefile.am b/bindings/python/gpiod/ext/Makefile.am
index 9c81b17..3a8a0d1 100644
--- a/bindings/python/gpiod/ext/Makefile.am
+++ b/bindings/python/gpiod/ext/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 EXTRA_DIST = \
diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
index d6e3ea3..1809206 100644
--- a/bindings/python/tests/Makefile.am
+++ b/bindings/python/tests/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 SUBDIRS = gpiosim system
diff --git a/bindings/python/tests/gpiosim/Makefile.am b/bindings/python/tests/gpiosim/Makefile.am
index b403f3c..cc8c11a 100644
--- a/bindings/python/tests/gpiosim/Makefile.am
+++ b/bindings/python/tests/gpiosim/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 EXTRA_DIST = \
diff --git a/bindings/python/tests/gpiosim/__init__.py b/bindings/python/tests/gpiosim/__init__.py
index 64a1551..ddb59be 100644
--- a/bindings/python/tests/gpiosim/__init__.py
+++ b/bindings/python/tests/gpiosim/__init__.py
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from .chip import Chip
diff --git a/bindings/python/tests/helpers.py b/bindings/python/tests/helpers.py
index 2126901..ad272a1 100644
--- a/bindings/python/tests/helpers.py
+++ b/bindings/python/tests/helpers.py
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from __future__ import annotations
diff --git a/bindings/python/tests/system/Makefile.am b/bindings/python/tests/system/Makefile.am
index dbc8e64..3590be3 100644
--- a/bindings/python/tests/system/Makefile.am
+++ b/bindings/python/tests/system/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 EXTRA_DIST = \
diff --git a/bindings/python/tests/system/__init__.py b/bindings/python/tests/system/__init__.py
index cba9b92..99fde9c 100644
--- a/bindings/python/tests/system/__init__.py
+++ b/bindings/python/tests/system/__init__.py
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from ._ext import check_kernel_version, set_process_name
diff --git a/bindings/python/tests/tests_line.py b/bindings/python/tests/tests_line.py
index c96f6de..5bc742a 100644
--- a/bindings/python/tests/tests_line.py
+++ b/bindings/python/tests/tests_line.py
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2024 Kent Gibson <warthog618@gmail.com>
 
 from unittest import TestCase
diff --git a/bindings/python/tests/tests_line_settings.py b/bindings/python/tests/tests_line_settings.py
index 66e01df..ad70921 100644
--- a/bindings/python/tests/tests_line_settings.py
+++ b/bindings/python/tests/tests_line_settings.py
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 import datetime
-- 
2.45.2


