Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D027C251
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 14:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfGaMzI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 08:55:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51670 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726300AbfGaMzI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Jul 2019 08:55:08 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D5D83FBF895ADF134FA0;
        Wed, 31 Jul 2019 20:39:35 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 20:39:27 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <yamada.masahiro@socionext.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] gpio: Fix build error of function redefinition
Date:   Wed, 31 Jul 2019 20:38:14 +0800
Message-ID: <20190731123814.46624-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

when do randbuilding, I got this error:

In file included from drivers/hwmon/pmbus/ucd9000.c:19:0:
./include/linux/gpio/driver.h:576:1: error: redefinition of gpiochip_add_pin_range
 gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 ^~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/hwmon/pmbus/ucd9000.c:18:0:
./include/linux/gpio.h:245:1: note: previous definition of gpiochip_add_pin_range was here
 gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 ^~~~~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 964cb341882f ("gpio: move pincontrol calls to <linux/gpio/driver.h>")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 include/linux/gpio.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 40915b4..f757a58 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -241,30 +241,6 @@ static inline int irq_to_gpio(unsigned irq)
 	return -EINVAL;
 }
 
-static inline int
-gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
-		       unsigned int gpio_offset, unsigned int pin_offset,
-		       unsigned int npins)
-{
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static inline int
-gpiochip_add_pingroup_range(struct gpio_chip *chip,
-			struct pinctrl_dev *pctldev,
-			unsigned int gpio_offset, const char *pin_group)
-{
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static inline void
-gpiochip_remove_pin_ranges(struct gpio_chip *chip)
-{
-	WARN_ON(1);
-}
-
 static inline int devm_gpio_request(struct device *dev, unsigned gpio,
 				    const char *label)
 {
-- 
2.7.4


