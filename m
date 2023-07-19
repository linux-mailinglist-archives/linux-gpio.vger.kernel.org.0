Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40163759E6F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 21:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjGSTVP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 15:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjGSTVL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 15:21:11 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4394F199A
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:10 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so111691341fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689794468; x=1690399268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vePYdMZFJuQihmH3yi3T9i4hjCbxXtyqAjrUjGuTH8=;
        b=SQQ5i+YVZGdqAbrvYRwdcSkj0ELEKiBC9Lp9A+2uUNnKfeFCraHc66HABKnwV3k45+
         OpqOG2sApyQB8Xl5Tn3xpr0B12/wYD3JQ0tdgroCekXj3s2m+9ILX2UFnwZNKYamgSVw
         8r4/TuqlETMZFnMJokBODAJBOrhw2m7RDCp8AKQjisR6miHsUKUIoPk2LAS0jgRWEybG
         Q00MRhtII1Yy7MtMYvmmsonzLpaoRE0H+e/AfllcFdQPsFYS8RC+bhqjRwSwtyxBvpOr
         xjUjGI0CgvoZyXUP1xH2iU2tBIRhI4Cl0JAtrhtnEhs+1pmsxVJC3BQht+jmvWeHq30T
         ECIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794468; x=1690399268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vePYdMZFJuQihmH3yi3T9i4hjCbxXtyqAjrUjGuTH8=;
        b=AcxDG1teH1EIwqkXLBFp2Nak/OpajVXbSl115hjYu1USAUR9EWWLavEtvc/0b106LN
         UuVOJpTnNquMCMqKQJf6xR8vDFek5bWHhgM08tiTsSiexN6AtShhppOLs+eY/E7vjc4U
         Ha2A0/tbdfox2yIgnNMr0v9yifkNkU7tQrCFsqDi+wYPyLrXAb7sv2g77OzL/ogk1HCR
         2gdoUQHjTSNbcQpvVbINc9brt1Ei+KhYlgcofoUAgvp94lF4ZbhaxTu9Jxe9biQTc4UI
         bvZJIGSzWYBo9ulDf4/Ztt3HCyQ993JqLVmXYau/d0P0cpFOG9Fx6xTsFZAdaTUX3lc5
         JRsQ==
X-Gm-Message-State: ABy/qLZTRjPkUz04X6VDdwlZrG8GNr0/6yWSgYHUblraUFR0bqG/+GYo
        B/4IG7cdchrHr6BXZAm5mBn0aA==
X-Google-Smtp-Source: APBJJlFDzDTqI6Q5kKS3mpX17ESSsFj9HiLxAaG7SkKqS8uYy9ntQlcJAptCd7cf2fG9y3RMZC1Obw==
X-Received: by 2002:a2e:3a09:0:b0:2b6:de52:357 with SMTP id h9-20020a2e3a09000000b002b6de520357mr570164lja.40.1689794468529;
        Wed, 19 Jul 2023 12:21:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f884:f48d:2867:5c1d])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm2373454wmi.6.2023.07.19.12.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:21:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 4/5] bindings: python: provide the chip_path property in line_request
Date:   Wed, 19 Jul 2023 21:20:56 +0200
Message-Id: <20230719192057.172560-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719192057.172560-1-brgl@bgdev.pl>
References: <20230719192057.172560-1-brgl@bgdev.pl>
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

Provide a wrapper around gpiod_line_request_get_chip_path() for Python
bindings and update the tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py               |  1 +
 bindings/python/gpiod/line_request.py       | 12 ++++++++++--
 bindings/python/tests/tests_line_request.py | 13 ++++++++-----
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index da93370..0629db0 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -315,6 +315,7 @@ class Chip:
         req_internal = self._chip.request_lines(line_cfg, consumer, event_buffer_size)
         request = LineRequest(req_internal)
 
+        request._chip_path = self.path
         request._offsets = req_internal.offsets
         request._name_map = name_map
         request._offset_map = offset_map
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 096bf18..aaae37c 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -212,10 +212,18 @@ class LineRequest:
         if not self._req:
             return "<LineRequest RELEASED>"
 
-        return "<LineRequest num_lines={} offsets={} fd={}>".format(
-            self.num_lines, self.offsets, self.fd
+        return '<LineRequest chip_path="{}" num_lines={} offsets={} fd={}>'.format(
+            self.chip_path, self.num_lines, self.offsets, self.fd
         )
 
+    @property
+    def chip_path(self) -> str:
+        """
+        Path of the chip this request was made on.
+        """
+        self._check_released()
+        return self._chip_path
+
     @property
     def num_lines(self) -> int:
         """
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index aa84b9a..4ab3ea5 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -529,11 +529,14 @@ class LineRequestStringRepresentation(TestCase):
         del self.sim
 
     def test_str(self):
-        with gpiod.request_lines(self.sim.dev_path, config={(2, 6, 4, 1): None}) as req:
-            self.assertEqual(
-                str(req),
-                "<LineRequest num_lines=4 offsets=[2, 6, 4, 1] fd={}>".format(req.fd),
-            )
+        with gpiod.Chip(self.sim.dev_path) as chip:
+            with chip.request_lines(config={(2, 6, 4, 1): None}) as req:
+                self.assertEqual(
+                    str(req),
+                    '<LineRequest chip_path="{}" num_lines=4 offsets=[2, 6, 4, 1] fd={}>'.format(
+                        chip.path, req.fd
+                    ),
+                )
 
     def test_str_released(self):
         req = gpiod.request_lines(self.sim.dev_path, config={(2, 6, 4, 1): None})
-- 
2.39.2

