Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC2B116DAD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfLINJi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:38 -0500
Received: from mga05.intel.com ([192.55.52.43]:62113 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727610AbfLINJe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="215088566"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E682E94D; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 17/24] pinctrl: lynxpoint: Implement intel_gpio_get_direction callback
Date:   Mon,  9 Dec 2019 15:09:19 +0200
Message-Id: <20191209130926.86483-18-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allows querying GPIO direction from the pad config register.
If the pad is not in GPIO mode, return an error.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 3b0dfe9a51ba..3c1b71204bbe 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -197,6 +197,16 @@ static int lp_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static int lp_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
+
+	if (ioread32(reg) & DIR_BIT)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
 static void lp_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
@@ -391,6 +401,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->direction_output = lp_gpio_direction_output;
 	gc->get = lp_gpio_get;
 	gc->set = lp_gpio_set;
+	gc->get_direction = lp_gpio_get_direction;
 	gc->base = -1;
 	gc->ngpio = LP_NUM_GPIO;
 	gc->can_sleep = false;
-- 
2.24.0

