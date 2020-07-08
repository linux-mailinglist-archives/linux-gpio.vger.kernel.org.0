Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673B0218235
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgGHI1z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgGHI1w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:27:52 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90523C08E6DC;
        Wed,  8 Jul 2020 01:27:51 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d17so38407162ljl.3;
        Wed, 08 Jul 2020 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ohEJqbXIM1VP63tkBUHCDrB0ZyB2o3kZjgi9FEKekj4=;
        b=a441co27DyzcWAgCtkRKk/v7hmGgwCh6CovM2eq3v8vETY7EHsW+shgRvwcuPcFoMj
         brce+o/BBv6+IQlfoqMX4VRwWMnSZ+2QJGsNpF4iL9u7WT4hGhYwohWCXl5WpSZXL5H8
         XFv5SAI/zOOwL9UpQFkaXpkq2cvWqOkPDA+BaikdQqQvt2zETvGkVPD40INXzbVhGDt5
         J8/1NibGASuS5Is2gTncwE7LqyypTBbd6t1TmbDKftl/AN0l2Al+eeLnKJgZ0T3Oo4Bv
         e6NMdAqC6gEsnwnVudWZ3xt4pmJJokSvooWDK3Eab0TrtnMwto9Q7tot/hBhpTiKl+fV
         3pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ohEJqbXIM1VP63tkBUHCDrB0ZyB2o3kZjgi9FEKekj4=;
        b=eC3vUTLnJ5EYwT+AF2zPYkJTtII7GBw7ix7WWkaGvoG/ZebX2Ffp6pEMnKV5jAVxOi
         5w+nyS9CuQky8uu8H9GfVea6JgAJpxgkUjAVpVUZF2Uo1Jtr4Dh+TvcDd1fn1Gbow7H7
         qZ+tXcYGHFfsv3WBl4SFFXLnMUISJ1TafRmMgZzhgMwhXtwjcpijnfnCat2Yguat487o
         4WeUcGK8cIq13GgPsGpsxYwhuhe07+tEISdrGxpxgkKRiDMO/iJmhoz9/xGipHqF/P+L
         vypurnK8oxL7Tl2+f3XCNGp4dSrYavF5K5V5vAiZx7/BD/AXXOSl3MZFEBQsqfMGWnPw
         SgTw==
X-Gm-Message-State: AOAM533jDh31n2y+9L00fPY9XM+I47H/W1vuoTPPLTJit+UeLjllryEr
        ivlyg80LdhBrXY+/mrpCEvA=
X-Google-Smtp-Source: ABdhPJxP25lUsbBYqiEbc/Vk9jHFUpHJpEebWor4cEddN4hDJnhcJsqaMVgh5uzL3gkIyLmv6Rdp5Q==
X-Received: by 2002:a2e:b0e9:: with SMTP id h9mr21602930ljl.3.1594196870116;
        Wed, 08 Jul 2020 01:27:50 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id d2sm737555ljg.6.2020.07.08.01.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 01:27:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] gpio: max77620: Replace interrupt-enable array with bitmap
Date:   Wed,  8 Jul 2020 11:26:32 +0300
Message-Id: <20200708082634.30191-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708082634.30191-1-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to dedicate an array where a bitmap could be used.
Let's replace the interrupt's enable-array with the enable-mask in order
to improve the code a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 6a7ede6b8b74..dd83c16a1ec6 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/max77620.h>
@@ -20,7 +21,7 @@ struct max77620_gpio {
 	struct device		*dev;
 	struct mutex		buslock; /* irq_bus_lock */
 	unsigned int		irq_type[MAX77620_GPIO_NR];
-	bool			irq_enabled[MAX77620_GPIO_NR];
+	unsigned long		irq_enb_mask;
 };
 
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
@@ -53,7 +54,7 @@ static void max77620_gpio_irq_mask(struct irq_data *data)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct max77620_gpio *gpio = gpiochip_get_data(chip);
 
-	gpio->irq_enabled[data->hwirq] = false;
+	clear_bit(data->hwirq, &gpio->irq_enb_mask);
 }
 
 static void max77620_gpio_irq_unmask(struct irq_data *data)
@@ -61,7 +62,7 @@ static void max77620_gpio_irq_unmask(struct irq_data *data)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct max77620_gpio *gpio = gpiochip_get_data(chip);
 
-	gpio->irq_enabled[data->hwirq] = true;
+	set_bit(data->hwirq, &gpio->irq_enb_mask);
 }
 
 static int max77620_gpio_set_irq_type(struct irq_data *data, unsigned int type)
@@ -108,7 +109,10 @@ static void max77620_gpio_bus_sync_unlock(struct irq_data *data)
 	unsigned int value, offset = data->hwirq;
 	int err;
 
-	value = gpio->irq_enabled[offset] ? gpio->irq_type[offset] : 0;
+	if (test_bit(offset, &gpio->irq_enb_mask))
+		value = gpio->irq_type[offset];
+	else
+		value = 0;
 
 	err = regmap_update_bits(gpio->rmap, GPIO_REG_ADDR(offset),
 				 MAX77620_CNFG_GPIO_INT_MASK, value);
-- 
2.26.0

