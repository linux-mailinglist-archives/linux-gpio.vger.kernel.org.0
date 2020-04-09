Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 381DD1A3AE5
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgDIT7G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgDIT7G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:06 -0400
IronPort-SDR: AKhuXnmcmL4J3vhf7zPka3C68p218r+ofPhkeQLPMM9fIIqcMAZ+JdW6C7QiLMC4IZm0Ls/wcl
 2fQFGk3Le6fw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:07 -0700
IronPort-SDR: W+Q0KmlcAo+MokzG3Z67qeXNbJTY7EV16ikLqX0KcazAVyjUPGA26DGgo6Hb4TVKb6PFY84NbN
 E9+YYdPSP79A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745316"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:05 -0700
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
Subject: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+ PRO
Date:   Thu,  9 Apr 2020 14:58:29 -0500
Message-Id: <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Try to detect HifiBerry 44.1 and 48kHz oscillators on codec init

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_pcm512x.c | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index dcd769b352fa..c1d2a53c1ec8 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -46,6 +46,8 @@ struct sof_card_private {
 	struct list_head hdmi_pcm_list;
 	bool idisp_codec;
 	struct gpio_desc *gpio_4;
+	struct clk *sclk;
+	bool is_dac_pro;
 };
 
 static int sof_pcm512x_quirk_cb(const struct dmi_system_id *id)
@@ -87,6 +89,59 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct device *dev = rtd->card->dev;
+	unsigned int sck;
+	int ret;
+
+	ctx->sclk = devm_clk_get(rtd->card->dev, "sclk");
+	if (IS_ERR(ctx->sclk)) {
+		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
+		goto skip_dacpro;
+	}
+
+	/*
+	 * now we have a clk, see if it's really present or if we are on
+	 * plain vanilla DAC+
+	 */
+
+	/* Try 48 kHz */
+	clk_set_rate(ctx->sclk, 24576000UL);
+	ret = clk_prepare_enable(ctx->sclk);
+	if (ret) {
+		dev_info(dev, "Failed to enable SCLK for DAC+ PRO 48 kHz: %d\n", ret);
+		goto skip_dacpro;
+	}
+
+	snd_soc_component_read(rtd->codec_dai->component,
+			       PCM512x_RATE_DET_4, &sck);
+	clk_disable_unprepare(ctx->sclk);
+	if (sck & 0x40) {
+		dev_info(dev, "No SCLK detected for DAC+ PRO 48 kHz\n");
+		goto skip_dacpro;
+	}
+
+	/* Try 44.1 kHz */
+	clk_set_rate(ctx->sclk, 22579200UL);
+	ret = clk_prepare_enable(ctx->sclk);
+	if (ret) {
+		dev_info(dev, "Failed to enable SCLK for DAC+ PRO 44.1 kHz: %d\n", ret);
+		goto skip_dacpro;
+	}
+
+	snd_soc_component_read(rtd->codec_dai->component,
+			       PCM512x_RATE_DET_4, &sck);
+	clk_disable_unprepare(ctx->sclk);
+
+	if (sck & 0x40) {
+		dev_info(dev, "No SCLK detected for DAC+ PRO 44.1 kHz\n");
+		goto skip_dacpro;
+	}
+
+	dev_info(dev, "DAC+ PRO detected\n");
+	ctx->is_dac_pro = true;
+
+skip_dacpro:
 	return 0;
 }
 
-- 
2.20.1

