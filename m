Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E56A512D05A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 14:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfL3NjH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 08:39:07 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:37018 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbfL3NjA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Dec 2019 08:39:00 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id kDeu2100B5USYZQ01DeuGj; Mon, 30 Dec 2019 14:38:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilvG2-0001h6-KK; Mon, 30 Dec 2019 14:38:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilvG2-0001Xs-IR; Mon, 30 Dec 2019 14:38:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/2] gpio: of: Add DT overlay support for GPIO hogs
Date:   Mon, 30 Dec 2019 14:38:52 +0100
Message-Id: <20191230133852.5890-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230133852.5890-1-geert+renesas@glider.be>
References: <20191230133852.5890-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As GPIO hogs are configured at GPIO controller initialization time,
adding/removing GPIO hogs in DT overlays does not work.

Add support for GPIO hogs described in DT overlays by registering an OF
reconfiguration notifier, to handle the addition and removal of GPIO hog
subnodes to/from a GPIO controller device node.

Note that when a GPIO hog device node is being removed, its "gpios"
properties is no longer available, so we have to keep track of which
node a hog belongs to, which is done by adding a pointer to the hog's
device node to struct gpio_desc.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib-of.c | 84 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-of.h |  2 +
 drivers/gpio/gpiolib.c    | 14 +++++--
 drivers/gpio/gpiolib.h    |  3 ++
 4 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index dfae797846bb746b..89a6138ac0a4b506 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -649,6 +649,10 @@ static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
 		ret = gpiod_hog(desc, name, lflags, dflags);
 		if (ret < 0)
 			return ret;
+
+#ifdef CONFIG_OF_DYNAMIC
+		desc->hog = hog;
+#endif
 	}
 
 	return 0;
@@ -676,11 +680,91 @@ static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 			of_node_put(np);
 			return ret;
 		}
+
+		of_node_set_flag(np, OF_POPULATED);
 	}
 
 	return 0;
 }
 
+#ifdef CONFIG_OF_DYNAMIC
+/**
+ * of_gpiochip_remove_hog - Remove all hogs in a hog device node
+ * @chip:	gpio chip to act on
+ * @hog:	device node describing the hogs
+ */
+static void of_gpiochip_remove_hog(struct gpio_chip *chip,
+				   struct device_node *hog)
+{
+	struct gpio_desc *descs = chip->gpiodev->descs;
+	unsigned int i;
+
+	for (i = 0; i < chip->ngpio; i++) {
+		if (test_bit(FLAG_IS_HOGGED, &descs[i].flags) &&
+		    descs[i].hog == hog)
+			gpiochip_free_own_desc(&descs[i]);
+	}
+}
+
+static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
+{
+	return chip->gpiodev->dev.of_node == data;
+}
+
+static struct gpio_chip *of_find_gpiochip_by_node(struct device_node *np)
+{
+	return gpiochip_find(np, of_gpiochip_match_node);
+}
+
+static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
+			  void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+	struct gpio_chip *chip;
+	int ret;
+
+	switch (of_reconfig_get_state_change(action, arg)) {
+	case OF_RECONFIG_CHANGE_ADD:
+		if (!of_property_read_bool(rd->dn, "gpio-hog"))
+			return NOTIFY_OK;	/* not for us */
+
+		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_OK;
+
+		chip = of_find_gpiochip_by_node(rd->dn->parent);
+		if (chip == NULL)
+			return NOTIFY_OK;	/* not for us */
+
+		ret = of_gpiochip_add_hog(chip, rd->dn);
+		if (ret < 0) {
+			pr_err("%s: failed to add hogs for %pOF\n", __func__,
+			       rd->dn);
+			of_node_clear_flag(rd->dn, OF_POPULATED);
+			return notifier_from_errno(ret);
+		}
+		break;
+
+	case OF_RECONFIG_CHANGE_REMOVE:
+		if (!of_node_check_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_OK;	/* already depopulated */
+
+		chip = of_find_gpiochip_by_node(rd->dn->parent);
+		if (chip == NULL)
+			return NOTIFY_OK;	/* not for us */
+
+		of_gpiochip_remove_hog(chip, rd->dn);
+		of_node_clear_flag(rd->dn, OF_POPULATED);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+struct notifier_block gpio_of_notifier = {
+	.notifier_call = of_gpio_notify,
+};
+#endif /* CONFIG_OF_DYNAMIC */
+
 /**
  * of_gpio_simple_xlate - translate gpiospec to the GPIO number and flags
  * @gc:		pointer to the gpio_chip structure
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 9768831b1fe2f25b..ed26664f153782fc 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -35,4 +35,6 @@ static inline bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 }
 #endif /* CONFIG_OF_GPIO */
 
+extern struct notifier_block gpio_of_notifier;
+
 #endif /* GPIOLIB_OF_H */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bff5ac774d870b67..ef12cfcaf0962c1c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2952,6 +2952,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 		clear_bit(FLAG_PULL_DOWN, &desc->flags);
 		clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
 		clear_bit(FLAG_IS_HOGGED, &desc->flags);
+#ifdef CONFIG_OF_DYNAMIC
+		desc->hog = NULL;
+#endif
 		ret = true;
 	}
 
@@ -5145,10 +5148,15 @@ static int __init gpiolib_dev_init(void)
 	if (ret < 0) {
 		pr_err("gpiolib: failed to allocate char dev region\n");
 		bus_unregister(&gpio_bus_type);
-	} else {
-		gpiolib_initialized = true;
-		gpiochip_setup_devs();
+		return ret;
 	}
+
+	gpiolib_initialized = true;
+	gpiochip_setup_devs();
+
+	if (IS_ENABLED(CONFIG_OF_DYNAMIC))
+		WARN_ON(of_reconfig_notifier_register(&gpio_of_notifier));
+
 	return ret;
 }
 core_initcall(gpiolib_dev_init);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a4a759920faa48ab..7af9931e8572304a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -118,6 +118,9 @@ struct gpio_desc {
 	const char		*label;
 	/* Name of the GPIO */
 	const char		*name;
+#ifdef CONFIG_OF_DYNAMIC
+	struct device_node	*hog;
+#endif
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
-- 
2.17.1

