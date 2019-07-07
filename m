Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684996137C
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jul 2019 04:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfGGCbq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Jul 2019 22:31:46 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:37340 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfGGCbq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Jul 2019 22:31:46 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x672V2Y2005347;
        Sun, 7 Jul 2019 11:31:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x672V2Y2005347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562466662;
        bh=96sCi4Xhf5ToirAMAVRIfkn1VYysxqZV7yw6UAwTGuM=;
        h=From:To:Cc:Subject:Date:From;
        b=MMJIL9mZv3SUsXX9VzDhRPbVmvTjRG/MTHgrsQaIjjml9OcFQSGyARcWjrLMR/2xT
         LP7TkuY9WWJnbrPkUWWvFkjdP4TOmnOHI+7b6KsuOOHCo4m/GHFxB4iMJGK03UMAZk
         jHyo58czIN+sMAUN3CdJXy09XfyYs98y7aAeJdkoLJeOQoKtSyuu0CiyRIkxt3v10d
         gqcHBf/hfw91Ltin5nqIJqLR1tRqsadlua6fuhPBptwmLB35w4TyaxYyxizX2DnR+V
         1C7Li5xpZGEszbgZIYqUY7nEDt8Zcb1ydnuZZAzwoBuunntttMsMNYcBzJXIO9uMjp
         BpTYm85cWz1Xw==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: remove less important #ifdef around declarations
Date:   Sun,  7 Jul 2019 11:30:37 +0900
Message-Id: <20190707023037.21496-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The whole struct/function declarations in this header are surrounded
by #ifdef.

As far as I understood, the motivation of doing so is probably to break
the build earlier if a driver misses to select or depend on correct
CONFIG options in Kconfig.

Since commit 94bed2a9c4ae ("Add -Werror-implicit-function-declaration")
no one cannot call functions that have not been declared.

So, I see some benefit in doing this in the cost of uglier headers.

In reality, it would not be so easy to catch missed 'select' or
'depends on' because GPIOLIB, GPIOLIB_IRQCHIP etc. are already selected
by someone else eventually. So, this kind of error, if any, will be
caught by randconfig bots.

In summary, I am not a big fan of cluttered #ifdef nesting, and this
does not matter for normal developers. The code readability wins.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

FYI,
If you want replace the commit log of the pinctrl variant,
the better log is available:
https://lkml.org/lkml/2019/6/26/1344

 include/linux/gpio/driver.h | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a1d273c96016..845d657f2431 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -19,9 +19,6 @@ struct gpio_device;
 struct module;
 enum gpiod_flags;
 
-#ifdef CONFIG_GPIOLIB
-
-#ifdef CONFIG_GPIOLIB_IRQCHIP
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
  */
@@ -167,7 +164,6 @@ struct gpio_irq_chip {
 	 */
 	void		(*irq_disable)(struct irq_data *data);
 };
-#endif
 
 /**
  * struct gpio_chip - abstract a GPIO controller
@@ -445,16 +441,12 @@ bool gpiochip_line_is_valid(const struct gpio_chip *chip, unsigned int offset);
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *chip);
 
-struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
-
 struct bgpio_pdata {
 	const char *label;
 	int base;
 	int ngpio;
 };
 
-#if IS_ENABLED(CONFIG_GPIO_GENERIC)
-
 int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	       unsigned long sz, void __iomem *dat, void __iomem *set,
 	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
@@ -467,10 +459,6 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 
-#endif
-
-#ifdef CONFIG_GPIOLIB_IRQCHIP
-
 int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq);
 void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
@@ -559,15 +547,11 @@ static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
 }
 #endif /* CONFIG_LOCKDEP */
 
-#endif /* CONFIG_GPIOLIB_IRQCHIP */
-
 int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset);
 void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset);
 int gpiochip_generic_config(struct gpio_chip *chip, unsigned offset,
 			    unsigned long config);
 
-#ifdef CONFIG_PINCTRL
-
 /**
  * struct gpio_pin_range - pin range controlled by a gpio chip
  * @node: list for maintaining set of pin ranges, used internally
@@ -580,6 +564,8 @@ struct gpio_pin_range {
 	struct pinctrl_gpio_range range;
 };
 
+#ifdef CONFIG_PINCTRL
+
 int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 			   unsigned int gpio_offset, unsigned int pin_offset,
 			   unsigned int npins);
@@ -620,6 +606,10 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
 				const struct fwnode_handle *fwnode);
 
+#ifdef CONFIG_GPIOLIB
+
+struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+
 #else /* CONFIG_GPIOLIB */
 
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
@@ -631,4 +621,4 @@ static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 
 #endif /* CONFIG_GPIOLIB */
 
-#endif
+#endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.17.1

