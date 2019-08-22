Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76EC9989C5
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2019 05:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729994AbfHVDTA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 23:19:00 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4756 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726785AbfHVDTA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Aug 2019 23:19:00 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 63B236385ECCEE5B31CE;
        Thu, 22 Aug 2019 11:18:58 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 22 Aug 2019
 11:18:50 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <acourbot@nvidia.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h
Date:   Thu, 22 Aug 2019 11:18:17 +0800
Message-ID: <20190822031817.32888-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If CONFIG_GPIOLIB is not, gpiochip_lock/unlock_as_irq will
conflict as this:

In file included from sound/soc/codecs/wm5100.c:18:0:
./include/linux/gpio.h:224:19: error: static declaration of gpiochip_lock_as_irq follows non-static declaration
 static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
                   ^~~~~~~~~~~~~~~~~~~~
In file included from sound/soc/codecs/wm5100.c:17:0:
./include/linux/gpio/driver.h:494:5: note: previous declaration of gpiochip_lock_as_irq was here
 int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
     ^~~~~~~~~~~~~~~~~~~~
In file included from sound/soc/codecs/wm5100.c:18:0:
./include/linux/gpio.h:231:20: error: static declaration of gpiochip_unlock_as_irq follows non-static declaration
 static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
                    ^~~~~~~~~~~~~~~~~~~~~~
In file included from sound/soc/codecs/wm5100.c:17:0:
./include/linux/gpio/driver.h:495:6: note: previous declaration of gpiochip_unlock_as_irq was here
 void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
     ^~~~~~~~~~~~~~~~~~~~~~

Move them to gpio/driver.h and use CONFIG_GPIOLIB guard this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: d74be6dfea1b ("gpio: remove gpiod_lock/unlock_as_irq()")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 include/linux/gpio.h        | 13 -------------
 include/linux/gpio/driver.h | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index f757a58..2157717 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -221,19 +221,6 @@ static inline int gpio_to_irq(unsigned gpio)
 	return -EINVAL;
 }
 
-static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
-				       unsigned int offset)
-{
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
-					  unsigned int offset)
-{
-	WARN_ON(1);
-}
-
 static inline int irq_to_gpio(unsigned irq)
 {
 	/* irq can never have been returned from gpio_to_irq() */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4d2d7b7..1778106 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -490,9 +490,6 @@ extern int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *chip,
 extern struct gpio_chip *gpiochip_find(void *data,
 			      int (*match)(struct gpio_chip *chip, void *data));
 
-/* lock/unlock as IRQ */
-int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
-void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *chip, unsigned int offset);
 void gpiochip_relres_irq(struct gpio_chip *chip, unsigned int offset);
@@ -710,6 +707,10 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip,
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
+/* lock/unlock as IRQ */
+int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
+void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
+
 #else /* CONFIG_GPIOLIB */
 
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
@@ -719,6 +720,18 @@ static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
+
+static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
+					  unsigned int offset)
+{
+	WARN_ON(1);
+}
 #endif /* CONFIG_GPIOLIB */
 
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.7.4


