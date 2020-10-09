Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCA4288F9E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 19:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389953AbgJIRLp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 13:11:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:43541 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389944AbgJIRLp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 13:11:45 -0400
IronPort-SDR: yXbsZyK6S1RlUbWq8tVQe2WwHu+PnHxZ40gg3lHqPEl0ArMZ2Cmg09+xpSaGXGifFdgb3mHUbh
 1xd2C9nr62qw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="250208296"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="250208296"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 10:11:43 -0700
IronPort-SDR: L7xm9M3WltSz6qsmfv2APTxFwShUW2HWIzpqaifZFMh1Ck4dlf6iTF1eFQJKTOZt18s3GhC0mt
 WZ0pLRidLXdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="518731878"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2020 10:11:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6879E15C; Fri,  9 Oct 2020 20:11:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v1 2/2] pinctrl: mcp23s08: Print error message when regmap init fails
Date:   Fri,  9 Oct 2020 20:11:37 +0300
Message-Id: <20201009171137.81663-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009171137.81663-1-andriy.shevchenko@linux.intel.com>
References: <20201009171137.81663-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is useful for debugging to have the error message printed
when regmap initialisation fails. Add it to the driver.

Cc: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 7c72cffe1412..9ae10318f6f3 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -126,6 +126,8 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 	copy->name = name;
 
 	mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp, copy);
+	if (IS_ERR(mcp->regmap))
+		dev_err(dev, "regmap init failed for %s\n", mcp->chip.label);
 	return PTR_ERR_OR_ZERO(mcp->regmap);
 }
 
-- 
2.28.0

