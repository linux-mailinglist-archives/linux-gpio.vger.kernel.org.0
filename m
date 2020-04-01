Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC0719B4BA
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 19:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732289AbgDARfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 13:35:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:64631 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732279AbgDARfG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 13:35:06 -0400
IronPort-SDR: 2MkjdW+RXPt/et2aT4XV7LS2SMH1p2YR3aBfFa0b9gOf8u4wenjeieKyfZaCB/rKR8Yg5vacnE
 BuyQXbyyLnOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 10:35:06 -0700
IronPort-SDR: s87B8SzSilwyxpsvh96rjU8XHHAxZTLjsQqI9Cuanu8iT9oIE+5eK1SqEOWKAWvsGbiGNmAKSw
 VSsGwiBwsqTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; 
   d="scan'208";a="238248159"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 01 Apr 2020 10:35:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C64A723D; Wed,  1 Apr 2020 20:35:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: cherryview: Use GENMASK() consistently
Date:   Wed,  1 Apr 2020 20:35:02 +0300
Message-Id: <20200401173502.27626-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401173502.27626-1-andriy.shevchenko@linux.intel.com>
References: <20200401173502.27626-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use GENMASK() macro for all definitions where it's appropriate.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index fa81f3c0bdc5..53f2775f7184 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -35,18 +35,18 @@
 
 #define CHV_PADCTRL0			0x000
 #define CHV_PADCTRL0_INTSEL_SHIFT	28
-#define CHV_PADCTRL0_INTSEL_MASK	(0xf << CHV_PADCTRL0_INTSEL_SHIFT)
+#define CHV_PADCTRL0_INTSEL_MASK	GENMASK(31, 28)
 #define CHV_PADCTRL0_TERM_UP		BIT(23)
 #define CHV_PADCTRL0_TERM_SHIFT		20
-#define CHV_PADCTRL0_TERM_MASK		(7 << CHV_PADCTRL0_TERM_SHIFT)
+#define CHV_PADCTRL0_TERM_MASK		GENMASK(22, 20)
 #define CHV_PADCTRL0_TERM_20K		1
 #define CHV_PADCTRL0_TERM_5K		2
 #define CHV_PADCTRL0_TERM_1K		4
 #define CHV_PADCTRL0_PMODE_SHIFT	16
-#define CHV_PADCTRL0_PMODE_MASK		(0xf << CHV_PADCTRL0_PMODE_SHIFT)
+#define CHV_PADCTRL0_PMODE_MASK		GENMASK(19, 16)
 #define CHV_PADCTRL0_GPIOEN		BIT(15)
 #define CHV_PADCTRL0_GPIOCFG_SHIFT	8
-#define CHV_PADCTRL0_GPIOCFG_MASK	(7 << CHV_PADCTRL0_GPIOCFG_SHIFT)
+#define CHV_PADCTRL0_GPIOCFG_MASK	GENMASK(10, 8)
 #define CHV_PADCTRL0_GPIOCFG_GPIO	0
 #define CHV_PADCTRL0_GPIOCFG_GPO	1
 #define CHV_PADCTRL0_GPIOCFG_GPI	2
@@ -57,11 +57,11 @@
 #define CHV_PADCTRL1			0x004
 #define CHV_PADCTRL1_CFGLOCK		BIT(31)
 #define CHV_PADCTRL1_INVRXTX_SHIFT	4
-#define CHV_PADCTRL1_INVRXTX_MASK	(0xf << CHV_PADCTRL1_INVRXTX_SHIFT)
-#define CHV_PADCTRL1_INVRXTX_TXENABLE	(2 << CHV_PADCTRL1_INVRXTX_SHIFT)
+#define CHV_PADCTRL1_INVRXTX_MASK	GENMASK(7, 4)
+#define CHV_PADCTRL1_INVRXTX_RXDATA	BIT(6)
+#define CHV_PADCTRL1_INVRXTX_TXENABLE	BIT(5)
 #define CHV_PADCTRL1_ODEN		BIT(3)
-#define CHV_PADCTRL1_INVRXTX_RXDATA	(4 << CHV_PADCTRL1_INVRXTX_SHIFT)
-#define CHV_PADCTRL1_INTWAKECFG_MASK	7
+#define CHV_PADCTRL1_INTWAKECFG_MASK	GENMASK(2, 0)
 #define CHV_PADCTRL1_INTWAKECFG_FALLING	1
 #define CHV_PADCTRL1_INTWAKECFG_RISING	2
 #define CHV_PADCTRL1_INTWAKECFG_BOTH	3
-- 
2.25.1

