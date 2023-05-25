Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4F3710D3F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 15:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbjEYNba (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 09:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjEYNb3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 09:31:29 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1818199
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 06:31:27 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30950eecc1eso2098186f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685021485; x=1687613485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEbZwfd7B8yFINCI/0q4cupNK+9pfV7Mc1Q0t+q/ctc=;
        b=P5/mqMgEHHcNc60XfnoGVOXYsPQq6TjW86wBuDzumEyWSDaqyCqiVeJ/er0ZA8IgcR
         NZvGzTcKEpSGVNHJDQQrq6Yyia6Zhjs4KSv49CZ5R2QJaZsdGxH06ppldPypt3JdyUUi
         tLntYNlpk+z2URwPRT01LklRurUANFcaMUWF/IfP/yoX80cnqdXkVi2Fd6Qpxv8We3q2
         qbGjvTeOXNTWxXB8h7fdh5jpyHwrVz8hI8TKJksOmmwi6xrVFywz/4eiRFWZs51LDB91
         OwnS/5+6xSyxA+F9qgzlQfStCFYjcmZhjhC+61+OpKuisxfq2jdqOFAw5fSaMAmnMoZI
         Ravg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021485; x=1687613485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEbZwfd7B8yFINCI/0q4cupNK+9pfV7Mc1Q0t+q/ctc=;
        b=UYqZzYWiTgXv+Q/8epmniB4qdbat/SW1PGHvGje2dXyMNgT+XY5UcSRekjImjj+1z2
         qTs342AFuZtwxyu9KRidg7YJ4Yj7qoGe+jZZiiQ6Hoag7WOilEvUaEgNHfGogFAsRh/h
         T4TRGxO7o9CTJMzwqf5LPnjadEvMh7pbA6P0On5kpykdBk2o0WaRYr0NFcJ+d+o3XKo2
         DcUSUnNeyvsTReWPhMy6jBOZX4Ho64Wm0LGSwkzsEBtNDWgSSEuXXUNTj3gLvpq+iCST
         zWIpAvXgy9PS0CB9cI9zPoIeI7YCoTTGTeo+2ivbEPAF7VCRfZUTC12iGPUbfNxKCRcU
         vyzQ==
X-Gm-Message-State: AC+VfDyFpvHsIGPiAyyeygJB3Dv/AzMZz9J8fnHEOh64yuikE3ypkrUT
        dNvIMmozlD5+I/zF3y968fbKPA==
X-Google-Smtp-Source: ACHHUZ7T07jZk38SdTY8AxJC7KvFLKiwkj0+nzC5jB/VGQxslVKdtpWa81H95E3pcaT+j/ZnnZZu+A==
X-Received: by 2002:a5d:4147:0:b0:309:38f4:fb52 with SMTP id c7-20020a5d4147000000b0030938f4fb52mr2023175wrq.9.1685021485495;
        Thu, 25 May 2023 06:31:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1fe:b5ad:8d14:8475])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6551000000b00301a351a8d6sm1784635wrv.84.2023.05.25.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:31:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: specify the symbols to export explicitly
Date:   Thu, 25 May 2023 15:31:22 +0200
Message-Id: <20230525133122.296025-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're currently unintentionally exporting a bunch of symbols that should
remain local to sub-modules. Use __all__ where appropriate so that we
don't re-export standard library functions such as select() etc. in the
gpiod module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py          |  2 ++
 bindings/python/gpiod/chip_info.py     |  2 ++
 bindings/python/gpiod/edge_event.py    |  2 ++
 bindings/python/gpiod/exception.py     |  2 ++
 bindings/python/gpiod/ext/module.c     | 15 ++++++++++++++-
 bindings/python/gpiod/info_event.py    |  2 ++
 bindings/python/gpiod/internal.py      |  2 ++
 bindings/python/gpiod/line.py          |  2 ++
 bindings/python/gpiod/line_info.py     |  2 ++
 bindings/python/gpiod/line_request.py  |  2 ++
 bindings/python/gpiod/line_settings.py |  2 ++
 11 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 52d0757..da93370 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -17,6 +17,8 @@ from errno import ENOENT
 from select import select
 from typing import Union, Optional
 
+__all__ = "Chip"
+
 
 class Chip:
     """
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index a506b55..92b5e6f 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -4,6 +4,8 @@
 
 from dataclasses import dataclass
 
+__all__ = "ChipInfo"
+
 
 @dataclass(frozen=True, repr=False)
 class ChipInfo:
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index 88f8e9b..bf258c1 100644
--- a/bindings/python/gpiod/edge_event.py
+++ b/bindings/python/gpiod/edge_event.py
@@ -5,6 +5,8 @@ from . import _ext
 from dataclasses import dataclass
 from enum import Enum
 
+__all__ = "EdgeEvent"
+
 
 @dataclass(frozen=True, init=False, repr=False)
 class EdgeEvent:
diff --git a/bindings/python/gpiod/exception.py b/bindings/python/gpiod/exception.py
index 07ffaa6..f9a83c2 100644
--- a/bindings/python/gpiod/exception.py
+++ b/bindings/python/gpiod/exception.py
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+__all__ = ["ChipClosedError", "RequestReleasedError"]
+
 
 class ChipClosedError(Exception):
     """
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 101d756..25c252a 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -157,8 +157,8 @@ static PyTypeObject *types[] = {
 PyMODINIT_FUNC PyInit__ext(void)
 {
 	const struct module_const *modconst;
+	PyObject *module, *all;
 	PyTypeObject **type;
-	PyObject *module;
 	int ret;
 
 	module = PyModule_Create(&module_def);
@@ -172,6 +172,19 @@ PyMODINIT_FUNC PyInit__ext(void)
 		return NULL;
 	}
 
+	all = PyList_New(0);
+	if (!all) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	ret = PyModule_AddObjectRef(module, "__all__", all);
+	Py_DECREF(all);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
 	for (type = types; *type; type++) {
 		ret = PyModule_AddType(module, *type);
 		if (ret) {
diff --git a/bindings/python/gpiod/info_event.py b/bindings/python/gpiod/info_event.py
index 78b1459..481eae6 100644
--- a/bindings/python/gpiod/info_event.py
+++ b/bindings/python/gpiod/info_event.py
@@ -6,6 +6,8 @@ from .line_info import LineInfo
 from dataclasses import dataclass
 from enum import Enum
 
+__all__ = "InfoEvent"
+
 
 @dataclass(frozen=True, init=False, repr=False)
 class InfoEvent:
diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/internal.py
index 7b4598c..2dddb65 100644
--- a/bindings/python/gpiod/internal.py
+++ b/bindings/python/gpiod/internal.py
@@ -5,6 +5,8 @@ from datetime import timedelta
 from select import select
 from typing import Optional, Union
 
+__all__ = []
+
 
 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
     if isinstance(timeout, timedelta):
diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
index c5d5ddf..1cc512f 100644
--- a/bindings/python/gpiod/line.py
+++ b/bindings/python/gpiod/line.py
@@ -5,6 +5,8 @@
 from . import _ext
 from enum import Enum
 
+__all__ = ["Value", "Direction", "Bias", "Drive", "Edge", "Clock"]
+
 
 class Value(Enum):
     """Logical line states."""
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index 9a6c9bf..c196a6a 100644
--- a/bindings/python/gpiod/line_info.py
+++ b/bindings/python/gpiod/line_info.py
@@ -6,6 +6,8 @@ from dataclasses import dataclass
 from datetime import timedelta
 from gpiod.line import Direction, Bias, Drive, Edge, Clock
 
+__all__ = "LineInfo"
+
 
 @dataclass(frozen=True, init=False, repr=False)
 class LineInfo:
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 090467c..096bf18 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -11,6 +11,8 @@ from collections.abc import Iterable
 from datetime import timedelta
 from typing import Optional, Union
 
+__all__ = "LineRequest"
+
 
 class LineRequest:
     """
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index e02e932..458fd81 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -6,6 +6,8 @@ from dataclasses import dataclass
 from datetime import timedelta
 from gpiod.line import Direction, Bias, Drive, Edge, Clock, Value
 
+__all__ = "LineSettings"
+
 
 @dataclass(repr=False)
 class LineSettings:
-- 
2.39.2

