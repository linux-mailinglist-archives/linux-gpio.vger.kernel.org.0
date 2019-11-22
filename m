Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3D0105F20
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 04:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfKVDzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 22:55:12 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34277 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfKVDzM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 22:55:12 -0500
Received: by mail-qk1-f196.google.com with SMTP id b188so5164498qkg.1;
        Thu, 21 Nov 2019 19:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qJgHMdwa86FwHH2BnJx9o+uMlPWtDWtUBpBKhEzQlcY=;
        b=Sxmjshlz5yQTTOAu4nNlUJS9ai2wiwJeX0ygWPGzFMWcijwQNby78HeDWMV3GcWFGr
         dKFhOWQ+5YutSHLh/72G2qH+4/W/9tSp4AA31Y17O1jJPG6dwxRTnkOdA6du+xVZ+quh
         EoZTOmtQLwoPJaAEegsbqDbIgy0UZpXXwViXBAgv7b3Xe9y06o8mZPHcEABc4PUQqYup
         9OqZ8KgEUA3NgMcEitln6PK2S1p99eQMyVYhWJCxOIuUEoSSP2jamezxHyVeU5pMMa2r
         oJn7oOSLBcxArtpGepvPTBLbKlJz2OGAk5n3usrTUVmWwKNXBS2W5JxY0x+ZE9sw+ZF8
         gHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qJgHMdwa86FwHH2BnJx9o+uMlPWtDWtUBpBKhEzQlcY=;
        b=eCR0sQa5xuzv6+vWCDekk/WU2IEVw6xohO/za4VOHIixxIIWlzxeQ+qNmYHD1Kq2Oc
         rqFaIY14cUDaVnPmug9vBeLZrhl+wq0tGUAlIMuJW8wweOgAvNriudzdd5TLV1rmHDWM
         30/2u93qbOdJTBvCRa0Zpmk3/h+LD0vWH0JI84UWEhpq6kbKyeHR51hAUGzfdO1wN0IV
         1UTIZizN5cwPLAkysF9QZqUYmOA1rd5q4+XTznR+wQKcfI8Dpcyvrj3BShW2EtO7G1kq
         p1qR1NeRKT81I143eqTcJ74bIpxMc6pJXbVCBMLERUoG6X7J/GT6wiuw2pmHGsOaUtrE
         stKQ==
X-Gm-Message-State: APjAAAULqbr4zJmcbcWuxiJXgFXohuI+UMM9hdPnKHAK/u/++yAHKAss
        ptW1fF3csXeDn4n2slfgS3Y=
X-Google-Smtp-Source: APXvYqyUtQvoeHjTF0Q5RJf3zqSSH2BrJdKM5Vc34ZQusjqABGdyO8t9oxG78TRsAwjdEakEXLs4mw==
X-Received: by 2002:a37:4884:: with SMTP id v126mr11657411qka.45.1574394910917;
        Thu, 21 Nov 2019 19:55:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id p54sm2873833qta.39.2019.11.21.19.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 19:55:10 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     linus.walleij@linaro.org, corbet@lwn.net, bgolaszewski@baylibre.com
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Documentation: gpio: driver.rst: Fix warnings
Date:   Fri, 22 Nov 2019 00:47:02 -0300
Message-Id: <20191122034702.58563-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix warnings due to incorrect rst markup. Also improved the presentation
a little without changing the underlying content.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/driver-api/gpio/driver.rst | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 3fdb32422f8a..c58f54783237 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -5,7 +5,7 @@ GPIO Driver Interface
 This document serves as a guide for writers of GPIO chip drivers.
 
 Each GPIO controller driver needs to include the following header, which defines
-the structures used to define a GPIO driver:
+the structures used to define a GPIO driver::
 
 	#include <linux/gpio/driver.h>
 
@@ -398,12 +398,15 @@ provided. A big portion of overhead code will be managed by gpiolib,
 under the assumption that your interrupts are 1-to-1-mapped to the
 GPIO line index:
 
-  GPIO line offset   Hardware IRQ
-  0                  0
-  1                  1
-  2                  2
-  ...                ...
-  ngpio-1            ngpio-1
+.. csv-table::
+    :header: GPIO line offset, Hardware IRQ
+
+    0,0
+    1,1
+    2,2
+    ...,...
+    ngpio-1, ngpio-1
+
 
 If some GPIO lines do not have corresponding IRQs, the bitmask valid_mask
 and the flag need_valid_mask in gpio_irq_chip can be used to mask off some
@@ -413,7 +416,7 @@ The preferred way to set up the helpers is to fill in the
 struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
 If you do this, the additional irq_chip will be set up by gpiolib at the
 same time as setting up the rest of the GPIO functionality. The following
-is a typical example of a cascaded interrupt handler using gpio_irq_chip:
+is a typical example of a cascaded interrupt handler using gpio_irq_chip::
 
   /* Typical state container with dynamic irqchip */
   struct my_gpio {
@@ -448,7 +451,7 @@ is a typical example of a cascaded interrupt handler using gpio_irq_chip:
   return devm_gpiochip_add_data(dev, &g->gc, g);
 
 The helper support using hierarchical interrupt controllers as well.
-In this case the typical set-up will look like this:
+In this case the typical set-up will look like this::
 
   /* Typical state container with dynamic irqchip */
   struct my_gpio {
-- 
2.24.0

