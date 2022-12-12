Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4E0649C79
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 11:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiLLKmO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 05:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiLLKlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 05:41:01 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26691181A;
        Mon, 12 Dec 2022 02:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841339; x=1702377339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PcuD8RuvqGmj+VYkkwi9nKNinGEefx1DYZFE4duHoLk=;
  b=K2s32RZfgU0MjqUqVP1HTQDDgEulVEM4W28YuVHKxkHFyw7tMzOd+Z2s
   9UIkNurUp3hKqHsF5MRW0ND0TUM38Um98ARykEEw3oGkZLVXlESG/NiV+
   6qFGcGQiUN6OumWHd+J3seoGchSCFihczpCtErlqYpNkvP58b67W6+qE9
   sVxJUV3lmhxAzKw8ScUhdprnqpSS4I5L4e69s0p7u1b/R70XiWEkZms7o
   JacLHgmzBGq1aKQKeLN6AusfpvBPmcw3ctTnDtfHpopIsN7nBIcVppZVV
   5d15UKiraRMCyFwPR8lcEF1UXI/GD+YfotCEzueSuBm4LqZWsAcMJ7GsB
   w==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892498"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Dec 2022 11:35:33 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 12 Dec 2022 11:35:33 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 12 Dec 2022 11:35:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841333; x=1702377333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PcuD8RuvqGmj+VYkkwi9nKNinGEefx1DYZFE4duHoLk=;
  b=WhkoOFAoZhVuQc+ff/NuE71/vHizjHvY2EjSRE5NUuLbpdRgYbmH6ke0
   PVNeZhQ2twqeXGnzCiS+LshbsIqPyfHLtKcrLBDT8FFVD/m5h5Vx+Aak+
   uOtJ/0iWHsVbxWDm9cHCcolgr51BnxBecVQ68+ztUs+NNwI20t7lSwub/
   uWjOq+o4x0X1qKI/9zHc5yJ08PgczCNPqpGKaV7z8gV7j2yaSAtI9AtIf
   0pSolctlqDTsNvwhn3AJPAjBiNDyW1QxC5vCHv8jvDFD8eR6qpFNNUUJW
   cNNyi5HwMMv9KtyGxQHZ5VY/lXR3QJHVwb3JY/jlmtqczTjYVOGLc7nbL
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892497"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2022 11:35:33 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A777E280073;
        Mon, 12 Dec 2022 11:35:32 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 2/3] gpiolib: Add support for optional ramp-up delays
Date:   Mon, 12 Dec 2022 11:35:24 +0100
Message-Id: <20221212103525.231298-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These delays are added when specified per GPIO line and GPIO is set
to high level, including any active low flag.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpio/gpiolib.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.h |  3 ++
 2 files changed, 83 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5a66d9616d7cc..5848caf0b1e12 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -20,6 +20,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/fs.h>
 #include <linux/compat.h>
+#include <linux/delay.h>
 #include <linux/file.h>
 #include <uapi/linux/gpio.h>
 
@@ -432,6 +433,73 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	return 0;
 }
 
+/*
+ * devprop_gpiochip_set_delays - Set GPIO line delays using device properties
+ * @chip: GPIO chip whose delays should be set, if possible
+ *
+ * Looks for device property "gpio-ramp-up-delays-us" and if it exists assigns
+ * GPIO delays for the chip.
+ */
+static int devprop_gpiochip_set_delays(struct gpio_chip *chip)
+{
+	struct gpio_device *gdev = chip->gpiodev;
+	struct device *dev = &gdev->dev;
+	u32 *delays;
+	int ret, i;
+	int count;
+
+	count = device_property_count_u32(dev, "gpio-ramp-up-delays-us");
+	if (count < 0)
+		return 0;
+
+	/*
+	 * When offset is set in the driver side we assume the driver internally
+	 * is using more than one gpiochip per the same device. We have to stop
+	 * setting delays if the specified ones with 'gpio-ramp-up-delays-us'
+	 * are less than the offset in the device itself. This means all the
+	 * lines are not present for every single pin within all the internal
+	 * gpiochips.
+	 */
+	if (count <= chip->offset) {
+		dev_warn(dev, "gpio-ramp-up-delays-us too short (length %d), cannot map delays for the gpiochip at offset %u\n",
+			 count, chip->offset);
+		return 0;
+	}
+
+	delays = kcalloc(count, sizeof(*delays), GFP_KERNEL);
+	if (!delays)
+		return -ENOMEM;
+
+	ret = device_property_read_u32_array(dev, "gpio-ramp-up-delays-us",
+					     delays, count);
+	if (ret < 0) {
+		dev_warn(dev, "failed to read GPIO rampup delays: %d\n", ret);
+		kfree(delays);
+		return ret;
+	}
+
+	/*
+	 * When more than one gpiochip per device is used, 'count' can
+	 * contain at most number gpiochips x chip->ngpio. We have to
+	 * correctly distribute all defined lines taking into account
+	 * chip->offset as starting point from where we will assign
+	 * the delays to pins from the 'delays' array. Since property
+	 * 'gpio-ramp-up-delays-us' cannot contains gaps, we have to be sure
+	 * we only assign those pins that really exists since chip->ngpio
+	 * can be different of the chip->offset.
+	 */
+	count = (count > chip->offset) ? count - chip->offset : count;
+	if (count > chip->ngpio)
+		count = chip->ngpio;
+
+	for (i = 0; i < count; i++)
+		gdev->descs[i].ramp_up_delay_us = delays[chip->offset + i];
+
+	kfree(delays);
+
+	return 0;
+}
+
 static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
 {
 	unsigned long *p;
@@ -806,6 +874,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			goto err_remove_from_list;
 	}
 	ret = devprop_gpiochip_set_names(gc);
+	if (ret)
+		goto err_remove_from_list;
+	ret = devprop_gpiochip_set_delays(gc);
 	if (ret)
 		goto err_remove_from_list;
 
@@ -2962,6 +3033,9 @@ static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 		gpiod_err(desc,
 			  "%s: Error in set_value for open drain err %d\n",
 			  __func__, ret);
+
+	if (desc->ramp_up_delay_us && value)
+		fsleep(desc->ramp_up_delay_us);
 }
 
 /*
@@ -2987,6 +3061,9 @@ static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value
 		gpiod_err(desc,
 			  "%s: Error in set_value for open source err %d\n",
 			  __func__, ret);
+
+	if (desc->ramp_up_delay_us && value)
+		fsleep(desc->ramp_up_delay_us);
 }
 
 static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
@@ -2996,6 +3073,9 @@ static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 	gc = desc->gdev->chip;
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
 	gc->set(gc, gpio_chip_hwgpio(desc), value);
+
+	if (desc->ramp_up_delay_us && value)
+		fsleep(desc->ramp_up_delay_us);
 }
 
 /*
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b3c2db6eba80c..3d7e5781e00d2 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -143,6 +143,7 @@ extern struct list_head gpio_devices;
  * @name:		Line name
  * @hog:		Pointer to the device node that hogs this line (if any)
  * @debounce_period_us:	Debounce period in microseconds
+ * @ramp_up_delay_us:	Enable propagation delay in microseconds
  *
  * These are obtained using gpiod_get() and are preferable to the old
  * integer-based handles.
@@ -184,6 +185,8 @@ struct gpio_desc {
 	/* debounce period in microseconds */
 	unsigned int		debounce_period_us;
 #endif
+	/* enable propagation delay in microseconds */
+	unsigned int		ramp_up_delay_us;
 };
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
-- 
2.34.1

