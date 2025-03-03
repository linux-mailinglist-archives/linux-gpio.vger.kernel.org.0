Return-Path: <linux-gpio+bounces-16952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E578AA4C45F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD683A84C7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 15:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C49B214210;
	Mon,  3 Mar 2025 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuW5LXJ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B882212B04;
	Mon,  3 Mar 2025 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014605; cv=none; b=ZvCgGs24BSUJHNQqdqYre5oyNiiJlb7ZKc8Ov80dygyH2epXXYj+LMm0H+XP2Y+vZjD/Gfed00u55ekT3qeoKMHjtm+yffBZ7qtd+YlzF+qvNiJJvi8QJdCpQhLcBnUZ7rNhV76PIZBJ6gX7S3aGyuBsh55TBYBVpzRdNfKyLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014605; c=relaxed/simple;
	bh=+nmCVhTXoru3X0wWJqoQLsXNFK1aXTMN9Yyx21EeHNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkK94p4OXCiGs0ZLc6XQAQ5bKl3+ZF32XxyYqfrgN1YDfKKNwgBbU8QhUdiI7T72mzpushJxZWsGc2KGlAMuduj/pQ1we5AJOCM+SAwG+WprP6I7xsVbikyytfmcuhx/ibcwuWABpA54N1Xt5asPebiUhd61UTTahoSCTZgdyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuW5LXJ/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741014603; x=1772550603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+nmCVhTXoru3X0wWJqoQLsXNFK1aXTMN9Yyx21EeHNo=;
  b=FuW5LXJ/ZbmFdSW5L102GCMdfeL3iIcarVT36+yeVIaDY25a2dM8E0S+
   hbRkSgv666vyTf847zGRpjgTAx8ShoLtNb3bF4m6YnKvcPKtBoEm/W1RR
   FRVPl7p3QJJqjv+q8DNmcwHh6jMSRoI4fx7bEZltHI1jCDgNFdB45BUGI
   cljTBIVTsjUiGapuagybTGecmJhwv1L42kOqO1yDN4a0IH174ISOHu1TR
   K8DiFIb8vRN6U08oPA1Y45Syq6g0Pnxno6omfyT7bN7J68RFgKaqSnSEz
   sIXktAnsGIgNkpCvO8N1Nspf6ppPcKR5MYg796Y0LXerB6NRPu3OiMEwV
   A==;
X-CSE-ConnectionGUID: +OHKg/u8SxOiFK+zMXwrOQ==
X-CSE-MsgGUID: czEH5OC8RauRlHnEPelrPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52099481"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="52099481"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 07:09:01 -0800
X-CSE-ConnectionGUID: K1pD2p+pRQeKrxUygAZjJQ==
X-CSE-MsgGUID: 5u9d68B3QyageQIsd99Bsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118739574"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 07:08:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8FC25191; Mon, 03 Mar 2025 17:08:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH net-next v1 2/2] ieee802154: ca8210: Switch to using gpiod API
Date: Mon,  3 Mar 2025 17:07:40 +0200
Message-ID: <20250303150855.1294188-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
References: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the driver to gpiod API, and removes yet another use of
of_get_named_gpio().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ieee802154/ca8210.c | 63 ++++++++++++---------------------
 1 file changed, 22 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index a036910f6082..2342f1927dc9 100644
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
+ * @reset_gpio:     GPIO of ca8210 reset line
+ * @irq_gpio:       GPIO of ca8210 interrupt line
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
 
@@ -631,10 +629,10 @@ static void ca8210_reset_send(struct spi_device *spi, unsigned int ms)
 	struct ca8210_priv *priv = spi_get_drvdata(spi);
 	long status;
 
-	gpio_set_value(pdata->gpio_reset, 0);
+	gpiod_set_value(pdata->reset_gpio, 0);
 	reinit_completion(&priv->ca8210_is_awake);
 	msleep(ms);
-	gpio_set_value(pdata->gpio_reset, 1);
+	gpiod_set_value(pdata->reset_gpio, 1);
 	priv->promiscuous = false;
 
 	/* Wait until wakeup indication seen */
@@ -2784,25 +2782,14 @@ static void ca8210_unregister_ext_clock(struct spi_device *spi)
  */
 static int ca8210_reset_init(struct spi_device *spi)
 {
-	int ret;
-	struct ca8210_platform_data *pdata = spi->dev.platform_data;
+	struct device *dev = &spi->dev;
+	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
 
-	pdata->gpio_reset = of_get_named_gpio(
-		spi->dev.of_node,
-		"reset-gpio",
-		0
-	);
+	pdata->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(pdata->reset_gpio))
+		dev_crit(dev, "Reset GPIO did not set to output mode\n");
 
-	ret = gpio_direction_output(pdata->gpio_reset, 1);
-	if (ret < 0) {
-		dev_crit(
-			&spi->dev,
-			"Reset GPIO %d did not set to output mode\n",
-			pdata->gpio_reset
-		);
-	}
-
-	return ret;
+	return PTR_ERR_OR_ZERO(pdata->reset_gpio);
 }
 
 /**
@@ -2813,23 +2800,19 @@ static int ca8210_reset_init(struct spi_device *spi)
  */
 static int ca8210_interrupt_init(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
+	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
 	int ret;
-	struct ca8210_platform_data *pdata = spi->dev.platform_data;
 
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
 
@@ -2840,10 +2823,8 @@ static int ca8210_interrupt_init(struct spi_device *spi)
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


