Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADB5F1914
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfKFOsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:48:36 -0500
Received: from mga09.intel.com ([134.134.136.24]:65092 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731713AbfKFOsf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:48:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="377067550"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 06 Nov 2019 06:48:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3900B33B; Wed,  6 Nov 2019 16:48:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/8] pinctrl: lynxpoint: Use %pR to print IO resource
Date:   Wed,  6 Nov 2019 16:48:26 +0200
Message-Id: <20191106144829.32275-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
References: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace explicit casting by pointer to struct resource with
specifier replacement to %pR to print the IO resource.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index dbca1ff076c8..05921729fe78 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -340,8 +340,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	reg_len = resource_size(io_rc);
 
 	if (!devm_request_region(dev, lg->reg_base, reg_len, "lp-gpio")) {
-		dev_err(dev, "failed requesting IO region 0x%x\n",
-			(unsigned int)lg->reg_base);
+		dev_err(dev, "failed requesting IO region %pR\n", &io_rc);
 		return -EBUSY;
 	}
 
-- 
2.24.0.rc1

