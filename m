Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80682117804
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 22:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfLIVJl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 16:09:41 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:51263 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbfLIVJl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 16:09:41 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Wwk10lwmzTs;
        Mon,  9 Dec 2019 22:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575925625; bh=X54m/zz/rvcQU0ac/xLDyjKb78jJuPUl37OADFsQW3s=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=sNywq38EEn7P4soal5BZRtW5nKAslIwjYOhS3ZJaT9D9aH5JEk7dqv4WAy26VcRrV
         r4GxTeLYdMUc4APEolffEIEoIvZlIRFhWx+TpgEM6KuZ/xGzuzOXgBfs0xcj2uHs7w
         MjA8Qutj6mMzUEUhr9vhjqS0EJeS14D9ZxREb1zTSmpKNG1RWHQPX6eP2hIACh/xaJ
         EgjMGQFz6prpVzjKA/mA6nNOq68cZo5yNokNqw+IlD6vLMdtWmr2ADT5oFgi8AQSoN
         wlo9XS4ielIfEKmZZZS8pQJyfsw/3gaBCXsUaD9BxE9DYiXqc6Gm6ZdtevkJVbcw1/
         YjgA6XRSZkohQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 09 Dec 2019 22:09:37 +0100
Message-Id: <a88bf1b7498ad877ba8d1ac7661bc467f2414b1d.1575925023.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1575925023.git.mirq-linux@rere.qmqm.pl>
References: <cover.1575925023.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 4/4] mmc: remove mmc_gpiod_request_*(invert_gpio)
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

Now, that invert_gpio arguments are unused, remove them.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/mmc/core/host.c            |  5 ++---
 drivers/mmc/core/slot-gpio.c       | 14 ++------------
 drivers/mmc/host/davinci_mmc.c     |  4 ++--
 drivers/mmc/host/mmc_spi.c         |  4 ++--
 drivers/mmc/host/mmci.c            |  4 ++--
 drivers/mmc/host/pxamci.c          |  4 ++--
 drivers/mmc/host/s3cmci.c          |  4 ++--
 drivers/mmc/host/sdhci-acpi.c      |  2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c |  2 +-
 drivers/mmc/host/sdhci-pci-core.c  |  4 ++--
 drivers/mmc/host/sdhci-sirf.c      |  2 +-
 drivers/mmc/host/sdhci-spear.c     |  2 +-
 drivers/mmc/host/tmio_mmc_core.c   |  2 +-
 include/linux/mmc/slot-gpio.h      |  5 ++---
 14 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index e655dc1b5b85..c8768726d925 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -232,8 +232,7 @@ int mmc_of_parse(struct mmc_host *host)
 			host->caps |= MMC_CAP_NEEDS_POLL;
 
 		ret = mmc_gpiod_request_cd(host, "cd", 0, false,
-					   cd_debounce_delay_ms * 1000,
-					   NULL);
+					   cd_debounce_delay_ms * 1000);
 		if (!ret)
 			dev_info(host->parent, "Got CD GPIO\n");
 		else if (ret != -ENOENT && ret != -ENOSYS)
@@ -245,7 +244,7 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "wp-inverted"))
 		host->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
 
-	ret = mmc_gpiod_request_ro(host, "wp", 0, 0, NULL);
+	ret = mmc_gpiod_request_ro(host, "wp", 0, 0);
 	if (!ret)
 		dev_info(host->parent, "Got WP GPIO\n");
 	else if (ret != -ENOENT && ret != -ENOSYS)
diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index 303e825ecfd8..d66225c1feaf 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -160,8 +160,6 @@ EXPORT_SYMBOL(mmc_gpio_set_cd_isr);
  * @idx: index of the GPIO to obtain in the consumer
  * @override_active_level: ignore %GPIO_ACTIVE_LOW flag
  * @debounce: debounce time in microseconds
- * @gpio_invert: will return whether the GPIO line is inverted or not, set
- * to NULL to ignore
  *
  * Note that this must be called prior to mmc_add_host()
  * otherwise the caller must also call mmc_gpiod_request_cd_irq().
@@ -170,7 +168,7 @@ EXPORT_SYMBOL(mmc_gpio_set_cd_isr);
  */
 int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, bool override_active_level,
-			 unsigned int debounce, bool *gpio_invert)
+			 unsigned int debounce)
 {
 	struct mmc_gpio *ctx = host->slot.handler_priv;
 	struct gpio_desc *desc;
@@ -194,9 +192,6 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 	if (host->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
 		gpiod_toggle_active_low(desc);
 
-	if (gpio_invert)
-		*gpio_invert = !gpiod_is_active_low(desc);
-
 	ctx->cd_gpio = desc;
 
 	return 0;
@@ -217,14 +212,12 @@ EXPORT_SYMBOL(mmc_can_gpio_cd);
  * @con_id: function within the GPIO consumer
  * @idx: index of the GPIO to obtain in the consumer
  * @debounce: debounce time in microseconds
- * @gpio_invert: will return whether the GPIO line is inverted or not,
- * set to NULL to ignore
  *
  * Returns zero on success, else an error.
  */
 int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 			 unsigned int idx,
-			 unsigned int debounce, bool *gpio_invert)
+			 unsigned int debounce)
 {
 	struct mmc_gpio *ctx = host->slot.handler_priv;
 	struct gpio_desc *desc;
@@ -243,9 +236,6 @@ int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 	if (host->caps2 & MMC_CAP2_RO_ACTIVE_HIGH)
 		gpiod_toggle_active_low(desc);
 
-	if (gpio_invert)
-		*gpio_invert = !gpiod_is_active_low(desc);
-
 	ctx->ro_gpio = desc;
 
 	return 0;
diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index ebfaeb33bc8c..f01fecd75833 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1174,13 +1174,13 @@ static int mmc_davinci_parse_pdata(struct mmc_host *mmc)
 		mmc->caps |= pdata->caps;
 
 	/* Register a cd gpio, if there is not one, enable polling */
-	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL);
+	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
 	if (ret == -EPROBE_DEFER)
 		return ret;
 	else if (ret)
 		mmc->caps |= MMC_CAP_NEEDS_POLL;
 
-	ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0, NULL);
+	ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0);
 	if (ret == -EPROBE_DEFER)
 		return ret;
 
diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
index 74c6cfbf9172..76a67a292b16 100644
--- a/drivers/mmc/host/mmc_spi.c
+++ b/drivers/mmc/host/mmc_spi.c
@@ -1421,7 +1421,7 @@ static int mmc_spi_probe(struct spi_device *spi)
 	 * Index 0 is card detect
 	 * Old boardfiles were specifying 1 ms as debounce
 	 */
-	status = mmc_gpiod_request_cd(mmc, NULL, 0, false, 1000, NULL);
+	status = mmc_gpiod_request_cd(mmc, NULL, 0, false, 1000);
 	if (status == -EPROBE_DEFER)
 		goto fail_add_host;
 	if (!status) {
@@ -1436,7 +1436,7 @@ static int mmc_spi_probe(struct spi_device *spi)
 	mmc_detect_change(mmc, 0);
 
 	/* Index 1 is write protect/read only */
-	status = mmc_gpiod_request_ro(mmc, NULL, 1, 0, NULL);
+	status = mmc_gpiod_request_ro(mmc, NULL, 1, 0);
 	if (status == -EPROBE_DEFER)
 		goto fail_add_host;
 	if (!status)
diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 40e72c30ea84..7c5c24f9f8fe 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -2062,11 +2062,11 @@ static int mmci_probe(struct amba_device *dev,
 	 * silently of these do not exist
 	 */
 	if (!np) {
-		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL);
+		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
 		if (ret == -EPROBE_DEFER)
 			goto clk_disable;
 
-		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0, NULL);
+		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0);
 		if (ret == -EPROBE_DEFER)
 			goto clk_disable;
 	}
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index b2bbcb09a49e..d38982abd26d 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -734,7 +734,7 @@ static int pxamci_probe(struct platform_device *pdev)
 		}
 
 		/* FIXME: should we pass detection delay to debounce? */
-		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL);
+		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
 		if (ret && ret != -ENOENT) {
 			dev_err(dev, "Failed requesting gpio_cd\n");
 			goto out;
@@ -743,7 +743,7 @@ static int pxamci_probe(struct platform_device *pdev)
 		if (!host->pdata->gpio_card_ro_invert)
 			mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
 
-		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0, NULL);
+		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0);
 		if (ret && ret != -ENOENT) {
 			dev_err(dev, "Failed requesting gpio_ro\n");
 			goto out;
diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
index bce9c33bc4b5..1e616ae56b13 100644
--- a/drivers/mmc/host/s3cmci.c
+++ b/drivers/mmc/host/s3cmci.c
@@ -1505,14 +1505,14 @@ static int s3cmci_probe_pdata(struct s3cmci_host *host)
 		mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
 
 	/* If we get -ENOENT we have no card detect GPIO line */
-	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL);
+	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
 	if (ret != -ENOENT) {
 		dev_err(&pdev->dev, "error requesting GPIO for CD %d\n",
 			ret);
 		return ret;
 	}
 
-	ret = mmc_gpiod_request_ro(host->mmc, "wp", 0, 0, NULL);
+	ret = mmc_gpiod_request_ro(host->mmc, "wp", 0, 0);
 	if (ret != -ENOENT) {
 		dev_err(&pdev->dev, "error requesting GPIO for WP %d\n",
 			ret);
diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index 105e73d4a3b9..dd908577a9dc 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -752,7 +752,7 @@ static int sdhci_acpi_probe(struct platform_device *pdev)
 	if (sdhci_acpi_flag(c, SDHCI_ACPI_SD_CD)) {
 		bool v = sdhci_acpi_flag(c, SDHCI_ACPI_SD_CD_OVERRIDE_LEVEL);
 
-		err = mmc_gpiod_request_cd(host->mmc, NULL, 0, v, 0, NULL);
+		err = mmc_gpiod_request_cd(host->mmc, NULL, 0, v, 0);
 		if (err) {
 			if (err == -EPROBE_DEFER)
 				goto err_free;
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index f1b21d87ecea..e9d408870f4f 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1394,7 +1394,7 @@ static int sdhci_esdhc_imx_probe_nondt(struct platform_device *pdev,
 	/* card_detect */
 	switch (boarddata->cd_type) {
 	case ESDHC_CD_GPIO:
-		err = mmc_gpiod_request_cd(host->mmc, "cd", 0, false, 0, NULL);
+		err = mmc_gpiod_request_cd(host->mmc, "cd", 0, false, 0);
 		if (err) {
 			dev_err(mmc_dev(host->mmc),
 				"failed to request card-detect gpio!\n");
diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
index acefb76b4e15..53496111883d 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -1983,12 +1983,12 @@ static struct sdhci_pci_slot *sdhci_pci_probe_slot(
 
 	if (slot->cd_idx >= 0) {
 		ret = mmc_gpiod_request_cd(host->mmc, "cd", slot->cd_idx,
-					   slot->cd_override_level, 0, NULL);
+					   slot->cd_override_level, 0);
 		if (ret && ret != -EPROBE_DEFER)
 			ret = mmc_gpiod_request_cd(host->mmc, NULL,
 						   slot->cd_idx,
 						   slot->cd_override_level,
-						   0, NULL);
+						   0);
 		if (ret == -EPROBE_DEFER)
 			goto remove;
 
diff --git a/drivers/mmc/host/sdhci-sirf.c b/drivers/mmc/host/sdhci-sirf.c
index e43143223320..f4b05dd6c20a 100644
--- a/drivers/mmc/host/sdhci-sirf.c
+++ b/drivers/mmc/host/sdhci-sirf.c
@@ -194,7 +194,7 @@ static int sdhci_sirf_probe(struct platform_device *pdev)
 	 * We must request the IRQ after sdhci_add_host(), as the tasklet only
 	 * gets setup in sdhci_add_host() and we oops.
 	 */
-	ret = mmc_gpiod_request_cd(host->mmc, "cd", 0, false, 0, NULL);
+	ret = mmc_gpiod_request_cd(host->mmc, "cd", 0, false, 0);
 	if (ret == -EPROBE_DEFER)
 		goto err_request_cd;
 	if (!ret)
diff --git a/drivers/mmc/host/sdhci-spear.c b/drivers/mmc/host/sdhci-spear.c
index 916b5b09c3d1..141dd3847411 100644
--- a/drivers/mmc/host/sdhci-spear.c
+++ b/drivers/mmc/host/sdhci-spear.c
@@ -98,7 +98,7 @@ static int sdhci_probe(struct platform_device *pdev)
 	 * It is optional to use GPIOs for sdhci card detection. If we
 	 * find a descriptor using slot GPIO, we use it.
 	 */
-	ret = mmc_gpiod_request_cd(host->mmc, "cd", 0, false, 0, NULL);
+	ret = mmc_gpiod_request_cd(host->mmc, "cd", 0, false, 0);
 	if (ret == -EPROBE_DEFER)
 		goto disable_clk;
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index c4a1d49fbea4..d68bc4e3891d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1181,7 +1181,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	 * Look for a card detect GPIO, if it fails with anything
 	 * else than a probe deferral, just live without it.
 	 */
-	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0, NULL);
+	ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
 	if (ret == -EPROBE_DEFER)
 		return ret;
 
diff --git a/include/linux/mmc/slot-gpio.h b/include/linux/mmc/slot-gpio.h
index 0de3d7c016cd..4ae2f2908f99 100644
--- a/include/linux/mmc/slot-gpio.h
+++ b/include/linux/mmc/slot-gpio.h
@@ -17,10 +17,9 @@ int mmc_gpio_get_ro(struct mmc_host *host);
 int mmc_gpio_get_cd(struct mmc_host *host);
 int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, bool override_active_level,
-			 unsigned int debounce, bool *gpio_invert);
+			 unsigned int debounce);
 int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
-			 unsigned int idx,
-			 unsigned int debounce, bool *gpio_invert);
+			 unsigned int idx, unsigned int debounce);
 void mmc_gpio_set_cd_isr(struct mmc_host *host,
 			 irqreturn_t (*isr)(int irq, void *dev_id));
 int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on);
-- 
2.20.1

