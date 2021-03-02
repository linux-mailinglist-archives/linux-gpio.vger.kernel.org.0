Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73EE32AD2A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383247AbhCBV1e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347494AbhCBSHN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 13:07:13 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA207C0617AA;
        Tue,  2 Mar 2021 10:06:04 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d15so5633667wrv.5;
        Tue, 02 Mar 2021 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnkuHuyViGY8zg3xnjKXTQqrs4pSICO7UYO1lK2VU+Q=;
        b=AwnopjaXS2hX7IMjcz79ZlfUNKEp2Oxb8rO61mXVKKosI/G7j+5fB9/UKeDKlW6LBm
         YagB0Xi20yf2qnJUZZv/xg9YKYXnaKgTNuvmihLjvKVPXGJ5CF2G8GCfw8yDI6gIk5iR
         OhLUh+dZue30YHabqWtWSXUjqBqFw4mmai9uBPg72X78fYUHReUOBJ7FXkmbzo7u3w2X
         0Q282JKskkEqTcKPDXfoeKbkIBOWK6qfFl2rySlsbsphIP8CZIzToWMjcrp2KWq4H9wS
         uI9B5R1e4n2Jde3TTOth4ccq+Xk6ur/KjlmZeylJOwJqI+II59GmgxN5DAtXtIXHvLrX
         XojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnkuHuyViGY8zg3xnjKXTQqrs4pSICO7UYO1lK2VU+Q=;
        b=g7VKO/MOhYfGxDkEgS2Ix5reC0b4OXZ95hpz5v8HU1ccuXrHyp/9QuFlIMh6ytMgPu
         Z4f03bj3CuOGsV09T2GGxQPWpNUsFPrHTCaOZofD43ba1NbGpcaZI8R9Rf+OofJXrLVC
         gPqJbMzmXXQJjfpn4AGbjSAOL6cFv8xbgTm29w11ZU34Dg6cY8xlDIKrIebAIhYZeXS7
         uwx7ZSIxYtZQdlqhn87jAISEvic62k0ptDzH7oG4U2ajfUqk5BPf1n4oyfjRPvvqV+GY
         8O+A9crA0NHA3Q7Ild2YTodc8opDtIp0JEB9GpaqPpZhlhAp/5Hf9Gvs8R3dPAW6C9Mt
         YRgg==
X-Gm-Message-State: AOAM532AA5ISrGxBv2oYL0tR9iOES/70g4zLMRhtrvpbnQGAqAAxzbjg
        GC5MDujMqRtWXMdf6je0EoQ=
X-Google-Smtp-Source: ABdhPJy/G47wvJRz10CO7RBiIR3rwtnapxBdAhWA/8PJFCD03yVzoaQSeHYOBhRemPCLmDfyxbud+Q==
X-Received: by 2002:a5d:4592:: with SMTP id p18mr7576282wrq.244.1614708363488;
        Tue, 02 Mar 2021 10:06:03 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id 3sm17136336wry.72.2021.03.02.10.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 10:06:02 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] gpio: regmap: move struct gpio_regmap definition
Date:   Tue,  2 Mar 2021 19:06:01 +0100
Message-Id: <20210302180601.12082-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

struct gpio_regmap should be declared in gpio/regmap.h.
This way other drivers can access the structure data when registering a gpio
regmap controller.

Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using regmap")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/gpio/gpio-regmap.c  | 20 ------------------
 include/linux/gpio/regmap.h | 41 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 5412cb3b0b2a..23b0a8572f53 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -11,26 +11,6 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 
-struct gpio_regmap {
-	struct device *parent;
-	struct regmap *regmap;
-	struct gpio_chip gpio_chip;
-
-	int reg_stride;
-	int ngpio_per_reg;
-	unsigned int reg_dat_base;
-	unsigned int reg_set_base;
-	unsigned int reg_clr_base;
-	unsigned int reg_dir_in_base;
-	unsigned int reg_dir_out_base;
-
-	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
-			      unsigned int offset, unsigned int *reg,
-			      unsigned int *mask);
-
-	void *driver_data;
-};
-
 static unsigned int gpio_regmap_addr(unsigned int addr)
 {
 	if (addr == GPIO_REGMAP_ADDR_ZERO)
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index ad76f3d0a6ba..ce2fc6e9b62b 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -4,13 +4,52 @@
 #define _LINUX_GPIO_REGMAP_H
 
 struct device;
-struct gpio_regmap;
 struct irq_domain;
 struct regmap;
 
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
 
+/**
+ * struct gpio_regmap - GPIO regmap controller
+ * @parent:		The parent device
+ * @regmap:		The regmap used to access the registers
+ *			given, the name of the device is used
+ * @gpio_chip:		GPIO chip controller
+ * @ngpio_per_reg:	Number of GPIOs per register
+ * @reg_stride:		(Optional) May be set if the registers (of the
+ *			same type, dat, set, etc) are not consecutive.
+ * @reg_dat_base:	(Optional) (in) register base address
+ * @reg_set_base:	(Optional) set register base address
+ * @reg_clr_base:	(Optional) clear register base address
+ * @reg_dir_in_base:	(Optional) in setting register base address
+ * @reg_dir_out_base:	(Optional) out setting register base address
+ * @reg_mask_xlate:     (Optional) Translates base address and GPIO
+ *			offset to a register/bitmask pair. If not
+ *			given the default gpio_regmap_simple_xlate()
+ *			is used.
+ * @driver_data:	(Optional) driver-private data
+ */
+struct gpio_regmap {
+	struct device *parent;
+	struct regmap *regmap;
+	struct gpio_chip gpio_chip;
+
+	int reg_stride;
+	int ngpio_per_reg;
+	unsigned int reg_dat_base;
+	unsigned int reg_set_base;
+	unsigned int reg_clr_base;
+	unsigned int reg_dir_in_base;
+	unsigned int reg_dir_out_base;
+
+	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
+			      unsigned int offset, unsigned int *reg,
+			      unsigned int *mask);
+
+	void *driver_data;
+};
+
 /**
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
-- 
2.20.1

