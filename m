Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C99FE065
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfKOOpO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:14 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38665 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOpO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id c13so6785860pfp.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/HBD8d8BDWiXdFnRjwHb/de2FlPpTYAQz1J8zQ/lgw=;
        b=PlrEq7BeqaThqjnzQwshDi55euR/8W0XVR0HfwSfM0SWZpYSrYhR9jRTWoWXJJzEgm
         FlYNkuebdF87aUqFmq6Aer9pQ048DRDYRJhHPbnLi9NQNsCAa1kWirJbk5ix2Ud5nXO1
         UNG+CDNEkHrFkIXJ2NFcWc0rrSRdoitVK8WdUBO85FNo/0bjSrtn/vdKycAXV8LRc6dD
         +RF8L7me1nl57C8BtRuPro+ftjQH0Bxgyt5TN6+vfzCCmoaRjoC8AyoGeVkSXVlzwv7w
         z75RIz2u+V7YChPmbxVcnPT95MJVWbknVuGkGQWAL9OjhkI6X/Jhjbkc+zyQujm4nfKU
         0rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/HBD8d8BDWiXdFnRjwHb/de2FlPpTYAQz1J8zQ/lgw=;
        b=CN+Ya+54OFX2CQ9fKU0wn6caLzzAHMMKjElzVJtMvZ6oZOQb48L71DhFoLtTiDOIzJ
         g9UhQs6CYim1l8jORaCw+FvdnGZ5gv/rPMwvwgv5MO5I0XBE0QVm9b/CkIyz4KtOnFff
         CtGSTwjdABRaZG/WQY8ntr85ioBHVUCcD902WzCcd3G1UbK/VKSiPy5XtkM0dMnjijb0
         mJUaFy0ltjnpJYO2U5tBypthE1F87zYzQMN/KIEMBrTZo0D7uaUpH/CEQanDNPXFDhPr
         1zVFm1iK44DfJL9RJICoayMw4oMj1VKM1grkggvJBnd2FEGLs6L8Eqy30pEDXRJbSgL1
         Qluw==
X-Gm-Message-State: APjAAAXafqCAL81hm2Zyl94HvUZAFQBeJku5wkBsGKSFkpwXTV0PGoiB
        PEXbbP3ZKVrw50CPsXHCOSKNrUCyhdg=
X-Google-Smtp-Source: APXvYqzr8K+Tmc6WyN50bQ9ulPuJcxXWXTr+C/VcpUELLiJiFTOyQOsiGZh8+L0xIvIFGOdcZXGCMg==
X-Received: by 2002:a63:1402:: with SMTP id u2mr16645888pgl.391.1573829112890;
        Fri, 15 Nov 2019 06:45:12 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:12 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 10/19] bindings: python: tests: add tests for bias flags
Date:   Fri, 15 Nov 2019 22:43:46 +0800
Message-Id: <20191115144355.975-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage to cover the bias flags in requests and the bias
setting returned by line.bias().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/tests/gpiod_py_test.py | 91 ++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index ed31c8e..9330b43 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -306,6 +306,97 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertTrue(line.is_open_drain())
             self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+
+    def test_exported_open_drain_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_OPEN_DRAIN
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertTrue(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+
+    def test_exported_open_source_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_OPEN_SOURCE
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertTrue(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+
+    def test_exported_bias_disable_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_BIAS_DISABLE
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLE)
+
+    def test_exported_bias_pull_down_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_BIAS_PULL_DOWN
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_DOWN)
+
+    def test_exported_bias_pull_up_line(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            flags = gpiod.LINE_REQ_FLAG_BIAS_PULL_UP
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         flags=flags)
+            self.assertEqual(line.offset(), 4)
+            self.assertEqual(line.name(), 'gpio-mockup-A-4')
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertEqual(line.consumer(), default_consumer)
+            self.assertTrue(line.is_used())
+            self.assertTrue(line.is_requested())
+            self.assertFalse(line.is_open_drain())
+            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_UP)
 
     def test_update_line_info(self):
         with gpiod.Chip(mockup.chip_name(0)) as chip:
-- 
2.24.0

