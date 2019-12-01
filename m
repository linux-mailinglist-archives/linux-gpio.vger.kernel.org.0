Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9722610E042
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfLADZT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:19 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40921 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:19 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so659523pgt.7
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eVS8py5jjg7v7z8tOZUTXchHFaJlTRC8SJKNhYMcn70=;
        b=rD6UsPfhyvb80qKT5sxgbfFvAPnN1wb1k9fLFmqs3zGoanZHomR2tY0oYHfQJvXi2S
         FFn9kPD8fU90ZklL4BwBc2Sdk6fYyOJNnHRAa+xyAGYEhnUZDCGe+82sWm4LyqdMZAbS
         x0sfSCBeFySP+3EreOx+0irE+BtM6VEEsW4de7KT65UWi8GaZas2nypmgfmkLDynmyWQ
         jZdEo4s+100PFINVI3IQBa0Xn5tDfWMI+CUv7nASD0N02LB9cy6wx4Kr04BS1Ltq3JQv
         iDtxuixcW8d0OPxNgir12UBWZJp5sKNpmd+gxmopM/n8etzv6O4xZPr8ecL4vNWAJDOF
         E/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVS8py5jjg7v7z8tOZUTXchHFaJlTRC8SJKNhYMcn70=;
        b=CF3rgwEwwDMhIYy+NsNwPNSyfund9WM1HH1z+NDQ9w6aJcWNGwQnVW8xxlFlLxVIdz
         JY+x77T7N9tdHxmbhuKxBzCZLPyXyIg601tcc7GxWCeGPRvKjlKxOejb4sw0avNc4cIn
         SXR2uMTjS4JPdhITWODPebRhV/AckeWOYxLCewZPQSLYJFrp2fJM2elDTqcDpRw79NVB
         Kqm/89pn05VNBsiEzSuY6D+bYtsyF3zgS1VVB1EaURK4gygwyr2toZUU0TN62jVkbZly
         rFOifxnDOiO6BM+D3Ezo/8QIvMgiADAJMv3Kd/08DKj2QmMuZR5amCboC9K5svu1V9Cc
         BkaQ==
X-Gm-Message-State: APjAAAWSyr12e1kCQGsEAvuUzkeF0Wle6qmTBmpv1cPeSbRURkHSfV7U
        a0//Ji7rY/8NRKpimMAYYkC4eKU3
X-Google-Smtp-Source: APXvYqwK+tsPPHsWzlPPdq/YiDqFIqHTvOoLd/X/X11RpQhZQIVuMsvcheHZOnSR4zspkJZyS7Ff+w==
X-Received: by 2002:a63:445c:: with SMTP id t28mr25255489pgk.348.1575170718377;
        Sat, 30 Nov 2019 19:25:18 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:18 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 13/20] bindings: python: tests: add tests for SET_CONFIG methods
Date:   Sun,  1 Dec 2019 11:24:00 +0800
Message-Id: <20191201032407.23589-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
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
index 744bbfe..fd38bb9 100755
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

