Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA4D709E84
	for <lists+linux-gpio@lfdr.de>; Fri, 19 May 2023 19:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjESRrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 13:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjESRrY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 13:47:24 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC9DC1
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 10:47:23 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so7722185e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684518442; x=1687110442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8k0SzhVYf0x2I84ZY2J1e/vAFdQ0ldj9RFCPO9pMLNs=;
        b=ZqIhVfJnJH8Nd5B79sLzlmHbd4K68qRj0kv2OPKJo0JcJp52HBro03CS4T0thV37LH
         yMMIPsMXDBotQidopBcwoj/DOW5j543lrlFVzmuOJNc9nc0SCIzMIBuQ0lIsiHW/V8gZ
         TefsVbpaBoANi6CLsWQkeniql8Yo6ZDA/I0bBNtEG3opYXxRmDrT5ltOl43SDBXTMN9f
         q3wEi4Mu317Xfs9SnyQSj9FV8JGZP3vDBD68Ymvv24rrmuUx23XlhAYo6zvkUXE/YAco
         j9fXRt6P9AhQCnHf6oDW28p0urTIiaKF6etNoJ0wOhM9LVq/r1aeJHRoSMi/g0EgbMfA
         nnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684518442; x=1687110442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8k0SzhVYf0x2I84ZY2J1e/vAFdQ0ldj9RFCPO9pMLNs=;
        b=c4Hk7Brw2/vi5waeiQ4yK/8lVTyj7DseY5rgv9JoZAHHp96uRjM/tpCw/1HzUEVFZv
         S/dlwDbjxEvcRe5R/vVPCL7StBgYiHVQpU711qir9dEgiHvxeeTkHJ+GmzDRJnlD+05q
         AQZC8xGOMirafRulfvSlMAQWy1U+dwLEjdkANzquZW4oudWUimISHmOA2WyYd6qy+Puz
         0zyHhWrVgWs20mLiUer7uYmU2BXFYZaSN0lgzA08M8JAv7LTPWvBYR0RRdtPDHI5jqLO
         d6m4VIdSt73c/gdWnwTkivWDAqgEFTngBRCcHWIZozxOsTKlrZUOwmL0+cZDyDRhrNqm
         6sbQ==
X-Gm-Message-State: AC+VfDzhYTlxd++ykbd1M284fHB5zXbAGx2a5zLAW2n9K2ASLlJDpGgF
        SkGqSNie8DFVOdIHJN65uiW6B7gbYnI=
X-Google-Smtp-Source: ACHHUZ43IjYi12Iv3B+T+nKHxIiQNU2LGf29+s2MQjiF57lUCFNzRdxd4kTCaVjYppwYXZhHY0Tj+A==
X-Received: by 2002:a5d:6e01:0:b0:309:48eb:993d with SMTP id h1-20020a5d6e01000000b0030948eb993dmr4247305wrz.15.1684518441472;
        Fri, 19 May 2023 10:47:21 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b003f42bb3a5adsm3100758wmi.4.2023.05.19.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:47:20 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: [libgpiod] [RFC PATCH] bindings: python: allow specifying infinite timeout
Date:   Fri, 19 May 2023 19:46:19 +0200
Message-Id: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

So far, libgpiod's Python bindings had no way to state that a
user wishes to wait for events indefinitely, as a timeout of
None would intentionally be converted to 0 seconds, i.e. return
from the select call in poll_fd immediately.

The usual Python convention and even the select convention is
to block indefinitely on a timeout=None. However, changing the
poll_fd function to do this now would change an (intentional)
API design choice by libgpiod 2.0 that API users presumably
rely on.

By allowing float("inf") (or in fact math.inf, or your favourite
other way to get an infinite float) to mean waiting infinitely
solves this by extending the API rather than changing it.

On gpiod Python bindings without this change, passing inf results
in an OverflowError being raised in select. API users who wish to
support older versions of the bindings can catch this exception and
act on it.

Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 bindings/python/gpiod/chip.py         | 3 ++-
 bindings/python/gpiod/internal.py     | 4 ++++
 bindings/python/gpiod/line_request.py | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 97ff340..95c5757 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -195,7 +195,8 @@ class Chip:
         Args:
           timeout:
             Wait time limit represented as either a datetime.timedelta object
-            or the number of seconds stored in a float.
+            or the number of seconds stored in a float. A timeout of None
+            returns immediately, use float("inf") to wait indefinitely.
 
         Returns:
           True if an info event is ready to be read from the chip, False if the
diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/internal.py
index 37e8b62..141cfe9 100644
--- a/bindings/python/gpiod/internal.py
+++ b/bindings/python/gpiod/internal.py
@@ -2,6 +2,7 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from datetime import timedelta
+from math import inf
 from select import select
 from typing import Optional, Union
 
@@ -15,5 +16,8 @@ def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
     else:
         sec = timeout
 
+    if sec == inf:
+        sec = None
+
     readable, _, _ = select([fd], [], [], sec)
     return True if fd in readable else False
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index a0f97b7..ae21835 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -178,7 +178,8 @@ class LineRequest:
         Args:
           timeout:
             Wait time limit expressed as either a datetime.timedelta object
-            or the number of seconds stored in a float.
+            or the number of seconds stored in a float. None returns
+            immediately. Use float("inf") to wait indefinitely.
 
         Returns:
           True if events are ready to be read. False on timeout.
-- 
2.40.1

