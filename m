Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E564610E03B
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfLADZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:02 -0500
Received: from mail-pf1-f170.google.com ([209.85.210.170]:40839 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:01 -0500
Received: by mail-pf1-f170.google.com with SMTP id q8so787835pfh.7
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/pFdRw4oqOr2fRpn0X8MlEgtvyBsJX5lmFPKBzWdpk=;
        b=c/V9Ij/HSanBwJksw4dRjgUmn8OwGtP0Zd2oyJ630rDw3PKCY1TJNrqLR5SHQbq2UD
         bcWEBdkkl+ayb1fwdkXOOfloK+1s+2kcRyCD1dQr83dnh2scR7WZ8R2GiTkLoenSR6bk
         R+IJZFHO/oBYsj5jF1t9vAtxaQ0gGfemjWWHCE7Ci3zNkcRtkxHbhnyw7Zaw2fS+fmro
         KC00H41ZRKXFdoH7D7mFwRRmL7O4hYuUcJ6eYkd5R3ixC0C+HOuXQpXHYUmcT4nvpm6j
         KSuhHzynNtv3Ea44YjxlcBMYm7jyguttODtRx6b8cfg8i3jIIkuy9J4pxanXgmwDkOrk
         zFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/pFdRw4oqOr2fRpn0X8MlEgtvyBsJX5lmFPKBzWdpk=;
        b=ZYYXHvIP7zq/IjYBv3rRQF20rGveh4TAK2YgRcUXawzmXc5j5yA/4hdDUnbvGgIRX9
         SrqgLHBkVtbaVVJdq39kK0Nvh2quu89ZMpkDUslJS8yjEUyH5wWcrkeHPBhC8d7G1+Ox
         ygISHAGWYDe/anDEr8yOuCUVLl8qvuvFCUcRhWpThzHspnZJ1lTdW7jihFBL81PN9OgQ
         uldnaDI/SnfHoUi1tx90goAtjHWp4jTinaF2Bn9canwp5ACdw7nPXs81eBhBCzV9jP4C
         XvPvbVrfgGL3JLBzY27KDQU4Y0oCWhuJO622hQZCmKNbqxu2i4ePZjX8yJs2NIsOO0OW
         upmw==
X-Gm-Message-State: APjAAAVEa+VbDi/rudSqs7pzAFSgdicSx3bKAg5ZDj6esJU8UQg/Eqoo
        nGmdou7mbKpb+uirNJpCuAW/8U+B
X-Google-Smtp-Source: APXvYqx/wr61c+BeMPnArmkvylfhZQBdz277YF1XIbfh3JvXmWHejkxW/WwkcDIx3eg7c5nvRWbU0w==
X-Received: by 2002:a63:ff5c:: with SMTP id s28mr487078pgk.196.1575170700975;
        Sat, 30 Nov 2019 19:25:00 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:00 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 06/20] bindings: python: tests: add tests for bias flags
Date:   Sun,  1 Dec 2019 11:23:53 +0800
Message-Id: <20191201032407.23589-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
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
 bindings/python/tests/gpiod_py_test.py | 93 +++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index ed31c8e..744bbfe 100755
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
@@ -659,6 +750,6 @@ class EventFileDescriptor(MockupTestCase):
 #
 
 if __name__ == '__main__':
-    check_kernel(5, 2, 11)
+    check_kernel(5, 5, 0)
     mockup = gpiomockup.Mockup()
     unittest.main()
-- 
2.24.0

