Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A56F1A3AF4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgDIT7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:59:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgDIT7V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:59:21 -0400
IronPort-SDR: Gt/Fp6jhjs6jqk0OHOjIwEacIl3qj4p+FxZICpFwjgkRqZcPtSEznda4Bj6WFKHGhEaAmz29zM
 9qGtawGVQmvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:59:21 -0700
IronPort-SDR: 0D80xSN2e8ZlyhaRLFGKvpxSyzt9ebrNS/wl73d/6TDEu6hm7qMSOJYjkbPu6am2toWPVQ+oWk
 KhaQnMJ64z+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745377"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:19 -0700
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
Subject: [RFC PATCH 11/16] clk: hifiberry-dacpro: transition to _hw functions
Date:   Thu,  9 Apr 2020 14:58:36 -0500
Message-Id: <20200409195841.18901-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_clk_register() and of_clk_add_provider() are deprecated, use the
recommended functions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index 78ede325d237..bf0616c959da 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -91,7 +91,6 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 	struct clk_hifiberry_hw *proclk;
 	struct clk_init_data init;
 	struct device *dev;
-	struct clk *clk;
 	int ret;
 
 	dev = &pdev->dev;
@@ -109,14 +108,15 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 	proclk->mode = 0;
 	proclk->hw.init = &init;
 
-	clk = devm_clk_register(dev, &proclk->hw);
-	if (!IS_ERR(clk)) {
-		ret = of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
-			clk);
-	} else {
+	ret = devm_clk_hw_register(dev, &proclk->hw);
+	if (ret) {
 		dev_err(dev, "Fail to register clock driver\n");
-		ret = PTR_ERR(clk);
+		return ret;
 	}
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
+				     &proclk->hw);
+
 	return ret;
 }
 
-- 
2.20.1

