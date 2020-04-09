Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFFB1A3AE1
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgDIT7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:02 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgDIT7C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:02 -0400
IronPort-SDR: c5XAKoTcxFTYISEnVkhAiD8dZgjsWtAw4xZtpyyPWNPtn40kgiMrJvazfLW7X1UkCDYMaH/aLw
 fR0OBdSn1Vsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:03 -0700
IronPort-SDR: 8K+mXrYK+GvQ/LMwBFGYlin/OhB/dVt/tdyXM/fxSWBSnq/Iwf5qKATIxeFzDNpBM/XXA3O31D
 78K+hfWiC/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745301"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:01 -0700
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
Subject: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve clock
Date:   Thu,  9 Apr 2020 14:58:27 -0500
Message-Id: <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Using devm_clk_get() with a NULL string fails on ACPI platforms, use
the "sclk" string as a fallback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/pcm512x.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 4f895a588c31..1df291b84925 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1603,6 +1603,7 @@ static const struct gpio_chip template_chip = {
 
 int pcm512x_probe(struct device *dev, struct regmap *regmap)
 {
+	const char * const clk_name[] = {NULL, "sclk"};
 	struct pcm512x_priv *pcm512x;
 	int i, ret;
 
@@ -1671,17 +1672,28 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 		goto err;
 	}
 
-	pcm512x->sclk = devm_clk_get(dev, NULL);
-	if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
-		goto err;
-	}
-	if (!IS_ERR(pcm512x->sclk)) {
-		ret = clk_prepare_enable(pcm512x->sclk);
-		if (ret != 0) {
-			dev_err(dev, "Failed to enable SCLK: %d\n", ret);
+	for (i = 0; i < ARRAY_SIZE(clk_name); i++) {
+		pcm512x->sclk = devm_clk_get(dev, clk_name[i]);
+		if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
 			goto err;
 		}
+		if (!IS_ERR(pcm512x->sclk)) {
+			dev_dbg(dev, "SCLK detected by devm_clk_get\n");
+			ret = clk_prepare_enable(pcm512x->sclk);
+			if (ret != 0) {
+				dev_err(dev, "Failed to enable SCLK: %d\n",
+					ret);
+				goto err;
+			}
+			break;
+		}
+
+		if (!clk_name[i])
+			dev_dbg(dev, "no SCLK detected with NULL string\n");
+		else
+			dev_dbg(dev, "no SCLK detected for %s string\n",
+				clk_name[i]);
 	}
 
 	/* Default to standby mode */
-- 
2.20.1

