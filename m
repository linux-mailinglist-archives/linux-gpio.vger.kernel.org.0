Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453131A844B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 18:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389359AbgDNQNo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 12:13:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:43395 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388615AbgDNQNn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 12:13:43 -0400
IronPort-SDR: QievyJ7knyO22meSKpBeMvOYerdSPcZj9MU8aK3lsLCUneRBx1vdVB0BFzydsK/iUqha3lCvOM
 WiAgrXgTAy0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 09:13:42 -0700
IronPort-SDR: V5rUWjhN1WZmYb737jsh/pfPwvGXpEvm8V+sj2WVGsvCt38S2uRVc9wAtw/UYheAiRgM6ekR9M
 I0JRboWQJ5dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="454607393"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2020 09:13:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AA0E143; Tue, 14 Apr 2020 19:13:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: lynxpoint: Use platform_get_irq_optional() explicitly
Date:   Tue, 14 Apr 2020 19:13:38 +0300
Message-Id: <20200414161338.3025-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414161338.3025-1-andriy.shevchenko@linux.intel.com>
References: <20200414161338.3025-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to repeat functionality of platform_get_irq_optional()
in the driver. Replace it with explicit call to the helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index e928742c7181..a45b8f2182fd 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -794,11 +794,11 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	const struct intel_pinctrl_soc_data *soc;
 	struct intel_pinctrl *lg;
 	struct gpio_chip *gc;
-	struct resource *io_rc, *irq_rc;
 	struct device *dev = &pdev->dev;
+	struct resource *io_rc;
 	void __iomem *regs;
 	unsigned int i;
-	int ret;
+	int irq, ret;
 
 	soc = (const struct intel_pinctrl_soc_data *)device_get_match_data(dev);
 	if (!soc)
@@ -870,8 +870,8 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->parent = dev;
 
 	/* set up interrupts  */
-	irq_rc = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (irq_rc && irq_rc->start) {
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
 		girq = &gc->irq;
@@ -884,7 +884,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 					     GFP_KERNEL);
 		if (!girq->parents)
 			return -ENOMEM;
-		girq->parents[0] = (unsigned int)irq_rc->start;
+		girq->parents[0] = irq;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
 	}
-- 
2.25.1

