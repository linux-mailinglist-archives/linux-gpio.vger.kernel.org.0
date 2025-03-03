Return-Path: <linux-gpio+bounces-16968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F7A4C925
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 18:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55E3A3B64C7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 17:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06D92561D5;
	Mon,  3 Mar 2025 16:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAGyMiWx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E2253F38;
	Mon,  3 Mar 2025 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020578; cv=none; b=tNBN08suWEMg8msEJKWw1LtC8y6lOCUbx6I9gpbBVkm+u/AjHOnD1R3uQFyuBcv791dzZ4ejOyeAcZw+79J0WRf6TXWDUY4UIs+FdjWiieKW/lvFZ9lLjPhw2W2xNxhlPHRZ0bHdWCVUhfnG/CR1UMGt0aC0WbH8Z0zIrrxnKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020578; c=relaxed/simple;
	bh=QxMI96pUH6DNsqjiw2kEM8KCz4+ZICG+5dYAmxd/380=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fb+tl1eehUd4iKx+dxd0Mr/vAEDPhgc44aHoU2jP0/6FWo7oBRHcZPnWDH4cFpG+vZg0yZh17qjyvmLRYa+rjc30myyyFpiWZGytnIGzHS12I+BH8Tp8NF1Ql6h3VTBNZZBc/lOzxQsh91CA/7NhjafG3rSFsY4SqUgRN+qGPL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAGyMiWx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741020577; x=1772556577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QxMI96pUH6DNsqjiw2kEM8KCz4+ZICG+5dYAmxd/380=;
  b=eAGyMiWxRk2fuRd1dnfGlkrvFlvQ/lDPiEq4LAfeya4QrVKH9Zh4sDS5
   bUsKpf3vSQkeyq568F1DREl3F8Gj7pb5Nf3aARgX3nkt6Z1PeKWHQRK4P
   J4pCRUyLFScd9zE9aUgePowiDLv4Cp6FZjkqN6LhOy0H9RIwxOtbChfZb
   FB6J6iGvzSTZaok0ZKVgWJlCVtDEUDU9n/COz2kG6hlY+V2bJb3Q5EKHk
   cPJRcDdd6i3BLlgkie5EteXYE3dEtbYEqtCLwxj8Iy/X5DGTXvnJ5p+46
   M1yTpqkahQRwycxu9MAoDll3qTUY8vHGSnXTn4C3PWVV+HVgBKyJ4nrZS
   g==;
X-CSE-ConnectionGUID: CpEFYVGGQoG0Xslk7rnq1Q==
X-CSE-MsgGUID: Vh/r83EmQhmIOlb9oePvPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41761409"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41761409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:49:34 -0800
X-CSE-ConnectionGUID: kYMzaWX1S2++c4ZMe1Brmw==
X-CSE-MsgGUID: /PwV6x5QQmCoUuLOgySURw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="123212198"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2025 08:49:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BC5BE1FF; Mon, 03 Mar 2025 18:49:29 +0200 (EET)
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
Subject: [PATCH net-next v2 3/3] ieee802154: ca8210: Switch to using gpiod API
Date: Mon,  3 Mar 2025 18:49:10 +0200
Message-ID: <20250303164928.1466246-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
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
 drivers/net/ieee802154/ca8210.c | 57 +++++++++++----------------------
 1 file changed, 19 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 65f042c8734b..d4c1f00d29fe 100644
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
+	gpiod_set_value(pdata->reset_gpio, 0);
 	reinit_completion(&priv->ca8210_is_awake);
 	msleep(ms);
-	gpio_set_value(pdata->gpio_reset, 1);
+	gpiod_set_value(pdata->reset_gpio, 1);
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
+	pdata->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
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


