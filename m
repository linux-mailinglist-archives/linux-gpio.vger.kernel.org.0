Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 405F110900A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbfKYOcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:32:53 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33195 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOcx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:32:53 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so2750638pgk.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/HBD8d8BDWiXdFnRjwHb/de2FlPpTYAQz1J8zQ/lgw=;
        b=fdPtgB3+KU6Gtapa/4BB2Wo+jO8q9JRlFtoyv9v8KTYc/Jh5W0hfHDpQ4pu1p+XVPh
         JgJ9VwDpmdLS+O/RQVOAU+arvdrLTYV9i7ii31lrSGkaA2fRGJs5UAjlFcCIkovAIC8F
         PN7dO7Q4EcGE8uOBYdVZe3wdYoJq87NQD83fvyhljq6HQkXrmQ9GvEbMLAqoFflDjKCx
         Ax/Bem+U6nVlIBdiX8vq0XSRfY/7VcbRXIkhXhT5mz24nsGSuO9JmCMOwJd6+Kw/TiCI
         mT93LjYHuYtyUKVMY/5bLoVMVt1OW8VAj1nH9WreopzY/a2qyglpTjeTnH6ZLqFqCPq1
         HG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/HBD8d8BDWiXdFnRjwHb/de2FlPpTYAQz1J8zQ/lgw=;
        b=COxM6UCvTsX4Wo5K6Dq+qVNnyMHQR/wk0+HI3Ffqlz7Tbpj7gQhYCpaPw63PcLZQMy
         1NyP3LP5y7NEXmsj4ZzqJcRPe9sRkZX18bwnvTYdpsLHWaoft7BjvqPuw94cgHNfbCBu
         ukYA00c8JaqyMm1qlO/blehPe/l+v4kUI7568mltDmb0sh62qXrFqWP/2E8h5z2hUoyV
         s5Pfndw+U7TwiTjLZOaVmtZ1Ybj6k0hQ1MpXWDUzFX2IUxZdNKw1pCwDbwdA0G6+CUTy
         a1p99NR+JB5+A+EOMzMd5FKplE3A/v8B3Va2FQeqZsz19G30QiuSnHrBWFHtrfsdIOcK
         yfbA==
X-Gm-Message-State: APjAAAVP0yg04G7uiqOZMVy8IIwGj+pT15yvqf/aOlH6SQ3vN8SxhddE
        ez6FMfnjoZziAA+FGjX4/oFQpqp0adWn/g==
X-Google-Smtp-Source: APXvYqzQVBKc/Xw6c3glUS/RiTGF2RkqwmqnVmsBEnK0au9gSIsSG1HC03TqbUgyqpoEHCZF0Ho6Mw==
X-Received: by 2002:aa7:8b47:: with SMTP id i7mr35558206pfd.226.1574692372641;
        Mon, 25 Nov 2019 06:32:52 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:52 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 06/14] bindings: python: tests: add tests for bias flags
Date:   Mon, 25 Nov 2019 22:31:49 +0800
Message-Id: <20191125143157.26154-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
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

