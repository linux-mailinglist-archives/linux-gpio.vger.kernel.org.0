Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA5825589C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 12:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbgH1Kcj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 06:32:39 -0400
Received: from mga11.intel.com ([192.55.52.93]:31840 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgH1Kcj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 06:32:39 -0400
IronPort-SDR: rYuAE3GDMFeIOBYuJhLQM0v27xIhz+U2al6Zj38bZFkiZ/l+WxQmgOmlG8T3olzYHKmEH9v2rL
 gVoehpB1azEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="154188206"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="154188206"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 03:32:38 -0700
IronPort-SDR: DrDzdzQixXmdlM21WDrP5BDP9PrbsEoBXC2Z0iZXCrNNMmq+vanOM1UTvhdYwDoaDrrwg2j6GZ
 jWtw3RkIzd8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="300189328"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2020 03:32:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CC12D166; Fri, 28 Aug 2020 13:32:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v1] pinctrl: mcp23s08: Improve error messaging in ->probe()
Date:   Fri, 28 Aug 2020 13:32:35 +0300
Message-Id: <20200828103235.78380-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Print particular message in each of error case in the ->probe().
While here, use dev_err_probe() for that.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 42b12ea14d6b..b4606811cf57 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -564,7 +564,7 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	ret = mcp_read(mcp, MCP_IOCON, &status);
 	if (ret < 0)
-		goto fail;
+		return dev_err_probe(dev, ret, "can't identify chip %d\n", addr);
 
 	mcp->irq_controller =
 		device_property_read_bool(dev, "interrupt-controller");
@@ -598,7 +598,7 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 		ret = mcp_write(mcp, MCP_IOCON, status);
 		if (ret < 0)
-			goto fail;
+			return dev_err_probe(dev, ret, "can't write IOCON %d\n", addr);
 	}
 
 	if (mcp->irq && mcp->irq_controller) {
@@ -616,7 +616,7 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
 	if (ret < 0)
-		goto fail;
+		return dev_err_probe(dev, ret, "can't add GPIO chip\n");
 
 	mcp->pinctrl_desc.pctlops = &mcp_pinctrl_ops;
 	mcp->pinctrl_desc.confops = &mcp_pinconf_ops;
@@ -628,18 +628,17 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->pinctrl_desc.owner = THIS_MODULE;
 
 	mcp->pctldev = devm_pinctrl_register(dev, &mcp->pinctrl_desc, mcp);
-	if (IS_ERR(mcp->pctldev)) {
-		ret = PTR_ERR(mcp->pctldev);
-		goto fail;
-	}
+	if (IS_ERR(mcp->pctldev))
+		return dev_err_probe(dev, PTR_ERR(mcp->pctldev), "can't register controller\n");
 
-	if (mcp->irq)
+	if (mcp->irq) {
 		ret = mcp23s08_irq_setup(mcp);
+		if (ret)
+			return dev_err_probe(dev, ret, "can't setup IRQ\n");
+	}
 
-fail:
-	if (ret < 0)
-		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mcp23s08_probe_one);
+
 MODULE_LICENSE("GPL");
-- 
2.28.0

