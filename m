Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487001A3AE8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgDIT7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:09 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgDIT7J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:09 -0400
IronPort-SDR: Tnu5KPV6w64ExiT/TVdIFtbTw7lOZt3R54Fy/4OpZBiwKenCxQorQzpAXqv6KRnMxG6gU8aXhs
 hPwYAXWAK+lQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:09 -0700
IronPort-SDR: 6jL3jkk0QBWptiRUVfPumFqS71jtUzgGaS44vAnp+tf98qIV5Y02n6vQUnku29ZiAHleaErZhG
 JdUu3IZ6uy4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745317"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:07 -0700
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
Subject: [RFC PATCH 05/16] ASoC: Intel: sof-pcm512x: reconfigure sclk in hw_params if needed
Date:   Thu,  9 Apr 2020 14:58:30 -0500
Message-Id: <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SCLK is resumed by the codec driver. In case the rate specified in
hw_params does not match the current configuration, disable, set the
new rate and restart the clock.

There is no operation on hw_free, the codec suspend routine will
disable/deprepare the clock.

Note that we don't change the DAI configuration when the DAC+ PRO is
detected. All changes for the codec master mode are handled in the
topology file (DAI configuration change and scheduling change)

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_pcm512x.c | 94 ++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index c1d2a53c1ec8..b5153ce954c7 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -145,6 +145,31 @@ static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int aif1_update_rate_den(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_ratnum rats_no_pll;
+	unsigned int num = 0, den = 0;
+	int err;
+
+	rats_no_pll.num = clk_get_rate(ctx->sclk) / 64;
+	rats_no_pll.den_min = 1;
+	rats_no_pll.den_max = 128;
+	rats_no_pll.den_step = 1;
+
+	err = snd_interval_ratnum(hw_param_interval(params,
+						    SNDRV_PCM_HW_PARAM_RATE),
+				  1, &rats_no_pll, &num, &den);
+	if (err >= 0 && den) {
+		params->rate_num = num;
+		params->rate_den = den;
+	}
+
+	return 0;
+}
+
 static int aif1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -156,6 +181,74 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int aif1_hw_params(struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct device *dev = rtd->card->dev;
+	int current_rate;
+	int sclk_rate;
+	int channels;
+	int width;
+	int rate;
+	int ret = 0;
+
+	if (ctx->is_dac_pro) {
+		rate = params_rate(params);
+		channels = params_channels(params);
+		width = snd_pcm_format_physical_width(params_format(params));
+
+		if (rate % 24000)
+			sclk_rate = 22579200;
+		else
+			sclk_rate = 24576000;
+
+		current_rate = clk_get_rate(ctx->sclk);
+		if (current_rate != sclk_rate) {
+			/*
+			 * The sclk clock is started and stopped by the codec
+			 * resume/suspend functions. If the rate isn't correct,
+			 * stop, set the new rate and restart the clock
+			 */
+
+			dev_dbg(dev, "reconfiguring SCLK to rate %d\n",
+				sclk_rate);
+
+			clk_disable_unprepare(ctx->sclk);
+
+			ret = clk_set_rate(ctx->sclk, sclk_rate);
+			if (ret) {
+				dev_err(dev, "Could not set SCLK rate %d\n",
+					sclk_rate);
+				return ret;
+			}
+
+			ret = clk_prepare_enable(ctx->sclk);
+			if (ret) {
+				dev_err(dev, "Failed to enable SCLK: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		ret = aif1_update_rate_den(substream, params);
+		if (ret) {
+			dev_err(dev, "Failed to update rate denominator: %d\n", ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_bclk_ratio(rtd->codec_dai,
+						 channels * width);
+		if (ret) {
+			dev_err(dev, "Failed to set bclk ratio : %d\n", ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
 static void aif1_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -167,6 +260,7 @@ static void aif1_shutdown(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sof_pcm512x_ops = {
 	.startup = aif1_startup,
+	.hw_params = aif1_hw_params,
 	.shutdown = aif1_shutdown,
 };
 
-- 
2.20.1

