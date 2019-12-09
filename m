Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4EB8116DA8
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfLINJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:35 -0500
Received: from mga04.intel.com ([192.55.52.120]:15277 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727633AbfLINJe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="237744368"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1AC55A6D; Mon,  9 Dec 2019 15:09:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 21/24] pinctrl: lynxpoint: Implement ->pin_dbg_show()
Date:   Mon,  9 Dec 2019 15:09:23 +0200
Message-Id: <20191209130926.86483-22-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The introduced callback ->pin_dbg_show() is useful for debugging.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index c209deff9efb..bfdd283d2c20 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -297,10 +297,33 @@ static int lp_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void lp_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+			    unsigned int pin)
+{
+	struct intel_pinctrl *lg = pinctrl_dev_get_drvdata(pctldev);
+	void __iomem *reg = lp_gpio_reg(&lg->chip, pin, LP_CONFIG1);
+	void __iomem *conf2 = lp_gpio_reg(&lg->chip, pin, LP_CONFIG2);
+	u32 value, mode;
+
+	value = ioread32(reg);
+
+	mode = value & USE_SEL_MASK;
+	if (mode == USE_SEL_GPIO)
+		seq_puts(s, "GPIO ");
+	else
+		seq_printf(s, "mode %d ", mode);
+
+	seq_printf(s, "0x%08x 0x%08x", value, ioread32(conf2));
+
+	if (lp_gpio_acpi_use(lg, pin))
+		seq_puts(s, " [ACPI]");
+}
+
 static const struct pinctrl_ops lptlp_pinctrl_ops = {
 	.get_groups_count	= lp_get_groups_count,
 	.get_group_name		= lp_get_group_name,
 	.get_group_pins		= lp_get_group_pins,
+	.pin_dbg_show		= lp_pin_dbg_show,
 };
 
 static int lp_get_functions_count(struct pinctrl_dev *pctldev)
-- 
2.24.0

