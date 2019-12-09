Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF8A116D9D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfLINJc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:62113 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbfLINJc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="215088553"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2019 05:09:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 702A7447; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 07/24] pinctrl: lynxpoint: Assume 2 bits for mode selector
Date:   Mon,  9 Dec 2019 15:09:09 +0200
Message-Id: <20191209130926.86483-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

New generations can use 2 bits for mode selector.
Update the code to support it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 17a7843c8dc9..4b2e3f298641 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -38,7 +38,9 @@
 #define TRIG_SEL_BIT	BIT(4) /* 0: Edge, 1: Level */
 #define INT_INV_BIT	BIT(3) /* Invert interrupt triggering */
 #define DIR_BIT		BIT(2) /* 0: Output, 1: Input */
-#define USE_SEL_BIT	BIT(0) /* 0: Native, 1: GPIO */
+#define USE_SEL_MASK	GENMASK(1, 0)	/* 0: Native, 1: GPIO, ... */
+#define USE_SEL_NATIVE	(0 << 0)
+#define USE_SEL_GPIO	(1 << 0)
 
 /* LP_CONFIG2 reg bits */
 #define GPINDIS_BIT	BIT(2) /* disable input sensing */
@@ -111,7 +113,7 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 		return -EBUSY;
 	}
 	/* Fail if pin is in alternate function mode (not GPIO mode) */
-	if (!(inl(reg) & USE_SEL_BIT))
+	if ((inl(reg) & USE_SEL_MASK) != USE_SEL_GPIO)
 		return -ENODEV;
 
 	/* enable input sensing */
-- 
2.24.0

