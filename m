Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA25185C48
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2020 13:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgCOMOI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Mar 2020 08:14:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43523 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgCOMOI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Mar 2020 08:14:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id f8so6556192plt.10;
        Sun, 15 Mar 2020 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=On/CIi7lsRWZeABbfDLunndsH1tzgWCy78MAeMnJ4oI=;
        b=RitAPrujX482uhCE75nlGSWGUP20839UmBWG967pjq25ZhV1CSBN+5fw3+DpkHau/A
         z13sIiyGXP1v+Lmbz3xb55PZWV+RtjXTJV9WyS5U4aj2RZTec5VXQczuGt3ALnBs/S+G
         ENWoALPFJImdT6C0Y18SLashSvXXYZTu+hfBeMr22wKGFiqv2YMyPItNwKEB3SOtiMmN
         xEhE/1ZtD0VcmZ4UFZF0DL9QOaCpf2EO97493b3AVFDA2jcsaEBmZ/ThgG96gnAOFZty
         XFWoa6zwRWBYDQSmaeM4CU6oO8KEpN5J7FLoWZ0Vx9wdNcLROOt0EfefAth8TKjiXnMr
         duyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=On/CIi7lsRWZeABbfDLunndsH1tzgWCy78MAeMnJ4oI=;
        b=VSJlBji6Xf71BKkA3+VYHXWLZzX9dvWBogxCge27quZCo7Bq0D8I+QyWkchsEHgjpC
         GQgdHTJn1BsEs4EVqjGJc/KombaRQ8BGNvbcG7a37jN0KFC9hsIiobcD8fkbru28ckau
         718o6Lhelxwv8Pwz8yFU46tK9y7AgA2hNQMxDhQzHC+opmy+pNkokQXOtYzg0K3OibE6
         KiAp49mwcG70zH9O3t3KrGzkWuzMA0IFBVm26pXczsXsYwRAaZUcWWOOlHVf95mcwWv2
         4bJTKQDnqLXX/Vb1MVZMMqKJgbcRiCsb3rc5hV0LESoG/Tf3kO5Tx6hzhijw8dpobNJ4
         jMgQ==
X-Gm-Message-State: ANhLgQ1uD7XK1Gm5CObfIQGzLTID2ZOcddA0+EPNx3Ia5Ta5+EI6uibs
        dz9oPaodI3OeU602t+GjAOua78d8qbU=
X-Google-Smtp-Source: ADFU+vvSHcV3nBl1cVB0+71+HbmbXrkh2Q2ogWu9aPT8RJDIroI4TpWJOSge+LocsW6i9HMn3zXrww==
X-Received: by 2002:a17:902:8d94:: with SMTP id v20mr22724811plo.259.1584274446492;
        Sun, 15 Mar 2020 05:14:06 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:976:a075:bc02:9cda:8f71:1120])
        by smtp.gmail.com with ESMTPSA id 5sm19869025pfw.98.2020.03.15.05.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 05:14:06 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
Date:   Sun, 15 Mar 2020 20:13:37 +0800
Message-Id: <20200315121338.251362-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200315121338.251362-1-gch981213@gmail.com>
References: <20200315121338.251362-1-gch981213@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some gpio controllers ignores pin value writing when that pin is
configured as input mode. As a result, bgpio_dir_out should set
pin to output before configuring pin values or gpio pin values
can't be set up properly.
Introduce two variants of bgpio_dir_out: bgpio_dir_out_val_first
and bgpio_dir_out_dir_first, and assign direction_output according
to a new flag: BGPIOF_NO_SET_ON_INPUT.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/gpio/gpio-mmio.c    | 23 +++++++++++++++++++----
 include/linux/gpio/driver.h |  1 +
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f729e3e9e983..b778f33cc6af 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -389,12 +389,10 @@ static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+static void bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 
-	gc->set(gc, gpio, val);
-
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 
 	gc->bgpio_dir |= bgpio_line2mask(gc, gpio);
@@ -405,7 +403,21 @@ static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 		gc->write_reg(gc->reg_dir_out, gc->bgpio_dir);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+}
 
+static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
+				   int val)
+{
+	bgpio_dir_out(gc, gpio, val);
+	gc->set(gc, gpio, val);
+	return 0;
+}
+
+static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
+				   int val)
+{
+	gc->set(gc, gpio, val);
+	bgpio_dir_out(gc, gpio, val);
 	return 0;
 }
 
@@ -538,7 +550,10 @@ static int bgpio_setup_direction(struct gpio_chip *gc,
 	if (dirout || dirin) {
 		gc->reg_dir_out = dirout;
 		gc->reg_dir_in = dirin;
-		gc->direction_output = bgpio_dir_out;
+		if (flags & BGPIOF_NO_SET_ON_INPUT)
+			gc->direction_output = bgpio_dir_out_dir_first;
+		else
+			gc->direction_output = bgpio_dir_out_val_first;
 		gc->direction_input = bgpio_dir_in;
 		gc->get_direction = bgpio_get_dir;
 	} else {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6ef05bccc0a6..ed65e00ee977 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -572,6 +572,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_BIG_ENDIAN_BYTE_ORDER	BIT(3)
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
+#define BGPIOF_NO_SET_ON_INPUT		BIT(6)
 
 int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq);
-- 
2.24.1

