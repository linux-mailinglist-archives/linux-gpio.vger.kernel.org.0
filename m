Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47823E35A1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 16:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393920AbfJXOdr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 10:33:47 -0400
Received: from mga12.intel.com ([192.55.52.136]:16726 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732293AbfJXOdr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Oct 2019 10:33:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 07:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="281956351"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 24 Oct 2019 07:33:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2DD3742; Thu, 24 Oct 2019 17:33:44 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: baytrail: Group GPIO IRQ chip initialization
Date:   Thu, 24 Oct 2019 17:33:43 +0300
Message-Id: <20191024143343.17638-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024143343.17638-1-andriy.shevchenko@linux.intel.com>
References: <20191024143343.17638-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After commit aee0f04d5f3b ("pinctrl: intel: baytrail: Pass irqchip
when adding gpiochip") the GPIO IRQ chip structure is being initialized under
conditional when IRQ resource has been discovered. But that commit left aside
the assignment of ->init_valid_mask() callback that is done unconditionally.

For sake of consistency and preventing some garbage in GPIO IRQ chip structure
group initialization together.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9d0e32dbf970..beb26550c25f 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1513,7 +1513,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	gc->can_sleep	= false;
 	gc->parent	= &vg->pdev->dev;
 	gc->ngpio	= vg->soc_data->npins;
-	gc->irq.init_valid_mask	= byt_init_irq_valid_mask;
 
 #ifdef CONFIG_PM_SLEEP
 	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
@@ -1537,6 +1536,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 		girq = &gc->irq;
 		girq->chip = &vg->irqchip;
 		girq->init_hw = byt_gpio_irq_init_hw;
+		girq->init_valid_mask = byt_init_irq_valid_mask;
 		girq->parent_handler = byt_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
-- 
2.23.0

