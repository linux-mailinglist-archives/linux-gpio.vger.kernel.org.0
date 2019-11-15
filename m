Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A15B0FE06E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbfKOOpm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:42 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38725 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfKOOpm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:42 -0500
Received: by mail-pf1-f196.google.com with SMTP id c13so6786461pfp.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZlbgmFt9O1mvX0rp/4awL3PbMSgZdBNoRECTogus8M=;
        b=mYCvIdqU4XDc+JdBEaqo4+bNCbyFDs7mV7fZ9u/SjLmujSJ3O3eAaYClFxUfkK8/WJ
         hy6wxSUX17LcwZBvMf5kL58ubW9aVzwnxKaAt9WoBwuZ45CLRtDp0xhDRH80iCF7hftW
         vCjcoraCAyoNepWW0PISrIwMo3WJYFEcUXfcgp4+r9nvU0KwAR5gR6L+611Nb/aHFuW2
         qfStq0l9pqeF1IO2s99LiDFGF73P4a9RhofXb+x8sSR19tgSaJY3CUdZpHxJ4vVsabJQ
         lHxRcEWoed1R/CBVT0e3OPCnMcQSu0dzmrJR1f6uDwuOQ2SKGnbd/ObTm2XGY2aD+dRe
         7v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZlbgmFt9O1mvX0rp/4awL3PbMSgZdBNoRECTogus8M=;
        b=dTJ0k1c8LdOjFn2Thnfy0cImzBVX0anF84mOW0uct57FcJfetRy1qCckxYM816ZSVY
         J0YPNv/iYtflZqZhV8RVV5h5NZl25nCNICouGk51pJeT17phQkoRc+qsh0X078eonb5G
         Ugx8zyJktdIqQAcJAVQgHkXTuZSkn/AsW64DVK/VD313WfdCuamXoeeb9qJu2HwFkwWo
         Dy69qQuJoYHMEuQhrjlPfjMC3M4tebcv6wycSKLJN/H4+5Hw79Np/tKee87p9N1w0R0E
         pc6bW73qzdw+WE+EClDgTLgxOLxcDEHcHdTKBTBkD9r6k0uHaIrHiyRD2zKg4PscySDv
         dw1w==
X-Gm-Message-State: APjAAAXaOZLyC4p0Bn5KgDpw3Asfa2q/aP+iqelpsBvZB9e0pjrPyXAq
        BpsrB8BfqvFa1IDx0AVP57hGMd+AXNU=
X-Google-Smtp-Source: APXvYqx+mfdv17S3TUGECacLOE1FyYNHc0ystagkRI7bRg7iuB4HrAeQBITlzLeiWzI40knr9mP0jg==
X-Received: by 2002:a65:6685:: with SMTP id b5mr7537517pgw.94.1573829141121;
        Fri, 15 Nov 2019 06:45:41 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:40 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 17/19] bindings: python: tests: add tests for SET_CONFIG methods
Date:   Fri, 15 Nov 2019 22:43:53 +0800
Message-Id: <20191115144355.975-18-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage over set_config, set_flags, set_direction_input, and
set_direction_output methods.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/tests/gpiod_py_test.py | 163 +++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 9330b43..704d916 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -493,6 +493,169 @@ class LineValues(MockupTestCase):
             line.set_value(0)
             self.assertEqual(mockup.chip_get_value(0, 3), 1)
 
+class LineConfig(MockupTestCase):
+
+    chip_sizes = ( 8, )
+
+    def test_set_config_direction(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(3)
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_IN)
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_INPUT)
+            line.set_config(gpiod.LINE_REQ_DIR_IN, 0, 0)
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_INPUT)
+            line.set_config(gpiod.LINE_REQ_DIR_OUT,0,0)
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+
+    def test_set_config_flags(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(3)
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT)
+            line.set_config(gpiod.LINE_REQ_DIR_OUT,
+                            gpiod.LINE_REQ_FLAG_ACTIVE_LOW, 0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            line.set_config(gpiod.LINE_REQ_DIR_OUT, 0, 0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+
+    def test_set_config_output_value(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(3)
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_IN)
+            line.set_config(gpiod.LINE_REQ_DIR_OUT,0,1)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            line.set_config(gpiod.LINE_REQ_DIR_OUT,0,0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+
+    def test_set_config_output_no_value(self):
+         with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(3)
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         default_val=1)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            line.set_config(gpiod.LINE_REQ_DIR_OUT,0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+
+    def test_set_config_bulk_output_no_values(self):
+         with gpiod.Chip(mockup.chip_name(0)) as chip:
+            lines = chip.get_lines(( 0, 3, 4, 6 ))
+            lines.request(consumer=default_consumer,
+                          type=gpiod.LINE_REQ_DIR_OUT,
+                          default_vals=(1,1,1,1))
+            self.assertEqual(mockup.chip_get_value(0, 0), 1)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            self.assertEqual(mockup.chip_get_value(0, 4), 1)
+            self.assertEqual(mockup.chip_get_value(0, 6), 1)
+            lines.set_config(gpiod.LINE_REQ_DIR_OUT,0)
+            self.assertEqual(mockup.chip_get_value(0, 0), 0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+            self.assertEqual(mockup.chip_get_value(0, 4), 0)
+            self.assertEqual(mockup.chip_get_value(0, 6), 0)
+
+class LineFlags(MockupTestCase):
+
+    chip_sizes = ( 8, )
+
+    def test_set_flags(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(3)
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT,
+                         default_val=1)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            line.set_flags(gpiod.LINE_REQ_FLAG_ACTIVE_LOW)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+            line.set_flags(0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+
+    def test_set_flags_bulk(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            lines = chip.get_lines(( 0, 3, 4, 6 ))
+            lines.request(consumer=default_consumer,
+                          type=gpiod.LINE_REQ_DIR_OUT,
+                          default_vals=(1,1,1,1))
+            self.assertEqual(mockup.chip_get_value(0, 0), 1)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            self.assertEqual(mockup.chip_get_value(0, 4), 1)
+            self.assertEqual(mockup.chip_get_value(0, 6), 1)
+            lines.set_flags(gpiod.LINE_REQ_FLAG_ACTIVE_LOW)
+            self.assertEqual(mockup.chip_get_value(0, 0), 0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+            self.assertEqual(mockup.chip_get_value(0, 4), 0)
+            self.assertEqual(mockup.chip_get_value(0, 6), 0)
+            lines.set_flags(0)
+            self.assertEqual(mockup.chip_get_value(0, 0), 1)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            self.assertEqual(mockup.chip_get_value(0, 4), 1)
+            self.assertEqual(mockup.chip_get_value(0, 6), 1)
+
+class LineDirection(MockupTestCase):
+
+    chip_sizes = ( 8, )
+
+    def test_set_direction(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(3)
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_DIR_OUT)
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            line.set_direction_input()
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_INPUT)
+            line.set_direction_output(0)
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+            line.set_direction_output(1)
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            line.set_direction_output()
+            self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+
+    def test_set_direction_bulk(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            lines = chip.get_lines(( 0, 3, 4, 6 ))
+            lines.request(consumer=default_consumer,
+                          type=gpiod.LINE_REQ_DIR_OUT)
+            self.assertEqual(lines.to_list()[0].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[1].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[2].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[3].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            lines.set_direction_input()
+            self.assertEqual(lines.to_list()[0].direction(), gpiod.Line.DIRECTION_INPUT)
+            self.assertEqual(lines.to_list()[1].direction(), gpiod.Line.DIRECTION_INPUT)
+            self.assertEqual(lines.to_list()[2].direction(), gpiod.Line.DIRECTION_INPUT)
+            self.assertEqual(lines.to_list()[3].direction(), gpiod.Line.DIRECTION_INPUT)
+            lines.set_direction_output((0,0,1,0))
+            self.assertEqual(lines.to_list()[0].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[1].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[2].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[3].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(mockup.chip_get_value(0, 0), 0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+            self.assertEqual(mockup.chip_get_value(0, 4), 1)
+            self.assertEqual(mockup.chip_get_value(0, 6), 0)
+            lines.set_direction_output((1,1,1,0))
+            self.assertEqual(lines.to_list()[0].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[1].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[2].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[3].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(mockup.chip_get_value(0, 0), 1)
+            self.assertEqual(mockup.chip_get_value(0, 3), 1)
+            self.assertEqual(mockup.chip_get_value(0, 4), 1)
+            self.assertEqual(mockup.chip_get_value(0, 6), 0)
+            lines.set_direction_output()
+            self.assertEqual(lines.to_list()[0].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[1].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[2].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(lines.to_list()[3].direction(), gpiod.Line.DIRECTION_OUTPUT)
+            self.assertEqual(mockup.chip_get_value(0, 0), 0)
+            self.assertEqual(mockup.chip_get_value(0, 3), 0)
+            self.assertEqual(mockup.chip_get_value(0, 4), 0)
+            self.assertEqual(mockup.chip_get_value(0, 6), 0)
+
 class LineRequestBehavior(MockupTestCase):
 
     chip_sizes = ( 8, )
-- 
2.24.0

