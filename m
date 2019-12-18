Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0779312497B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfLROZI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:08 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37964 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfLROZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:08 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so2109131wmc.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ZSChuHO8sZVpkp85l6cUuUaKu1WPwJ++IKIjENJVP8=;
        b=XvQ0hE9LKZnkFyg08uyjDLXTMRhS8V3CgahyunnkIBeFkN45N1FGg3tEJF8PLIWxLz
         5ksrBorRNzMu3nKZZj3tkR6BNA2iesOZmDqRS91t6fShrv9AiPtbnYzRjGq6Hct4oP+4
         r+9FmwBzh4H8MSHvwC1pMKm9z7mW6MIkqWOXsZ7jHX+iAu5jhotGWxoANpPYDupSHioT
         EGjRoOVAstQwOtOKMdrRBOAahHNLW5E1oS3bu9i7ULfjllgb0NuEfDLmpprAsU8uF9mG
         Xio4wAAGM4bhjG7eWBwiHCHBF78cRERVXx+o0saljXaLLHORyfZ0mh0TWsXYJhEUdtdz
         rjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ZSChuHO8sZVpkp85l6cUuUaKu1WPwJ++IKIjENJVP8=;
        b=l2c4CkbdYTsC62t8VfdZoeB2Y1zuT5zbZknXLIgVwCIgmEf898XO9yv9I+lHuV8t/Q
         Fi5NfTHB+IjdBwx9gC4p1iktQi+vh14xi3juCZVaOeNJQz8SA08ErJq9NhQ2/sGuTYTC
         8lCrqIPQ4PbCX57hsccdcz150RefSNSRz+ajpalpiXEb2Q3PNPa3mxm4rgflbxU+dkzE
         hWFs3xzaB2yClc4Zb/wxIu0VKGObBW0TGQbhKoAQODZfaatlOmRAeoNmkZw+CjZiVTuz
         Nzu1FArpdrhxC8UdZOcbOUqPfvSpkV0MD0JLhoRBSOT7F2NnvimmUGobD1jN1jIzt6RN
         0UaA==
X-Gm-Message-State: APjAAAWltsDtd39BsBe/fwB8DdfbvmbW5thfYg1DNpTW7vd1XBjdhwn8
        FZD1yWL1nAfIjfpjLvhl2K8qoQ==
X-Google-Smtp-Source: APXvYqxab6rGP/lFBFwaqrO5pUzZSeUxc52Nk2qYqtLM2OA5ZtmnFI9/csXbqEIlnTh2zg6IskzQpQ==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr3408406wmj.41.1576679106316;
        Wed, 18 Dec 2019 06:25:06 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:25:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 7/7] bindings: python: tests: add a test-case for reading multiple line events
Date:   Wed, 18 Dec 2019 15:24:49 +0100
Message-Id: <20191218142449.10957-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218142449.10957-1-brgl@bgdev.pl>
References: <20191218142449.10957-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Extend the test coverage of Python bindings with tests of reading of
multiple line events at once.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/python/tests/gpiod_py_test.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 53d99d8..572aad8 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -12,6 +12,7 @@ import gpiod
 import gpiomockup
 import os
 import select
+import time
 import threading
 import unittest
 
@@ -833,6 +834,27 @@ class EventSingleLine(MockupTestCase):
                 self.assertEqual(event.type, gpiod.LineEvent.RISING_EDGE)
                 self.assertEqual(event.source.offset(), 4)
 
+    def test_single_line_read_multiple_events(self):
+        with gpiod.Chip(mockup.chip_name(0)) as chip:
+            line = chip.get_line(4)
+            line.request(consumer=default_consumer,
+                         type=gpiod.LINE_REQ_EV_BOTH_EDGES)
+            mockup.chip_set_pull(0, 4, 1)
+            time.sleep(0.01)
+            mockup.chip_set_pull(0, 4, 0)
+            time.sleep(0.01)
+            mockup.chip_set_pull(0, 4, 1)
+            time.sleep(0.01)
+            self.assertTrue(line.event_wait(sec=1))
+            events = line.event_read_multiple()
+            self.assertEqual(len(events), 3)
+            self.assertEqual(events[0].type, gpiod.LineEvent.RISING_EDGE)
+            self.assertEqual(events[1].type, gpiod.LineEvent.FALLING_EDGE)
+            self.assertEqual(events[2].type, gpiod.LineEvent.RISING_EDGE)
+            self.assertEqual(events[0].source.offset(), 4)
+            self.assertEqual(events[1].source.offset(), 4)
+            self.assertEqual(events[2].source.offset(), 4)
+
 class EventBulk(MockupTestCase):
 
     chip_sizes = ( 8, )
-- 
2.23.0

