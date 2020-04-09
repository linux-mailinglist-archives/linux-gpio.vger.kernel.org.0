Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301FF1A3AF0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgDIT7R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgDIT7R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:17 -0400
IronPort-SDR: 8PYscl6JaVlglJJ9bDP7O3xp0yZxs7L++DGjp/CWY4/VOTiwc+0lCo9kpAR/wOFFvNPAHmcBRB
 jQC8ETOWjQEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:17 -0700
IronPort-SDR: 3WujSN8sErlH4LsZZeBQSMcfeDIlK8/K1hfbi8ZRpRH8qOmudVT8BrRdvDgS1VkJLQv2wo7pfZ
 H4yYlItESZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745352"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:15 -0700
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
Subject: [RFC PATCH 09/16] clk: hifiberry-dacpro: style cleanups, use devm_
Date:   Thu,  9 Apr 2020 14:58:34 -0500
Message-Id: <20200409195841.18901-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Lots of small issues, xmas style, alignment, wrong comments, memory leak

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 42 +++++++++++-------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index eb67a8c47c49..78ede325d237 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -21,13 +21,13 @@
 #define CLK_48EN_RATE 24576000UL
 
 /**
- * struct hifiberry_dacpro_clk - Common struct to the HiFiBerry DAC Pro
+ * struct clk_hifiberry_hw - Common struct to the HiFiBerry DAC Pro
  * @hw: clk_hw for the common clk framework
  * @mode: 0 => CLK44EN, 1 => CLK48EN
  */
 struct clk_hifiberry_hw {
 	struct clk_hw hw;
-	uint8_t mode;
+	u8 mode;
 };
 
 #define to_hifiberry_clk(_hw) container_of(_hw, struct clk_hifiberry_hw, hw)
@@ -39,14 +39,15 @@ static const struct of_device_id clk_hifiberry_dacpro_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, clk_hifiberry_dacpro_dt_ids);
 
 static unsigned long clk_hifiberry_dacpro_recalc_rate(struct clk_hw *hw,
-	unsigned long parent_rate)
+						      unsigned long parent_rate)
 {
 	return (to_hifiberry_clk(hw)->mode == 0) ? CLK_44EN_RATE :
 		CLK_48EN_RATE;
 }
 
 static long clk_hifiberry_dacpro_round_rate(struct clk_hw *hw,
-	unsigned long rate, unsigned long *parent_rate)
+					    unsigned long rate,
+					    unsigned long *parent_rate)
 {
 	long actual_rate;
 
@@ -66,21 +67,20 @@ static long clk_hifiberry_dacpro_round_rate(struct clk_hw *hw,
 	return actual_rate;
 }
 
-
 static int clk_hifiberry_dacpro_set_rate(struct clk_hw *hw,
-	unsigned long rate, unsigned long parent_rate)
+					 unsigned long rate,
+					 unsigned long parent_rate)
 {
-	unsigned long actual_rate;
 	struct clk_hifiberry_hw *clk = to_hifiberry_clk(hw);
+	unsigned long actual_rate;
 
 	actual_rate = (unsigned long)clk_hifiberry_dacpro_round_rate(hw, rate,
-		&parent_rate);
+								&parent_rate);
 	clk->mode = (actual_rate == CLK_44EN_RATE) ? 0 : 1;
 	return 0;
 }
 
-
-const struct clk_ops clk_hifiberry_dacpro_rate_ops = {
+static const struct clk_ops clk_hifiberry_dacpro_rate_ops = {
 	.recalc_rate = clk_hifiberry_dacpro_recalc_rate,
 	.round_rate = clk_hifiberry_dacpro_round_rate,
 	.set_rate = clk_hifiberry_dacpro_set_rate,
@@ -88,15 +88,15 @@ const struct clk_ops clk_hifiberry_dacpro_rate_ops = {
 
 static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 {
-	int ret;
 	struct clk_hifiberry_hw *proclk;
-	struct clk *clk;
-	struct device *dev;
 	struct clk_init_data init;
+	struct device *dev;
+	struct clk *clk;
+	int ret;
 
 	dev = &pdev->dev;
 
-	proclk = kzalloc(sizeof(struct clk_hifiberry_hw), GFP_KERNEL);
+	proclk = devm_kzalloc(dev, sizeof(*proclk), GFP_KERNEL);
 	if (!proclk)
 		return -ENOMEM;
 
@@ -115,7 +115,6 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 			clk);
 	} else {
 		dev_err(dev, "Fail to register clock driver\n");
-		kfree(proclk);
 		ret = PTR_ERR(clk);
 	}
 	return ret;
@@ -135,18 +134,7 @@ static struct platform_driver clk_hifiberry_dacpro_driver = {
 		.of_match_table = clk_hifiberry_dacpro_dt_ids,
 	},
 };
-
-static int __init clk_hifiberry_dacpro_init(void)
-{
-	return platform_driver_register(&clk_hifiberry_dacpro_driver);
-}
-core_initcall(clk_hifiberry_dacpro_init);
-
-static void __exit clk_hifiberry_dacpro_exit(void)
-{
-	platform_driver_unregister(&clk_hifiberry_dacpro_driver);
-}
-module_exit(clk_hifiberry_dacpro_exit);
+module_platform_driver(clk_hifiberry_dacpro_driver);
 
 MODULE_DESCRIPTION("HiFiBerry DAC Pro clock driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1

