Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6564D116DA7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfLINJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:35 -0500
Received: from mga09.intel.com ([134.134.136.24]:48019 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbfLINJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="362921943"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 01531A69; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 18/24] pinctrl: lynxpoint: Add pin control data structures
Date:   Mon,  9 Dec 2019 15:09:20 +0200
Message-Id: <20191209130926.86483-19-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order to implement pin control for Intel Lynxpoint, we need
data structures in which to store and pass along pin, community
and SoC data information.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 126 +++++++++++++++++++++-
 1 file changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 3c1b71204bbe..ea46bd64226d 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -18,6 +18,128 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+
+#include "pinctrl-intel.h"
+
+#define COMMUNITY(p, n)			\
+	{				\
+		.pin_base	= (p),	\
+		.npins		= (n),	\
+	}
+
+static const struct pinctrl_pin_desc lptlp_pins[] = {
+	PINCTRL_PIN(0, "GP0_UART1_RXD"),
+	PINCTRL_PIN(1, "GP1_UART1_TXD"),
+	PINCTRL_PIN(2, "GP2_UART1_RTSB"),
+	PINCTRL_PIN(3, "GP3_UART1_CTSB"),
+	PINCTRL_PIN(4, "GP4_I2C0_SDA"),
+	PINCTRL_PIN(5, "GP5_I2C0_SCL"),
+	PINCTRL_PIN(6, "GP6_I2C1_SDA"),
+	PINCTRL_PIN(7, "GP7_I2C1_SCL"),
+	PINCTRL_PIN(8, "GP8"),
+	PINCTRL_PIN(9, "GP9"),
+	PINCTRL_PIN(10, "GP10"),
+	PINCTRL_PIN(11, "GP11_SMBALERTB"),
+	PINCTRL_PIN(12, "GP12_LANPHYPC"),
+	PINCTRL_PIN(13, "GP13"),
+	PINCTRL_PIN(14, "GP14"),
+	PINCTRL_PIN(15, "GP15"),
+	PINCTRL_PIN(16, "GP16_MGPIO9"),
+	PINCTRL_PIN(17, "GP17_MGPIO10"),
+	PINCTRL_PIN(18, "GP18_SRC0CLKRQB"),
+	PINCTRL_PIN(19, "GP19_SRC1CLKRQB"),
+	PINCTRL_PIN(20, "GP20_SRC2CLKRQB"),
+	PINCTRL_PIN(21, "GP21_SRC3CLKRQB"),
+	PINCTRL_PIN(22, "GP22_SRC4CLKRQB_TRST2"),
+	PINCTRL_PIN(23, "GP23_SRC5CLKRQB_TDI2"),
+	PINCTRL_PIN(24, "GP24_MGPIO0"),
+	PINCTRL_PIN(25, "GP25_USBWAKEOUTB"),
+	PINCTRL_PIN(26, "GP26_MGPIO5"),
+	PINCTRL_PIN(27, "GP27_MGPIO6"),
+	PINCTRL_PIN(28, "GP28_MGPIO7"),
+	PINCTRL_PIN(29, "GP29_SLP_WLANB_MGPIO3"),
+	PINCTRL_PIN(30, "GP30_SUSWARNB_SUSPWRDNACK_MGPIO1"),
+	PINCTRL_PIN(31, "GP31_ACPRESENT_MGPIO2"),
+	PINCTRL_PIN(32, "GP32_CLKRUNB"),
+	PINCTRL_PIN(33, "GP33_DEVSLP0"),
+	PINCTRL_PIN(34, "GP34_SATA0XPCIE6L3B_SATA0GP"),
+	PINCTRL_PIN(35, "GP35_SATA1XPCIE6L2B_SATA1GP"),
+	PINCTRL_PIN(36, "GP36_SATA2XPCIE6L1B_SATA2GP"),
+	PINCTRL_PIN(37, "GP37_SATA3XPCIE6L0B_SATA3GP"),
+	PINCTRL_PIN(38, "GP38_DEVSLP1"),
+	PINCTRL_PIN(39, "GP39_DEVSLP2"),
+	PINCTRL_PIN(40, "GP40_OC0B"),
+	PINCTRL_PIN(41, "GP41_OC1B"),
+	PINCTRL_PIN(42, "GP42_OC2B"),
+	PINCTRL_PIN(43, "GP43_OC3B"),
+	PINCTRL_PIN(44, "GP44"),
+	PINCTRL_PIN(45, "GP45_TMS2"),
+	PINCTRL_PIN(46, "GP46_TDO2"),
+	PINCTRL_PIN(47, "GP47"),
+	PINCTRL_PIN(48, "GP48"),
+	PINCTRL_PIN(49, "GP49"),
+	PINCTRL_PIN(50, "GP50"),
+	PINCTRL_PIN(51, "GP51_GSXDOUT"),
+	PINCTRL_PIN(52, "GP52_GSXSLOAD"),
+	PINCTRL_PIN(53, "GP53_GSXDIN"),
+	PINCTRL_PIN(54, "GP54_GSXSRESETB"),
+	PINCTRL_PIN(55, "GP55_GSXCLK"),
+	PINCTRL_PIN(56, "GP56"),
+	PINCTRL_PIN(57, "GP57"),
+	PINCTRL_PIN(58, "GP58"),
+	PINCTRL_PIN(59, "GP59"),
+	PINCTRL_PIN(60, "GP60_SML0ALERTB_MGPIO4"),
+	PINCTRL_PIN(61, "GP61_SUS_STATB"),
+	PINCTRL_PIN(62, "GP62_SUSCLK"),
+	PINCTRL_PIN(63, "GP63_SLP_S5B"),
+	PINCTRL_PIN(64, "GP64_SDIO_CLK"),
+	PINCTRL_PIN(65, "GP65_SDIO_CMD"),
+	PINCTRL_PIN(66, "GP66_SDIO_D0"),
+	PINCTRL_PIN(67, "GP67_SDIO_D1"),
+	PINCTRL_PIN(68, "GP68_SDIO_D2"),
+	PINCTRL_PIN(69, "GP69_SDIO_D3"),
+	PINCTRL_PIN(70, "GP70_SDIO_POWER_EN"),
+	PINCTRL_PIN(71, "GP71_MPHYPC"),
+	PINCTRL_PIN(72, "GP72_BATLOWB"),
+	PINCTRL_PIN(73, "GP73_SML1ALERTB_PCHHOTB_MGPIO8"),
+	PINCTRL_PIN(74, "GP74_SML1DATA_MGPIO12"),
+	PINCTRL_PIN(75, "GP75_SML1CLK_MGPIO11"),
+	PINCTRL_PIN(76, "GP76_BMBUSYB"),
+	PINCTRL_PIN(77, "GP77_PIRQAB"),
+	PINCTRL_PIN(78, "GP78_PIRQBB"),
+	PINCTRL_PIN(79, "GP79_PIRQCB"),
+	PINCTRL_PIN(80, "GP80_PIRQDB"),
+	PINCTRL_PIN(81, "GP81_SPKR"),
+	PINCTRL_PIN(82, "GP82_RCINB"),
+	PINCTRL_PIN(83, "GP83_GSPI0_CSB"),
+	PINCTRL_PIN(84, "GP84_GSPI0_CLK"),
+	PINCTRL_PIN(85, "GP85_GSPI0_MISO"),
+	PINCTRL_PIN(86, "GP86_GSPI0_MOSI"),
+	PINCTRL_PIN(87, "GP87_GSPI1_CSB"),
+	PINCTRL_PIN(88, "GP88_GSPI1_CLK"),
+	PINCTRL_PIN(89, "GP89_GSPI1_MISO"),
+	PINCTRL_PIN(90, "GP90_GSPI1_MOSI"),
+	PINCTRL_PIN(91, "GP91_UART0_RXD"),
+	PINCTRL_PIN(92, "GP92_UART0_TXD"),
+	PINCTRL_PIN(93, "GP93_UART0_RTSB"),
+	PINCTRL_PIN(94, "GP94_UART0_CTSB"),
+};
+
+static const struct intel_community lptlp_communities[] = {
+	COMMUNITY(0, 95),
+};
+
+static const struct intel_pinctrl_soc_data lptlp_soc_data = {
+	.pins		= lptlp_pins,
+	.npins		= ARRAY_SIZE(lptlp_pins),
+	.communities	= lptlp_communities,
+	.ncommunities	= ARRAY_SIZE(lptlp_communities),
+};
+
 /* LynxPoint chipset has support for 95 GPIO pins */
 
 #define LP_NUM_GPIO	95
@@ -477,8 +599,8 @@ static const struct dev_pm_ops lp_gpio_pm_ops = {
 };
 
 static const struct acpi_device_id lynxpoint_gpio_acpi_match[] = {
-	{ "INT33C7", 0 },
-	{ "INT3437", 0 },
+	{ "INT33C7", (kernel_ulong_t)&lptlp_soc_data },
+	{ "INT3437", (kernel_ulong_t)&lptlp_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, lynxpoint_gpio_acpi_match);
-- 
2.24.0

