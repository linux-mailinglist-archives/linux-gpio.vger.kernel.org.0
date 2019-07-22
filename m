Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C761A6F920
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfGVF4H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:07 -0400
Received: from mout.gmx.net ([212.227.17.20]:49269 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727395AbfGVF4G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774940;
        bh=cudRuspaqlYWwlEIcsrXp2GOPdVKrZrdrR8utXa8E3g=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=HuiV5EjI2gcNRdsUdlNDxAEXs8sR0gImRfXC/7DB3RP85yrabIDq5NQHncs3fvGtY
         65tQO9rI8TggHC1wfLEuNQO+RnlUJgnexz1rHSTNgeo0/jrRK+KFu7OAkGPmhFvVJ7
         eU6p/mPaXxFxNmdk4WwM6ilOz7j5hXXgv0ROwXVo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MOTRh-1hjfzt0jkz-005ogW; Mon, 22
 Jul 2019 07:55:40 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 07/18] clk: bcm2835: Introduce SoC specific clock registration
Date:   Mon, 22 Jul 2019 07:54:38 +0200
Message-Id: <1563774880-8061-8-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:eszUSIGiCy76Kio/7/F0P9aMkhMnVmVVhCnbqJnbUjxnKpYXKQW
 hNct85tJSdcfNPGx79cKYDJWr8eXg4hEWQD5k4VZg7wN6+dEtmrVRpviQMPGozerxdXvktH
 gft6gt6KLUpZ3XqDWVXeDl00dwpYp5NYpNy+T9TQ7v4jzoFzn+CoLmh2P/Ji82LbMURP57f
 MfAybwa64IQBruxP4MMJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mSt9ecxj8EQ=:9AxjYi6Uo0VUV42C3KRHif
 2CZzaq3fu+k32XDcnSij6ZlPneAlGvIrfA+6altCF3G2HE7DqO+9Df8Roe4SN4v+NkjjS+WI7
 Kq38XUkreOVTsihrZSD+dqU+C/SVhYgUoT+WcmvGU4weyjBDLLIVNYAMPjC2N6JEf/fGWViJ0
 In+xNJB9W9AcB96kUhb+SobmNRlIruoq9g6BNquerrn/rAlHxVQTBWwypvGxytEfP9MfgBgSX
 f+W/sfbdS9ocQO+ifDoapMv/AJPpulK9NgSMaupXPMKKWWz5nZW428LlyEk32DEwwMtQR4hIn
 uAF6ZsLoUzYuFbW/YYeYIfsTY3xU4OUgWUEINKkrjhv0xR0qouBgod3BVm3oBHl1c5lt/G8kU
 hMXNTAM5w35Nl/etP+EdvXRB0qgjLV7tlUbpGJpfAGQBryghEZyWKwROIHPH8WBTeRsUgVPiY
 ePa8PJ8IZtVilTm+ugQAxmcVfAo29Z+kQ0N0p+hBskPIo4/mxakfje4TlwUJErJHX8z2OmVHZ
 XUfajq7EeuFpgh+APk5X4yTy5HYu43mam5GXdqTttzwfJTWf+DN8QAem6btRk134+eIZZxJin
 3UNwEPwXheZ94Vw1SLydtv2TgQS5YKMYfs696JtdL3QijSqh3Z1oZRvk1QjAIIiRiH9Pc6Uvm
 j5hmc7ZF8NWkHuzC1rpneuDmD7iBuaN6MwnhUGj2JIN9mWCJg3EWR7at6QeSw3DCTfoibFK2L
 jg2VVnzVoBMmXJQ5MUXj8k9A3lTP3TLaG+egeRQrsYVj+vuARiN1xoZIgb6E4yVcg4vwso1Oz
 Lw3Mgu7bXfoW2fHkWxYs/GTxlgt8n8+X7ooLs/BJmRZSp4OTw/l8InlvzgLtiL6UUr4Gclrnj
 uZ+VXNsSY1/+ZQXdkoLtWIm/Ur1ga1+yNnsf65Ztvl5YskExLPmNAsscJAUWEsEoso5ucbLuM
 LG7MmmP56SgpfqjvFQ84rOd5RpDzwGb3xlNImekbQKMkX4Y4vGwNbUaNMmFqxHiSM8Jdcs65F
 sat4yKh/3v+2T17ZWsnzqY+IqyraP1JyLJ2o+mWqJ0goCwEjQvgTyFrVhA7PVKH3nTRrrvtwu
 +uUUyjquahfvTA=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order to support SoC specific clocks (e.g. emmc2 for BCM2711), we
extend the description with a SoC support flag. This approach avoids long
and mostly redundant lists of clock IDs.

Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 103 +++++++++++++++++++++++++++++++++++--=
-----
 1 file changed, 86 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 867ae3c..3231b76 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -31,7 +31,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <dt-bindings/clock/bcm2835.h>
@@ -289,6 +289,9 @@
 #define LOCK_TIMEOUT_NS		100000000
 #define BCM2835_MAX_FB_RATE	1750000000u

+#define SOC_BCM2835		BIT(0)
+#define SOC_ALL			(SOC_BCM2835)
+
 /*
  * Names of clocks used within the driver that need to be replaced
  * with an external parent's name.  This array is in the order that
@@ -1451,22 +1454,28 @@ typedef struct clk_hw *(*bcm2835_clk_register)(str=
uct bcm2835_cprman *cprman,
 					       const void *data);
 struct bcm2835_clk_desc {
 	bcm2835_clk_register clk_register;
+	unsigned int supported;
 	const void *data;
 };

 /* assignment helper macros for different clock types */
-#define _REGISTER(f, ...) { .clk_register =3D (bcm2835_clk_register)f, \
-			    .data =3D __VA_ARGS__ }
-#define REGISTER_PLL(...)	_REGISTER(&bcm2835_register_pll,	\
+#define _REGISTER(f, s, ...) { .clk_register =3D (bcm2835_clk_register)f,=
 \
+			       .supported =3D s,				\
+			       .data =3D __VA_ARGS__ }
+#define REGISTER_PLL(s, ...)	_REGISTER(&bcm2835_register_pll,	\
+					  s,				\
 					  &(struct bcm2835_pll_data)	\
 					  {__VA_ARGS__})
-#define REGISTER_PLL_DIV(...)	_REGISTER(&bcm2835_register_pll_divider, \
-					  &(struct bcm2835_pll_divider_data) \
-					  {__VA_ARGS__})
-#define REGISTER_CLK(...)	_REGISTER(&bcm2835_register_clock,	\
+#define REGISTER_PLL_DIV(s, ...) _REGISTER(&bcm2835_register_pll_divider,=
 \
+					   s,				  \
+					   &(struct bcm2835_pll_divider_data) \
+					   {__VA_ARGS__})
+#define REGISTER_CLK(s, ...)	_REGISTER(&bcm2835_register_clock,	\
+					  s,				\
 					  &(struct bcm2835_clock_data)	\
 					  {__VA_ARGS__})
-#define REGISTER_GATE(...)	_REGISTER(&bcm2835_register_gate,	\
+#define REGISTER_GATE(s, ...)	_REGISTER(&bcm2835_register_gate,	\
+					  s,				\
 					  &(struct bcm2835_gate_data)	\
 					  {__VA_ARGS__})

@@ -1480,7 +1489,8 @@ static const char *const bcm2835_clock_osc_parents[]=
 =3D {
 	"testdebug1"
 };

-#define REGISTER_OSC_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_OSC_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_osc_parents),	\
 	.parents =3D bcm2835_clock_osc_parents,				\
 	__VA_ARGS__)
@@ -1497,7 +1507,8 @@ static const char *const bcm2835_clock_per_parents[]=
 =3D {
 	"pllh_aux",
 };

-#define REGISTER_PER_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_PER_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_per_parents),	\
 	.parents =3D bcm2835_clock_per_parents,				\
 	__VA_ARGS__)
@@ -1522,7 +1533,8 @@ static const char *const bcm2835_pcm_per_parents[] =
=3D {
 	"-",
 };

-#define REGISTER_PCM_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_PCM_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_pcm_per_parents),		\
 	.parents =3D bcm2835_pcm_per_parents,				\
 	__VA_ARGS__)
@@ -1541,7 +1553,8 @@ static const char *const bcm2835_clock_vpu_parents[]=
 =3D {
 	"pllc_core2",
 };

-#define REGISTER_VPU_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_VPU_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_vpu_parents),	\
 	.parents =3D bcm2835_clock_vpu_parents,				\
 	__VA_ARGS__)
@@ -1577,12 +1590,14 @@ static const char *const bcm2835_clock_dsi1_parent=
s[] =3D {
 	"dsi1_byte_inv",
 };

-#define REGISTER_DSI0_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_DSI0_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_dsi0_parents),	\
 	.parents =3D bcm2835_clock_dsi0_parents,				\
 	__VA_ARGS__)

-#define REGISTER_DSI1_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_DSI1_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_dsi1_parents),	\
 	.parents =3D bcm2835_clock_dsi1_parents,				\
 	__VA_ARGS__)
@@ -1602,6 +1617,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLA]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "plla",
 		.cm_ctrl_reg =3D CM_PLLA,
 		.a2w_ctrl_reg =3D A2W_PLLA_CTRL,
@@ -1616,6 +1632,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 2400000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLA_CORE]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_core",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1625,6 +1642,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLA_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_per",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1634,6 +1652,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLA_DSI0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_dsi0",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1642,6 +1661,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.hold_mask =3D CM_PLLA_HOLDDSI0,
 		.fixed_divider =3D 1),
 	[BCM2835_PLLA_CCP2]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_ccp2",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1663,6 +1683,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLC]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "pllc",
 		.cm_ctrl_reg =3D CM_PLLC,
 		.a2w_ctrl_reg =3D A2W_PLLC_CTRL,
@@ -1677,6 +1698,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 3000000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLC_CORE0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core0",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1686,6 +1708,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_CORE1]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core1",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1695,6 +1718,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_CORE2]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core2",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1704,6 +1728,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_per",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1720,6 +1745,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLD]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "plld",
 		.cm_ctrl_reg =3D CM_PLLD,
 		.a2w_ctrl_reg =3D A2W_PLLD_CTRL,
@@ -1734,6 +1760,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 2400000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLD_CORE]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_core",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1743,6 +1770,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_per",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1752,6 +1780,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_DSI0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_dsi0",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1760,6 +1789,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.hold_mask =3D CM_PLLD_HOLDDSI0,
 		.fixed_divider =3D 1),
 	[BCM2835_PLLD_DSI1]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_dsi1",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1775,6 +1805,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * It is in the HDMI power domain.
 	 */
 	[BCM2835_PLLH]		=3D REGISTER_PLL(
+		SOC_ALL,
 		"pllh",
 		.cm_ctrl_reg =3D CM_PLLH,
 		.a2w_ctrl_reg =3D A2W_PLLH_CTRL,
@@ -1789,6 +1820,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 3000000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLH_RCAL]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllh_rcal",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1798,6 +1830,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 10,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLH_AUX]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllh_aux",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1807,6 +1840,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLH_PIX]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllh_pix",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1822,6 +1856,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* One Time Programmable Memory clock.  Maximum 10Mhz. */
 	[BCM2835_CLOCK_OTP]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "otp",
 		.ctl_reg =3D CM_OTPCTL,
 		.div_reg =3D CM_OTPDIV,
@@ -1833,6 +1868,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * bythe watchdog timer and the camera pulse generator.
 	 */
 	[BCM2835_CLOCK_TIMER]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "timer",
 		.ctl_reg =3D CM_TIMERCTL,
 		.div_reg =3D CM_TIMERDIV,
@@ -1843,12 +1879,14 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
 	 * Generally run at 2Mhz, max 5Mhz.
 	 */
 	[BCM2835_CLOCK_TSENS]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "tsens",
 		.ctl_reg =3D CM_TSENSCTL,
 		.div_reg =3D CM_TSENSDIV,
 		.int_bits =3D 5,
 		.frac_bits =3D 0),
 	[BCM2835_CLOCK_TEC]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "tec",
 		.ctl_reg =3D CM_TECCTL,
 		.div_reg =3D CM_TECDIV,
@@ -1857,6 +1895,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* clocks with vpu parent mux */
 	[BCM2835_CLOCK_H264]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "h264",
 		.ctl_reg =3D CM_H264CTL,
 		.div_reg =3D CM_H264DIV,
@@ -1864,6 +1903,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 1),
 	[BCM2835_CLOCK_ISP]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "isp",
 		.ctl_reg =3D CM_ISPCTL,
 		.div_reg =3D CM_ISPDIV,
@@ -1876,6 +1916,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * in the SDRAM controller can't be used.
 	 */
 	[BCM2835_CLOCK_SDRAM]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "sdram",
 		.ctl_reg =3D CM_SDCCTL,
 		.div_reg =3D CM_SDCDIV,
@@ -1883,6 +1924,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 3),
 	[BCM2835_CLOCK_V3D]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "v3d",
 		.ctl_reg =3D CM_V3DCTL,
 		.div_reg =3D CM_V3DDIV,
@@ -1896,6 +1938,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * in various hardware documentation.
 	 */
 	[BCM2835_CLOCK_VPU]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "vpu",
 		.ctl_reg =3D CM_VPUCTL,
 		.div_reg =3D CM_VPUDIV,
@@ -1907,6 +1950,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* clocks with per parent mux */
 	[BCM2835_CLOCK_AVEO]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "aveo",
 		.ctl_reg =3D CM_AVEOCTL,
 		.div_reg =3D CM_AVEODIV,
@@ -1914,6 +1958,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 38),
 	[BCM2835_CLOCK_CAM0]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "cam0",
 		.ctl_reg =3D CM_CAM0CTL,
 		.div_reg =3D CM_CAM0DIV,
@@ -1921,6 +1966,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 14),
 	[BCM2835_CLOCK_CAM1]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "cam1",
 		.ctl_reg =3D CM_CAM1CTL,
 		.div_reg =3D CM_CAM1DIV,
@@ -1928,12 +1974,14 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 15),
 	[BCM2835_CLOCK_DFT]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dft",
 		.ctl_reg =3D CM_DFTCTL,
 		.div_reg =3D CM_DFTDIV,
 		.int_bits =3D 5,
 		.frac_bits =3D 0),
 	[BCM2835_CLOCK_DPI]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dpi",
 		.ctl_reg =3D CM_DPICTL,
 		.div_reg =3D CM_DPIDIV,
@@ -1943,6 +1991,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* Arasan EMMC clock */
 	[BCM2835_CLOCK_EMMC]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "emmc",
 		.ctl_reg =3D CM_EMMCCTL,
 		.div_reg =3D CM_EMMCDIV,
@@ -1952,6 +2001,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* General purpose (GPIO) clocks */
 	[BCM2835_CLOCK_GP0]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp0",
 		.ctl_reg =3D CM_GP0CTL,
 		.div_reg =3D CM_GP0DIV,
@@ -1960,6 +2010,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 20),
 	[BCM2835_CLOCK_GP1]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp1",
 		.ctl_reg =3D CM_GP1CTL,
 		.div_reg =3D CM_GP1DIV,
@@ -1969,6 +2020,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 21),
 	[BCM2835_CLOCK_GP2]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp2",
 		.ctl_reg =3D CM_GP2CTL,
 		.div_reg =3D CM_GP2DIV,
@@ -1978,6 +2030,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* HDMI state machine */
 	[BCM2835_CLOCK_HSM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "hsm",
 		.ctl_reg =3D CM_HSMCTL,
 		.div_reg =3D CM_HSMDIV,
@@ -1985,6 +2038,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 22),
 	[BCM2835_CLOCK_PCM]	=3D REGISTER_PCM_CLK(
+		SOC_ALL,
 		.name =3D "pcm",
 		.ctl_reg =3D CM_PCMCTL,
 		.div_reg =3D CM_PCMDIV,
@@ -1994,6 +2048,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.low_jitter =3D true,
 		.tcnt_mux =3D 23),
 	[BCM2835_CLOCK_PWM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "pwm",
 		.ctl_reg =3D CM_PWMCTL,
 		.div_reg =3D CM_PWMDIV,
@@ -2002,6 +2057,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 24),
 	[BCM2835_CLOCK_SLIM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "slim",
 		.ctl_reg =3D CM_SLIMCTL,
 		.div_reg =3D CM_SLIMDIV,
@@ -2010,6 +2066,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 25),
 	[BCM2835_CLOCK_SMI]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "smi",
 		.ctl_reg =3D CM_SMICTL,
 		.div_reg =3D CM_SMIDIV,
@@ -2017,6 +2074,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 27),
 	[BCM2835_CLOCK_UART]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "uart",
 		.ctl_reg =3D CM_UARTCTL,
 		.div_reg =3D CM_UARTDIV,
@@ -2026,6 +2084,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* TV encoder clock.  Only operating frequency is 108Mhz.  */
 	[BCM2835_CLOCK_VEC]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "vec",
 		.ctl_reg =3D CM_VECCTL,
 		.div_reg =3D CM_VECDIV,
@@ -2040,6 +2099,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* dsi clocks */
 	[BCM2835_CLOCK_DSI0E]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dsi0e",
 		.ctl_reg =3D CM_DSI0ECTL,
 		.div_reg =3D CM_DSI0EDIV,
@@ -2047,6 +2107,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 18),
 	[BCM2835_CLOCK_DSI1E]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dsi1e",
 		.ctl_reg =3D CM_DSI1ECTL,
 		.div_reg =3D CM_DSI1EDIV,
@@ -2054,6 +2115,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 19),
 	[BCM2835_CLOCK_DSI0P]	=3D REGISTER_DSI0_CLK(
+		SOC_ALL,
 		.name =3D "dsi0p",
 		.ctl_reg =3D CM_DSI0PCTL,
 		.div_reg =3D CM_DSI0PDIV,
@@ -2061,6 +2123,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 12),
 	[BCM2835_CLOCK_DSI1P]	=3D REGISTER_DSI1_CLK(
+		SOC_ALL,
 		.name =3D "dsi1p",
 		.ctl_reg =3D CM_DSI1PCTL,
 		.div_reg =3D CM_DSI1PDIV,
@@ -2077,6 +2140,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * non-stop vpu clock.
 	 */
 	[BCM2835_CLOCK_PERI_IMAGE] =3D REGISTER_GATE(
+		SOC_ALL,
 		.name =3D "peri_image",
 		.parent =3D "vpu",
 		.ctl_reg =3D CM_PERIICTL),
@@ -2109,9 +2173,14 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)
 	struct resource *res;
 	const struct bcm2835_clk_desc *desc;
 	const size_t asize =3D ARRAY_SIZE(clk_desc_array);
+	unsigned int soc;
 	size_t i;
 	int ret;

+	soc =3D (unsigned int)of_device_get_match_data(&pdev->dev);
+	if (!soc)
+		return -ENODEV;
+
 	cprman =3D devm_kzalloc(dev,
 			      struct_size(cprman, onecell.hws, asize),
 			      GFP_KERNEL);
@@ -2147,7 +2216,7 @@ static int bcm2835_clk_probe(struct platform_device =
*pdev)

 	for (i =3D 0; i < asize; i++) {
 		desc =3D &clk_desc_array[i];
-		if (desc->clk_register && desc->data)
+		if (desc->clk_register && desc->data && (desc->supported & soc))
 			hws[i] =3D desc->clk_register(cprman, desc->data);
 	}

@@ -2160,7 +2229,7 @@ static int bcm2835_clk_probe(struct platform_device =
*pdev)
 }

 static const struct of_device_id bcm2835_clk_of_match[] =3D {
-	{ .compatible =3D "brcm,bcm2835-cprman", },
+	{ .compatible =3D "brcm,bcm2835-cprman", .data =3D (void *)SOC_BCM2835 }=
,
 	{}
 };
 MODULE_DEVICE_TABLE(of, bcm2835_clk_of_match);
=2D-
2.7.4

