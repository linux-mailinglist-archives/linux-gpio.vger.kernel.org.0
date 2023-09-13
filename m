Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3574179DDC3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 03:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbjIMBlX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 21:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjIMBlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 21:41:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB01115;
        Tue, 12 Sep 2023 18:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694569279; x=1726105279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+cjUbsuUzQAOeaZXfdiR1ihSiw+afECd56Rm0JouYPU=;
  b=mGD/mla+75kUzhC49JhYFXdILmKB6t/ULHnCP5HwmNvyawhFBmaiOAW6
   bGP1bBG4Hd6hKZZv27jj6mHUqOS2UflQexrlIVjUZqxoRLSu2gTyrqY8W
   ju2tk03T7M1Ky/TCA0mQqnRJoJz1zJwxfKpqU7TVVhjBWz2RMMuSdqkKg
   VJyYoQRMYv5Sf5w87nMVCsPti33jY1jfTeTcVct2wqdyyQ2FexHmC+9dJ
   VRdyxQ8a5W6Nojj8JPsowBXUE2kC8IcoR9j+n4ynNJ3HsSICos6z6FF8b
   vdT+Irt1JtpIDl3Uz7+6ws7b8+0f+wVngUFLFRRDg0s6fCrqc+h8sqUzW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442569184"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="442569184"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 18:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773250450"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="773250450"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2023 18:40:55 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v16 4/4] gpio: update Intel LJCA USB GPIO driver
Date:   Wed, 13 Sep 2023 09:40:12 +0800
Message-Id: <1694569212-10080-5-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
References: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver communicate with LJCA GPIO module with specific
protocol through interfaces exported by LJCA USB driver.
Update the driver according to LJCA USB driver's changes.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/Kconfig     |   4 +-
 drivers/gpio/gpio-ljca.c | 246 +++++++++++++++++++++++++++--------------------
 2 files changed, 145 insertions(+), 105 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e382dfe..c85843b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1294,9 +1294,9 @@ config GPIO_KEMPLD
 
 config GPIO_LJCA
 	tristate "INTEL La Jolla Cove Adapter GPIO support"
-	depends on MFD_LJCA
+	depends on USB_LJCA
 	select GPIOLIB_IRQCHIP
-	default MFD_LJCA
+	default USB_LJCA
 	help
 	  Select this option to enable GPIO driver for the INTEL
 	  La Jolla Cove Adapter (LJCA) board.
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 87863f0..7fae26d 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/dev_printk.h>
@@ -13,19 +14,18 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
-#include <linux/mfd/ljca.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb/ljca.h>
 
 /* GPIO commands */
-#define LJCA_GPIO_CONFIG	1
-#define LJCA_GPIO_READ		2
-#define LJCA_GPIO_WRITE		3
-#define LJCA_GPIO_INT_EVENT	4
-#define LJCA_GPIO_INT_MASK	5
-#define LJCA_GPIO_INT_UNMASK	6
+#define LJCA_GPIO_CONFIG		1
+#define LJCA_GPIO_READ			2
+#define LJCA_GPIO_WRITE			3
+#define LJCA_GPIO_INT_EVENT		4
+#define LJCA_GPIO_INT_MASK		5
+#define LJCA_GPIO_INT_UNMASK		6
 
 #define LJCA_GPIO_CONF_DISABLE		BIT(0)
 #define LJCA_GPIO_CONF_INPUT		BIT(1)
@@ -36,45 +36,49 @@
 #define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
 #define LJCA_GPIO_INT_TYPE		BIT(7)
 
-#define LJCA_GPIO_CONF_EDGE	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
-#define LJCA_GPIO_CONF_LEVEL	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
+#define LJCA_GPIO_CONF_EDGE		FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
+#define LJCA_GPIO_CONF_LEVEL		FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
 
 /* Intentional overlap with PULLUP / PULLDOWN */
-#define LJCA_GPIO_CONF_SET	BIT(3)
-#define LJCA_GPIO_CONF_CLR	BIT(4)
+#define LJCA_GPIO_CONF_SET		BIT(3)
+#define LJCA_GPIO_CONF_CLR		BIT(4)
 
-struct gpio_op {
+#define LJCA_GPIO_BUF_SIZE		60u
+
+struct ljca_gpio_op {
 	u8 index;
 	u8 value;
 } __packed;
 
-struct gpio_packet {
+struct ljca_gpio_packet {
 	u8 num;
-	struct gpio_op item[];
+	struct ljca_gpio_op item[];
 } __packed;
 
-#define LJCA_GPIO_BUF_SIZE 60
 struct ljca_gpio_dev {
-	struct platform_device *pdev;
+	struct ljca_client *ljca;
 	struct gpio_chip gc;
 	struct ljca_gpio_info *gpio_info;
 	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
 	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
 	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
+	DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
 	u8 *connect_mode;
-	/* mutex to protect irq bus */
+	/* protect irq bus */
 	struct mutex irq_lock;
 	struct work_struct work;
-	/* lock to protect package transfer to Hardware */
+	/* protect package transfer to hardware */
 	struct mutex trans_lock;
 
 	u8 obuf[LJCA_GPIO_BUF_SIZE];
 	u8 ibuf[LJCA_GPIO_BUF_SIZE];
 };
 
-static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8 config)
+static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
+			    u8 config)
 {
-	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	struct ljca_gpio_packet *packet =
+				(struct ljca_gpio_packet *)ljca_gpio->obuf;
 	int ret;
 
 	mutex_lock(&ljca_gpio->trans_lock);
@@ -82,43 +86,43 @@ static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8 config)
 	packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
 	packet->num = 1;
 
-	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_CONFIG, packet,
-			    struct_size(packet, item, packet->num), NULL, NULL);
+	ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_CONFIG, (u8 *)packet,
+			    struct_size(packet, item, packet->num), NULL, 0);
 	mutex_unlock(&ljca_gpio->trans_lock);
-	return ret;
+
+	return ret < 0 ? ret : 0;
 }
 
 static int ljca_gpio_read(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id)
 {
-	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
-	struct gpio_packet *ack_packet = (struct gpio_packet *)ljca_gpio->ibuf;
-	unsigned int ibuf_len = LJCA_GPIO_BUF_SIZE;
+	struct ljca_gpio_packet *ack_packet =
+				(struct ljca_gpio_packet *)ljca_gpio->ibuf;
+	struct ljca_gpio_packet *packet =
+				(struct ljca_gpio_packet *)ljca_gpio->obuf;
 	int ret;
 
 	mutex_lock(&ljca_gpio->trans_lock);
 	packet->num = 1;
 	packet->item[0].index = gpio_id;
-	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_READ, packet,
-			    struct_size(packet, item, packet->num), ljca_gpio->ibuf, &ibuf_len);
-	if (ret)
-		goto out_unlock;
-
-	if (!ibuf_len || ack_packet->num != packet->num) {
-		dev_err(&ljca_gpio->pdev->dev, "failed gpio_id:%u %u", gpio_id, ack_packet->num);
-		ret = -EIO;
+	ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_READ, (u8 *)packet,
+			    struct_size(packet, item, packet->num),
+			    ljca_gpio->ibuf, LJCA_GPIO_BUF_SIZE);
+
+	if (ret <= 0 || ack_packet->num != packet->num) {
+		dev_err(&ljca_gpio->ljca->auxdev.dev,
+			"read package error, gpio_id: %u num: %u ret: %d\n",
+			gpio_id, ack_packet->num, ret);
+		ret = ret < 0 ? ret : -EIO;
 	}
-
-out_unlock:
 	mutex_unlock(&ljca_gpio->trans_lock);
-	if (ret)
-		return ret;
-	return ack_packet->item[0].value > 0;
+
+	return ret < 0 ? ret : ack_packet->item[0].value > 0;
 }
 
-static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
-			   int value)
+static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, int value)
 {
-	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	struct ljca_gpio_packet *packet =
+			(struct ljca_gpio_packet *)ljca_gpio->obuf;
 	int ret;
 
 	mutex_lock(&ljca_gpio->trans_lock);
@@ -126,10 +130,11 @@ static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
 	packet->item[0].index = gpio_id;
 	packet->item[0].value = value & 1;
 
-	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_WRITE, packet,
-			    struct_size(packet, item, packet->num), NULL, NULL);
+	ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_WRITE, (u8 *)packet,
+			    struct_size(packet, item, packet->num), NULL, 0);
 	mutex_unlock(&ljca_gpio->trans_lock);
-	return ret;
+
+	return ret < 0 ? ret : 0;
 }
 
 static int ljca_gpio_get_value(struct gpio_chip *chip, unsigned int offset)
@@ -147,16 +152,24 @@ static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
 
 	ret = ljca_gpio_write(ljca_gpio, offset, val);
 	if (ret)
-		dev_err(chip->parent, "offset:%u val:%d set value failed %d\n", offset, val, ret);
+		dev_err(chip->parent,
+			"set value failed offset: %u val: %d ret: %d\n",
+			offset, val, ret);
 }
 
-static int ljca_gpio_direction_input(struct gpio_chip *chip,
-				     unsigned int offset)
+static int ljca_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
 	u8 config = LJCA_GPIO_CONF_INPUT | LJCA_GPIO_CONF_CLR;
+	int ret;
 
-	return gpio_config(ljca_gpio, offset, config);
+	ret = ljca_gpio_config(ljca_gpio, offset, config);
+	if (ret)
+		return ret;
+
+	clear_bit(offset, ljca_gpio->output_enabled);
+
+	return 0;
 }
 
 static int ljca_gpio_direction_output(struct gpio_chip *chip,
@@ -166,14 +179,26 @@ static int ljca_gpio_direction_output(struct gpio_chip *chip,
 	u8 config = LJCA_GPIO_CONF_OUTPUT | LJCA_GPIO_CONF_CLR;
 	int ret;
 
-	ret = gpio_config(ljca_gpio, offset, config);
+	ret = ljca_gpio_config(ljca_gpio, offset, config);
 	if (ret)
 		return ret;
 
 	ljca_gpio_set_value(chip, offset, val);
+	set_bit(offset, ljca_gpio->output_enabled);
+
 	return 0;
 }
 
+static int ljca_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	if (test_bit(offset, ljca_gpio->output_enabled))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
 static int ljca_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				unsigned long config)
 {
@@ -197,7 +222,8 @@ static int ljca_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
-static int ljca_gpio_init_valid_mask(struct gpio_chip *chip, unsigned long *valid_mask,
+static int ljca_gpio_init_valid_mask(struct gpio_chip *chip,
+				     unsigned long *valid_mask,
 				     unsigned int ngpios)
 {
 	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
@@ -208,15 +234,18 @@ static int ljca_gpio_init_valid_mask(struct gpio_chip *chip, unsigned long *vali
 	return 0;
 }
 
-static void ljca_gpio_irq_init_valid_mask(struct gpio_chip *chip, unsigned long *valid_mask,
+static void ljca_gpio_irq_init_valid_mask(struct gpio_chip *chip,
+					  unsigned long *valid_mask,
 					  unsigned int ngpios)
 {
 	ljca_gpio_init_valid_mask(chip, valid_mask, ngpios);
 }
 
-static int ljca_enable_irq(struct ljca_gpio_dev *ljca_gpio, int gpio_id, bool enable)
+static int ljca_enable_irq(struct ljca_gpio_dev *ljca_gpio, int gpio_id,
+			   bool enable)
 {
-	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	struct ljca_gpio_packet *packet =
+			(struct ljca_gpio_packet *)ljca_gpio->obuf;
 	int ret;
 
 	mutex_lock(&ljca_gpio->trans_lock);
@@ -224,18 +253,20 @@ static int ljca_enable_irq(struct ljca_gpio_dev *ljca_gpio, int gpio_id, bool en
 	packet->item[0].index = gpio_id;
 	packet->item[0].value = 0;
 
-	ret = ljca_transfer(ljca_gpio->gpio_info->ljca,
-			    enable ? LJCA_GPIO_INT_UNMASK : LJCA_GPIO_INT_MASK, packet,
-			    struct_size(packet, item, packet->num), NULL, NULL);
+	ret = ljca_transfer(ljca_gpio->ljca,
+			    enable ? LJCA_GPIO_INT_UNMASK : LJCA_GPIO_INT_MASK,
+			    (u8 *)packet, struct_size(packet, item, packet->num),
+			    NULL, 0);
 	mutex_unlock(&ljca_gpio->trans_lock);
-	return ret;
+
+	return ret < 0 ? ret : 0;
 }
 
 static void ljca_gpio_async(struct work_struct *work)
 {
-	struct ljca_gpio_dev *ljca_gpio = container_of(work, struct ljca_gpio_dev, work);
-	int gpio_id;
-	int unmasked;
+	struct ljca_gpio_dev *ljca_gpio =
+			container_of(work, struct ljca_gpio_dev, work);
+	int gpio_id, unmasked;
 
 	for_each_set_bit(gpio_id, ljca_gpio->reenable_irqs, ljca_gpio->gc.ngpio) {
 		clear_bit(gpio_id, ljca_gpio->reenable_irqs);
@@ -245,20 +276,22 @@ static void ljca_gpio_async(struct work_struct *work)
 	}
 }
 
-static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data, int len)
+static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data,
+			       int len)
 {
-	const struct gpio_packet *packet = evt_data;
+	const struct ljca_gpio_packet *packet = evt_data;
 	struct ljca_gpio_dev *ljca_gpio = context;
-	int i;
-	int irq;
+	int i, irq;
 
 	if (cmd != LJCA_GPIO_INT_EVENT)
 		return;
 
 	for (i = 0; i < packet->num; i++) {
-		irq = irq_find_mapping(ljca_gpio->gc.irq.domain, packet->item[i].index);
+		irq = irq_find_mapping(ljca_gpio->gc.irq.domain,
+				       packet->item[i].index);
 		if (!irq) {
-			dev_err(ljca_gpio->gc.parent, "gpio_id %u does not mapped to IRQ yet\n",
+			dev_err(ljca_gpio->gc.parent,
+				"gpio_id %u does not mapped to IRQ yet\n",
 				packet->item[i].index);
 			return;
 		}
@@ -299,18 +332,22 @@ static int ljca_irq_set_type(struct irq_data *irqd, unsigned int type)
 	ljca_gpio->connect_mode[gpio_id] = LJCA_GPIO_CONF_INTERRUPT;
 	switch (type) {
 	case IRQ_TYPE_LEVEL_HIGH:
-		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLUP);
+		ljca_gpio->connect_mode[gpio_id] |=
+			(LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLUP);
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLDOWN);
+		ljca_gpio->connect_mode[gpio_id] |=
+			(LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLDOWN);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
 		break;
 	case IRQ_TYPE_EDGE_RISING:
-		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLUP);
+		ljca_gpio->connect_mode[gpio_id] |=
+			(LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLUP);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLDOWN);
+		ljca_gpio->connect_mode[gpio_id] |=
+			(LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLDOWN);
 		break;
 	default:
 		return -EINVAL;
@@ -332,15 +369,14 @@ static void ljca_irq_bus_unlock(struct irq_data *irqd)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
 	int gpio_id = irqd_to_hwirq(irqd);
-	int enabled;
-	int unmasked;
+	int enabled, unmasked;
 
 	enabled = test_bit(gpio_id, ljca_gpio->enabled_irqs);
 	unmasked = test_bit(gpio_id, ljca_gpio->unmasked_irqs);
 
 	if (enabled != unmasked) {
 		if (unmasked) {
-			gpio_config(ljca_gpio, gpio_id, 0);
+			ljca_gpio_config(ljca_gpio, gpio_id, 0);
 			ljca_enable_irq(ljca_gpio, gpio_id, true);
 			set_bit(gpio_id, ljca_gpio->enabled_irqs);
 		} else {
@@ -363,43 +399,48 @@ static const struct irq_chip ljca_gpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-static int ljca_gpio_probe(struct platform_device *pdev)
+static int ljca_gpio_probe(struct auxiliary_device *auxdev,
+			   const struct auxiliary_device_id *aux_dev_id)
 {
+	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
 	struct ljca_gpio_dev *ljca_gpio;
 	struct gpio_irq_chip *girq;
 	int ret;
 
-	ljca_gpio = devm_kzalloc(&pdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
+	ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
 	if (!ljca_gpio)
 		return -ENOMEM;
 
-	ljca_gpio->gpio_info = dev_get_platdata(&pdev->dev);
-	ljca_gpio->connect_mode = devm_kcalloc(&pdev->dev, ljca_gpio->gpio_info->num,
-					       sizeof(*ljca_gpio->connect_mode), GFP_KERNEL);
+	ljca_gpio->ljca = ljca;
+	ljca_gpio->gpio_info = dev_get_platdata(&auxdev->dev);
+	ljca_gpio->connect_mode = devm_kcalloc(&auxdev->dev,
+					       ljca_gpio->gpio_info->num,
+					       sizeof(*ljca_gpio->connect_mode),
+					       GFP_KERNEL);
 	if (!ljca_gpio->connect_mode)
 		return -ENOMEM;
 
 	mutex_init(&ljca_gpio->irq_lock);
 	mutex_init(&ljca_gpio->trans_lock);
-	ljca_gpio->pdev = pdev;
 	ljca_gpio->gc.direction_input = ljca_gpio_direction_input;
 	ljca_gpio->gc.direction_output = ljca_gpio_direction_output;
+	ljca_gpio->gc.get_direction = ljca_gpio_get_direction;
 	ljca_gpio->gc.get = ljca_gpio_get_value;
 	ljca_gpio->gc.set = ljca_gpio_set_value;
 	ljca_gpio->gc.set_config = ljca_gpio_set_config;
 	ljca_gpio->gc.init_valid_mask = ljca_gpio_init_valid_mask;
 	ljca_gpio->gc.can_sleep = true;
-	ljca_gpio->gc.parent = &pdev->dev;
+	ljca_gpio->gc.parent = &auxdev->dev;
 
 	ljca_gpio->gc.base = -1;
 	ljca_gpio->gc.ngpio = ljca_gpio->gpio_info->num;
-	ljca_gpio->gc.label = ACPI_COMPANION(&pdev->dev) ?
-			      acpi_dev_name(ACPI_COMPANION(&pdev->dev)) :
-			      dev_name(&pdev->dev);
+	ljca_gpio->gc.label = ACPI_COMPANION(&auxdev->dev) ?
+			      acpi_dev_name(ACPI_COMPANION(&auxdev->dev)) :
+			      dev_name(&auxdev->dev);
 	ljca_gpio->gc.owner = THIS_MODULE;
 
-	platform_set_drvdata(pdev, ljca_gpio);
-	ljca_register_event_cb(ljca_gpio->gpio_info->ljca, ljca_gpio_event_cb, ljca_gpio);
+	auxiliary_set_drvdata(auxdev, ljca_gpio);
+	ljca_register_event_cb(ljca, ljca_gpio_event_cb, ljca_gpio);
 
 	girq = &ljca_gpio->gc.irq;
 	gpio_irq_chip_set_chip(girq, &ljca_gpio_irqchip);
@@ -413,7 +454,7 @@ static int ljca_gpio_probe(struct platform_device *pdev)
 	INIT_WORK(&ljca_gpio->work, ljca_gpio_async);
 	ret = gpiochip_add_data(&ljca_gpio->gc, ljca_gpio);
 	if (ret) {
-		ljca_unregister_event_cb(ljca_gpio->gpio_info->ljca);
+		ljca_unregister_event_cb(ljca);
 		mutex_destroy(&ljca_gpio->irq_lock);
 		mutex_destroy(&ljca_gpio->trans_lock);
 	}
@@ -421,34 +462,33 @@ static int ljca_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ljca_gpio_remove(struct platform_device *pdev)
+static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 {
-	struct ljca_gpio_dev *ljca_gpio = platform_get_drvdata(pdev);
+	struct ljca_gpio_dev *ljca_gpio = auxiliary_get_drvdata(auxdev);
 
 	gpiochip_remove(&ljca_gpio->gc);
-	ljca_unregister_event_cb(ljca_gpio->gpio_info->ljca);
+	ljca_unregister_event_cb(ljca_gpio->ljca);
+	cancel_work_sync(&ljca_gpio->work);
 	mutex_destroy(&ljca_gpio->irq_lock);
 	mutex_destroy(&ljca_gpio->trans_lock);
-	return 0;
 }
 
-#define LJCA_GPIO_DRV_NAME "ljca-gpio"
-static const struct platform_device_id ljca_gpio_id[] = {
-	{ LJCA_GPIO_DRV_NAME, 0 },
-	{ /* sentinel */ }
+static const struct auxiliary_device_id ljca_gpio_id_table[] = {
+	{ "usb_ljca.ljca-gpio", 0 },
+	{ /* sentinel */ },
 };
-MODULE_DEVICE_TABLE(platform, ljca_gpio_id);
+MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
 
-static struct platform_driver ljca_gpio_driver = {
-	.driver.name = LJCA_GPIO_DRV_NAME,
+static struct auxiliary_driver ljca_gpio_driver = {
 	.probe = ljca_gpio_probe,
 	.remove = ljca_gpio_remove,
+	.id_table = ljca_gpio_id_table,
 };
-module_platform_driver(ljca_gpio_driver);
+module_auxiliary_driver(ljca_gpio_driver);
 
-MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
-MODULE_AUTHOR("Wang Zhifeng <zhifeng.wang@intel.com>");
-MODULE_AUTHOR("Zhang Lixu <lixu.zhang@intel.com>");
+MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-GPIO driver");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(LJCA);
-- 
2.7.4

