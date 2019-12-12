Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11DAE11CAA4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbfLLK0J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:26:09 -0500
Received: from mga09.intel.com ([134.134.136.24]:57202 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728521AbfLLK0J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 05:26:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 02:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
   d="scan'208";a="363927445"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2019 02:26:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6619324C; Thu, 12 Dec 2019 12:26:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        hdegoede@redhat.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/5] pinctrl: baytrail: Use local variable to keep device pointer
Date:   Thu, 12 Dec 2019 12:25:56 +0200
Message-Id: <20191212102557.87754-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use local variable to keep device pointer in order to increase readability
of the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index bd33b39082d9..ca5e394fca4e 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1604,15 +1604,16 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc_data = NULL;
 	const struct intel_pinctrl_soc_data **soc_table;
+	struct device *dev = &pdev->dev;
 	struct acpi_device *acpi_dev;
 	struct byt_gpio *vg;
 	int i, ret;
 
-	acpi_dev = ACPI_COMPANION(&pdev->dev);
+	acpi_dev = ACPI_COMPANION(dev);
 	if (!acpi_dev)
 		return -ENODEV;
 
-	soc_table = (const struct intel_pinctrl_soc_data **)device_get_match_data(&pdev->dev);
+	soc_table = (const struct intel_pinctrl_soc_data **)device_get_match_data(dev);
 
 	for (i = 0; soc_table[i]; i++) {
 		if (!strcmp(acpi_dev->pnp.unique_id, soc_table[i]->uid)) {
@@ -1624,25 +1625,25 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	if (!soc_data)
 		return -ENODEV;
 
-	vg = devm_kzalloc(&pdev->dev, sizeof(*vg), GFP_KERNEL);
+	vg = devm_kzalloc(dev, sizeof(*vg), GFP_KERNEL);
 	if (!vg)
 		return -ENOMEM;
 
-	vg->dev = &pdev->dev;
+	vg->dev = dev;
 	ret = byt_set_soc_data(vg, soc_data);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to set soc data\n");
+		dev_err(dev, "failed to set soc data\n");
 		return ret;
 	}
 
 	vg->pctl_desc		= byt_pinctrl_desc;
-	vg->pctl_desc.name	= dev_name(&pdev->dev);
+	vg->pctl_desc.name	= dev_name(dev);
 	vg->pctl_desc.pins	= vg->soc_data->pins;
 	vg->pctl_desc.npins	= vg->soc_data->npins;
 
-	vg->pctl_dev = devm_pinctrl_register(&pdev->dev, &vg->pctl_desc, vg);
+	vg->pctl_dev = devm_pinctrl_register(dev, &vg->pctl_desc, vg);
 	if (IS_ERR(vg->pctl_dev)) {
-		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
+		dev_err(dev, "failed to register pinctrl driver\n");
 		return PTR_ERR(vg->pctl_dev);
 	}
 
@@ -1651,7 +1652,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 		return ret;
 
 	platform_set_drvdata(pdev, vg);
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	return 0;
 }
-- 
2.24.0

