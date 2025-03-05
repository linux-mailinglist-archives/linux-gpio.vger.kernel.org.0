Return-Path: <linux-gpio+bounces-17109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D52FA4FD00
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65AF57A6526
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42589233737;
	Wed,  5 Mar 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="er8CLQyT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909722A4DF;
	Wed,  5 Mar 2025 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172228; cv=none; b=ctKLFBYTXWqSNtnpO9x1LBGDncbhcTLtg3CDpPGBtH+oHIgUcmw2Di9a4bIwWju8RShYSa+1awn+ugdC7D9gHL9AjfdVrWBdRzTCzo6Kq4FvbqdCJmufi+Vk8wN3SvwXoI8SECcvq+KTS+cb5lQCP10gHHtn6KfAa5VDdOq9TFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172228; c=relaxed/simple;
	bh=4mWiSaWYOBSBHZ9umfa/gZfpmXrkDhdbnk2oA30pHHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkgxQLb/kKTz3Gi2wILapkzpt8PfEL0d57BR7hfvNsleC+r2WoucEb+mlgZX2wWh4zdx6bzkzP1o0z+tOrFv2Y/4q7dOTIocxtsFGgq2jn4tzndShbST9ZAwlV5KqBs3k+XjXns8ODpTQoK+eOJztltWrMq4t7O+s6XMpKt7pkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=er8CLQyT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741172227; x=1772708227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4mWiSaWYOBSBHZ9umfa/gZfpmXrkDhdbnk2oA30pHHE=;
  b=er8CLQyTvMNhcpnAn1WYg5mwPobTT4oMT8FyVLwWFN0gANGzRrSkw2p7
   FcGXaqpg3pNwI1SVasfzj0K5/kWT5rsO/ticRFItcp62H88+qLifdgXex
   r9eS2BKD0QNRhAgyGwLaWPoSOGs2hA93c0e/Vo/HTUt0X3endP+MbH0hI
   4Vi5hUYKHHbUmPCpfFwmo5ug7g8UdUWp3kDKVaGCkyPGWNXEk5IcyE3hv
   YFxyzMD/saSVdcFNcmIdxpu8w/1fCnoJAw7zLyoDiS6/lgjLhQ5bvqhpf
   irNjqpMxSCtgH6jMFia5CNlGw9repEi45zMaxSWPRlwiwshecNAaDqbdE
   Q==;
X-CSE-ConnectionGUID: QjBeELr5ReuYCX/2qubWlQ==
X-CSE-MsgGUID: Bp4bxZTZQC6OiAcUUfZTiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45783928"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="45783928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:57:04 -0800
X-CSE-ConnectionGUID: YdFP/EZ3RLi2eaiBqmj98g==
X-CSE-MsgGUID: 7P8XXUEXQyKZmFetVQl47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123245749"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2025 02:56:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A218B2CA; Wed, 05 Mar 2025 12:56:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH net-next v4 3/4] ieee802154: ca8210: Switch to using gpiod API
Date: Wed,  5 Mar 2025 12:55:36 +0200
Message-ID: <20250305105656.2133487-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
References: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the driver to gpiod API, and removes yet another use of
of_get_named_gpio().

With this, invert the logic of the reset pin which is active-low
and add a quirk for the legacy and incorrect device tree descriptions.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-of.c       |  9 ++++++
 drivers/net/ieee802154/ca8210.c | 57 +++++++++++----------------------
 2 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a7370fa48556..280d56736844 100644
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


