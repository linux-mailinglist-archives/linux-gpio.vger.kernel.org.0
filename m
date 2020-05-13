Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720721D1365
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733013AbgEMM4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:56:17 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:41487 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbgEMM4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374575; x=1620910575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z3RtA3Is19gMLuQPixC7qZLhsQ/ltAtQlKTqxZJF4kc=;
  b=ojoNBcdFjwObnjL0HOqbNOrH51SzViNsZ+9gpZV7Y42CvkaJ9A9mcPB3
   pn0Nz+BB+ideeUHu8n6YH3UW9SJV05RHNlgE2Yn7i20N+iab2jwTXHf4P
   1yGzTUNCUjszYDDyYfli0/eujJNuv8wYkyUpV9Y4DTLaq48X+A094jMbD
   wyiptExhTZB1fKrplwnXabUFAODEyQ5AzL1r6d6X6RA8OKvj6IppFkS5U
   p2phRFqWed952seyhzsADn+xFJP5Hv7KKMDrer7ZRfzB+YPNJZKZGveSM
   LtiQKaBN28k/VHf8rlCuiaFNPr9eOZ8lCA/aTGD9vQmp9Hec9maNzM+t4
   A==;
IronPort-SDR: lO6DOcnAhr84ZBSxSAxSdxBBd5w2TOugv8+G0o0Vq5kEETCRHS/5YLSTywa4ycsGzA1J4ByVAq
 0aS6FSaHetV7NqZ3WCeiHYIfI//XOXuyourN3Jp1z2/a1cSJLwCmZvqi2VGZ07o6j/1bUGyyOx
 SlYno5D6xVWWhZkAU6os1SH41UkBGaSEVxdsgvmUFQ9CA42JixTkKyJ3FJbtTLB1PEcJFqWcit
 3xoupXRGh9bPwFty1g3eLsZpsguJOLBYe/iTZXIn37JhtZSaRjGeiSLroSxuzed6U5uCtgLv6G
 fwI=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="79436261"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:56:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:56:14 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:11 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 02/14] pinctrl: ocelot: Remove instance number from pin functions
Date:   Wed, 13 May 2020 14:55:20 +0200
Message-ID: <20200513125532.24585-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch removes the instance number from the "miim", "reco_clk" and
"sfp" pin function.

The change needed is to prepare the driver for adding new platforms
with more of these instances. The instance number is also redundant,
as this is implicit for each pin.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 94 ++++++++++----------------------
 1 file changed, 30 insertions(+), 64 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index d4ac65b1efc0b..375f3ea3b80c4 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -46,32 +46,15 @@ enum {
 	FUNC_IRQ0_OUT,
 	FUNC_IRQ1_IN,
 	FUNC_IRQ1_OUT,
-	FUNC_MIIM1,
-	FUNC_MIIM2,
+	FUNC_MIIM,
 	FUNC_PCI_WAKE,
 	FUNC_PTP0,
 	FUNC_PTP1,
 	FUNC_PTP2,
 	FUNC_PTP3,
 	FUNC_PWM,
-	FUNC_RECO_CLK0,
-	FUNC_RECO_CLK1,
-	FUNC_SFP0,
-	FUNC_SFP1,
-	FUNC_SFP2,
-	FUNC_SFP3,
-	FUNC_SFP4,
-	FUNC_SFP5,
-	FUNC_SFP6,
-	FUNC_SFP7,
-	FUNC_SFP8,
-	FUNC_SFP9,
-	FUNC_SFP10,
-	FUNC_SFP11,
-	FUNC_SFP12,
-	FUNC_SFP13,
-	FUNC_SFP14,
-	FUNC_SFP15,
+	FUNC_RECO_CLK,
+	FUNC_SFP,
 	FUNC_SG0,
 	FUNC_SG1,
 	FUNC_SG2,
@@ -92,32 +75,15 @@ static const char *const ocelot_function_names[] = {
 	[FUNC_IRQ0_OUT]		= "irq0_out",
 	[FUNC_IRQ1_IN]		= "irq1_in",
 	[FUNC_IRQ1_OUT]		= "irq1_out",
-	[FUNC_MIIM1]		= "miim1",
-	[FUNC_MIIM2]		= "miim2",
+	[FUNC_MIIM]		= "miim",
 	[FUNC_PCI_WAKE]		= "pci_wake",
 	[FUNC_PTP0]		= "ptp0",
 	[FUNC_PTP1]		= "ptp1",
 	[FUNC_PTP2]		= "ptp2",
 	[FUNC_PTP3]		= "ptp3",
 	[FUNC_PWM]		= "pwm",
-	[FUNC_RECO_CLK0]	= "reco_clk0",
-	[FUNC_RECO_CLK1]	= "reco_clk1",
-	[FUNC_SFP0]		= "sfp0",
-	[FUNC_SFP1]		= "sfp1",
-	[FUNC_SFP2]		= "sfp2",
-	[FUNC_SFP3]		= "sfp3",
-	[FUNC_SFP4]		= "sfp4",
-	[FUNC_SFP5]		= "sfp5",
-	[FUNC_SFP6]		= "sfp6",
-	[FUNC_SFP7]		= "sfp7",
-	[FUNC_SFP8]		= "sfp8",
-	[FUNC_SFP9]		= "sfp9",
-	[FUNC_SFP10]		= "sfp10",
-	[FUNC_SFP11]		= "sfp11",
-	[FUNC_SFP12]		= "sfp12",
-	[FUNC_SFP13]		= "sfp13",
-	[FUNC_SFP14]		= "sfp14",
-	[FUNC_SFP15]		= "sfp15",
+	[FUNC_RECO_CLK]		= "reco_clk",
+	[FUNC_SFP]		= "sfp",
 	[FUNC_SG0]		= "sg0",
 	[FUNC_SG1]		= "sg1",
 	[FUNC_SG2]		= "sg2",
@@ -168,18 +134,18 @@ OCELOT_P(6,  UART,      TWI_SCL_M, NONE);
 OCELOT_P(7,  UART,      TWI_SCL_M, NONE);
 OCELOT_P(8,  SI,        TWI_SCL_M, IRQ0_OUT);
 OCELOT_P(9,  SI,        TWI_SCL_M, IRQ1_OUT);
-OCELOT_P(10, PTP2,      TWI_SCL_M, SFP0);
-OCELOT_P(11, PTP3,      TWI_SCL_M, SFP1);
-OCELOT_P(12, UART2,     TWI_SCL_M, SFP2);
-OCELOT_P(13, UART2,     TWI_SCL_M, SFP3);
-OCELOT_P(14, MIIM1,     TWI_SCL_M, SFP4);
-OCELOT_P(15, MIIM1,     TWI_SCL_M, SFP5);
+OCELOT_P(10, PTP2,      TWI_SCL_M, SFP);
+OCELOT_P(11, PTP3,      TWI_SCL_M, SFP);
+OCELOT_P(12, UART2,     TWI_SCL_M, SFP);
+OCELOT_P(13, UART2,     TWI_SCL_M, SFP);
+OCELOT_P(14, MIIM,      TWI_SCL_M, SFP);
+OCELOT_P(15, MIIM,      TWI_SCL_M, SFP);
 OCELOT_P(16, TWI,       NONE,      SI);
 OCELOT_P(17, TWI,       TWI_SCL_M, SI);
 OCELOT_P(18, PTP0,      TWI_SCL_M, NONE);
 OCELOT_P(19, PTP1,      TWI_SCL_M, NONE);
-OCELOT_P(20, RECO_CLK0, TACHO,     NONE);
-OCELOT_P(21, RECO_CLK1, PWM,       NONE);
+OCELOT_P(20, RECO_CLK,  TACHO,     TWI_SCL_M);
+OCELOT_P(21, RECO_CLK,  PWM,       TWI_SCL_M);

 #define OCELOT_PIN(n) {						\
 	.number = n,						\
@@ -264,22 +230,22 @@ JAGUAR2_P(40, NONE,      TWI_SCL_M);
 JAGUAR2_P(41, NONE,      TWI_SCL_M);
 JAGUAR2_P(42, NONE,      TWI_SCL_M);
 JAGUAR2_P(43, NONE,      TWI_SCL_M);
-JAGUAR2_P(44, NONE,      SFP8);
-JAGUAR2_P(45, NONE,      SFP9);
-JAGUAR2_P(46, NONE,      SFP10);
-JAGUAR2_P(47, NONE,      SFP11);
-JAGUAR2_P(48, SFP0,      NONE);
-JAGUAR2_P(49, SFP1,      SI);
-JAGUAR2_P(50, SFP2,      SI);
-JAGUAR2_P(51, SFP3,      SI);
-JAGUAR2_P(52, SFP4,      NONE);
-JAGUAR2_P(53, SFP5,      NONE);
-JAGUAR2_P(54, SFP6,      NONE);
-JAGUAR2_P(55, SFP7,      NONE);
-JAGUAR2_P(56, MIIM1,     SFP12);
-JAGUAR2_P(57, MIIM1,     SFP13);
-JAGUAR2_P(58, MIIM2,     SFP14);
-JAGUAR2_P(59, MIIM2,     SFP15);
+JAGUAR2_P(44, NONE,      SFP);
+JAGUAR2_P(45, NONE,      SFP);
+JAGUAR2_P(46, NONE,      SFP);
+JAGUAR2_P(47, NONE,      SFP);
+JAGUAR2_P(48, SFP,       NONE);
+JAGUAR2_P(49, SFP,       SI);
+JAGUAR2_P(50, SFP,       SI);
+JAGUAR2_P(51, SFP,       SI);
+JAGUAR2_P(52, SFP,       NONE);
+JAGUAR2_P(53, SFP,       NONE);
+JAGUAR2_P(54, SFP,       NONE);
+JAGUAR2_P(55, SFP,       NONE);
+JAGUAR2_P(56, MIIM,      SFP);
+JAGUAR2_P(57, MIIM,      SFP);
+JAGUAR2_P(58, MIIM,      SFP);
+JAGUAR2_P(59, MIIM,      SFP);
 JAGUAR2_P(60, NONE,      NONE);
 JAGUAR2_P(61, NONE,      NONE);
 JAGUAR2_P(62, NONE,      NONE);
--
2.26.2
