Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888121A3AF8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDIT7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726997AbgDIT7Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:25 -0400
IronPort-SDR: 8Yle3AJwxJTXXYbfl2DsVgsFG5D5RgRw+LXPvHv++Rz6yaM4FpKHhIopybwSQZpds1PeU3Qyqb
 AZyEucJNzt0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:25 -0700
IronPort-SDR: dHP/bYIuIXTrVPUaQy+yzFaahuuDr9UKCMFuLiMQJKE4xPbdL5qLhqrC5rosaIRiHayHfiw6Jd
 nFqdBJVE8Adw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745396"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:23 -0700
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
Subject: [RFC PATCH 13/16] clk: hifiberry-dacpro: add "sclk" lookup
Date:   Thu,  9 Apr 2020 14:58:38 -0500
Message-Id: <20200409195841.18901-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_clk_get() fails on ACPI platforms when a NULL string is used.
Create a "sclk" lookup to make sure codec and machine drivers can get
the clock.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index d01a90fed51b..36210f52c624 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -24,10 +24,12 @@
  * struct clk_hifiberry_hw - Common struct to the HiFiBerry DAC Pro
  * @hw: clk_hw for the common clk framework
  * @mode: 0 => CLK44EN, 1 => CLK48EN
+ * @sclk_lookup: handle for "sclk"
  */
 struct clk_hifiberry_hw {
 	struct clk_hw hw;
 	u8 mode;
+	struct clk_lookup *sclk_lookup;
 };
 
 #define to_hifiberry_clk(_hw) container_of(_hw, struct clk_hifiberry_hw, hw)
@@ -121,15 +123,34 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 	ret = devm_clk_hw_register_clkdev(dev, &proclk->hw,
 					  init.name, NULL);
 #endif
+	if (ret) {
+		dev_err(dev, "Fail to add clock driver\n");
+		return ret;
+	}
+
+	proclk->sclk_lookup = clkdev_hw_create(&proclk->hw, "sclk", NULL);
+	if (!proclk->sclk_lookup) {
+#ifndef CONFIG_ACPI
+		of_clk_del_provider(dev->of_node);
+#endif
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, proclk);
 
 	return ret;
 }
 
 static int clk_hifiberry_dacpro_remove(struct platform_device *pdev)
 {
+	struct clk_hifiberry_hw *proclk = platform_get_drvdata(pdev);
+
+	clkdev_drop(proclk->sclk_lookup);
+
 #ifndef CONFIG_ACPI
 	of_clk_del_provider(pdev->dev.of_node);
 #endif
+
 	return 0;
 }
 
-- 
2.20.1

