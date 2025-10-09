Return-Path: <linux-gpio+bounces-26934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC1BC9326
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FEA23C3164
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1978B2E6CBE;
	Thu,  9 Oct 2025 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh9SYmDL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328A2D6E53
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015141; cv=none; b=isXxusRBrJjcR66VJq55tm174iZBXaS+odrKkyzs6hxU+xlHZegN1cUp6vcQeYwMKu89GGTGPmZx8xD0ZNXMFof40M3fe4PHLv94vdkMgvcMaGI60arFpPLklHLN2B/MFaums25Nw2rRYFsttNpoaxDGLEGCUN7qzOlKIh75Fjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015141; c=relaxed/simple;
	bh=LhWSL2R7RdHGQSqWxi4RfdJwLQ4gt6mlK2tVINdKNHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdMyM1h8/q3gXH9+VayyHihtwPwS76z0KZN6AoEf+Ysopk4hLrXrgqUvHKBFjh8uCeFTXPI6qtgQ9JylrF3gq1fZP85RbQdZn3yNSD7ZVwVVFeL5H+KEyQ8DzjTb18hNzjRtphVzbCz9NC3ubKNOmXhc7zYchgkwL95fj91mwZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh9SYmDL; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-92c781fd73aso87574939f.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015139; x=1760619939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXEWaN12dy7Y/W20U4zbrMK0ZsL1cxzWh6/oEKrvn3Q=;
        b=jh9SYmDLg6Mg6EENDnjXRHUnv6D3QDeqhng7aNuh7gxmkLiR/vmCmC0ARCmyCFTxri
         a62ApJFtSdd+9kmqqpdqsEmfJF50nw1QKk6bWUlOvzXpcSJLLFnHagjcDvR43BBSs8RL
         5jW6TCnQLM01tP3fYN3HibibAWqJA/Qc25/nr3uGD46lFLf4BuyviK4mCOnRv6Li4Ay5
         IzNoM/sWZHRIva6VglFK2dicB8A82c7dNv/UOWzuDuB7TvnDL3Cz0dlhjuOuUF9LuyJa
         +vybUpjTm9Z1uJXpiAuiXKLDSl7BduGRmV9nWto2avGf0OKYqdfgtWIflB2zXTGVayPy
         SM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015139; x=1760619939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXEWaN12dy7Y/W20U4zbrMK0ZsL1cxzWh6/oEKrvn3Q=;
        b=v2Khz43IDskERDwmlfE7ALvZ15fQ7ThiiNbcQT9CnmCszKeJcgJWraDxBAxmpCx4MP
         xfYnZkc5hWf31wb24DnAUgiJ/FIZfSNSbC073lXp4hRoQPKaAOnBkv7+KamyX7K8ZVuX
         gpRDDLaEdbPNm4T/fiMmf+xwW+wTEkxxtV13Kf7p+LgpRGIOyu/Jp4D84m7UHz/8bO9X
         xmoSO6tk2fzL7tjGJNnR7Dmh6W/HxKu87Vr+md9J62pK5/lGt3rSIdZohC/VzB1sNi4y
         A52YwWGlfeu30maM9iXscKsb9UGxOEHXTwaKcEibfirTkb14Y1iTBMiZfbCmRInLyLiK
         bhHg==
X-Gm-Message-State: AOJu0YwsnjjMti5NlBH4IDXOFyB8TjiuMq1rUoasQVUTX7Qkscl5GiK0
	0ytmtDBYTXCcGdBOc8AEJjNlbkxpEtHLporK5PBLgHUh650Y/u+pSvxBLBAaGLWO
X-Gm-Gg: ASbGncv9MJaSN8y2LbyR8b1o7ImB8uzwpI6qCTmL/OppzSS+FYtpEnZe60naHM41OM2
	7sE6drbLpQboN7p3fQYj1jFWjoKFx4TEQhIE/ZFRhShaF9Lcj9Ka8A7HvVXpiSWgMnJtitcw6ix
	jMR6qTlJnTsFARLI+10jkgq0tPEGkv7yriLvZjOVLPGB94AAkEabEn9ThOQfo8BcTsHfE77GqGb
	7rFMFXuaDYr3So1VJLozrwQA8i0cL4xA6vqLcpTcbdX75CxyfOrNfvxK0khyJBMQzhv4qjYza2t
	SoASzqMvtBxFCSSz3y9HjySjM81NnCVFAoCn0hpK2F3bqw9Fb2gmYl2oeezTA/RdPkocWBtQDql
	0VRWebcFQmUueSj2KUjkkx3xPrcnzMia5wlLrR/eTwN8hssPBilU=
X-Google-Smtp-Source: AGHT+IG0TAUlsKyGwRWfNMXdy+ZBwReHyJIMTI9G11wrDKckgPf0GLLu2VYQ+xzEShyKcy/F8zWNUA==
X-Received: by 2002:a05:6602:341c:b0:93b:d70e:68bf with SMTP id ca18e2360f4ac-93bd70e6b04mr625910539f.8.1760015138634;
        Thu, 09 Oct 2025 06:05:38 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:38 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 1/9] bindings: python: make config iteration consistent
Date: Thu,  9 Oct 2025 08:05:07 -0500
Message-ID: <20251009130516.3729433-2-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130516.3729433-1-vfazio@gmail.com>
References: <20251009130516.3729433-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, Chip.request_lines and LineRequest.reconfigure_lines
iterated over a config object but did so in subtly different ways.

Create a generator that iterates over a config object and returns line +
settings pairs. Update the aforementioned functions to use the generator
to consolidate and condense code.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/_internal.py    | 22 ++++++++++++++--
 bindings/python/gpiod/chip.py         | 38 ++++++++++++---------------
 bindings/python/gpiod/line_request.py | 12 +++------
 3 files changed, 41 insertions(+), 31 deletions(-)

diff --git a/bindings/python/gpiod/_internal.py b/bindings/python/gpiod/_internal.py
index 37f6661..ee15796 100644
--- a/bindings/python/gpiod/_internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -1,11 +1,18 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from __future__ import annotations
+
 from datetime import timedelta
 from select import select
-from typing import Optional, Union
+from typing import TYPE_CHECKING, Optional, Union
+
+if TYPE_CHECKING:
+    from collections.abc import Generator, Iterable
+
+    from .line_settings import LineSettings
 
-__all__ = ["poll_fd"]
+__all__ = ["poll_fd", "config_iter"]
 
 
 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
@@ -17,3 +24,14 @@ def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
 
     readable, _, _ = select([fd], [], [], sec)
     return True if fd in readable else False
+
+
+def config_iter(
+    config: dict[Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]],
+) -> Generator[tuple[Union[int, str], Optional[LineSettings]]]:
+    for key, settings in config.items():
+        if isinstance(key, int) or isinstance(key, str):
+            yield key, settings
+        else:
+            for subkey in key:
+                yield subkey, settings
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 169488a..9f38ab7 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -8,7 +8,7 @@ from errno import ENOENT
 from typing import TYPE_CHECKING, Optional, Union, cast
 
 from . import _ext
-from ._internal import poll_fd
+from ._internal import config_iter, poll_fd
 from .exception import ChipClosedError
 from .line import Value
 from .line_request import LineRequest
@@ -305,28 +305,24 @@ class Chip:
         offset_map = dict()
         global_output_values = list()
 
-        for lines, settings in config.items():
+        for line, settings in config_iter(config):
             offsets = list()
 
-            if isinstance(lines, int) or isinstance(lines, str):
-                lines = (lines,)
-
-            for line in lines:
-                offset = self.line_offset_from_id(line)
-                offsets.append(offset)
-
-                # If there's a global output value for this offset, store it in the
-                # list for later.
-                if mapped_output_values:
-                    global_output_values.append(
-                        mapped_output_values[offset]
-                        if offset in mapped_output_values
-                        else Value.INACTIVE
-                    )
-
-                if isinstance(line, str):
-                    name_map[line] = offset
-                    offset_map[offset] = line
+            offset = self.line_offset_from_id(line)
+            offsets.append(offset)
+
+            # If there's a global output value for this offset, store it in the
+            # list for later.
+            if mapped_output_values:
+                global_output_values.append(
+                    mapped_output_values[offset]
+                    if offset in mapped_output_values
+                    else Value.INACTIVE
+                )
+
+            if isinstance(line, str):
+                name_map[line] = offset
+                offset_map[offset] = line
 
             line_cfg.add_line_settings(
                 offsets, _line_settings_to_ext(settings or LineSettings())
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 69f86f6..7956e54 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -6,7 +6,7 @@ from __future__ import annotations
 from typing import TYPE_CHECKING, Optional, Union, cast
 
 from . import _ext
-from ._internal import poll_fd
+from ._internal import config_iter, poll_fd
 from .exception import RequestReleasedError
 from .line_settings import LineSettings, _line_settings_to_ext
 
@@ -174,13 +174,9 @@ class LineRequest:
         line_cfg = _ext.LineConfig()
         line_settings = {}
 
-        for lines, settings in config.items():
-            if isinstance(lines, int) or isinstance(lines, str):
-                lines = [lines]
-
-            for line in lines:
-                offset = self._line_to_offset(line)
-                line_settings[offset] = settings
+        for line, settings in config_iter(config):
+            offset = self._line_to_offset(line)
+            line_settings[offset] = settings
 
         for offset in self.offsets:
             settings = line_settings.get(offset) or LineSettings()
-- 
2.43.0


