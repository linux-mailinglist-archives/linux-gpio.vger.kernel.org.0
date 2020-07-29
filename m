Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9B1231DBC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jul 2020 13:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgG2L5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jul 2020 07:57:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:6146 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbgG2L5N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jul 2020 07:57:13 -0400
IronPort-SDR: 2o47A1kCA570TXMuTWVJZLq1iPy73t/0z04er1uzBUG1vve43M0vb9i4HWLoYTt/JqY/DHQo5G
 6qx/4DApq9UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="150567115"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="150567115"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 04:57:12 -0700
IronPort-SDR: p0vGKn4bTXXwCmOHe4bpiOGukrmMej7hswTomyOvasSDkQBhtCWKngVit179TZJpjhH1NNFex9
 yJpO9dh4Fvhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="304198101"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2020 04:57:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F222F198; Wed, 29 Jul 2020 14:57:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] pinctrl: cherryview: Switch to use intel_pinctrl_get_soc_data()
Date:   Wed, 29 Jul 2020 14:57:08 +0300
Message-Id: <20200729115708.38112-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
References: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have common helper to retrieve SoC data from driver data
we may switch to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 23 ++++++----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index c18abc1a0d04..595686e6a238 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1605,28 +1605,17 @@ static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
 
 static int chv_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct intel_pinctrl_soc_data *soc_data = NULL;
-	const struct intel_pinctrl_soc_data **soc_table;
+	const struct intel_pinctrl_soc_data *soc_data;
 	struct intel_community *community;
 	struct device *dev = &pdev->dev;
+	struct acpi_device *adev = ACPI_COMPANION(dev);
 	struct intel_pinctrl *pctrl;
-	struct acpi_device *adev;
 	acpi_status status;
-	int ret, irq, i;
+	int ret, irq;
 
-	adev = ACPI_COMPANION(&pdev->dev);
-	if (!adev)
-		return -ENODEV;
-
-	soc_table = (const struct intel_pinctrl_soc_data **)device_get_match_data(dev);
-	for (i = 0; soc_table[i]; i++) {
-		if (!strcmp(adev->pnp.unique_id, soc_table[i]->uid)) {
-			soc_data = soc_table[i];
-			break;
-		}
-	}
-	if (!soc_data)
-		return -ENODEV;
+	soc_data = intel_pinctrl_get_soc_data(pdev);
+	if (IS_ERR(soc_data))
+		return PTR_ERR(soc_data);
 
 	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
-- 
2.27.0

