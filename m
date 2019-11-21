Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8BD1047A4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKUAgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:50 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34000 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKUAgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:50 -0500
Received: by mail-pl1-f196.google.com with SMTP id h13so681988plr.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZlbgmFt9O1mvX0rp/4awL3PbMSgZdBNoRECTogus8M=;
        b=sGQ8bDi4v7hWYSLrijBiPEXWqxwacOGNMt86Kq1boFEVfUnCj2b5SLTJqWdLkO7s5i
         Ed7JGNpwFcr/QeQfASdxh8rzItdhAiyehJZ2J3Ko2MCZlqwV3McEDk50eQHoLMpPx5/t
         r34hLLmgBtuoDXAEAY5GhXZBDWy5+zbjAkDFHiUpvZkrViDOAb/I1K+TFDpWbb63Uuk1
         4m+No1BX0iO+MMrwl/AAaEW6H4e+ZKLlHud2S86icDqTZft8BhELjvi5GCUb8oMRJXKl
         bFojfE3puUUgtu+NQu43zT12dgaqrVSlFSRZRxMtTkxra0fTqGgrUrW9+5xo9I/4Wu0G
         gKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZlbgmFt9O1mvX0rp/4awL3PbMSgZdBNoRECTogus8M=;
        b=r2o/Wt8rL0x7mV9+PLNb8shnBFZhACZPuoVfmyRL34gME4NflmaXgWaEz2KNXZT0Q8
         Ef9l/6qeLoDwYrZ8yXGBbZ2tLewHWiDiylvRnkZPj77ITQ8U3TtogkPJ+v9DmR5G2+VT
         u2NVR1UFaCkUjZvQRwjZHBuum17jaQzC8Dn/lKsL2z4mj1u/oLtK0m8cJxlRkpvCtfd6
         hdEn8FDzYLiLORdTtFkfiWDm/B47sFO0gwHtgucu3rAzAs8jOxNjIjL5celyvTau6A+z
         W0Ox8ib60reJoJDEX1xylU/I4OrT482kE5KT1hj4dG4kAW1R8nOcUHV46Msuy924vHGG
         SwOw==
X-Gm-Message-State: APjAAAUR8M775NQ29kCsuPO9sm6BatYlRci4idMvbmVKU2uaq6X14hgK
        EwJnSuAM9PGg5LzW1CstrUsD/LxIvNE=
X-Google-Smtp-Source: APXvYqyX/KyUSW77mO9VRWQbhcTyfn6p47Bah6Xv8HOEahxkEy7EepaeUxYDvUhEvBfjhaJYBqMr6Q==
X-Received: by 2002:a17:90a:dd42:: with SMTP id u2mr7648167pjv.57.1574296608446;
        Wed, 20 Nov 2019 16:36:48 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:48 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 12/14] bindings: python: tests: add tests for SET_CONFIG methods
Date:   Thu, 21 Nov 2019 08:35:54 +0800
Message-Id: <20191121003556.9020-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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

