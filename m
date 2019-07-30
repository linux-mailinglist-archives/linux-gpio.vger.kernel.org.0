Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8A27A079
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 07:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfG3FoZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 01:44:25 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:40047 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbfG3FoZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 01:44:25 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6U5htrh014000;
        Tue, 30 Jul 2019 14:43:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6U5htrh014000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564465436;
        bh=jvXtS3IdtW2U6PNx0KXESbeP9+QZPJpAFb8C103FY44=;
        h=From:To:Cc:Subject:Date:From;
        b=DaopBaT95A9MUOde2+xnhT46FS3ePS8Ls3oVALYnVH+62jB1mt9FI+VEw3e5ueTVv
         fFyliS1OdxZ1nQ1HlZjPNvQXADxgJFcTUobq/o36vLyu5Au+8rz2eR+VteTTt7fL+p
         H/0AIhB5iimthkBdglMJpYw0sovTbflR2Q2cRhW1uBNzVUcx2zqczx+XUU1cx837He
         qBsrDZ+anNSTHXDnOxveOdCp7hStdKF6um8dqYgXZVsp6mobAfoPH0XytGcCYZdE6o
         TwYGp32dXgpxsCAplLVHqXNRaCrOnqmFaEsbTpkWAqvn4Xjm6lWzXJ8W1C4/m/709E
         5fks0I3EWAyUg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: remove less important #ifdef around declarations
Date:   Tue, 30 Jul 2019 14:43:47 +0900
Message-Id: <20190730054347.15500-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The whole struct/function declarations in this header are surrounded
by #ifdef.

As far as I understood, the motivation of this is probably to break
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

Changes in v2:
  - rebase

 include/linux/gpio/driver.h | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6a0e420915a3..f28f534f451a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -20,9 +20,6 @@ struct module;
 enum gpiod_flags;
 enum gpio_lookup_flags;
 
-#ifdef CONFIG_GPIOLIB
-
-#ifdef CONFIG_GPIOLIB_IRQCHIP
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
  */
@@ -161,7 +158,6 @@ struct gpio_irq_chip {
 	 */
 	void		(*irq_disable)(struct irq_data *data);
 };
-#endif /* CONFIG_GPIOLIB_IRQCHIP */
 
 /**
  * struct gpio_chip - abstract a GPIO controller
@@ -441,16 +437,12 @@ bool gpiochip_line_is_valid(const struct gpio_chip *chip, unsigned int offset);
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
@@ -463,10 +455,6 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 
-#endif /* CONFIG_GPIO_GENERIC */
-
-#ifdef CONFIG_GPIOLIB_IRQCHIP
-
 int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq);
 void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
@@ -555,15 +543,11 @@ static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
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
@@ -576,6 +560,8 @@ struct gpio_pin_range {
 	struct pinctrl_gpio_range range;
 };
 
+#ifdef CONFIG_PINCTRL
+
 int gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 			   unsigned int gpio_offset, unsigned int pin_offset,
 			   unsigned int npins);
@@ -586,8 +572,6 @@ void gpiochip_remove_pin_ranges(struct gpio_chip *chip);
 
 #else /* ! CONFIG_PINCTRL */
 
-struct pinctrl_dev;
-
 static inline int
 gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
 		       unsigned int gpio_offset, unsigned int pin_offset,
@@ -619,6 +603,11 @@ void gpiochip_free_own_desc(struct gpio_desc *desc);
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
 				const struct fwnode_handle *fwnode);
 
+
+#ifdef CONFIG_GPIOLIB
+
+struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+
 #else /* CONFIG_GPIOLIB */
 
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
@@ -630,4 +619,4 @@ static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 
 #endif /* CONFIG_GPIOLIB */
 
-#endif
+#endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.17.1

