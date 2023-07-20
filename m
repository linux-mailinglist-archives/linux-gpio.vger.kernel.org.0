Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7889875B18B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjGTOsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjGTOsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:48:04 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9104F171E
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:03 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so7122425e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864482; x=1690469282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vLZOYxnnvhagtudLBu9fBVf4KzmQKUtoa3RQs/0e9Q=;
        b=prD+YoPul8UpF7S30KqtP9J+ySgIoFrvmaSL6BNMxntI59uczUgufY5he3nPEvfOvL
         Joy0SMYKeN1hK34oZKhoFyGdq7bpuUZzE6qEQe3TxiGd2qYfPDk8NmshqwFl0Ws8ax4L
         yHtET2GwomZSPoCWA9KyMeDhc++G3nv20UEbyoLkzc7EAZg/05B2zMy4+3DCSzyGnBmD
         q3v6h9wT6ZuNP3vBEXWlXxxGINpG57XxsU3YZEbvvPL8/aZBqyG2E7NbS8j8cmi2rL3R
         BKALIm7hnS5sMXI0v5f0eoETmhRk1Uh0/K5A5lt78H2ouaPsZGYljS01HLzkMAHNLyJ6
         /JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864482; x=1690469282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vLZOYxnnvhagtudLBu9fBVf4KzmQKUtoa3RQs/0e9Q=;
        b=K7cEgQP268o+1W6pbTdHJL/i/Oe29uA4HMBKW7dgjHyhifWLLdUtrLmWuo4NIinb5N
         IFYCU7T22IDIvlRUVuDUViPDOdnxAJK8Yf4ezhWJHrdUQZ5VOdQyeg3M3xOEmWBGH2Vq
         F5BHOFdIwThcBMAqCrnw7uIYNpsdoCSdtQLDAMbQ3jYxUahXpACPsjSgVSe4YomF1ySt
         3lxxoFYetyWAslLdPD9jY4UOIeZ9Upf5nw2H3bnugYNlYYZmByd9MLuCSfizG/PqX9uk
         LJAhUDd/mD1LgdiJgKkKiHx4prhpLYTaTjQjZORM6GfcF0WM0RCXj5GSSaez+GGIMq/4
         5ZHQ==
X-Gm-Message-State: ABy/qLa16bRqJVjK/mWrigXVIH43+HwvhTR9T3efqvBjU+7eAHyA4UQY
        pWa9mv1d0V5xjvxGxXdQF9HnFw==
X-Google-Smtp-Source: APBJJlEhGw96fTOcKAzNizZQi/ypWy1Xcyq7AjYpnl3fBqAkZl6GHPNQ/FHhxL2ozOJ2Mj0e9Ywo4Q==
X-Received: by 2002:a05:600c:b41:b0:3fc:85c:5ed2 with SMTP id k1-20020a05600c0b4100b003fc085c5ed2mr4327861wmr.11.1689864482087;
        Thu, 20 Jul 2023 07:48:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bd83:c166:7e2d:3d74])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm1550906wrn.83.2023.07.20.07.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:48:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 4/5] bindings: python: provide the chip_name property in line_request
Date:   Thu, 20 Jul 2023 16:47:46 +0200
Message-Id: <20230720144747.73276-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720144747.73276-1-brgl@bgdev.pl>
References: <20230720144747.73276-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a wrapper around gpiod_line_request_get_chip_name() for Python
bindings and update the tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py               |  1 +
 bindings/python/gpiod/ext/request.c         | 11 +++++++++++
 bindings/python/gpiod/line_request.py       | 12 ++++++++++--
 bindings/python/tests/tests_line_request.py | 13 ++++++++-----
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index da93370..b3d8e61 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -315,6 +315,7 @@ class Chip:
         req_internal = self._chip.request_lines(line_cfg, consumer, event_buffer_size)
         request = LineRequest(req_internal)
 
+        request._chip_name = req_internal.chip_name
         request._offsets = req_internal.offsets
         request._name_map = name_map
         request._offset_map = offset_map
diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index a32ff8f..5db69fe 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -37,6 +37,13 @@ static void request_finalize(request_object *self)
 		gpiod_edge_event_buffer_free(self->buffer);
 }
 
+static PyObject *
+request_chip_name(request_object *self, void *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(
+			gpiod_line_request_get_chip_name(self->request));
+}
+
 static PyObject *
 request_num_lines(request_object *self, void *Py_UNUSED(ignored))
 {
@@ -92,6 +99,10 @@ static PyObject *request_fd(request_object *self, void *Py_UNUSED(ignored))
 }
 
 static PyGetSetDef request_getset[] = {
+	{
+		.name = "chip_name",
+		.get = (getter)request_chip_name,
+	},
 	{
 		.name = "num_lines",
 		.get = (getter)request_num_lines,
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 096bf18..cde298f 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -212,10 +212,18 @@ class LineRequest:
         if not self._req:
             return "<LineRequest RELEASED>"
 
-        return "<LineRequest num_lines={} offsets={} fd={}>".format(
-            self.num_lines, self.offsets, self.fd
+        return '<LineRequest chip="{}" num_lines={} offsets={} fd={}>'.format(
+            self.chip_name, self.num_lines, self.offsets, self.fd
         )
 
+    @property
+    def chip_name(self) -> str:
+        """
+        Name of the chip this request was made on.
+        """
+        self._check_released()
+        return self._chip_name
+
     @property
     def num_lines(self) -> int:
         """
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index aa84b9a..f99b93d 100644
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
+                    '<LineRequest chip="{}" num_lines=4 offsets=[2, 6, 4, 1] fd={}>'.format(
+                        self.sim.name, req.fd
+                    ),
+                )
 
     def test_str_released(self):
         req = gpiod.request_lines(self.sim.dev_path, config={(2, 6, 4, 1): None})
-- 
2.39.2

