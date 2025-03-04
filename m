Return-Path: <linux-gpio+bounces-17028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C237A4DC85
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1900B3B32C7
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1896D20124F;
	Tue,  4 Mar 2025 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/PJT3iJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217001FFC67;
	Tue,  4 Mar 2025 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741087473; cv=none; b=CngVrmhiVd/mEhvooxDZkNnWY97EZOaBsYwHRri5vBPL1VpJT/jpEsFsBjFeOjTMzCZMWpzZn7a1TlLtJD2DWJjEM2FheNefSQVxpS1FbTuMO68rXhtuTSlAou7Me2Gz0NOGA5lLEwDmKiaH7sdtc+AqNlFmNpDciBVkvYX7bdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741087473; c=relaxed/simple;
	bh=7nohAw0bWsd6obQUX7U+tOIRobhxal0W9DKsjxcd/NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhtuCWJD+v20vf4NRhCl6806TWjSEJCiFAGoPNj50u/nA6BU9s5piVgKkyZkVxz1YUbMmeRsvcMamLy9KIjqhadC4ndsHIbjbiDlbsG+1h1lPTsebhddvMzJflsOwQeO2EvR8Ag3/+J2QMKf0ZN4CqtWJUt3aDEBr7TWXqZ/RK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/PJT3iJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741087472; x=1772623472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7nohAw0bWsd6obQUX7U+tOIRobhxal0W9DKsjxcd/NQ=;
  b=f/PJT3iJyJUcSEfW8b21zjMvIe7llgKeYM7zM4O1l0EwKo+lA6ARRg2Q
   K6Yhp2sEaeFyy5K/7mBryEK5ZZhSmW6AfcWxhwiYuDrOSdllFw2MZm4T5
   U0Soy3P8NqaX5hsTw/djFo/gWIj7PetEFJVPSQpW8BG8ViMMJH66IPj/o
   AGoZSHNR1EpIv2mN2eSvJOiEATvGrIfzC+fn/NkvFwn5JD4hnVV6ZhoGH
   O5wus1RwxRilntIeMefrUKmln64nnhMOGEHHXlXLUFL/YiCJ8OhOpyoPi
   vPPZIKzl5tZSe4cpr5y0I9wUpjZBzO8CrDbdayqxtu3B/yYvVDl0AFJxQ
   A==;
X-CSE-ConnectionGUID: PgrnrSpsTD2BVbpPJnzdVg==
X-CSE-MsgGUID: EF4U61EZSo2qO7ycA70Lgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41897792"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41897792"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:24:28 -0800
X-CSE-ConnectionGUID: ccPscuNNTNSWt4AvY0E8sQ==
X-CSE-MsgGUID: PS4x1KcCRO+fsU65//b09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="141578428"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2025 03:24:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0196C2FB; Tue, 04 Mar 2025 13:24:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH net-next v3 3/3] ieee802154: ca8210: Switch to using gpiod API
Date: Tue,  4 Mar 2025 13:22:34 +0200
Message-ID: <20250304112418.1774869-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
References: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the driver to gpiod API, and removes yet another use of
of_get_named_gpio().

With this, invert the logic of the reset pin which is active low
and add a quirk for the legacy and incorrect device tree descriptions.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../bindings/net/ieee802154/ca8210.txt        |  2 +-
 drivers/gpio/gpiolib-of.c                     |  9 +++
 drivers/net/ieee802154/ca8210.c               | 57 +++++++------------
 3 files changed, 29 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
index a1046e636fa1..f1bd07a0097d 100644
--- a/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
+++ b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
@@ -20,7 +20,7 @@ Example:
 		reg = <0>;
 		spi-max-frequency = <3000000>;
 		spi-cpol;
-		reset-gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+		reset-gpio = <&gpio1 1 GPIO_ACTIVE_LOW>;
 		irq-gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		extclock-enable;
 		extclock-freq = 16000000;
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index df351b1d6628..54e916d4c03e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -203,6 +203,15 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "qi,lb60",		"rb-gpios",	true },
 #endif
+#if IS_ENABLED(CONFIG_IEEE802154_CA8210)
+		/*
+		 * According to the datasheet, the NRST pin 27 is an active-low
+		 * signal. However, the device tree schema and admittedly
+		 * the out-of-tree implementations have been used for a long
+		 * time incorrectly by describing reset GPIO as active-high.
+		 */
+		{ "cascoda,ca8210",	"reset-gpio",	false },
+#endif
 #if IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/*
 		 * According to the PCI specification, the RST# pin is an
diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 65f042c8734b..ebc4f1b18e7b 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -52,12 +52,10 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/ieee802154.h>
 #include <linux/io.h>
 #include <linux/kfifo.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
@@ -350,8 +348,8 @@ struct work_priv_container {
  * @extclockenable: true if the external clock is to be enabled
  * @extclockfreq:   frequency of the external clock
  * @extclockgpio:   ca8210 output gpio of the external clock
- * @gpio_reset:     gpio number of ca8210 reset line
- * @gpio_irq:       gpio number of ca8210 interrupt line
+ * @reset_gpio:     ca8210 reset GPIO descriptor
+ * @irq_gpio:       ca8210 interrupt GPIO descriptor
  * @irq_id:         identifier for the ca8210 irq
  *
  */
@@ -359,8 +357,8 @@ struct ca8210_platform_data {
 	bool extclockenable;
 	unsigned int extclockfreq;
 	unsigned int extclockgpio;
-	int gpio_reset;
-	int gpio_irq;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *irq_gpio;
 	int irq_id;
 };
 
@@ -632,10 +630,10 @@ static void ca8210_reset_send(struct spi_device *spi, unsigned int ms)
 	struct ca8210_priv *priv = spi_get_drvdata(spi);
 	long status;
 
-	gpio_set_value(pdata->gpio_reset, 0);
+	gpiod_set_value(pdata->reset_gpio, 1);
 	reinit_completion(&priv->ca8210_is_awake);
 	msleep(ms);
-	gpio_set_value(pdata->gpio_reset, 1);
+	gpiod_set_value(pdata->reset_gpio, 0);
 	priv->promiscuous = false;
 
 	/* Wait until wakeup indication seen */
@@ -2788,24 +2786,14 @@ static int ca8210_reset_init(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
 	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
-	int ret;
 
-	pdata->gpio_reset = of_get_named_gpio(
-		spi->dev.of_node,
-		"reset-gpio",
-		0
-	);
-
-	ret = gpio_direction_output(pdata->gpio_reset, 1);
-	if (ret < 0) {
-		dev_crit(
-			&spi->dev,
-			"Reset GPIO %d did not set to output mode\n",
-			pdata->gpio_reset
-		);
+	pdata->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(pdata->reset_gpio)) {
+		dev_crit(dev, "Reset GPIO did not set to output mode\n");
+		return PTR_ERR(pdata->reset_gpio);
 	}
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2820,20 +2808,15 @@ static int ca8210_interrupt_init(struct spi_device *spi)
 	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
 	int ret;
 
-	pdata->gpio_irq = of_get_named_gpio(
-		spi->dev.of_node,
-		"irq-gpio",
-		0
-	);
+	pdata->irq_gpio = devm_gpiod_get(dev, "irq", GPIOD_IN);
+	if (IS_ERR(pdata->irq_gpio)) {
+		dev_crit(dev, "Could not retrieve IRQ GPIO\n");
+		return PTR_ERR(pdata->irq_gpio);
+	}
 
-	pdata->irq_id = gpio_to_irq(pdata->gpio_irq);
+	pdata->irq_id = gpiod_to_irq(pdata->irq_gpio);
 	if (pdata->irq_id < 0) {
-		dev_crit(
-			&spi->dev,
-			"Could not get irq for gpio pin %d\n",
-			pdata->gpio_irq
-		);
-		gpio_free(pdata->gpio_irq);
+		dev_crit(dev, "Could not get irq for IRQ GPIO\n");
 		return pdata->irq_id;
 	}
 
@@ -2844,10 +2827,8 @@ static int ca8210_interrupt_init(struct spi_device *spi)
 		"ca8210-irq",
 		spi_get_drvdata(spi)
 	);
-	if (ret) {
+	if (ret)
 		dev_crit(&spi->dev, "request_irq %d failed\n", pdata->irq_id);
-		gpio_free(pdata->gpio_irq);
-	}
 
 	return ret;
 }
-- 
2.47.2


