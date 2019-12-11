Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 154F111A181
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 03:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbfLKClA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 21:41:00 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:7700 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727254AbfLKCk7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 21:40:59 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Xh4m14qHzW9;
        Wed, 11 Dec 2019 03:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576032056; bh=ax8k3kdpX2PJMhw57PNrJBf75thucfVxSMfYkKFcdZ0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GmUFAfGTUaWBBb1cuoDRvtSup7FsnUnIj5EHQpIfEjHQHl/Y7ur5XUZijWR4PLpz9
         8yvPn0B3xvSM+dhyCZ9BxUansATMwX4i8FZgIAQHkupR9dDl5fFrGTgXGxohwk5MZg
         WpIgKYya1mbi+/4nKdTR9CYaZMPXoCTi50YGsdVZOYmYEc2XlfSk+n0ToAe9NZYWI7
         CxnA6jsLPBxQ05r2Csgty+WgHoNrkMzCS9f4SX3lPkkGBOxkdkqicmR5TwHHPi76fe
         XNUvZo4bd3FE9e0/dE1e6FLYNUZYp/aQxF1G3F2C1xUxJmrPhdj4y3bbUHNPK57jW+
         BxQWfZ6VV7FCg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 03:40:55 +0100
Message-Id: <a60f563f11bbff821da2fa2949ca82922b144860.1576031637.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1576031636.git.mirq-linux@rere.qmqm.pl>
References: <cover.1576031636.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 2/4] mmc: rework wp-gpio handling
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-mmc@vger.kernel.org
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use MMC_CAP2_RO_ACTIVE_HIGH flag as indicator if GPIO line is to be
inverted compared to DT/platform-specified polarity. The flag is not
used after init in GPIO mode anyway. No functional changes intended.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
  v2: moved argument removal in sdhci-esdhc-imx to the right patch
---
 drivers/gpio/gpiolib-of.c          |  4 ----
 drivers/mmc/core/host.c            | 11 ++++-------
 drivers/mmc/core/slot-gpio.c       |  3 +++
 drivers/mmc/host/pxamci.c          |  8 ++++----
 drivers/mmc/host/sdhci-esdhc-imx.c |  3 ++-
 5 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index dc27b1a88e93..b0b77e52e261 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -120,10 +120,6 @@ static void of_gpio_flags_quirks(struct device_node *np,
 			if (of_property_read_bool(np, "cd-inverted"))
 				*flags ^= OF_GPIO_ACTIVE_LOW;
 		}
-		if (!strcmp(propname, "wp-gpios")) {
-			if (of_property_read_bool(np, "wp-inverted"))
-				*flags ^= OF_GPIO_ACTIVE_LOW;
-		}
 	}
 	/*
 	 * Some GPIO fixed regulator quirks.
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 105b7a7c0251..b3484def0a8b 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -176,7 +176,6 @@ int mmc_of_parse(struct mmc_host *host)
 	u32 bus_width, drv_type, cd_debounce_delay_ms;
 	int ret;
 	bool cd_cap_invert, cd_gpio_invert = false;
-	bool ro_cap_invert, ro_gpio_invert = false;
 
 	if (!dev || !dev_fwnode(dev))
 		return 0;
@@ -255,9 +254,11 @@ int mmc_of_parse(struct mmc_host *host)
 	}
 
 	/* Parse Write Protection */
-	ro_cap_invert = device_property_read_bool(dev, "wp-inverted");
 
-	ret = mmc_gpiod_request_ro(host, "wp", 0, 0, &ro_gpio_invert);
+	if (device_property_read_bool(dev, "wp-inverted"))
+		host->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
+
+	ret = mmc_gpiod_request_ro(host, "wp", 0, 0, NULL);
 	if (!ret)
 		dev_info(host->parent, "Got WP GPIO\n");
 	else if (ret != -ENOENT && ret != -ENOSYS)
@@ -266,10 +267,6 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "disable-wp"))
 		host->caps2 |= MMC_CAP2_NO_WRITE_PROTECT;
 
-	/* See the comment on CD inversion above */
-	if (ro_cap_invert ^ ro_gpio_invert)
-		host->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
-
 	if (device_property_read_bool(dev, "cap-sd-highspeed"))
 		host->caps |= MMC_CAP_SD_HIGHSPEED;
 	if (device_property_read_bool(dev, "cap-mmc-highspeed"))
diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index da2596c5fa28..582ec3d720f6 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -241,6 +241,9 @@ int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 			return ret;
 	}
 
+	if (host->caps2 & MMC_CAP2_RO_ACTIVE_HIGH)
+		gpiod_toggle_active_low(desc);
+
 	if (gpio_invert)
 		*gpio_invert = !gpiod_is_active_low(desc);
 
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 024acc1b0a2e..b2bbcb09a49e 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -740,16 +740,16 @@ static int pxamci_probe(struct platform_device *pdev)
 			goto out;
 		}
 
+		if (!host->pdata->gpio_card_ro_invert)
+			mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
+
 		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0, NULL);
 		if (ret && ret != -ENOENT) {
 			dev_err(dev, "Failed requesting gpio_ro\n");
 			goto out;
 		}
-		if (!ret) {
+		if (!ret)
 			host->use_ro_gpio = true;
-			mmc->caps2 |= host->pdata->gpio_card_ro_invert ?
-				0 : MMC_CAP2_RO_ACTIVE_HIGH;
-		}
 
 		if (host->pdata->init)
 			host->pdata->init(dev, pxamci_detect_irq, mmc);
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 1c988d6a2433..dccb4df46512 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1381,13 +1381,14 @@ static int sdhci_esdhc_imx_probe_nondt(struct platform_device *pdev,
 				host->mmc->parent->platform_data);
 	/* write_protect */
 	if (boarddata->wp_type == ESDHC_WP_GPIO) {
+		host->mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
+
 		err = mmc_gpiod_request_ro(host->mmc, "wp", 0, 0, NULL);
 		if (err) {
 			dev_err(mmc_dev(host->mmc),
 				"failed to request write-protect gpio!\n");
 			return err;
 		}
-		host->mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
 	}
 
 	/* card_detect */
-- 
2.20.1

