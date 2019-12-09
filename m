Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A556E11780A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 22:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfLIVJk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 16:09:40 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:1047 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbfLIVJj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 16:09:39 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Wwjz6PsDzLy;
        Mon,  9 Dec 2019 22:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575925623; bh=/Q8V7b4XtlcY8lKdF87f/JxToMPNmVy8zIttRxB4xw0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ZMEWpsrlv65Z/N0OHs39QwlikU3uXO2wymuYx07y56Ffu5bxRcF4bsXoG49E+yZU9
         Xa363iySJjZMcq7ndYpwarjoddox0ohpOOH9O/2n8sHp223XkSibMZ+0+bwsuLMmF0
         b1eVgKrBCyDJ8rrQW0bkXUDQxinjcgonSsQD4oI9GWRhpKriCjkTmpV8UCZ2/43MJp
         9wOS8ZO0YxVJAFi8ZhEjr9micrwXE9EW0Gw7lAG3EEGRkq/hO/AFTKjpIIbWvJLjC2
         r2djh4ocbVGf10Ng8TuPLTmhYWNr3qLbLw4A5YG4Yp//aAldChTbwnI+t2N1YkIzE0
         /X+ddb/xxjlfQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 09 Dec 2019 22:09:36 +0100
Message-Id: <ec36b8af793239ad744ecabdb0828f931d2c95c8.1575925023.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1575925023.git.mirq-linux@rere.qmqm.pl>
References: <cover.1575925023.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/4] mmc: rework wp-gpio handling
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use MMC_CAP2_RO_ACTIVE_HIGH flag as indicator if GPIO line is to be
inverted compared to DT/platform-specified polarity. The flag is not
used after init in GPIO mode anyway. No functional changes intended.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/gpio/gpiolib-of.c          |  4 ----
 drivers/mmc/core/host.c            | 11 ++++-------
 drivers/mmc/core/slot-gpio.c       |  3 +++
 drivers/mmc/host/pxamci.c          |  8 ++++----
 drivers/mmc/host/sdhci-esdhc-imx.c | 13 +++++++------
 5 files changed, 18 insertions(+), 21 deletions(-)

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
index 1c988d6a2433..f1b21d87ecea 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1381,13 +1381,14 @@ static int sdhci_esdhc_imx_probe_nondt(struct platform_device *pdev,
 				host->mmc->parent->platform_data);
 	/* write_protect */
 	if (boarddata->wp_type == ESDHC_WP_GPIO) {
-		err = mmc_gpiod_request_ro(host->mmc, "wp", 0, 0, NULL);
-		if (err) {
-			dev_err(mmc_dev(host->mmc),
-				"failed to request write-protect gpio!\n");
-			return err;
-		}
 		host->mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
+
+		err = mmc_gpiod_request_ro(host->mmc, "wp", 0, 0);
+		if (err) {
+			dev_err(mmc_dev(host->mmc),
+				"failed to request write-protect gpio!\n");
+			return err;
+		}
 	}
 
 	/* card_detect */
-- 
2.20.1

