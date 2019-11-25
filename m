Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C180109010
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfKYOdK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:33:10 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:43436 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:33:10 -0500
Received: by mail-pj1-f66.google.com with SMTP id a10so6683444pju.10
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZlbgmFt9O1mvX0rp/4awL3PbMSgZdBNoRECTogus8M=;
        b=quEEJAwQ0H5iEtjC6nVI7SuhN8vux7OiQrO/XW/BfsEIwEVPEhiaGONGhE/hycfLfP
         r/06iFnnN+pRHe3/Gmvd1Ar8HpohUWIOI1fQEPU12RjM5kNChWsMVTVe/QaXpPieSnBA
         +P2uYi0yj+ruAfNfewlcSe9StPh5LGXKhAMMNzM1K8tmpFxNe7jUNlM3lFAzpq1ypcmJ
         nmdlcBJ4R5gSuAGCKnzKxLbOh8nJCMXa/33m4+wcE/3W8EF3u/2lXrGte+dNshVtYKrP
         k9gRZ9m1BypbN5D56tCsZnkrdZh72jus+a0+dxVJrMsZul3/RtX0fPOi2/tf358uvhUJ
         daqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZlbgmFt9O1mvX0rp/4awL3PbMSgZdBNoRECTogus8M=;
        b=Ie/JOoTupYog0PSSNc3jTUUC7bekUXBz+9JYRZ9B+QIIJMXwfHo0rBz8mBvggfULIw
         EEraYHbopJqeEry33c70nrNkU0Zy291K0eU9qUeyMYoOFWpz5R3EzWn+ggSpXVerioPL
         bkqq28VS3XSi8y1mjtTpukqEyYvHGeNavllYuasYO1y4xfTSyfsmtOGuNQyGaXmqLzJO
         1aaadXUdgV50YRMtrD/tQxlusCIEqvLpP3Pi/w+R7ugXj9D1+4p4Zi6qn/D4ReHBNJdl
         HqiTUBlUTY2koUjr+HXK7j39cL8LwXFTN4IGXN8qkjKyznNSQ0oDk7X8FloeKlqNrGeI
         JpYQ==
X-Gm-Message-State: APjAAAWU0O3r9TXFFJ/gTie1DUNDH3aDmtEesRqAuBV3q+izDTzihzro
        RVCmmLtuQIPc5QY/iy6hx96ZyvzMFGWG7w==
X-Google-Smtp-Source: APXvYqxZycGELQXbwVM0POCA5pFrg7KrSlkV8PyBTJpCLJlVvRCNTHlOWhvwh281WH4c5ETBeTqlSQ==
X-Received: by 2002:a17:902:b218:: with SMTP id t24mr29164107plr.267.1574692389245;
        Mon, 25 Nov 2019 06:33:09 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:33:08 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 12/14] bindings: python: tests: add tests for SET_CONFIG methods
Date:   Mon, 25 Nov 2019 22:31:55 +0800
Message-Id: <20191125143157.26154-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
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

