Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C0348931
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfFQQpJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:45:09 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:51903 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQQpI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:45:08 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvKGv-1iTEDz3mGv-00rIcM; Mon, 17 Jun 2019 18:45:07 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] include: linux: gpio: add comments on #if/#else/#endif
Date:   Mon, 17 Jun 2019 18:45:05 +0200
Message-Id: <1560789905-32307-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:Kb4PXHmktSFtrE/nhsjdBigS3zLpkCGcyqx1c89dX6l77ihn3I0
 isTGqgDLajpMfYUp13FaSgdaeDERFWvfQEPWZI48drVgfWo/RvJad4GljylLgsqaJ/JHkDB
 uWBnXyI+EFr5Tlu4+2CoucUAq6HUvKTCKQbFcCp1R9ASwJKLMpN39rLeezS6QzzQf00nlem
 MZHzb0ZsMUUUYJVUuekcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CJVpQFmWFCQ=:A2g3w32twkeGwW530ohITl
 VadaBTsYKM2yhv9rt141rTsMCMVIGToT7TE7PUEwiaaxLnbBjvsWCV+AS0SMxMEdt+OWZ1HRs
 omoMl7Og/ItA9BWhtQVR7xhZ8P2TRtzNYmYATS/xoVFz48+CIDhkF8rvQgZ1AOBvVPJFYCXMa
 vB92vLbECNPBIghs4WyjKYUsotMpXpRUtk8d44fs/0zPYz7LNzaaY88BBn8ZHz1wYhOZrUGeB
 gALPIe+XguE3aJ7dBmF1i/h2Kvif2GSb5agmyCLPf7DiEFU1PFtdoQZTKYpaMvWp7zcCLPEv2
 rmnq5eVyIsBzvFzZKLwvxiIigusEYMgFPvjF76IbikZ3xs3VjkYmgKW5sao4nhgi+kLOrD74c
 ZFU3xSrWivWRjtCA3MZMfGtOKrlwgSM9v6vAQ5Nmozqclj6OmEqhl3YplJJJfs7qM2RfgZI9E
 K59L2yXZKskDA0rdIlKBdfDYli/EQAngBPl6T/6e7lLjPzSd93ZoBYZUXKl49PgtCDbeQx0e6
 SwQUa0RpjKtddMXkxQ0EY3LXFiSVKZjp/+5xHrjLcUI+tlnX5mtLS6/wgEk83mcXGNLiYJCw0
 iYMg6rOb5/BCrBMegRsndtEBPePBNoo1Y+YRTloOt+5uClwxWP3IrlJiz80x/vZfpzyPNgHdu
 mHM8RKp59epPXcrd0+seRU07fnBOPznS0W/wX5OdV8ONCqljB+1kHHjNhmaPFowLOEPhl9Gd+
 wNLxL95pouF3XG2GvQ/Vx/gGhPVntC7UXgu1sw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Improve readability a bit by commenting #if/#else/#endif statements
with the checked preprocessor symbols.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 include/linux/gpio/driver.h   | 16 ++++++++--------
 include/linux/gpio/gpio-reg.h |  2 +-
 include/linux/gpio/machine.h  |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a1d273c..563714d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -167,7 +167,7 @@ struct gpio_irq_chip {
 	 */
 	void		(*irq_disable)(struct irq_data *data);
 };
-#endif
+#endif /* CONFIG_GPIOLIB_IRQCHIP */
 
 /**
  * struct gpio_chip - abstract a GPIO controller
@@ -307,7 +307,7 @@ struct gpio_chip {
 	spinlock_t bgpio_lock;
 	unsigned long bgpio_data;
 	unsigned long bgpio_dir;
-#endif
+#endif /* CONFIG_GPIO_GENERIC */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 	/*
@@ -322,7 +322,7 @@ struct gpio_chip {
 	 * used to handle IRQs for most practical cases.
 	 */
 	struct gpio_irq_chip irq;
-#endif
+#endif /* CONFIG_GPIOLIB_IRQCHIP */
 
 	/**
 	 * @need_valid_mask:
@@ -369,7 +369,7 @@ struct gpio_chip {
 	 */
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
-#endif
+#endif /* CONFIG_OF_GPIO */
 };
 
 extern const char *gpiochip_is_requested(struct gpio_chip *chip,
@@ -412,7 +412,7 @@ extern int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	})
 #else
 #define gpiochip_add_data(chip, data) gpiochip_add_data_with_key(chip, data, NULL, NULL)
-#endif
+#endif /* CONFIG_LOCKDEP */
 
 static inline int gpiochip_add(struct gpio_chip *chip)
 {
@@ -467,7 +467,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
 #define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
 
-#endif
+#endif /* CONFIG_GPIO_GENERIC */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
@@ -537,7 +537,7 @@ static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
 					handler, type, true,
 					&lock_key, &request_key);
 }
-#else
+#else /* ! CONFIG_LOCKDEP */
 static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 				       struct irq_chip *irqchip,
 				       unsigned int first_irq,
@@ -588,7 +588,7 @@ int gpiochip_add_pingroup_range(struct gpio_chip *chip,
 			unsigned int gpio_offset, const char *pin_group);
 void gpiochip_remove_pin_ranges(struct gpio_chip *chip);
 
-#else
+#else /* ! CONFIG_PINCTRL */
 
 static inline int
 gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
diff --git a/include/linux/gpio/gpio-reg.h b/include/linux/gpio/gpio-reg.h
index 5c6efd3..39b888c 100644
--- a/include/linux/gpio/gpio-reg.h
+++ b/include/linux/gpio/gpio-reg.h
@@ -11,4 +11,4 @@ struct gpio_chip *gpio_reg_init(struct device *dev, void __iomem *reg,
 
 int gpio_reg_resume(struct gpio_chip *gc);
 
-#endif
+#endif /* GPIO_REG_H */
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 35f299d..1ebe5be 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -97,7 +97,7 @@ struct gpiod_hog {
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
 void gpiod_add_hogs(struct gpiod_hog *hogs);
-#else
+#else /* ! CONFIG_GPIOLIB */
 static inline
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
 static inline
@@ -105,6 +105,6 @@ void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n) {}
 static inline
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
 static inline void gpiod_add_hogs(struct gpiod_hog *hogs) {}
-#endif
+#endif /* CONFIG_GPIOLIB */
 
 #endif /* __LINUX_GPIO_MACHINE_H */
-- 
1.9.1

