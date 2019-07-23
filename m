Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D619172015
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 21:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfGWT1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 15:27:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:43122 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbfGWT1l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 15:27:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 12:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="368536075"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2019 12:27:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0CB1881; Tue, 23 Jul 2019 22:27:38 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] pinctrl: msm: Switch to use device_property_count_uXX()
Date:   Tue, 23 Jul 2019 22:27:37 +0300
Message-Id: <20190723192738.68486-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use use device_property_count_uXX() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7f35c196bb3e..90bc667139e0 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -617,8 +617,7 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
 	}
 
 	/* The number of GPIOs in the ACPI tables */
-	len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
-						   0);
+	len = ret = device_property_count_u16(pctrl->dev, "gpios");
 	if (ret < 0)
 		return 0;
 
@@ -996,7 +995,7 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 	if (pctrl->soc->reserved_gpios)
 		return true;
 
-	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
+	return device_property_count_u16(pctrl->dev, "gpios") > 0;
 }
 
 static int msm_gpio_init(struct msm_pinctrl *pctrl)
-- 
2.20.1

