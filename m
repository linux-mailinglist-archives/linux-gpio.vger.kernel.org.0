Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4C05E738
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 16:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfGCO4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 10:56:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:20719 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbfGCO4S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jul 2019 10:56:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jul 2019 07:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="339331903"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 03 Jul 2019 07:56:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2F7EDB2; Wed,  3 Jul 2019 17:56:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] pinctrl: cherryview: Use devm_platform_ioremap_resource()
Date:   Wed,  3 Jul 2019 17:56:13 +0300
Message-Id: <20190703145615.74768-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703145615.74768-1-andriy.shevchenko@linux.intel.com>
References: <20190703145615.74768-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index d0740714b3cb..6e7da421b6c9 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1689,7 +1689,6 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 {
 	struct chv_pinctrl *pctrl;
 	struct acpi_device *adev;
-	struct resource *res;
 	acpi_status status;
 	int ret, irq, i;
 
@@ -1717,8 +1716,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	if (!pctrl->saved_pin_context)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pctrl->regs = devm_ioremap_resource(&pdev->dev, res);
+	pctrl->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->regs))
 		return PTR_ERR(pctrl->regs);
 
-- 
2.20.1

