Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CD11ACDBF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 18:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgDPQcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 12:32:22 -0400
Received: from muru.com ([72.249.23.125]:49792 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgDPQcV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 12:32:21 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D6E2D804F;
        Thu, 16 Apr 2020 16:33:05 +0000 (UTC)
Date:   Thu, 16 Apr 2020 09:32:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
Message-ID: <20200416163215.GH37466@atomide.com>
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1>
 <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415233712.GA16167@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

* Drew Fustini <drew@pdp7.com> [200415 23:37]:
> As Robert described, I wanted to make us of the new support for bias
> flags in the gpiolib uapi which allows userspace libraries like libgpiod
> set pull-up or pull-down on lines [0].
> 
> Is there no way for gpio-omap to call into the pinctrl-single backend to
> set the bias bits (PULLUDEN and PULLTYPESEL) in pad control registers?

It sure would be nice to improve some of this :) You should be able to
do this using the gpio-ranges binding with the following steps:

1. Add gpio-ranges to dts files

This should be done for all the pins that need handling, here's
just one line version:

gpio-ranges = <&pmx_core 0 15 1>;
                         |  | |
			 |  | +-- number of pins
			 |  +---- pin start
			 +------- gpio start

Some mappings can use larger ranges, while some pins just need
to be added separately.

2. Implement parsing of gpio-ranges to pinctrl-single.c

The following test patch I did a while back should get you started.

From what I recall, the issue here the addressing. The addressing
ends up using an artiticial index of pin entries in the dts, while
it should use the read pinctrl device padconf offset.

Maybe Linus has some suggestion on how to deal with that?

3. Have gpio-omap.c call gpiod_direction_input(desc) and
   gpiod_to_irq(desc) for example for gpio interrupt pins

To do that, you need something like this in gpio-omap.c:

if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
	chips->chip.request = gpiochip_generic_request;
	chips->chip.free = gpiochip_generic_free;
}

Regards,

Tony

8< -------------------
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -149,6 +150,8 @@ struct pcs_soc_data {
  * @dev:	device entry
  * @np:		device tree node
  * @pctl:	pin controller device
+ * @gc:		optional gpio chip
+ * @nr_gpio:	optional number of gpio pins
  * @flags:	mask of PCS_FEAT_xxx values
  * @missing_nr_pinctrl_cells: for legacy binding, may go away
  * @socdata:	soc specific data
@@ -178,6 +181,8 @@ struct pcs_device {
 	struct device *dev;
 	struct device_node *np;
 	struct pinctrl_dev *pctl;
+	struct gpio_chip *gc;
+	int nr_gpio;
 	unsigned flags;
 #define PCS_CONTEXT_LOSS_OFF	(1 << 3)
 #define PCS_QUIRK_SHARED_IRQ	(1 << 2)
@@ -1340,6 +1345,8 @@ static int pcs_add_gpio_func(struct device_node *node, struct pcs_device *pcs)
 		mutex_lock(&pcs->mutex);
 		list_add_tail(&range->node, &pcs->gpiofuncs);
 		mutex_unlock(&pcs->mutex);
+
+		pcs->nr_gpio += range->npins;
 	}
 	return ret;
 }
@@ -1599,6 +1606,93 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
 	return 0;
 }
 
+static int pcs_gpio_find_by_offset(struct pcs_device *pcs, int offset)
+{
+
+}
+
+static int pcs_gpio_request(struct gpio_chip *gc, unsigned offset)
+{
+	struct pcs_device *pcs = gpiochip_get_data(gc);
+
+	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
+
+	return 0;
+}
+
+static void pcs_gpio_free(struct gpio_chip *gc, unsigned offset)
+{
+	struct pcs_device *pcs = gpiochip_get_data(gc);
+
+	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
+}
+
+static int pcs_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct pcs_device *pcs = gpiochip_get_data(gc);
+
+	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
+
+	return 0;
+}
+
+static int pcs_gpio_get(struct gpio_chip *gc, unsigned offset)
+{
+	struct pcs_device *pcs = gpiochip_get_data(gc);
+
+	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
+
+	return -EINVAL;
+}
+
+static void pcs_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct pcs_device *pcs = gpiochip_get_data(gc);
+
+	dev_info(pcs->dev, "XXX %s offset: %u value: %i\n",
+		 __func__, offset, value);
+}
+
+static int pcs_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+{
+	struct pcs_device *pcs = gpiochip_get_data(gc);
+
+	dev_info(pcs->dev, "XXX %s offset: %u\n", __func__, offset);
+
+	return 0;
+}
+
+static int pcs_init_gpiochip(struct device_node *np, struct pcs_device *pcs)
+{
+	int error;
+
+	if (!pcs->nr_gpio || !of_property_read_bool(np, "gpio-controller"))
+		return 0;
+
+	pcs->gc = devm_kzalloc(pcs->dev, sizeof(*pcs->gc), GFP_KERNEL);
+	if (!pcs->gc)
+		return -ENOMEM;
+
+	pcs->gc->request = pcs_gpio_request;
+	pcs->gc->free = pcs_gpio_free;
+	pcs->gc->direction_input = pcs_gpio_direction_input;
+	pcs->gc->get = pcs_gpio_get;
+	pcs->gc->set = pcs_gpio_set;
+	pcs->gc->to_irq = pcs_gpio_to_irq;
+
+	pcs->gc->label = pcs->desc.name;
+	pcs->gc->parent = pcs->dev;
+	pcs->gc->owner = THIS_MODULE;
+	pcs->gc->base = -1;
+	pcs->gc->ngpio = pcs->nr_gpio;
+
+	error = devm_gpiochip_add_data(pcs->dev, pcs->gc, pcs);
+	if (error)
+		return error;
+
+	return 0;
+}
+
 #ifdef CONFIG_PM
 static int pcs_save_context(struct pcs_device *pcs)
 {
@@ -1868,6 +1962,10 @@ static int pcs_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto free;
 
+	ret = pcs_init_gpiochip(np, pcs);
+	if (ret < 0)
+		goto free;
+
 	pcs->socdata.irq = irq_of_parse_and_map(np, 0);
 	if (pcs->socdata.irq)
 		pcs->flags |= PCS_FEAT_IRQ;
-- 
2.26.1
