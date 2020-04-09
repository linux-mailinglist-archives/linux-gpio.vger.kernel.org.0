Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B881A3AE3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgDIT7E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:04 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgDIT7E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:04 -0400
IronPort-SDR: UxARs1L3N/kUKuJJpkmhp6kZh7pdwbFlSczJPpamgzmcl51WWYIDPTSZJb0dhIeMs43EpkCKSU
 3bNtYNItyRQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:05 -0700
IronPort-SDR: Xm4qqKX+D50Bu8qrr8/HRy9uXDhGIjH2KH56eGzv88z6EOX7KEXPqJSN6ShC5Eqj8Pmv/EKVGC
 nCNOLyANLT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745310"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:03 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 03/16] ASoC: Intel: sof-pcm512x: use gpiod for LED
Date:   Thu,  9 Apr 2020 14:58:28 -0500
Message-Id: <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove direct regmap access, use gpios exposed by PCM512x codec
Keep the codec_init function, this will be used in following patches

The gpios handling is done with an explicit lookup table. We cannot
use ACPI-based mappings since we don't have an ACPI device for the
machine driver, and the gpiochip is created during the probe of the
PCM512x driver.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_pcm512x.c | 45 ++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index fb7811899999..dcd769b352fa 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -10,6 +10,8 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/module.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 #include <sound/core.h>
@@ -43,6 +45,7 @@ struct sof_hdmi_pcm {
 struct sof_card_private {
 	struct list_head hdmi_pcm_list;
 	bool idisp_codec;
+	struct gpio_desc *gpio_4;
 };
 
 static int sof_pcm512x_quirk_cb(const struct dmi_system_id *id)
@@ -84,23 +87,16 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
-
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_EN, 0x08, 0x08);
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_OUTPUT_4, 0x0f, 0x02);
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
-				      0x08, 0x08);
-
 	return 0;
 }
 
 static int aif1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
-				      0x08, 0x08);
+	/* Turn LED on */
+	gpiod_set_value(ctx->gpio_4, 1);
 
 	return 0;
 }
@@ -108,10 +104,10 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 static void aif1_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
-				      0x08, 0x00);
+	/* Turn LED off */
+	gpiod_set_value(ctx->gpio_4, 0);
 }
 
 static const struct snd_soc_ops sof_pcm512x_ops = {
@@ -354,6 +350,14 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	return NULL;
 }
 
+static struct gpiod_lookup_table pcm512x_gpios_table = {
+	/* .dev_id set during probe */
+	.table = {
+		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
@@ -413,6 +417,21 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(&sof_audio_card_pcm512x, ctx);
 
+	/*
+	 * Enable GPIO4 for LED
+	 */
+	pcm512x_gpios_table.dev_id = dev_name(&pdev->dev);
+	gpiod_add_lookup_table(&pcm512x_gpios_table);
+
+	ctx->gpio_4 = devm_gpiod_get(&pdev->dev, "PCM512x-GPIO4",
+				     GPIOD_OUT_LOW);
+
+	if (IS_ERR(ctx->gpio_4)) {
+		dev_err(&pdev->dev, "gpio4 not found\n");
+		ret = PTR_ERR(ctx->gpio_4);
+		return ret;
+	}
+
 	return devm_snd_soc_register_card(&pdev->dev,
 					  &sof_audio_card_pcm512x);
 }
-- 
2.20.1

