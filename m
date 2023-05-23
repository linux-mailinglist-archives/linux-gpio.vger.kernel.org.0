Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5070270DD85
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbjEWNef (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbjEWNee (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:34:34 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E832E9
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:34:31 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f60ec45314so2535625e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684848870; x=1687440870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmlJzC6R1stNojz3wktRhc0PJWxFSVC+mu8MjvWf7A4=;
        b=DC+YLdjctlbeKxxOI+qL+JWO/hZBlBHS0aETWODxlv8q3IFmiNGFCksIEXtkEddd8U
         tPXFJWG++Y5BMfjBDZVcYTqW+nZFWoy8TjeHs0iCY3biC2kQo6pkCHH2YUcRa0TZ8Qft
         +cjmdMqUVwrJIYP6yb/zKkwkGpSxU+DryIAV+nQLq8FNJhSkQ3r173dqGR0sm/KHR0E7
         86RAInlMycVZKpZAcxwLw0mwywCM8+XPiovxQTGS+SOr6UVzW6rHBiyQuIt+dC3Iostv
         t4hiptIc/G1vleIZmDSGEGMVWwdSoGyL72XpAzCAYooOUZf1SncrHcs86pzilSVRZ1X/
         caGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684848870; x=1687440870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmlJzC6R1stNojz3wktRhc0PJWxFSVC+mu8MjvWf7A4=;
        b=Cp8g4bB5vk8ZZ8zUt294emW/l1QJsZYhtI7kv4Jzz2QJljbjB6JHJpIEHQSIBmhW72
         3Ao/WdrTCltgevcxj6wky4UNNER1eYJU0KRstbWMo7Kvf2pQZWHMVIYgorTeXXQZIx0e
         9E5KOHhSYS89VxPF2qXHnIjFCAaMRU+gdqBYMyxnBIPluMqjJAh+CDdhBfCjC0Ammj8D
         CdwD/YgyAr3cZiTELDkMI0bIjUJRW7GJ+YuxD1VNHzYUPhsS0Bl9PlaB7NGBjylDctF3
         lv3jVPjDNQDVZ+XN2vIV/U4fA8EXh1/xFCFFmNZcXADI9zZrqKDivKZMycrsqPJGIcjU
         tDlw==
X-Gm-Message-State: AC+VfDwUHu0wXOcWx+6lQra7yHwFGjbRdX3sL8b6R41Wl0JiqZfh1aA+
        QntN2U1VmWUU5H5d9cLvl8+hqg==
X-Google-Smtp-Source: ACHHUZ5/5rywBu7v2k4bRdtUMUVonafo3/S1BctGirc2wDWhlbPkUc3mZQMl1mWNSXDsx1GA2BP38g==
X-Received: by 2002:a1c:f217:0:b0:3f4:2328:b5c2 with SMTP id s23-20020a1cf217000000b003f42328b5c2mr9151320wmc.35.1684848869718;
        Tue, 23 May 2023 06:34:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3c9:a1c2:c486:3efd])
        by smtp.gmail.com with ESMTPSA id s2-20020a7bc382000000b003f4fbd9cdb3sm11889117wmj.34.2023.05.23.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:34:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: change the interpretation of None in event wait
Date:   Tue, 23 May 2023 15:34:27 +0200
Message-Id: <20230523133427.194558-1-brgl@bgdev.pl>
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

The docs don't mention it but currently passing None as the timeout to
one of the event wait methods works like passing 0 to select() - the wait
method returns immediately. Change it to a more standard behavior - None
makes the method block indefinitely until an even becomes available for
reading.

This is a slight change in the behavior but let's hope nobody complains
as libgpiod v2 is still pretty recent and its adoption is (hopegully)
not wide-spread yet.

Suggested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py         | 3 ++-
 bindings/python/gpiod/internal.py     | 3 ---
 bindings/python/gpiod/line_request.py | 3 ++-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 97ff340..52d0757 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -195,7 +195,8 @@ class Chip:
         Args:
           timeout:
             Wait time limit represented as either a datetime.timedelta object
-            or the number of seconds stored in a float.
+            or the number of seconds stored in a float. If set to 0, the
+            method returns immediately, if set to None it blocks indefinitely.
 
         Returns:
           True if an info event is ready to be read from the chip, False if the
diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/internal.py
index 37e8b62..7b4598c 100644
--- a/bindings/python/gpiod/internal.py
+++ b/bindings/python/gpiod/internal.py
@@ -7,9 +7,6 @@ from typing import Optional, Union
 
 
 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
-    if timeout is None:
-        timeout = 0.0
-
     if isinstance(timeout, timedelta):
         sec = timeout.total_seconds()
     else:
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index a0f97b7..090467c 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -178,7 +178,8 @@ class LineRequest:
         Args:
           timeout:
             Wait time limit expressed as either a datetime.timedelta object
-            or the number of seconds stored in a float.
+            or the number of seconds stored in a float. If set to 0, the
+            method returns immediately, if set to None it blocks indefinitely.
 
         Returns:
           True if events are ready to be read. False on timeout.
-- 
2.39.2

