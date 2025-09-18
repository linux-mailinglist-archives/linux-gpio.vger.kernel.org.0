Return-Path: <linux-gpio+bounces-25574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC35B438E4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 12:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DDAE1898989
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 10:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6152FAC06;
	Thu,  4 Sep 2025 10:35:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588532F8BD2;
	Thu,  4 Sep 2025 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756982122; cv=none; b=O8eFeUzsQe/36MoSgy29v+k6cF9V2zu8rAa1/G8bDvIAqkLLew4ZsgsPZc25uk4hJdN8SeYzFgBhwxpSFTBrNTFgiOg1H2mvA9QAaxdNUWtKkv2EMf0leLEtBfz3YZbV/5O3WByjGY0Gn09KLRt9MHv5trx62koyh7tMFbOQaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756982122; c=relaxed/simple;
	bh=ffAvMDxfp/3OMsfY43zORUVJSBt0hqNhLy+UrkxaP0E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OcZT3v0kix6lTOeGOGDfDEynYsmfmlEwfazijkiUOF15FQfFSWIdm2kJXyv0UvJ+Fu9MoWX0c0Mt5dE7qebT6W0PE7FuYQm4/5CS0nfw4kYRjRlc7ABlPTJG3DfNppT6QdowREfLr/cJn3VsBfosoE7EYhToGSQinF9cTEh9cVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 4 Sep
 2025 18:34:02 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 4 Sep 2025 18:34:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
Date: Thu, 4 Sep 2025 18:34:00 +0800
Message-ID: <20250904103401.88287-4-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch adds pinmux support for the AST2700, which includes two SoC
configurations:
- SoC0 closely resembles previous generations of ASPEED BMC SoCs, allowing
  the reuse of existing macros and callback functions.
- SoC1, however, introduces a new logic for configuring pin functions.
  Therefore, new g7_set_mux and gpio_request_enable functions are
  implemented to properly configure the pinctrl registers using the
  pin_cfg table and to resolve GPIO request errors.

The driver supports:
- All 12 GPIO-capable pins in SoC0
- All 212 GPIO-capable pins in SoC1

Additionally, this patch introduces several pseudo-ball definitions for
specific configuration purposes:
- USB function selection
- JTAG target selection
- PCIe RC PERST configuration
- SGMII PHY selection

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
 7 files changed, 3123 insertions(+), 5 deletions(-)
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kconfig
index 1a4e5b9ed471..16743091a139 100644
--- a/drivers/pinctrl/aspeed/Kconfig
+++ b/drivers/pinctrl/aspeed/Kconfig
@@ -31,3 +31,11 @@ config PINCTRL_ASPEED_G6
 	help
 	  Say Y here to enable pin controller support for Aspeed's 6th
 	  generation SoCs. GPIO is provided by a separate GPIO driver.
+
+config PINCTRL_ASPEED_G7
+	bool "Aspeed G7 SoC pin control"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && OF
+	select PINCTRL_ASPEED
+	help
+	  Say Y here to enable pin controller support for Aspeed's 7th
+	  generation SoCs. GPIO is provided by a separate GPIO driver.
diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Makefile
index db2a7600ae2b..1713f678a984 100644
--- a/drivers/pinctrl/aspeed/Makefile
+++ b/drivers/pinctrl/aspeed/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_PINCTRL_ASPEED)	+= pinctrl-aspeed.o pinmux-aspeed.o
 obj-$(CONFIG_PINCTRL_ASPEED_G4)	+= pinctrl-aspeed-g4.o
 obj-$(CONFIG_PINCTRL_ASPEED_G5)	+= pinctrl-aspeed-g5.o
 obj-$(CONFIG_PINCTRL_ASPEED_G6)	+= pinctrl-aspeed-g6.o
+obj-$(CONFIG_PINCTRL_ASPEED_G7) += pinctrl-aspeed-g7-soc0.o pinctrl-aspeed-g7-soc1.o
\ No newline at end of file
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
new file mode 100644
index 000000000000..86da889cc010
--- /dev/null
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include "pinctrl-aspeed.h"
+#include "../pinctrl-utils.h"
+
+#define SCU200 0x200 /* System Reset Control #1  */
+
+#define SCU400 0x400 /* Multi-function Pin Control #1  */
+#define SCU404 0x404 /* Multi-function Pin Control #2  */
+#define SCU408 0x408 /* Multi-function Pin Control #3  */
+#define SCU40C 0x40C /* Multi-function Pin Control #3  */
+#define SCU410 0x410 /* USB Multi-function Control Register  */
+#define SCU414 0x414 /* VGA Function Control Register  */
+
+#define SCU480 0x480 /* GPIO18A0 IO Control Register */
+#define SCU484 0x484 /* GPIO18A1 IO Control Register */
+#define SCU488 0x488 /* GPIO18A2 IO Control Register */
+#define SCU48C 0x48c /* GPIO18A3 IO Control Register */
+#define SCU490 0x490 /* GPIO18A4 IO Control Register */
+#define SCU494 0x494 /* GPIO18A5 IO Control Register */
+#define SCU498 0x498 /* GPIO18A6 IO Control Register */
+#define SCU49C 0x49c /* GPIO18A7 IO Control Register */
+#define SCU4A0 0x4A0 /* GPIO18B0 IO Control Register */
+#define SCU4A4 0x4A4 /* GPIO18B1 IO Control Register */
+#define SCU4A8 0x4A8 /* GPIO18B2 IO Control Register */
+#define SCU4AC 0x4AC /* GPIO18B3 IO Control Register */
+
+enum {
+	AC14,
+	AE15,
+	AD14,
+	AE14,
+	AF14,
+	AB13,
+	AB14,
+	AF15,
+	AF13,
+	AC13,
+	AD13,
+	AE13,
+	PORTA_U3, // SCU410[1:0]
+	PORTA_U2, // SCU410[3:2]
+	PORTB_U3, // SCU410[5:4]
+	PORTB_U2, // SCU410[7:6]
+	PORTA_U3_XHCI, // SCU410[9]
+	PORTA_U2_XHCI, // SCU410[9]
+	PORTB_U3_XHCI, // SCU410[10]
+	PORTB_U2_XHCI, // SCU410[10]
+	PORTA_MODE, // SCU410[25:24]
+	PORTB_MODE, // SCU410[29:28]
+	PORTA_U2_PHY,
+	PORTA_U3_PHY,
+	PORTB_U2_PHY,
+	PORTB_U3_PHY,
+	JTAG_PORT,
+	PCIERC0_PERST,
+	PCIERC1_PERST,
+};
+
+GROUP_DECL(EMMCG1, AC14, AE15, AD14);
+GROUP_DECL(EMMCG4, AC14, AE15, AD14, AE14, AF14, AB13);
+GROUP_DECL(EMMCG8, AC14, AE15, AD14, AE14, AF14, AB13, AF13, AC13, AD13, AE13);
+GROUP_DECL(EMMCWPN, AF15);
+GROUP_DECL(EMMCCDN, AB14);
+GROUP_DECL(VGADDC, AD13, AE13);
+GROUP_DECL(VB1, AC14, AE15, AD14, AE14);
+GROUP_DECL(VB0, AF15, AB14, AF13, AC13);
+//USB3A
+//xhci: BMC/PCIE, vHub/PHY/EXT port
+GROUP_DECL(USB3AXHD, PORTA_U3, PORTA_U3_XHCI);
+GROUP_DECL(USB3AXHPD, PORTA_U3, PORTA_U3_XHCI);
+GROUP_DECL(USB3AXH, PORTA_U3, PORTA_U3_XHCI, PORTA_U3_PHY);
+GROUP_DECL(USB3AXHP, PORTA_U3, PORTA_U3_XHCI, PORTA_U3_PHY);
+GROUP_DECL(USB3AXH2B, PORTA_U3, PORTA_U3_XHCI, PORTB_U3_PHY);
+GROUP_DECL(USB3AXHP2B, PORTA_U3, PORTA_U3_XHCI, PORTB_U3_PHY);
+
+//USB2A
+//xhci: BMC/PCIE, vHub/PHY/EXT port
+GROUP_DECL(USB2AXHD1, PORTA_U2, PORTA_U2_XHCI);
+GROUP_DECL(USB2AXHPD1, PORTA_U2, PORTA_U2_XHCI);
+GROUP_DECL(USB2AXH, PORTA_U2, PORTA_U2_XHCI, PORTA_U2_PHY);
+GROUP_DECL(USB2AXHP, PORTA_U2, PORTA_U2_XHCI, PORTA_U2_PHY);
+GROUP_DECL(USB2AXH2B, PORTA_U2, PORTA_U2_XHCI, PORTB_U2_PHY);
+GROUP_DECL(USB2AXHP2B, PORTA_U2, PORTA_U2_XHCI, PORTB_U2_PHY);
+// vhub to phy
+GROUP_DECL(USB2AD1, PORTA_U2, PORTA_U2_PHY);
+//ehci
+GROUP_DECL(USB2AHPD0, PORTA_MODE);
+GROUP_DECL(USB2AH, PORTA_MODE, PORTA_U2_PHY);
+GROUP_DECL(USB2AHP, PORTA_MODE, PORTA_U2_PHY);
+GROUP_DECL(USB2AD0, PORTA_MODE, PORTA_U2_PHY);
+
+//USB3B
+//xhci: BMC/PCIE, vHub/PHY/EXT port
+GROUP_DECL(USB3BXHD, PORTB_U3, PORTB_U3_XHCI);
+GROUP_DECL(USB3BXHPD, PORTB_U3, PORTB_U3_XHCI);
+GROUP_DECL(USB3BXH, PORTB_U3, PORTB_U3_XHCI, PORTB_U3_PHY);
+GROUP_DECL(USB3BXHP, PORTB_U3, PORTB_U3_XHCI, PORTB_U3_PHY);
+GROUP_DECL(USB3BXH2A, PORTB_U3, PORTB_U3_XHCI, PORTA_U3_PHY);
+GROUP_DECL(USB3BXHP2A, PORTB_U3, PORTB_U3_XHCI, PORTA_U3_PHY);
+
+//USB2B
+//xhci: BMC/PCIE, vHub/PHY/EXT port
+GROUP_DECL(USB2BXHD1, PORTB_U2, PORTB_U2_XHCI);
+GROUP_DECL(USB2BXHPD1, PORTB_U2, PORTB_U2_XHCI);
+GROUP_DECL(USB2BXH, PORTB_U2, PORTB_U2_XHCI, PORTB_U2_PHY);
+GROUP_DECL(USB2BXHP, PORTB_U2, PORTB_U2_XHCI, PORTB_U2_PHY);
+GROUP_DECL(USB2BXH2A, PORTB_U2, PORTB_U2_XHCI, PORTA_U2_PHY);
+GROUP_DECL(USB2BXHP2A, PORTB_U2, PORTB_U2_XHCI, PORTA_U2_PHY);
+// vhub to phy
+GROUP_DECL(USB2BD1, PORTB_U2, PORTB_U2_PHY);
+//ehci
+GROUP_DECL(USB2BHPD0, PORTB_MODE);
+GROUP_DECL(USB2BH, PORTB_MODE, PORTB_U2_PHY);
+GROUP_DECL(USB2BHP, PORTB_MODE, PORTB_U2_PHY);
+GROUP_DECL(USB2BD0, PORTB_MODE, PORTB_U2_PHY);
+//JTAG port
+GROUP_DECL(PSP, JTAG_PORT);
+GROUP_DECL(SSP, JTAG_PORT);
+GROUP_DECL(TSP, JTAG_PORT);
+GROUP_DECL(DDR, JTAG_PORT);
+GROUP_DECL(USB3A, JTAG_PORT);
+GROUP_DECL(USB3B, JTAG_PORT);
+GROUP_DECL(PCIEA, JTAG_PORT);
+GROUP_DECL(PCIEB, JTAG_PORT);
+GROUP_DECL(JTAGM0, JTAG_PORT);
+//PCIE RC PERST
+GROUP_DECL(PCIERC0PERST, PCIERC0_PERST);
+GROUP_DECL(PCIERC1PERST, PCIERC1_PERST);
+
+static struct aspeed_pin_group aspeed_g7_soc0_pingroups[] = {
+	ASPEED_PINCTRL_GROUP(EMMCG1),
+	ASPEED_PINCTRL_GROUP(EMMCG4),
+	ASPEED_PINCTRL_GROUP(EMMCG8),
+	ASPEED_PINCTRL_GROUP(EMMCWPN),
+	ASPEED_PINCTRL_GROUP(EMMCCDN),
+	ASPEED_PINCTRL_GROUP(VGADDC),
+	ASPEED_PINCTRL_GROUP(VB1),
+	ASPEED_PINCTRL_GROUP(VB0),
+	ASPEED_PINCTRL_GROUP(USB3AXHD),
+	ASPEED_PINCTRL_GROUP(USB3AXHPD),
+	ASPEED_PINCTRL_GROUP(USB3AXH),
+	ASPEED_PINCTRL_GROUP(USB3AXHP),
+	ASPEED_PINCTRL_GROUP(USB3AXH2B),
+	ASPEED_PINCTRL_GROUP(USB3AXHP2B),
+	ASPEED_PINCTRL_GROUP(USB2AXHD1),
+	ASPEED_PINCTRL_GROUP(USB2AXHPD1),
+	ASPEED_PINCTRL_GROUP(USB2AXH),
+	ASPEED_PINCTRL_GROUP(USB2AXHP),
+	ASPEED_PINCTRL_GROUP(USB2AXH2B),
+	ASPEED_PINCTRL_GROUP(USB2AXHP2B),
+	ASPEED_PINCTRL_GROUP(USB2AD1),
+	ASPEED_PINCTRL_GROUP(USB2AHPD0),
+	ASPEED_PINCTRL_GROUP(USB2AH),
+	ASPEED_PINCTRL_GROUP(USB2AHP),
+	ASPEED_PINCTRL_GROUP(USB2AD0),
+	ASPEED_PINCTRL_GROUP(USB3BXHD),
+	ASPEED_PINCTRL_GROUP(USB3BXHPD),
+	ASPEED_PINCTRL_GROUP(USB3BXH),
+	ASPEED_PINCTRL_GROUP(USB3BXHP),
+	ASPEED_PINCTRL_GROUP(USB3BXH2A),
+	ASPEED_PINCTRL_GROUP(USB3BXHP2A),
+	ASPEED_PINCTRL_GROUP(USB2BXHD1),
+	ASPEED_PINCTRL_GROUP(USB2BXHPD1),
+	ASPEED_PINCTRL_GROUP(USB2BXH),
+	ASPEED_PINCTRL_GROUP(USB2BXHP),
+	ASPEED_PINCTRL_GROUP(USB2BXH2A),
+	ASPEED_PINCTRL_GROUP(USB2BXHP2A),
+	ASPEED_PINCTRL_GROUP(USB2BD1),
+	ASPEED_PINCTRL_GROUP(USB2BHPD0),
+	ASPEED_PINCTRL_GROUP(USB2BH),
+	ASPEED_PINCTRL_GROUP(USB2BHP),
+	ASPEED_PINCTRL_GROUP(USB2BD0),
+	ASPEED_PINCTRL_GROUP(PSP),
+	ASPEED_PINCTRL_GROUP(SSP),
+	ASPEED_PINCTRL_GROUP(TSP),
+	ASPEED_PINCTRL_GROUP(DDR),
+	ASPEED_PINCTRL_GROUP(USB3A),
+	ASPEED_PINCTRL_GROUP(USB3B),
+	ASPEED_PINCTRL_GROUP(PCIEA),
+	ASPEED_PINCTRL_GROUP(PCIEB),
+	ASPEED_PINCTRL_GROUP(JTAGM0),
+	ASPEED_PINCTRL_GROUP(PCIERC0PERST),
+	ASPEED_PINCTRL_GROUP(PCIERC1PERST),
+};
+
+FUNC_DECL_(EMMC, "EMMCG1", "EMMCG4", "EMMCG8", "EMMCWPN", "EMMCCDN");
+FUNC_DECL_(VGADDC, "VGADDC");
+FUNC_DECL_(VB, "VB0", "VB1");
+FUNC_DECL_(USB3A, "USB3AXHD", "USB3AXHPD", "USB3AXH", "USB3AXHP", "USB3AXH2B",
+	   "USB3AXHP2B");
+FUNC_DECL_(USB2A, "USB2AXHD1", "USB2AXHPD1", "USB2AXH", "USB2AXHP", "USB2AXH2B",
+	   "USB2AXHP2B", "USB2AD1", "USB2AHPD0", "USB2AH", "USB2AHP",
+	   "USB2AD0");
+FUNC_DECL_(USB3B, "USB3BXHD", "USB3BXHPD", "USB3BXH", "USB3BXHP", "USB3BXH2A",
+	   "USB3BXHP2A");
+FUNC_DECL_(USB2B, "USB2BXHD1", "USB2BXHPD1", "USB2BXH", "USB2BXHP", "USB2BXH2A",
+	   "USB2BXHP2A", "USB2BD1", "USB2BHPD0", "USB2BH", "USB2BHP",
+	   "USB2BD0");
+FUNC_DECL_(JTAG0, "PSP", "SSP", "TSP", "DDR", "USB3A", "USB3B",
+	   "PCIEA", "PCIEB", "JTAGM0");
+FUNC_DECL_(PCIERC, "PCIERC0PERST", "PCIERC1PERST");
+
+static struct aspeed_pin_function aspeed_g7_soc0_funcs[] = {
+	ASPEED_PINCTRL_FUNC(EMMC),
+	ASPEED_PINCTRL_FUNC(VGADDC),
+	ASPEED_PINCTRL_FUNC(VB),
+	ASPEED_PINCTRL_FUNC(USB3A),
+	ASPEED_PINCTRL_FUNC(USB2A),
+	ASPEED_PINCTRL_FUNC(USB3B),
+	ASPEED_PINCTRL_FUNC(USB2B),
+	ASPEED_PINCTRL_FUNC(JTAG0),
+	ASPEED_PINCTRL_FUNC(PCIERC),
+};
+
+static const struct pinctrl_pin_desc aspeed_g7_soc0_pins[] = {
+	PINCTRL_PIN(AC14, "AC14"),
+	PINCTRL_PIN(AE15, "AE15"),
+	PINCTRL_PIN(AD14, "AD14"),
+	PINCTRL_PIN(AE14, "AE14"),
+	PINCTRL_PIN(AF14, "AF14"),
+	PINCTRL_PIN(AB13, "AB13"),
+	PINCTRL_PIN(AF15, "AF15"),
+	PINCTRL_PIN(AB14, "AB14"),
+	PINCTRL_PIN(AF13, "AF13"),
+	PINCTRL_PIN(AC13, "AC13"),
+	PINCTRL_PIN(AD13, "AD13"),
+	PINCTRL_PIN(AE13, "AE13"),
+	PINCTRL_PIN(PORTA_U3, "PORTA_U3"),
+	PINCTRL_PIN(PORTA_U2, "PORTA_U2"),
+	PINCTRL_PIN(PORTB_U3, "PORTB_U3"),
+	PINCTRL_PIN(PORTB_U2, "PORTB_U2"),
+	PINCTRL_PIN(PORTA_U3_XHCI, "PORTA_U3_XHCI"),
+	PINCTRL_PIN(PORTA_U2_XHCI, "PORTA_U2_XHCI"),
+	PINCTRL_PIN(PORTB_U3_XHCI, "PORTB_U3_XHCI"),
+	PINCTRL_PIN(PORTB_U2_XHCI, "PORTB_U2_XHCI"),
+	PINCTRL_PIN(PORTA_MODE, "PORTA_MODE"),
+	PINCTRL_PIN(PORTA_U3_PHY, "PORTA_U3_PHY"),
+	PINCTRL_PIN(PORTA_U2_PHY, "PORTA_U2_PHY"),
+	PINCTRL_PIN(PORTB_MODE, "PORTB_MODE"),
+	PINCTRL_PIN(PORTB_U3_PHY, "PORTB_U3_PHY"),
+	PINCTRL_PIN(PORTB_U2_PHY, "PORTB_U2_PHY"),
+	PINCTRL_PIN(JTAG_PORT, "JTAG_PORT"),
+	PINCTRL_PIN(PCIERC0_PERST, "PCIERC0_PERST"),
+	PINCTRL_PIN(PCIERC1_PERST, "PCIERC1_PERST"),
+};
+
+FUNCFG_DESCL(AC14, PIN_CFG(EMMCG1, SCU400, BIT_MASK(0), BIT(0)),
+	     PIN_CFG(EMMCG4, SCU400, BIT_MASK(0), BIT(0)),
+	     PIN_CFG(EMMCG8, SCU400, BIT_MASK(0), BIT(0)),
+	     PIN_CFG(VB1, SCU404, BIT_MASK(0), BIT(0)));
+FUNCFG_DESCL(AE15, PIN_CFG(EMMCG1, SCU400, BIT_MASK(1), BIT(1)),
+	     PIN_CFG(EMMCG4, SCU400, BIT_MASK(1), BIT(1)),
+	     PIN_CFG(EMMCG8, SCU400, BIT_MASK(1), BIT(1)),
+	     PIN_CFG(VB1, SCU404, BIT_MASK(1), BIT(1)));
+FUNCFG_DESCL(AD14, PIN_CFG(EMMCG1, SCU400, BIT_MASK(2), BIT(2)),
+	     PIN_CFG(EMMCG4, SCU400, BIT_MASK(2), BIT(2)),
+	     PIN_CFG(EMMCG8, SCU400, BIT_MASK(2), BIT(2)),
+	     PIN_CFG(VB1, SCU404, BIT_MASK(2), BIT(2)));
+FUNCFG_DESCL(AE14, PIN_CFG(EMMCG4, SCU400, BIT_MASK(3), BIT(3)),
+	     PIN_CFG(EMMCG8, SCU400, BIT_MASK(3), BIT(3)),
+	     PIN_CFG(VB1, SCU404, BIT_MASK(3), BIT(3)));
+FUNCFG_DESCL(AF14, PIN_CFG(EMMCG4, SCU400, BIT_MASK(4), BIT(4)),
+	     PIN_CFG(EMMCG8, SCU400, BIT_MASK(4), BIT(4)));
+FUNCFG_DESCL(AB13, PIN_CFG(EMMCG4, SCU400, BIT_MASK(5), BIT(5)),
+	     PIN_CFG(EMMCG8, SCU400, BIT_MASK(5), BIT(5)));
+FUNCFG_DESCL(AB14, PIN_CFG(EMMCCDN, SCU400, BIT_MASK(6), BIT(6)),
+	     PIN_CFG(VB0, SCU404, BIT_MASK(6), BIT(6)));
+FUNCFG_DESCL(AF15, PIN_CFG(EMMCWPN, SCU400, BIT_MASK(7), BIT(7)),
+	     PIN_CFG(VB0, SCU404, BIT_MASK(7), BIT(7)));
+FUNCFG_DESCL(AF13, PIN_CFG(EMMCG8, SCU400, BIT_MASK(8), BIT(8)),
+	     PIN_CFG(VB0, SCU404, BIT_MASK(8), BIT(8)));
+FUNCFG_DESCL(AC13, PIN_CFG(EMMCG8, SCU400, BIT_MASK(9), BIT(9)),
+	     PIN_CFG(VB0, SCU404, BIT_MASK(9), BIT(9)));
+FUNCFG_DESCL(AD13, PIN_CFG(EMMCG8, SCU400, BIT_MASK(10), BIT(10)),
+	     PIN_CFG(VGADDC, SCU404, BIT_MASK(10), BIT(10)));
+FUNCFG_DESCL(AE13, PIN_CFG(EMMCG8, SCU400, BIT_MASK(11), BIT(11)),
+	     PIN_CFG(VGADDC, SCU404, BIT_MASK(11), BIT(11)));
+FUNCFG_DESCL(PORTA_U3, PIN_CFG(USB3AXHD, SCU410, GENMASK(1, 0), 0),
+	     PIN_CFG(USB3AXHPD, SCU410, GENMASK(1, 0), 0),
+	     PIN_CFG(USB3AXH, SCU410, GENMASK(1, 0), 2),
+	     PIN_CFG(USB3AXHP, SCU410, GENMASK(1, 0), 2),
+	     PIN_CFG(USB3AXH2B, SCU410, GENMASK(1, 0), 3),
+	     PIN_CFG(USB3AXHP2B, SCU410, GENMASK(1, 0), 3));
+FUNCFG_DESCL(PORTA_U2, PIN_CFG(USB2AXHD1, SCU410, GENMASK(3, 2), 0),
+	     PIN_CFG(USB2AXHPD1, SCU410, GENMASK(3, 2), 0),
+	     PIN_CFG(USB2AXH, SCU410, GENMASK(3, 2), 2 << 2),
+	     PIN_CFG(USB2AXHP, SCU410, GENMASK(3, 2), 2 << 2),
+	     PIN_CFG(USB2AXH2B, SCU410, GENMASK(3, 2), 3 << 2),
+	     PIN_CFG(USB2AXHP2B, SCU410, GENMASK(3, 2), 3 << 2),
+	     PIN_CFG(USB2AD1, SCU410, GENMASK(3, 2), 1 << 2));
+FUNCFG_DESCL(PORTB_U3, PIN_CFG(USB3BXHD, SCU410, GENMASK(5, 4), 0),
+	     PIN_CFG(USB3BXHPD, SCU410, GENMASK(5, 4), 0),
+	     PIN_CFG(USB3BXH, SCU410, GENMASK(5, 4), 2 << 4),
+	     PIN_CFG(USB3BXHP, SCU410, GENMASK(5, 4), 2 << 4),
+	     PIN_CFG(USB3BXH2A, SCU410, GENMASK(5, 4), 3 << 4),
+	     PIN_CFG(USB3BXHP2A, SCU410, GENMASK(5, 4), 3 << 4));
+FUNCFG_DESCL(PORTB_U2, PIN_CFG(USB2BXHD1, SCU410, GENMASK(7, 6), 0),
+	     PIN_CFG(USB2BXHPD1, SCU410, GENMASK(7, 6), 0),
+	     PIN_CFG(USB2BXH, SCU410, GENMASK(7, 6), 2 << 6),
+	     PIN_CFG(USB2BXHP, SCU410, GENMASK(7, 6), 2 << 6),
+	     PIN_CFG(USB2BXH2A, SCU410, GENMASK(7, 6), 3 << 6),
+	     PIN_CFG(USB2BXHP2A, SCU410, GENMASK(7, 6), 3 << 6),
+	     PIN_CFG(USB2BD1, SCU410, GENMASK(7, 6), 1 << 6));
+FUNCFG_DESCL(PORTA_U3_XHCI, PIN_CFG(USB3AXHD, SCU410, BIT_MASK(9), 1 << 9),
+	     PIN_CFG(USB3AXHPD, SCU410, BIT_MASK(9), 0),
+	     PIN_CFG(USB3AXH, SCU410, BIT_MASK(9), 1 << 9),
+	     PIN_CFG(USB3AXHP, SCU410, BIT_MASK(9), 0),
+	     PIN_CFG(USB3AXH2B, SCU410, BIT_MASK(9), 1 << 9),
+	     PIN_CFG(USB3AXHP2B, SCU410, BIT_MASK(9), 0));
+FUNCFG_DESCL(PORTA_U2_XHCI, PIN_CFG(USB2AXHD1, SCU410, BIT_MASK(9), 1 << 9),
+	     PIN_CFG(USB2AXHPD1, SCU410, BIT_MASK(9), 0),
+	     PIN_CFG(USB2AXH, SCU410, BIT_MASK(9), 1 << 9),
+	     PIN_CFG(USB2AXHP, SCU410, BIT_MASK(9), 0),
+	     PIN_CFG(USB2AXH2B, SCU410, BIT_MASK(9), 1 << 9),
+	     PIN_CFG(USB2AXHP2B, SCU410, BIT_MASK(9), 0));
+FUNCFG_DESCL(PORTB_U3_XHCI, PIN_CFG(USB3BXHD, SCU410, BIT_MASK(10), 1 << 10),
+	     PIN_CFG(USB3BXHPD, SCU410, BIT_MASK(10), 0),
+	     PIN_CFG(USB3BXH, SCU410, BIT_MASK(10), 1 << 10),
+	     PIN_CFG(USB3BXHP, SCU410, BIT_MASK(10), 0),
+	     PIN_CFG(USB3BXH2A, SCU410, BIT_MASK(10), 1 << 10),
+	     PIN_CFG(USB3BXHP2A, SCU410, BIT_MASK(10), 0));
+FUNCFG_DESCL(PORTB_U2_XHCI, PIN_CFG(USB2BXHD1, SCU410, BIT_MASK(10), 1 << 10),
+	     PIN_CFG(USB2BXHPD1, SCU410, BIT_MASK(10), 0),
+	     PIN_CFG(USB2BXH, SCU410, BIT_MASK(10), 1 << 10),
+	     PIN_CFG(USB2BXHP, SCU410, BIT_MASK(10), 0),
+	     PIN_CFG(USB2BXH2A, SCU410, BIT_MASK(10), 1 << 10),
+	     PIN_CFG(USB2BXHP2A, SCU410, BIT_MASK(10), 0));
+FUNCFG_DESCL(PORTA_MODE, PIN_CFG(USB2AHPD0, SCU410, GENMASK(25, 24), 0),
+	     PIN_CFG(USB2AH, SCU410, GENMASK(25, 24), 2 << 24),
+	     PIN_CFG(USB2AHP, SCU410, GENMASK(25, 24), 3 << 24),
+	     PIN_CFG(USB2AD0, SCU410, GENMASK(25, 24), 1 << 24));
+FUNCFG_DESCL(PORTB_MODE, PIN_CFG(USB2BHPD0, SCU410, GENMASK(29, 28), 0),
+	     PIN_CFG(USB2BH, SCU410, GENMASK(29, 28), 2 << 28),
+	     PIN_CFG(USB2BHP, SCU410, GENMASK(29, 28), 3 << 28),
+	     PIN_CFG(USB2BD0, SCU410, GENMASK(29, 28), 1 << 28));
+FUNCFG_DESCL(PORTA_U3_PHY);
+FUNCFG_DESCL(PORTA_U2_PHY);
+FUNCFG_DESCL(PORTB_U3_PHY);
+FUNCFG_DESCL(PORTB_U2_PHY);
+FUNCFG_DESCL(JTAG_PORT, PIN_CFG(PSP, SCU408, GENMASK(12, 5), 0x0 << 5),
+	     PIN_CFG(SSP, SCU408, GENMASK(12, 5), 0x41 << 5),
+	     PIN_CFG(TSP, SCU408, GENMASK(12, 5), 0x42 << 5),
+	     PIN_CFG(DDR, SCU408, GENMASK(12, 5), 0x43 << 5),
+	     PIN_CFG(USB3A, SCU408, GENMASK(12, 5), 0x44 << 5),
+	     PIN_CFG(USB3B, SCU408, GENMASK(12, 5), 0x45 << 5),
+	     PIN_CFG(PCIEA, SCU408, GENMASK(12, 5), 0x46 << 5),
+	     PIN_CFG(PCIEB, SCU408, GENMASK(12, 5), 0x47 << 5),
+	     PIN_CFG(JTAGM0, SCU408, GENMASK(12, 5), 0x8 << 5));
+FUNCFG_DESCL(PCIERC0_PERST, PIN_CFG(PCIERC0PERST, SCU200, BIT_MASK(21), 1 << 21));
+FUNCFG_DESCL(PCIERC1_PERST, PIN_CFG(PCIERC1PERST, SCU200, BIT_MASK(19), 1 << 19));
+
+static const struct aspeed_g7_pincfg pin_cfg[] = {
+	PINCFG_PIN(AC14),	   PINCFG_PIN(AE15),
+	PINCFG_PIN(AD14),	   PINCFG_PIN(AE14),
+	PINCFG_PIN(AF14),	   PINCFG_PIN(AB13),
+	PINCFG_PIN(AB14),	   PINCFG_PIN(AF15),
+	PINCFG_PIN(AF13),	   PINCFG_PIN(AC13),
+	PINCFG_PIN(AD13),	   PINCFG_PIN(AE13),
+	PINCFG_PIN(PORTA_U3),	   PINCFG_PIN(PORTA_U2),
+	PINCFG_PIN(PORTB_U3),	   PINCFG_PIN(PORTB_U2),
+	PINCFG_PIN(PORTA_U3_XHCI), PINCFG_PIN(PORTA_U2_XHCI),
+	PINCFG_PIN(PORTB_U3_XHCI), PINCFG_PIN(PORTB_U2_XHCI),
+	PINCFG_PIN(PORTA_MODE),	   PINCFG_PIN(PORTB_MODE),
+	PINCFG_PIN(PORTA_U3_PHY),  PINCFG_PIN(PORTA_U2_PHY),
+	PINCFG_PIN(PORTB_U3_PHY),  PINCFG_PIN(PORTB_U2_PHY),
+	PINCFG_PIN(JTAG_PORT),     PINCFG_PIN(PCIERC0_PERST),
+	PINCFG_PIN(PCIERC1_PERST),
+};
+
+static const struct pinctrl_ops aspeed_g7_soc0_pinctrl_ops = {
+	.get_groups_count = aspeed_pinctrl_get_groups_count,
+	.get_group_name = aspeed_pinctrl_get_group_name,
+	.get_group_pins = aspeed_pinctrl_get_group_pins,
+	.pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static const struct pinmux_ops aspeed_g7_soc0_pinmux_ops = {
+	.get_functions_count = aspeed_pinmux_get_fn_count,
+	.get_function_name = aspeed_pinmux_get_fn_name,
+	.get_function_groups = aspeed_pinmux_get_fn_groups,
+	.set_mux = aspeed_g7_pinmux_set_mux,
+	.gpio_request_enable = aspeed_g7_gpio_request_enable,
+	.strict = true,
+};
+
+static const struct pinconf_ops aspeed_g7_soc0_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = aspeed_pin_config_get,
+	.pin_config_set = aspeed_pin_config_set,
+	.pin_config_group_get = aspeed_pin_config_group_get,
+	.pin_config_group_set = aspeed_pin_config_group_set,
+};
+
+/* pinctrl_desc */
+static struct pinctrl_desc aspeed_g7_soc0_pinctrl_desc = {
+	.name = "aspeed-g7-soc0-pinctrl",
+	.pins = aspeed_g7_soc0_pins,
+	.npins = ARRAY_SIZE(aspeed_g7_soc0_pins),
+	.pctlops = &aspeed_g7_soc0_pinctrl_ops,
+	.pmxops = &aspeed_g7_soc0_pinmux_ops,
+	.confops = &aspeed_g7_soc0_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static struct aspeed_pin_config aspeed_g7_configs[] = {
+	/* GPIO18A */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AC14, AC14 }, SCU480, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AE15, AE15 }, SCU484, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AD14, AD14 }, SCU488, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AE14, AE14 }, SCU48C, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AF14, AF14 }, SCU490, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AB13, AB13 }, SCU494, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AB14, AB14 }, SCU498, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AF15, AF15 }, SCU49C, GENMASK(3, 0) },
+	/* GPIO18B */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AF13, AF13 }, SCU4A0, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AC13, AC13 }, SCU4A4, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AD13, AD13 }, SCU4A8, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AE13, AE13 }, SCU4AC, GENMASK(3, 0) },
+};
+
+static const struct aspeed_pin_config_map aspeed_g7_pin_config_map[] = {
+	{ PIN_CONFIG_DRIVE_STRENGTH, 0, 0, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 1, 1, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 2, 2, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 3, 3, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 4, 4, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 5, 5, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 6, 6, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 7, 7, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 8, 8, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 9, 9, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 10, 10, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 11, 11, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 12, 12, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 13, 13, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 14, 14, GENMASK(3, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 15, 15, GENMASK(3, 0) },
+
+};
+
+static struct aspeed_pinctrl_data aspeed_g7_pinctrl_data = {
+	.pins = aspeed_g7_soc0_pins,
+	.npins = ARRAY_SIZE(aspeed_g7_soc0_pins),
+	.pinmux = {
+		.groups = aspeed_g7_soc0_pingroups,
+		.ngroups = ARRAY_SIZE(aspeed_g7_soc0_pingroups),
+		.functions = aspeed_g7_soc0_funcs,
+		.nfunctions = ARRAY_SIZE(aspeed_g7_soc0_funcs),
+		.configs_g7 = pin_cfg,
+		.nconfigs_g7 = ARRAY_SIZE(pin_cfg),
+	},
+	.configs = aspeed_g7_configs,
+	.nconfigs = ARRAY_SIZE(aspeed_g7_configs),
+	.confmaps = aspeed_g7_pin_config_map,
+	.nconfmaps = ARRAY_SIZE(aspeed_g7_pin_config_map),
+};
+
+static int aspeed_g7_soc0_pinctrl_probe(struct platform_device *pdev)
+{
+	return aspeed_pinctrl_probe(pdev, &aspeed_g7_soc0_pinctrl_desc,
+				    &aspeed_g7_pinctrl_data);
+}
+
+static const struct of_device_id aspeed_g7_soc0_pinctrl_match[] = {
+	{ .compatible = "aspeed,ast2700-soc0-pinctrl" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_g7_soc0_pinctrl_match);
+
+static struct platform_driver aspeed_g7_soc0_pinctrl_driver = {
+	.probe = aspeed_g7_soc0_pinctrl_probe,
+	.driver = {
+		.name = "aspeed-g7-soc0-pinctrl",
+		.of_match_table = aspeed_g7_soc0_pinctrl_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init aspeed_g7_soc0_pinctrl_register(void)
+{
+	return platform_driver_register(&aspeed_g7_soc0_pinctrl_driver);
+}
+arch_initcall(aspeed_g7_soc0_pinctrl_register);
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
new file mode 100644
index 000000000000..7c5a5e208f63
--- /dev/null
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
@@ -0,0 +1,2523 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include "pinctrl-aspeed.h"
+
+#define SCU3B0 0x3B0 /* USB Controller Register */
+#define SCU3B4 0x3B4 /* USB Controller Lock Register */
+#define SCU3B8 0x3B8 /* USB Controller Secure Register #1 */
+#define SCU3BC 0x3BC /* USB Controller Secure Register #2 */
+#define SCU3C0 0x3C0 /* USB Controller Secure Register #3 */
+#define SCU400 0x400 /* Multi-function Pin Control #1 */
+#define SCU404 0x404 /* Multi-function Pin Control #2 */
+#define SCU408 0x408 /* Multi-function Pin Control #3 */
+#define SCU40C 0x40C /* Multi-function Pin Control #4 */
+#define SCU410 0x410 /* Multi-function Pin Control #5 */
+#define SCU414 0x414 /* Multi-function Pin Control #6 */
+#define SCU418 0x418 /* Multi-function Pin Control #7 */
+#define SCU41C 0x41C /* Multi-function Pin Control #8 */
+#define SCU420 0x420 /* Multi-function Pin Control #9 */
+#define SCU424 0x424 /* Multi-function Pin Control #10 */
+#define SCU428 0x428 /* Multi-function Pin Control #11 */
+#define SCU42C 0x42C /* Multi-function Pin Control #12 */
+#define SCU430 0x430 /* Multi-function Pin Control #13 */
+#define SCU434 0x434 /* Multi-function Pin Control #14 */
+#define SCU438 0x438 /* Multi-function Pin Control #15 */
+#define SCU43C 0x43C /* Multi-function Pin Control #16 */
+#define SCU440 0x440 /* Multi-function Pin Control #17 */
+#define SCU444 0x444 /* Multi-function Pin Control #18 */
+#define SCU448 0x448 /* Multi-function Pin Control #19 */
+#define SCU44C 0x44C /* Multi-function Pin Control #20 */
+#define SCU450 0x450 /* Multi-function Pin Control #21 */
+#define SCU454 0x454 /* Multi-function Pin Control #22 */
+#define SCU458 0x458 /* Multi-function Pin Control #23 */
+#define SCU45C 0x45C /* Multi-function Pin Control #24 */
+#define SCU460 0x460 /* Multi-function Pin Control #25 */
+#define SCU464 0x464 /* Multi-function Pin Control #26 */
+#define SCU468 0x468 /* Multi-function Pin Control #27 */
+#define SCU46C 0x46C /* Multi-function Pin Control #28 */
+#define SCU470 0x470 /* Multi-function Pin Control #29 */
+#define SCU474 0x474 /* Multi-function Pin Control #30 */
+#define SCU478 0x478 /* Multi-function Pin Control #31 */
+#define SCU47C 0x47C
+#define SCU480 0x480 /* Disable Pull-Down Control #1 */
+#define SCU484 0x484 /* Disable Pull-Down Control #2 */
+#define SCU488 0x488 /* Disable Pull-Down Control #3 */
+#define SCU48C 0x48C /* Disable Pull-Down Control #4 */
+#define SCU490 0x490 /* Disable Pull-Down Control #5 */
+#define SCU494 0x494 /* Disable Pull-Down Control #6 */
+#define SCU498 0x498 /* Disable Pull-Down Control #7 */
+#define SCU4A0 0x4A0 /* Voltage Selection */
+#define SCU4C0 0x4C0 /* Driving Strength #0 A-I */
+#define SCU4C4 0x4C4 /* Driving Strength #1 J-K */
+#define SCU4C8 0x4C8 /* Driving Strength #2 L-M */
+#define SCU4CC 0x4CC /* Driving Strength #3 N-O */
+#define SCU4D0 0x4D0 /* Driving Strength #4 P-Q */
+#define SCU4D4 0x4D4 /* Driving Strength #5 R-S */
+#define SCU4D8 0x4D8 /* Driving Strength #6 T-U */
+#define SCU4DC 0x4DC /* Driving Strength #7 W */
+
+#define SCU908 0x908 /* PCIe RC PERST Pin Control */
+
+enum {
+	C16,
+	C14,
+	C11,
+	D9,
+	F14,
+	D10,
+	C12,
+	C13,
+	AC26,
+	AA25,
+	AB23,
+	U22,
+	V21,
+	N26,
+	P25,
+	N25,
+	V23,
+	W22,
+	AB26,
+	AD26,
+	P26,
+	AE26,
+	AF26,
+	AF25,
+	AE25,
+	AD25,
+	AF23,
+	AF20,
+	AF21,
+	AE21,
+	AE23,
+	AD22,
+	AF17,
+	AA16,
+	Y16,
+	V17,
+	J13,
+	AB16,
+	AC16,
+	AF16,
+	AA15,
+	AB15,
+	AC15,
+	AD15,
+	Y15,
+	AA14,
+	W16,
+	V16,
+	AB18,
+	AC18,
+	K13,
+	AA17,
+	AB17,
+	AD16,
+	AC17,
+	AD17,
+	AE16,
+	AE17,
+	AB24,
+	W26,
+	HOLE0,
+	HOLE1,
+	HOLE2,
+	HOLE3,
+	W25,
+	Y23,
+	Y24,
+	W21,
+	AA23,
+	AC22,
+	AB22,
+	Y21,
+	AE20,
+	AF19,
+	Y22,
+	AA20,
+	AA22,
+	AB20,
+	AF18,
+	AE19,
+	AD20,
+	AC20,
+	AA21,
+	AB21,
+	AC19,
+	AE18,
+	AD19,
+	AD18,
+	U25,
+	U26,
+	Y26,
+	AA24,
+	R25,
+	AA26,
+	R26,
+	Y25,
+	B16,
+	D14,
+	B15,
+	B14,
+	C17,
+	B13,
+	E14,
+	C15,
+	D24,
+	B23,
+	B22,
+	C23,
+	B18,
+	B21,
+	M15,
+	B19,
+	B26,
+	A25,
+	A24,
+	B24,
+	E26,
+	A21,
+	A19,
+	A18,
+	D26,
+	C26,
+	A23,
+	A22,
+	B25,
+	F26,
+	A26,
+	A14,
+	E10,
+	E13,
+	D12,
+	F10,
+	E11,
+	F11,
+	F13,
+	N15,
+	C20,
+	C19,
+	A8,
+	R14,
+	A7,
+	P14,
+	D20,
+	A6,
+	B6,
+	N14,
+	B7,
+	B8,
+	B9,
+	M14,
+	J11,
+	E7,
+	D19,
+	B11,
+	D15,
+	B12,
+	B10,
+	P13,
+	C18,
+	C6,
+	C7,
+	D7,
+	N13,
+	C8,
+	C9,
+	C10,
+	M16,
+	A15,
+	G11,
+	H7,
+	H8,
+	H9,
+	H10,
+	H11,
+	J9,
+	J10,
+	E9,
+	F9,
+	F8,
+	M13,
+	F7,
+	D8,
+	E8,
+	L12,
+	F12,
+	E12,
+	J12,
+	G7,
+	G8,
+	G9,
+	G10,
+	K12,
+	W17,
+	V18,
+	W18,
+	Y17,
+	AA18,
+	AA13,
+	Y18,
+	AA12,
+	W20,
+	V20,
+	Y11,
+	V14,
+	V19,
+	W14,
+	Y20,
+	AB19,
+	U21,
+	T24,
+	V24,
+	V22,
+	T23,
+	AC25,
+	AB25,
+	AC24,
+	SGMII0,
+	PCIERC2_PERST,
+	PORTC_MODE, // SCU3B0[1:0]
+	PORTD_MODE, // SCU3B0[3:2]
+};
+
+GROUP_DECL(ESPI0, B16, D14, B15, B14, C17, B13, E14, C15);
+GROUP_DECL(ESPI1, C16, C14, C11, D9, F14, D10, C12, C13);
+GROUP_DECL(LPC0, AF26, AF25, B16, D14, B15, B14, C17, B13, E14, C15);
+GROUP_DECL(LPC1, C16, C14, C11, D9, F14, D10, C12, C13, AE16, AE17);
+GROUP_DECL(SD, C16, C14, C11, D9, F14, D10, C12, C13);
+GROUP_DECL(VPI, C16, C14, C11, D9, F14, D10, C12, C13, AC26, AA25, AB23, U22,
+	   V21, N26, P25, N25, V23, W22, AB26, AD26, P26, AE26, AF26, AF25,
+	   AE25, AD25, AF23, AF20, AF21, AE21);
+GROUP_DECL(OSCCLK, C17);
+GROUP_DECL(TACH0, AC26);
+GROUP_DECL(TACH1, AA25);
+GROUP_DECL(TACH2, AB23);
+GROUP_DECL(TACH3, U22);
+GROUP_DECL(THRU0, AC26, AA25);
+GROUP_DECL(THRU1, AB23, U22);
+GROUP_DECL(TACH4, V21);
+GROUP_DECL(TACH5, N26);
+GROUP_DECL(TACH6, P25);
+GROUP_DECL(TACH7, N25);
+GROUP_DECL(NTCS5, V21);
+GROUP_DECL(NDCD5, N26);
+GROUP_DECL(NDSR5, P25);
+GROUP_DECL(NRI5, N25);
+GROUP_DECL(SALT12, AB26);
+GROUP_DECL(SALT13, AD26);
+GROUP_DECL(SALT14, P26);
+GROUP_DECL(SALT15, AE26);
+GROUP_DECL(NDTR5, V23);
+GROUP_DECL(NRTS5, W22);
+GROUP_DECL(NCTS6, AB26);
+GROUP_DECL(NDCD6, AD26);
+GROUP_DECL(NDSR6, P26);
+GROUP_DECL(NRI6, AE26);
+GROUP_DECL(NDTR6, AF26);
+GROUP_DECL(NRTS6, AF25);
+GROUP_DECL(TACH8, V23);
+GROUP_DECL(TACH9, W22);
+GROUP_DECL(TACH10, AB26);
+GROUP_DECL(TACH11, AD26);
+GROUP_DECL(TACH12, P26);
+GROUP_DECL(TACH13, AE26);
+GROUP_DECL(TACH14, AF26);
+GROUP_DECL(TACH15, AF25);
+GROUP_DECL(SPIM0, AE25, AD25, AF23, AF20, AF21, AE21, AE23);
+GROUP_DECL(PWM0, AE25);
+GROUP_DECL(PWM1, AD25);
+GROUP_DECL(PWM2, AF23);
+GROUP_DECL(PWM3, AF20);
+GROUP_DECL(PWM4, AF21);
+GROUP_DECL(PWM5, AE21);
+GROUP_DECL(PWM6, AE23);
+GROUP_DECL(PWM7, AD22);
+GROUP_DECL(SIOPBON0, AE25);
+GROUP_DECL(SIOPBIN0, AD25);
+GROUP_DECL(SIOSCIN0, AF23);
+GROUP_DECL(SIOS3N0, AF20);
+GROUP_DECL(SIOS5N0, AF21);
+GROUP_DECL(SIOPWREQN0, AE21);
+GROUP_DECL(SIOONCTRLN0, AE23);
+GROUP_DECL(SIOPWRGD0, AD22);
+GROUP_DECL(NCTS0, AF17);
+GROUP_DECL(NDCD0, AA16);
+GROUP_DECL(NDSR0, Y16);
+GROUP_DECL(NRI0, V17);
+GROUP_DECL(NDTR0, J13);
+GROUP_DECL(NRTS0, AB16);
+GROUP_DECL(TXD0, AC16);
+GROUP_DECL(RXD0, AF16);
+GROUP_DECL(NCTS1, AA15);
+GROUP_DECL(NDCD1, AB15);
+GROUP_DECL(NDSR1, AC15);
+GROUP_DECL(NRI1, AD15);
+GROUP_DECL(NDTR1, Y15);
+GROUP_DECL(NRTS1, AA14);
+GROUP_DECL(TXD1, W16);
+GROUP_DECL(RXD1, V16);
+GROUP_DECL(TXD2, AB18);
+GROUP_DECL(RXD2, AC18);
+GROUP_DECL(TXD3, K13);
+GROUP_DECL(RXD3, AA17);
+GROUP_DECL(NCTS5, V21);
+GROUP_DECL(TXD5, AB17);
+GROUP_DECL(RXD5, AD16);
+GROUP_DECL(TXD6, AC17);
+GROUP_DECL(RXD6, AD17);
+GROUP_DECL(TXD7, AE16);
+GROUP_DECL(RXD7, AE17);
+GROUP_DECL(TXD8, M15);
+GROUP_DECL(RXD8, B19);
+GROUP_DECL(TXD9, B26);
+GROUP_DECL(RXD9, A25);
+GROUP_DECL(TXD10, A24);
+GROUP_DECL(RXD10, B24);
+GROUP_DECL(TXD11, E26);
+GROUP_DECL(RXD11, A21);
+GROUP_DECL(SPIM1, K13, AA17, AB17, AD16, AC17, AD17, AE16, AE17);
+GROUP_DECL(WDTRST0N, K13);
+GROUP_DECL(WDTRST1N, AA17);
+GROUP_DECL(WDTRST2N, AB17);
+GROUP_DECL(WDTRST3N, AD16);
+GROUP_DECL(WDTRST4N, AC25);
+GROUP_DECL(WDTRST5N, AB25);
+GROUP_DECL(WDTRST6N, AC24);
+GROUP_DECL(WDTRST7N, AB24);
+GROUP_DECL(PWM8, K13);
+GROUP_DECL(PWM9, AA17);
+GROUP_DECL(PWM10, AB17);
+GROUP_DECL(PWM11, AD16);
+GROUP_DECL(PWM12, AC17);
+GROUP_DECL(PWM13, AD17);
+GROUP_DECL(PWM14, AE16);
+GROUP_DECL(PWM15, AE17);
+GROUP_DECL(SALT0, AC17);
+GROUP_DECL(SALT1, AD17);
+GROUP_DECL(SALT2, AC15);
+GROUP_DECL(SALT3, AD15);
+GROUP_DECL(FSI0, AD20, AC20);
+GROUP_DECL(FSI1, AA21, AB21);
+GROUP_DECL(FSI2, AC19, AE18);
+GROUP_DECL(FSI3, AD19, AD18);
+GROUP_DECL(SPIM2, W25, Y23, Y24, W21, AA23, AC22, AB22, Y21);
+GROUP_DECL(SALT4, W17);
+GROUP_DECL(SALT5, V18);
+GROUP_DECL(SALT6, W18);
+GROUP_DECL(SALT7, Y17);
+GROUP_DECL(SALT8, AA18);
+GROUP_DECL(SALT9, AA13);
+GROUP_DECL(SALT10, Y18);
+GROUP_DECL(SALT11, AA12);
+GROUP_DECL(ADC0, W17);
+GROUP_DECL(ADC1, V18);
+GROUP_DECL(ADC2, W18);
+GROUP_DECL(ADC3, Y17);
+GROUP_DECL(ADC4, AA18);
+GROUP_DECL(ADC5, AA13);
+GROUP_DECL(ADC6, Y18);
+GROUP_DECL(ADC7, AA12);
+GROUP_DECL(ADC8, W20);
+GROUP_DECL(ADC9, V20);
+GROUP_DECL(ADC10, Y11);
+GROUP_DECL(ADC11, V14);
+GROUP_DECL(ADC12, V19);
+GROUP_DECL(ADC13, W14);
+GROUP_DECL(ADC14, Y20);
+GROUP_DECL(ADC15, AB19);
+GROUP_DECL(AUXPWRGOOD0, W14);
+GROUP_DECL(AUXPWRGOOD1, Y20);
+GROUP_DECL(SGPM0, U21, T24, V22, T23);
+GROUP_DECL(SGPM1, AC25, AB25, AB24, W26);
+GROUP_DECL(I2C0, G11, H7);
+GROUP_DECL(I2C1, H8, H9);
+GROUP_DECL(I2C2, H10, H11);
+GROUP_DECL(I2C3, J9, J10);
+GROUP_DECL(I2C4, E9, F9);
+GROUP_DECL(I2C5, F8, M13);
+GROUP_DECL(I2C6, F7, D8);
+GROUP_DECL(I2C7, E8, L12);
+GROUP_DECL(I2C8, F12, E12);
+GROUP_DECL(I2C9, J12, G7);
+GROUP_DECL(I2C10, G8, G9);
+GROUP_DECL(I2C11, G10, K12);
+GROUP_DECL(I2C12, AC18, AA17);
+GROUP_DECL(I2C13, AB17, AD16);
+GROUP_DECL(I2C14, AC17, AD17);
+GROUP_DECL(I2C15, AE16, AE17);
+GROUP_DECL(DI2C0, C16, D9);
+GROUP_DECL(DI2C1, C14, F14);
+GROUP_DECL(DI2C2, D10, C12);
+GROUP_DECL(DI2C3, C11, C13);
+GROUP_DECL(DI2C8, U25, U26);
+GROUP_DECL(DI2C9, Y26, AA24);
+GROUP_DECL(DI2C10, R25, AA26);
+GROUP_DECL(DI2C11, R26, Y25);
+GROUP_DECL(DI2C12, W25, Y23);
+GROUP_DECL(DI2C13, Y24, W21);
+GROUP_DECL(DI2C14, AA23, AC22);
+GROUP_DECL(DI2C15, AB22, Y21);
+GROUP_DECL(LTPI_I2C0, G11, H7);
+GROUP_DECL(LTPI_I2C1, H8, H9);
+GROUP_DECL(LTPI_I2C2, H10, H11);
+GROUP_DECL(LTPI_I2C3, J9, J10);
+GROUP_DECL(SIOPBON1, AF17);
+GROUP_DECL(SIOPBIN1, AA16);
+GROUP_DECL(SIOSCIN1, Y16);
+GROUP_DECL(SIOS3N1, V17);
+GROUP_DECL(SIOS5N1, J13);
+GROUP_DECL(SIOPWREQN1, AB16);
+GROUP_DECL(SIOONCTRLN1, AA15);
+GROUP_DECL(SIOPWRGD1, AB15);
+GROUP_DECL(HVI3C12, W25, Y23);
+GROUP_DECL(HVI3C13, Y24, W21);
+GROUP_DECL(HVI3C14, AA23, AC22);
+GROUP_DECL(HVI3C15, AB22, Y21);
+GROUP_DECL(I3C4, AE20, AF19);
+GROUP_DECL(I3C5, Y22, AA20);
+GROUP_DECL(I3C6, AA22, AB20);
+GROUP_DECL(I3C7, AF18, AE19);
+GROUP_DECL(I3C8, AD20, AC20);
+GROUP_DECL(I3C9, AA21, AB21);
+GROUP_DECL(I3C10, AC19, AE18);
+GROUP_DECL(I3C11, AD19, AD18);
+GROUP_DECL(HVI3C0, U25, U26);
+GROUP_DECL(HVI3C1, Y26, AA24);
+GROUP_DECL(HVI3C2, R25, AA26);
+GROUP_DECL(HVI3C3, R26, Y25);
+GROUP_DECL(LTPI, U25, U26, Y26, AA24);
+GROUP_DECL(SPI0, D24, B23, B22);
+GROUP_DECL(QSPI0, C23, B18);
+GROUP_DECL(SPI0CS1, B21);
+GROUP_DECL(SPI0ABR, M15);
+GROUP_DECL(SPI0WPN, B19);
+GROUP_DECL(SPI1, B26, A25, A24);
+GROUP_DECL(QSPI1, B24, E26);
+GROUP_DECL(SPI1CS1, A21);
+GROUP_DECL(SPI1ABR, A19);
+GROUP_DECL(SPI1WPN, A18);
+GROUP_DECL(SPI2, D26, C26, A23, A22);
+GROUP_DECL(QSPI2, B25, F26);
+GROUP_DECL(SPI2CS1, A26);
+GROUP_DECL(THRU2, A19, A18);
+GROUP_DECL(THRU3, B25, F26);
+GROUP_DECL(JTAGM1, D12, F10, E11, F11, F13);
+GROUP_DECL(MDIO0, B9, M14);
+GROUP_DECL(MDIO1, C9, C10);
+GROUP_DECL(MDIO2, E10, E13);
+GROUP_DECL(FWQSPI, M16, A15);
+GROUP_DECL(FWSPIABR, A14);
+GROUP_DECL(FWSPIWPN, N15);
+GROUP_DECL(RGMII0, C20, C19, A8, R14, A7, P14, D20, A6, B6, N14, B7, B8);
+GROUP_DECL(RGMII1, D19, B11, D15, B12, B10, P13, C18, C6, C7, D7, N13, C8);
+GROUP_DECL(RMII0, C20, A8, R14, A7, P14, A6, B6, N14);
+GROUP_DECL(RMII0RCLKO, D20);
+GROUP_DECL(RMII1, D19, D15, B12, B10, P13, C6, C7, D7);
+GROUP_DECL(RMII1RCLKO, C18);
+GROUP_DECL(VGA, J11, E7);
+GROUP_DECL(DSGPM1, D19, B10, C7, D7);
+GROUP_DECL(SGPS, B11, C18, N13, C8);
+GROUP_DECL(I2CF0, F12, E12, J12, G7);
+GROUP_DECL(I2CF1, E9, F9, F8, M13);
+GROUP_DECL(I2CF2, F7, D8, E8, L12);
+GROUP_DECL(CANBUS, G7, G8, G9);
+GROUP_DECL(USBUART, G10, K12);
+GROUP_DECL(HBLED, V24);
+GROUP_DECL(MACLINK0, U21);
+GROUP_DECL(MACLINK1, T24);
+GROUP_DECL(MACLINK2, AC24);
+GROUP_DECL(NCTS2, U21);
+GROUP_DECL(NDCD2, T24);
+GROUP_DECL(NDSR2, V22);
+GROUP_DECL(NRI2, T23);
+GROUP_DECL(NDTR2, AC25);
+GROUP_DECL(NRTS2, AB25);
+GROUP_DECL(SMON0, U21, T24, V22, T23);
+GROUP_DECL(SMON1, AB24, W26, AC25, AB25);
+GROUP_DECL(SGMII, SGMII0);
+//PCIE RC PERST
+GROUP_DECL(PE2SGRSTN, PCIERC2_PERST, E10);
+GROUP_DECL(USB2CUD, PORTC_MODE);
+GROUP_DECL(USB2CD, PORTC_MODE);
+GROUP_DECL(USB2CH, PORTC_MODE);
+GROUP_DECL(USB2CU, PORTC_MODE);
+GROUP_DECL(USB2DD, PORTD_MODE);
+GROUP_DECL(USB2DH, PORTD_MODE);
+
+static struct aspeed_pin_group aspeed_g7_soc1_pingroups[] = {
+	ASPEED_PINCTRL_GROUP(ESPI0),
+	ASPEED_PINCTRL_GROUP(ESPI1),
+	ASPEED_PINCTRL_GROUP(LPC0),
+	ASPEED_PINCTRL_GROUP(LPC1),
+	ASPEED_PINCTRL_GROUP(SD),
+	ASPEED_PINCTRL_GROUP(VPI),
+	ASPEED_PINCTRL_GROUP(OSCCLK),
+	ASPEED_PINCTRL_GROUP(TACH0),
+	ASPEED_PINCTRL_GROUP(TACH1),
+	ASPEED_PINCTRL_GROUP(TACH2),
+	ASPEED_PINCTRL_GROUP(TACH3),
+	ASPEED_PINCTRL_GROUP(THRU0),
+	ASPEED_PINCTRL_GROUP(THRU1),
+	ASPEED_PINCTRL_GROUP(TACH4),
+	ASPEED_PINCTRL_GROUP(TACH5),
+	ASPEED_PINCTRL_GROUP(TACH6),
+	ASPEED_PINCTRL_GROUP(TACH7),
+	ASPEED_PINCTRL_GROUP(NTCS5),
+	ASPEED_PINCTRL_GROUP(NDCD5),
+	ASPEED_PINCTRL_GROUP(NDSR5),
+	ASPEED_PINCTRL_GROUP(NRI5),
+	ASPEED_PINCTRL_GROUP(SALT12),
+	ASPEED_PINCTRL_GROUP(SALT13),
+	ASPEED_PINCTRL_GROUP(SALT14),
+	ASPEED_PINCTRL_GROUP(SALT15),
+	ASPEED_PINCTRL_GROUP(NDTR5),
+	ASPEED_PINCTRL_GROUP(NRTS5),
+	ASPEED_PINCTRL_GROUP(NCTS6),
+	ASPEED_PINCTRL_GROUP(NDCD6),
+	ASPEED_PINCTRL_GROUP(NDSR6),
+	ASPEED_PINCTRL_GROUP(NRI6),
+	ASPEED_PINCTRL_GROUP(NDTR6),
+	ASPEED_PINCTRL_GROUP(NRTS6),
+	ASPEED_PINCTRL_GROUP(TACH8),
+	ASPEED_PINCTRL_GROUP(TACH9),
+	ASPEED_PINCTRL_GROUP(TACH10),
+	ASPEED_PINCTRL_GROUP(TACH11),
+	ASPEED_PINCTRL_GROUP(TACH12),
+	ASPEED_PINCTRL_GROUP(TACH13),
+	ASPEED_PINCTRL_GROUP(TACH14),
+	ASPEED_PINCTRL_GROUP(TACH15),
+	ASPEED_PINCTRL_GROUP(SPIM0),
+	ASPEED_PINCTRL_GROUP(PWM0),
+	ASPEED_PINCTRL_GROUP(PWM1),
+	ASPEED_PINCTRL_GROUP(PWM2),
+	ASPEED_PINCTRL_GROUP(PWM3),
+	ASPEED_PINCTRL_GROUP(PWM4),
+	ASPEED_PINCTRL_GROUP(PWM5),
+	ASPEED_PINCTRL_GROUP(PWM6),
+	ASPEED_PINCTRL_GROUP(PWM7),
+	ASPEED_PINCTRL_GROUP(SIOPBON0),
+	ASPEED_PINCTRL_GROUP(SIOPBIN0),
+	ASPEED_PINCTRL_GROUP(SIOSCIN0),
+	ASPEED_PINCTRL_GROUP(SIOS3N0),
+	ASPEED_PINCTRL_GROUP(SIOS5N0),
+	ASPEED_PINCTRL_GROUP(SIOPWREQN0),
+	ASPEED_PINCTRL_GROUP(SIOONCTRLN0),
+	ASPEED_PINCTRL_GROUP(SIOPWRGD0),
+	ASPEED_PINCTRL_GROUP(NCTS0),
+	ASPEED_PINCTRL_GROUP(NDCD0),
+	ASPEED_PINCTRL_GROUP(NDSR0),
+	ASPEED_PINCTRL_GROUP(NRI0),
+	ASPEED_PINCTRL_GROUP(NDTR0),
+	ASPEED_PINCTRL_GROUP(NRTS0),
+	ASPEED_PINCTRL_GROUP(TXD0),
+	ASPEED_PINCTRL_GROUP(RXD0),
+	ASPEED_PINCTRL_GROUP(NCTS1),
+	ASPEED_PINCTRL_GROUP(NDCD1),
+	ASPEED_PINCTRL_GROUP(NDSR1),
+	ASPEED_PINCTRL_GROUP(NRI1),
+	ASPEED_PINCTRL_GROUP(NDTR1),
+	ASPEED_PINCTRL_GROUP(NRTS1),
+	ASPEED_PINCTRL_GROUP(TXD1),
+	ASPEED_PINCTRL_GROUP(RXD1),
+	ASPEED_PINCTRL_GROUP(TXD2),
+	ASPEED_PINCTRL_GROUP(RXD2),
+	ASPEED_PINCTRL_GROUP(TXD3),
+	ASPEED_PINCTRL_GROUP(RXD3),
+	ASPEED_PINCTRL_GROUP(NCTS5),
+	ASPEED_PINCTRL_GROUP(NDCD5),
+	ASPEED_PINCTRL_GROUP(NDSR5),
+	ASPEED_PINCTRL_GROUP(NRI5),
+	ASPEED_PINCTRL_GROUP(NDTR5),
+	ASPEED_PINCTRL_GROUP(NRTS5),
+	ASPEED_PINCTRL_GROUP(TXD5),
+	ASPEED_PINCTRL_GROUP(RXD5),
+	ASPEED_PINCTRL_GROUP(NCTS6),
+	ASPEED_PINCTRL_GROUP(NDCD6),
+	ASPEED_PINCTRL_GROUP(NDSR6),
+	ASPEED_PINCTRL_GROUP(NRI6),
+	ASPEED_PINCTRL_GROUP(NDTR6),
+	ASPEED_PINCTRL_GROUP(NRTS6),
+	ASPEED_PINCTRL_GROUP(TXD6),
+	ASPEED_PINCTRL_GROUP(RXD6),
+	ASPEED_PINCTRL_GROUP(TXD6),
+	ASPEED_PINCTRL_GROUP(RXD6),
+	ASPEED_PINCTRL_GROUP(TXD7),
+	ASPEED_PINCTRL_GROUP(RXD7),
+	ASPEED_PINCTRL_GROUP(TXD8),
+	ASPEED_PINCTRL_GROUP(RXD8),
+	ASPEED_PINCTRL_GROUP(TXD9),
+	ASPEED_PINCTRL_GROUP(RXD9),
+	ASPEED_PINCTRL_GROUP(TXD10),
+	ASPEED_PINCTRL_GROUP(RXD10),
+	ASPEED_PINCTRL_GROUP(TXD11),
+	ASPEED_PINCTRL_GROUP(RXD11),
+	ASPEED_PINCTRL_GROUP(SPIM1),
+	ASPEED_PINCTRL_GROUP(WDTRST0N),
+	ASPEED_PINCTRL_GROUP(WDTRST1N),
+	ASPEED_PINCTRL_GROUP(WDTRST2N),
+	ASPEED_PINCTRL_GROUP(WDTRST3N),
+	ASPEED_PINCTRL_GROUP(WDTRST4N),
+	ASPEED_PINCTRL_GROUP(WDTRST5N),
+	ASPEED_PINCTRL_GROUP(WDTRST6N),
+	ASPEED_PINCTRL_GROUP(WDTRST7N),
+	ASPEED_PINCTRL_GROUP(PWM8),
+	ASPEED_PINCTRL_GROUP(PWM9),
+	ASPEED_PINCTRL_GROUP(PWM10),
+	ASPEED_PINCTRL_GROUP(PWM11),
+	ASPEED_PINCTRL_GROUP(PWM12),
+	ASPEED_PINCTRL_GROUP(PWM13),
+	ASPEED_PINCTRL_GROUP(PWM14),
+	ASPEED_PINCTRL_GROUP(PWM15),
+	ASPEED_PINCTRL_GROUP(SALT0),
+	ASPEED_PINCTRL_GROUP(SALT1),
+	ASPEED_PINCTRL_GROUP(SALT2),
+	ASPEED_PINCTRL_GROUP(SALT3),
+	ASPEED_PINCTRL_GROUP(FSI0),
+	ASPEED_PINCTRL_GROUP(FSI1),
+	ASPEED_PINCTRL_GROUP(FSI2),
+	ASPEED_PINCTRL_GROUP(FSI3),
+	ASPEED_PINCTRL_GROUP(SPIM2),
+	ASPEED_PINCTRL_GROUP(SALT4),
+	ASPEED_PINCTRL_GROUP(SALT5),
+	ASPEED_PINCTRL_GROUP(SALT6),
+	ASPEED_PINCTRL_GROUP(SALT7),
+	ASPEED_PINCTRL_GROUP(SALT8),
+	ASPEED_PINCTRL_GROUP(SALT9),
+	ASPEED_PINCTRL_GROUP(SALT10),
+	ASPEED_PINCTRL_GROUP(SALT11),
+	ASPEED_PINCTRL_GROUP(ADC0),
+	ASPEED_PINCTRL_GROUP(ADC1),
+	ASPEED_PINCTRL_GROUP(ADC2),
+	ASPEED_PINCTRL_GROUP(ADC3),
+	ASPEED_PINCTRL_GROUP(ADC4),
+	ASPEED_PINCTRL_GROUP(ADC5),
+	ASPEED_PINCTRL_GROUP(ADC6),
+	ASPEED_PINCTRL_GROUP(ADC7),
+	ASPEED_PINCTRL_GROUP(ADC8),
+	ASPEED_PINCTRL_GROUP(ADC9),
+	ASPEED_PINCTRL_GROUP(ADC10),
+	ASPEED_PINCTRL_GROUP(ADC11),
+	ASPEED_PINCTRL_GROUP(ADC12),
+	ASPEED_PINCTRL_GROUP(ADC13),
+	ASPEED_PINCTRL_GROUP(ADC14),
+	ASPEED_PINCTRL_GROUP(ADC15),
+	ASPEED_PINCTRL_GROUP(AUXPWRGOOD0),
+	ASPEED_PINCTRL_GROUP(AUXPWRGOOD1),
+	ASPEED_PINCTRL_GROUP(SGPM0),
+	ASPEED_PINCTRL_GROUP(SGPM1),
+	ASPEED_PINCTRL_GROUP(I2C0),
+	ASPEED_PINCTRL_GROUP(I2C1),
+	ASPEED_PINCTRL_GROUP(I2C2),
+	ASPEED_PINCTRL_GROUP(I2C3),
+	ASPEED_PINCTRL_GROUP(I2C4),
+	ASPEED_PINCTRL_GROUP(I2C5),
+	ASPEED_PINCTRL_GROUP(I2C6),
+	ASPEED_PINCTRL_GROUP(I2C7),
+	ASPEED_PINCTRL_GROUP(I2C8),
+	ASPEED_PINCTRL_GROUP(I2C9),
+	ASPEED_PINCTRL_GROUP(I2C10),
+	ASPEED_PINCTRL_GROUP(I2C11),
+	ASPEED_PINCTRL_GROUP(I2C12),
+	ASPEED_PINCTRL_GROUP(I2C13),
+	ASPEED_PINCTRL_GROUP(I2C14),
+	ASPEED_PINCTRL_GROUP(I2C15),
+	ASPEED_PINCTRL_GROUP(DI2C0),
+	ASPEED_PINCTRL_GROUP(DI2C1),
+	ASPEED_PINCTRL_GROUP(DI2C2),
+	ASPEED_PINCTRL_GROUP(DI2C3),
+	ASPEED_PINCTRL_GROUP(DI2C8),
+	ASPEED_PINCTRL_GROUP(DI2C9),
+	ASPEED_PINCTRL_GROUP(DI2C10),
+	ASPEED_PINCTRL_GROUP(DI2C11),
+	ASPEED_PINCTRL_GROUP(DI2C12),
+	ASPEED_PINCTRL_GROUP(DI2C13),
+	ASPEED_PINCTRL_GROUP(DI2C14),
+	ASPEED_PINCTRL_GROUP(DI2C15),
+	ASPEED_PINCTRL_GROUP(SIOPBON1),
+	ASPEED_PINCTRL_GROUP(SIOPBIN1),
+	ASPEED_PINCTRL_GROUP(SIOSCIN1),
+	ASPEED_PINCTRL_GROUP(SIOS3N1),
+	ASPEED_PINCTRL_GROUP(SIOS5N1),
+	ASPEED_PINCTRL_GROUP(SIOPWREQN1),
+	ASPEED_PINCTRL_GROUP(SIOONCTRLN1),
+	ASPEED_PINCTRL_GROUP(SIOPWRGD1),
+	ASPEED_PINCTRL_GROUP(HVI3C12),
+	ASPEED_PINCTRL_GROUP(HVI3C13),
+	ASPEED_PINCTRL_GROUP(HVI3C14),
+	ASPEED_PINCTRL_GROUP(HVI3C15),
+	ASPEED_PINCTRL_GROUP(I3C4),
+	ASPEED_PINCTRL_GROUP(I3C5),
+	ASPEED_PINCTRL_GROUP(I3C6),
+	ASPEED_PINCTRL_GROUP(I3C7),
+	ASPEED_PINCTRL_GROUP(I3C8),
+	ASPEED_PINCTRL_GROUP(I3C9),
+	ASPEED_PINCTRL_GROUP(I3C10),
+	ASPEED_PINCTRL_GROUP(I3C11),
+	ASPEED_PINCTRL_GROUP(HVI3C0),
+	ASPEED_PINCTRL_GROUP(HVI3C1),
+	ASPEED_PINCTRL_GROUP(HVI3C2),
+	ASPEED_PINCTRL_GROUP(HVI3C3),
+	ASPEED_PINCTRL_GROUP(LTPI),
+	ASPEED_PINCTRL_GROUP(SPI0),
+	ASPEED_PINCTRL_GROUP(QSPI0),
+	ASPEED_PINCTRL_GROUP(SPI0CS1),
+	ASPEED_PINCTRL_GROUP(SPI0ABR),
+	ASPEED_PINCTRL_GROUP(SPI0WPN),
+	ASPEED_PINCTRL_GROUP(SPI1),
+	ASPEED_PINCTRL_GROUP(QSPI1),
+	ASPEED_PINCTRL_GROUP(SPI1CS1),
+	ASPEED_PINCTRL_GROUP(SPI1ABR),
+	ASPEED_PINCTRL_GROUP(SPI1WPN),
+	ASPEED_PINCTRL_GROUP(SPI2),
+	ASPEED_PINCTRL_GROUP(QSPI2),
+	ASPEED_PINCTRL_GROUP(SPI2CS1),
+	ASPEED_PINCTRL_GROUP(THRU2),
+	ASPEED_PINCTRL_GROUP(THRU3),
+	ASPEED_PINCTRL_GROUP(JTAGM1),
+	ASPEED_PINCTRL_GROUP(MDIO0),
+	ASPEED_PINCTRL_GROUP(MDIO1),
+	ASPEED_PINCTRL_GROUP(MDIO2),
+	ASPEED_PINCTRL_GROUP(FWQSPI),
+	ASPEED_PINCTRL_GROUP(FWSPIABR),
+	ASPEED_PINCTRL_GROUP(FWSPIWPN),
+	ASPEED_PINCTRL_GROUP(RGMII0),
+	ASPEED_PINCTRL_GROUP(RGMII1),
+	ASPEED_PINCTRL_GROUP(RMII0),
+	ASPEED_PINCTRL_GROUP(RMII0RCLKO),
+	ASPEED_PINCTRL_GROUP(RMII1),
+	ASPEED_PINCTRL_GROUP(RMII1RCLKO),
+	ASPEED_PINCTRL_GROUP(VGA),
+	ASPEED_PINCTRL_GROUP(DSGPM1),
+	ASPEED_PINCTRL_GROUP(SGPS),
+	ASPEED_PINCTRL_GROUP(I2CF0),
+	ASPEED_PINCTRL_GROUP(I2CF1),
+	ASPEED_PINCTRL_GROUP(I2CF2),
+	ASPEED_PINCTRL_GROUP(CANBUS),
+	ASPEED_PINCTRL_GROUP(USBUART),
+	ASPEED_PINCTRL_GROUP(HBLED),
+	ASPEED_PINCTRL_GROUP(MACLINK0),
+	ASPEED_PINCTRL_GROUP(MACLINK1),
+	ASPEED_PINCTRL_GROUP(MACLINK2),
+	ASPEED_PINCTRL_GROUP(NCTS2),
+	ASPEED_PINCTRL_GROUP(NDCD2),
+	ASPEED_PINCTRL_GROUP(NDSR2),
+	ASPEED_PINCTRL_GROUP(NRI2),
+	ASPEED_PINCTRL_GROUP(NDTR2),
+	ASPEED_PINCTRL_GROUP(NRTS2),
+	ASPEED_PINCTRL_GROUP(SMON0),
+	ASPEED_PINCTRL_GROUP(SMON1),
+	ASPEED_PINCTRL_GROUP(SGMII),
+	ASPEED_PINCTRL_GROUP(PE2SGRSTN),
+	ASPEED_PINCTRL_GROUP(USB2CUD),
+	ASPEED_PINCTRL_GROUP(USB2CD),
+	ASPEED_PINCTRL_GROUP(USB2CH),
+	ASPEED_PINCTRL_GROUP(USB2CU),
+	ASPEED_PINCTRL_GROUP(USB2DD),
+	ASPEED_PINCTRL_GROUP(USB2DH),
+};
+
+FUNC_DECL_(ESPI0, "ESPI0");
+FUNC_DECL_(ESPI1, "ESPI1");
+FUNC_DECL_(LPC0, "LPC0");
+FUNC_DECL_(LPC1, "LPC1");
+FUNC_DECL_(VPI, "VPI");
+FUNC_DECL_(SD, "SD");
+FUNC_DECL_(OSCCLK, "OSCCLK");
+FUNC_DECL_(TACH0, "TACH0");
+FUNC_DECL_(TACH1, "TACH1");
+FUNC_DECL_(TACH2, "TACH2");
+FUNC_DECL_(TACH3, "TACH3");
+FUNC_DECL_(TACH4, "TACH4");
+FUNC_DECL_(TACH5, "TACH5");
+FUNC_DECL_(TACH6, "TACH6");
+FUNC_DECL_(TACH7, "TACH7");
+FUNC_DECL_(THRU0, "THRU0");
+FUNC_DECL_(THRU1, "THRU1");
+FUNC_DECL_(NTCS5, "NTCS5");
+FUNC_DECL_(NDSR5, "NDSR5");
+FUNC_DECL_(NRI5, "NRI5");
+FUNC_DECL_(TACH8, "TACH8");
+FUNC_DECL_(TACH9, "TACH9");
+FUNC_DECL_(TACH10, "TACH10");
+FUNC_DECL_(TACH11, "TACH11");
+FUNC_DECL_(TACH12, "TACH12");
+FUNC_DECL_(TACH13, "TACH13");
+FUNC_DECL_(TACH14, "TACH14");
+FUNC_DECL_(TACH15, "TACH15");
+FUNC_DECL_(SALT12, "SALT12");
+FUNC_DECL_(SALT13, "SALT13");
+FUNC_DECL_(SALT14, "SALT14");
+FUNC_DECL_(SALT15, "SALT15");
+FUNC_DECL_(SPIM0, "SPIM0");
+FUNC_DECL_(PWM0, "PWM0");
+FUNC_DECL_(PWM1, "PWM1");
+FUNC_DECL_(PWM2, "PWM2");
+FUNC_DECL_(PWM3, "PWM3");
+FUNC_DECL_(PWM4, "PWM4");
+FUNC_DECL_(PWM5, "PWM5");
+FUNC_DECL_(PWM6, "PWM6");
+FUNC_DECL_(PWM7, "PWM7");
+FUNC_DECL_(SIOPBON0, "SIOPBON0");
+FUNC_DECL_(SIOPBIN0, "SIOPBIN0");
+FUNC_DECL_(SIOSCIN0, "SIOSCIN0");
+FUNC_DECL_(SIOS3N0, "SIOS3N0");
+FUNC_DECL_(SIOS5N0, "SIOS5N0");
+FUNC_DECL_(SIOPWREQN0, "SIOPWREQN0");
+FUNC_DECL_(SIOONCTRLN0, "SIOONCTRLN0");
+FUNC_DECL_(SIOPWRGD0, "SIOPWRGD0");
+FUNC_DECL_(UART0, "NCTS0", "NDCD0", "NDSR0", "NRI0", "NDTR0", "NRTS0", "TXD0", "RXD0");
+FUNC_DECL_(UART1, "NCTS1", "NDCD1", "NDSR1", "NRI1", "NDTR1", "NRTS1", "TXD1", "RXD1");
+FUNC_DECL_(UART2, "TXD2", "RXD2");
+FUNC_DECL_(UART3, "TXD3", "RXD3");
+FUNC_DECL_(UART5, "NCTS5", "NDCD5", "NDSR5", "NRI5", "NDTR5", "NRTS5", "TXD5", "RXD5");
+FUNC_DECL_(UART6, "NCTS6", "NDCD6", "NDSR6", "NRI6", "NDTR6", "NRTS6", "TXD6", "RXD6");
+FUNC_DECL_(UART7, "TXD7", "RXD7");
+FUNC_DECL_(UART8, "TXD8", "RXD8");
+FUNC_DECL_(UART9, "TXD9", "RXD9");
+FUNC_DECL_(UART10, "TXD10", "RXD10");
+FUNC_DECL_(UART11, "TXD11", "RXD11");
+FUNC_DECL_(SPIM1, "SPIM1");
+FUNC_DECL_(SPIM2, "SPIM2");
+FUNC_DECL_(PWM8, "PWM8");
+FUNC_DECL_(PWM9, "PWM9");
+FUNC_DECL_(PWM10, "PWM10");
+FUNC_DECL_(PWM11, "PWM11");
+FUNC_DECL_(PWM12, "PWM12");
+FUNC_DECL_(PWM13, "PWM13");
+FUNC_DECL_(PWM14, "PWM14");
+FUNC_DECL_(PWM15, "PWM15");
+FUNC_DECL_(WDTRST0N, "WDTRST0N");
+FUNC_DECL_(WDTRST1N, "WDTRST1N");
+FUNC_DECL_(WDTRST2N, "WDTRST2N");
+FUNC_DECL_(WDTRST3N, "WDTRST3N");
+FUNC_DECL_(WDTRST4N, "WDTRST4N");
+FUNC_DECL_(WDTRST5N, "WDTRST5N");
+FUNC_DECL_(WDTRST6N, "WDTRST6N");
+FUNC_DECL_(WDTRST7N, "WDTRST7N");
+FUNC_DECL_(FSI0, "FSI0");
+FUNC_DECL_(FSI1, "FSI1");
+FUNC_DECL_(FSI2, "FSI2");
+FUNC_DECL_(FSI3, "FSI3");
+FUNC_DECL_(SALT0, "SALT0");
+FUNC_DECL_(SALT1, "SALT1");
+FUNC_DECL_(SALT2, "SALT2");
+FUNC_DECL_(SALT3, "SALT3");
+FUNC_DECL_(SALT4, "SALT4");
+FUNC_DECL_(SALT5, "SALT5");
+FUNC_DECL_(SALT6, "SALT6");
+FUNC_DECL_(SALT7, "SALT7");
+FUNC_DECL_(SALT8, "SALT8");
+FUNC_DECL_(SALT9, "SALT9");
+FUNC_DECL_(SALT10, "SALT10");
+FUNC_DECL_(SALT11, "SALT11");
+FUNC_DECL_(ADC0, "ADC0");
+FUNC_DECL_(ADC1, "ADC1");
+FUNC_DECL_(ADC2, "ADC2");
+FUNC_DECL_(ADC3, "ADC3");
+FUNC_DECL_(ADC4, "ADC4");
+FUNC_DECL_(ADC5, "ADC5");
+FUNC_DECL_(ADC6, "ADC6");
+FUNC_DECL_(ADC7, "ADC7");
+FUNC_DECL_(ADC8, "ADC8");
+FUNC_DECL_(ADC9, "ADC9");
+FUNC_DECL_(ADC10, "ADC10");
+FUNC_DECL_(ADC11, "ADC11");
+FUNC_DECL_(ADC12, "ADC12");
+FUNC_DECL_(ADC13, "ADC13");
+FUNC_DECL_(ADC14, "ADC14");
+FUNC_DECL_(ADC15, "ADC15");
+FUNC_DECL_(AUXPWRGOOD0, "AUXPWRGOOD0");
+FUNC_DECL_(AUXPWRGOOD1, "AUXPWRGOOD1");
+FUNC_DECL_(SGPM0, "SGPM0");
+FUNC_DECL_(SGPM1, "SGPM1");
+FUNC_DECL_(I2C0, "I2C0", "DI2C0");
+FUNC_DECL_(I2C1, "I2C1", "DI2C1");
+FUNC_DECL_(I2C2, "I2C2", "DI2C2");
+FUNC_DECL_(I2C3, "I2C3", "DI2C3");
+FUNC_DECL_(I2C4, "I2C4");
+FUNC_DECL_(I2C5, "I2C5");
+FUNC_DECL_(I2C6, "I2C6");
+FUNC_DECL_(I2C7, "I2C7");
+FUNC_DECL_(I2C8, "I2C8", "DI2C8");
+FUNC_DECL_(I2C9, "I2C9", "DI2C9");
+FUNC_DECL_(I2C10, "I2C10", "DI2C10");
+FUNC_DECL_(I2C11, "I2C11", "DI2C11");
+FUNC_DECL_(I2C12, "I2C12", "DI2C12");
+FUNC_DECL_(I2C13, "I2C13", "DI2C13");
+FUNC_DECL_(I2C14, "I2C14", "DI2C14");
+FUNC_DECL_(I2C15, "I2C15", "DI2C15");
+FUNC_DECL_(SIOPBON1, "SIOPBON1");
+FUNC_DECL_(SIOPBIN1, "SIOPBIN1");
+FUNC_DECL_(SIOSCIN1, "SIOSCIN1");
+FUNC_DECL_(SIOS3N1, "SIOS3N1");
+FUNC_DECL_(SIOS5N1, "SIOS5N1");
+FUNC_DECL_(SIOPWREQN1, "SIOPWREQN1");
+FUNC_DECL_(SIOONCTRLN1, "SIOONCTRLN1");
+FUNC_DECL_(SIOPWRGD1, "SIOPWRGD1");
+FUNC_DECL_(I3C0, "HVI3C0");
+FUNC_DECL_(I3C1, "HVI3C1");
+FUNC_DECL_(I3C2, "HVI3C2");
+FUNC_DECL_(I3C3, "HVI3C3");
+FUNC_DECL_(I3C4, "I3C4");
+FUNC_DECL_(I3C5, "I3C5");
+FUNC_DECL_(I3C6, "I3C6");
+FUNC_DECL_(I3C7, "I3C7");
+FUNC_DECL_(I3C8, "I3C8");
+FUNC_DECL_(I3C9, "I3C9");
+FUNC_DECL_(I3C10, "I3C10");
+FUNC_DECL_(I3C11, "I3C11");
+FUNC_DECL_(I3C12, "HVI3C12");
+FUNC_DECL_(I3C13, "HVI3C13");
+FUNC_DECL_(I3C14, "HVI3C14");
+FUNC_DECL_(I3C15, "HVI3C15");
+FUNC_DECL_(LTPI, "LTPI");
+FUNC_DECL_(SPI0, "SPI0");
+FUNC_DECL_(QSPI0, "QSPI0");
+FUNC_DECL_(SPI0CS1, "SPI0CS1");
+FUNC_DECL_(SPI0ABR, "SPI0ABR");
+FUNC_DECL_(SPI0WPN, "SPI0WPN");
+FUNC_DECL_(SPI1, "SPI1");
+FUNC_DECL_(QSPI1, "QSPI1");
+FUNC_DECL_(SPI1CS1, "SPI1CS1");
+FUNC_DECL_(SPI1ABR, "SPI1ABR");
+FUNC_DECL_(SPI1WPN, "SPI1WPN");
+FUNC_DECL_(SPI2, "SPI2");
+FUNC_DECL_(QSPI2, "QSPI2");
+FUNC_DECL_(SPI2CS1, "SPI2CS1");
+FUNC_DECL_(THRU2, "THRU2");
+FUNC_DECL_(THRU3, "THRU3");
+FUNC_DECL_(JTAGM1, "JTAGM1");
+FUNC_DECL_(MDIO0, "MDIO0");
+FUNC_DECL_(MDIO1, "MDIO1");
+FUNC_DECL_(MDIO2, "MDIO2");
+FUNC_DECL_(FWQSPI, "FWQSPI");
+FUNC_DECL_(FWSPIABR, "FWSPIABR");
+FUNC_DECL_(FWSPIWPN, "FWSPIWPN");
+FUNC_DECL_(RGMII0, "RGMII0");
+FUNC_DECL_(RGMII1, "RGMII1");
+FUNC_DECL_(RMII0, "RMII0");
+FUNC_DECL_(RMII0RCLKO, "RMII0RCLKO");
+FUNC_DECL_(RMII1, "RMII1");
+FUNC_DECL_(RMII1RCLKO, "RMII1RCLKO");
+FUNC_DECL_(VGA, "VGA");
+FUNC_DECL_(DSGPM1, "DSGPM1");
+FUNC_DECL_(SGPS, "SGPS");
+FUNC_DECL_(I2CF0, "I2CF0");
+FUNC_DECL_(I2CF1, "I2CF1");
+FUNC_DECL_(I2CF2, "I2CF2");
+FUNC_DECL_(CANBUS, "CANBUS");
+FUNC_DECL_(USBUART, "USBUART");
+FUNC_DECL_(HBLED, "HBLED");
+FUNC_DECL_(MACLINK0, "MACLINK0");
+FUNC_DECL_(MACLINK1, "MACLINK1");
+FUNC_DECL_(MACLINK2, "MACLINK2");
+FUNC_DECL_(SMON0, "SMON0");
+FUNC_DECL_(SMON1, "SMON1");
+FUNC_DECL_(SGMII, "SGMII");
+FUNC_DECL_(PCIERC, "PE2SGRSTN");
+FUNC_DECL_(USB2C, "USB2CUD", "USB2CD", "USB2CH", "USB2CU");
+FUNC_DECL_(USB2D, "USB2DD", "USB2DH");
+
+static struct aspeed_pin_function aspeed_g7_soc1_funcs[] = {
+	ASPEED_PINCTRL_FUNC(ESPI0),
+	ASPEED_PINCTRL_FUNC(ESPI1),
+	ASPEED_PINCTRL_FUNC(LPC0),
+	ASPEED_PINCTRL_FUNC(LPC1),
+	ASPEED_PINCTRL_FUNC(VPI),
+	ASPEED_PINCTRL_FUNC(SD),
+	ASPEED_PINCTRL_FUNC(OSCCLK),
+	ASPEED_PINCTRL_FUNC(TACH0),
+	ASPEED_PINCTRL_FUNC(TACH1),
+	ASPEED_PINCTRL_FUNC(TACH2),
+	ASPEED_PINCTRL_FUNC(TACH3),
+	ASPEED_PINCTRL_FUNC(TACH4),
+	ASPEED_PINCTRL_FUNC(TACH5),
+	ASPEED_PINCTRL_FUNC(TACH6),
+	ASPEED_PINCTRL_FUNC(TACH7),
+	ASPEED_PINCTRL_FUNC(THRU0),
+	ASPEED_PINCTRL_FUNC(THRU1),
+	ASPEED_PINCTRL_FUNC(NTCS5),
+	ASPEED_PINCTRL_FUNC(NTCS5),
+	ASPEED_PINCTRL_FUNC(NDSR5),
+	ASPEED_PINCTRL_FUNC(NRI5),
+	ASPEED_PINCTRL_FUNC(NRI5),
+	ASPEED_PINCTRL_FUNC(SALT12),
+	ASPEED_PINCTRL_FUNC(SALT13),
+	ASPEED_PINCTRL_FUNC(SALT14),
+	ASPEED_PINCTRL_FUNC(SALT15),
+	ASPEED_PINCTRL_FUNC(TACH8),
+	ASPEED_PINCTRL_FUNC(TACH9),
+	ASPEED_PINCTRL_FUNC(TACH10),
+	ASPEED_PINCTRL_FUNC(TACH11),
+	ASPEED_PINCTRL_FUNC(TACH12),
+	ASPEED_PINCTRL_FUNC(TACH13),
+	ASPEED_PINCTRL_FUNC(TACH14),
+	ASPEED_PINCTRL_FUNC(TACH15),
+	ASPEED_PINCTRL_FUNC(SPIM0),
+	ASPEED_PINCTRL_FUNC(PWM0),
+	ASPEED_PINCTRL_FUNC(PWM1),
+	ASPEED_PINCTRL_FUNC(PWM2),
+	ASPEED_PINCTRL_FUNC(PWM3),
+	ASPEED_PINCTRL_FUNC(PWM4),
+	ASPEED_PINCTRL_FUNC(PWM5),
+	ASPEED_PINCTRL_FUNC(PWM6),
+	ASPEED_PINCTRL_FUNC(PWM7),
+	ASPEED_PINCTRL_FUNC(SIOPBON0),
+	ASPEED_PINCTRL_FUNC(SIOPBIN0),
+	ASPEED_PINCTRL_FUNC(SIOSCIN0),
+	ASPEED_PINCTRL_FUNC(SIOS3N0),
+	ASPEED_PINCTRL_FUNC(SIOS5N0),
+	ASPEED_PINCTRL_FUNC(SIOPWREQN0),
+	ASPEED_PINCTRL_FUNC(SIOONCTRLN0),
+	ASPEED_PINCTRL_FUNC(SIOPWRGD0),
+	ASPEED_PINCTRL_FUNC(UART0),
+	ASPEED_PINCTRL_FUNC(UART1),
+	ASPEED_PINCTRL_FUNC(UART2),
+	ASPEED_PINCTRL_FUNC(UART3),
+	ASPEED_PINCTRL_FUNC(UART5),
+	ASPEED_PINCTRL_FUNC(UART6),
+	ASPEED_PINCTRL_FUNC(UART7),
+	ASPEED_PINCTRL_FUNC(UART8),
+	ASPEED_PINCTRL_FUNC(UART9),
+	ASPEED_PINCTRL_FUNC(UART10),
+	ASPEED_PINCTRL_FUNC(UART11),
+	ASPEED_PINCTRL_FUNC(SPIM1),
+	ASPEED_PINCTRL_FUNC(PWM7),
+	ASPEED_PINCTRL_FUNC(PWM8),
+	ASPEED_PINCTRL_FUNC(PWM9),
+	ASPEED_PINCTRL_FUNC(PWM10),
+	ASPEED_PINCTRL_FUNC(PWM11),
+	ASPEED_PINCTRL_FUNC(PWM12),
+	ASPEED_PINCTRL_FUNC(PWM13),
+	ASPEED_PINCTRL_FUNC(PWM14),
+	ASPEED_PINCTRL_FUNC(PWM15),
+	ASPEED_PINCTRL_FUNC(WDTRST0N),
+	ASPEED_PINCTRL_FUNC(WDTRST1N),
+	ASPEED_PINCTRL_FUNC(WDTRST2N),
+	ASPEED_PINCTRL_FUNC(WDTRST3N),
+	ASPEED_PINCTRL_FUNC(WDTRST4N),
+	ASPEED_PINCTRL_FUNC(WDTRST5N),
+	ASPEED_PINCTRL_FUNC(WDTRST6N),
+	ASPEED_PINCTRL_FUNC(WDTRST7N),
+	ASPEED_PINCTRL_FUNC(FSI0),
+	ASPEED_PINCTRL_FUNC(FSI1),
+	ASPEED_PINCTRL_FUNC(FSI2),
+	ASPEED_PINCTRL_FUNC(FSI3),
+	ASPEED_PINCTRL_FUNC(SALT0),
+	ASPEED_PINCTRL_FUNC(SALT1),
+	ASPEED_PINCTRL_FUNC(SALT2),
+	ASPEED_PINCTRL_FUNC(SALT3),
+	ASPEED_PINCTRL_FUNC(SALT4),
+	ASPEED_PINCTRL_FUNC(SALT5),
+	ASPEED_PINCTRL_FUNC(SALT6),
+	ASPEED_PINCTRL_FUNC(SALT7),
+	ASPEED_PINCTRL_FUNC(SALT8),
+	ASPEED_PINCTRL_FUNC(SALT9),
+	ASPEED_PINCTRL_FUNC(SALT10),
+	ASPEED_PINCTRL_FUNC(SALT11),
+	ASPEED_PINCTRL_FUNC(ADC0),
+	ASPEED_PINCTRL_FUNC(ADC1),
+	ASPEED_PINCTRL_FUNC(ADC2),
+	ASPEED_PINCTRL_FUNC(ADC3),
+	ASPEED_PINCTRL_FUNC(ADC4),
+	ASPEED_PINCTRL_FUNC(ADC5),
+	ASPEED_PINCTRL_FUNC(ADC6),
+	ASPEED_PINCTRL_FUNC(ADC7),
+	ASPEED_PINCTRL_FUNC(ADC8),
+	ASPEED_PINCTRL_FUNC(ADC9),
+	ASPEED_PINCTRL_FUNC(ADC10),
+	ASPEED_PINCTRL_FUNC(ADC11),
+	ASPEED_PINCTRL_FUNC(ADC12),
+	ASPEED_PINCTRL_FUNC(ADC13),
+	ASPEED_PINCTRL_FUNC(ADC14),
+	ASPEED_PINCTRL_FUNC(ADC15),
+	ASPEED_PINCTRL_FUNC(AUXPWRGOOD0),
+	ASPEED_PINCTRL_FUNC(AUXPWRGOOD1),
+	ASPEED_PINCTRL_FUNC(SGPM0),
+	ASPEED_PINCTRL_FUNC(SGPM1),
+	ASPEED_PINCTRL_FUNC(SPIM2),
+	ASPEED_PINCTRL_FUNC(I2C0),
+	ASPEED_PINCTRL_FUNC(I2C1),
+	ASPEED_PINCTRL_FUNC(I2C2),
+	ASPEED_PINCTRL_FUNC(I2C3),
+	ASPEED_PINCTRL_FUNC(I2C4),
+	ASPEED_PINCTRL_FUNC(I2C5),
+	ASPEED_PINCTRL_FUNC(I2C6),
+	ASPEED_PINCTRL_FUNC(I2C7),
+	ASPEED_PINCTRL_FUNC(I2C8),
+	ASPEED_PINCTRL_FUNC(I2C9),
+	ASPEED_PINCTRL_FUNC(I2C10),
+	ASPEED_PINCTRL_FUNC(I2C11),
+	ASPEED_PINCTRL_FUNC(I2C12),
+	ASPEED_PINCTRL_FUNC(I2C13),
+	ASPEED_PINCTRL_FUNC(I2C14),
+	ASPEED_PINCTRL_FUNC(I2C15),
+	ASPEED_PINCTRL_FUNC(SIOPBON1),
+	ASPEED_PINCTRL_FUNC(SIOPBIN1),
+	ASPEED_PINCTRL_FUNC(SIOSCIN1),
+	ASPEED_PINCTRL_FUNC(SIOS3N1),
+	ASPEED_PINCTRL_FUNC(SIOS5N1),
+	ASPEED_PINCTRL_FUNC(SIOPWREQN1),
+	ASPEED_PINCTRL_FUNC(SIOONCTRLN1),
+	ASPEED_PINCTRL_FUNC(SIOPWRGD1),
+	ASPEED_PINCTRL_FUNC(I3C0),
+	ASPEED_PINCTRL_FUNC(I3C1),
+	ASPEED_PINCTRL_FUNC(I3C2),
+	ASPEED_PINCTRL_FUNC(I3C3),
+	ASPEED_PINCTRL_FUNC(I3C4),
+	ASPEED_PINCTRL_FUNC(I3C5),
+	ASPEED_PINCTRL_FUNC(I3C6),
+	ASPEED_PINCTRL_FUNC(I3C7),
+	ASPEED_PINCTRL_FUNC(I3C8),
+	ASPEED_PINCTRL_FUNC(I3C9),
+	ASPEED_PINCTRL_FUNC(I3C10),
+	ASPEED_PINCTRL_FUNC(I3C11),
+	ASPEED_PINCTRL_FUNC(I3C12),
+	ASPEED_PINCTRL_FUNC(I3C13),
+	ASPEED_PINCTRL_FUNC(I3C14),
+	ASPEED_PINCTRL_FUNC(I3C15),
+	ASPEED_PINCTRL_FUNC(LTPI),
+	ASPEED_PINCTRL_FUNC(SPI0),
+	ASPEED_PINCTRL_FUNC(QSPI0),
+	ASPEED_PINCTRL_FUNC(SPI0CS1),
+	ASPEED_PINCTRL_FUNC(SPI0ABR),
+	ASPEED_PINCTRL_FUNC(SPI0WPN),
+	ASPEED_PINCTRL_FUNC(SPI1),
+	ASPEED_PINCTRL_FUNC(QSPI1),
+	ASPEED_PINCTRL_FUNC(SPI1CS1),
+	ASPEED_PINCTRL_FUNC(SPI1ABR),
+	ASPEED_PINCTRL_FUNC(SPI1WPN),
+	ASPEED_PINCTRL_FUNC(SPI2),
+	ASPEED_PINCTRL_FUNC(QSPI2),
+	ASPEED_PINCTRL_FUNC(SPI2CS1),
+	ASPEED_PINCTRL_FUNC(THRU2),
+	ASPEED_PINCTRL_FUNC(THRU3),
+	ASPEED_PINCTRL_FUNC(JTAGM1),
+	ASPEED_PINCTRL_FUNC(MDIO0),
+	ASPEED_PINCTRL_FUNC(MDIO1),
+	ASPEED_PINCTRL_FUNC(MDIO2),
+	ASPEED_PINCTRL_FUNC(FWQSPI),
+	ASPEED_PINCTRL_FUNC(FWSPIABR),
+	ASPEED_PINCTRL_FUNC(FWSPIWPN),
+	ASPEED_PINCTRL_FUNC(RGMII0),
+	ASPEED_PINCTRL_FUNC(RGMII1),
+	ASPEED_PINCTRL_FUNC(RMII0),
+	ASPEED_PINCTRL_FUNC(RMII0RCLKO),
+	ASPEED_PINCTRL_FUNC(RMII1),
+	ASPEED_PINCTRL_FUNC(RMII1RCLKO),
+	ASPEED_PINCTRL_FUNC(VGA),
+	ASPEED_PINCTRL_FUNC(DSGPM1),
+	ASPEED_PINCTRL_FUNC(SGPS),
+	ASPEED_PINCTRL_FUNC(I2CF0),
+	ASPEED_PINCTRL_FUNC(I2CF1),
+	ASPEED_PINCTRL_FUNC(I2CF2),
+	ASPEED_PINCTRL_FUNC(CANBUS),
+	ASPEED_PINCTRL_FUNC(USBUART),
+	ASPEED_PINCTRL_FUNC(HBLED),
+	ASPEED_PINCTRL_FUNC(MACLINK0),
+	ASPEED_PINCTRL_FUNC(MACLINK1),
+	ASPEED_PINCTRL_FUNC(MACLINK2),
+	ASPEED_PINCTRL_FUNC(SMON0),
+	ASPEED_PINCTRL_FUNC(SMON1),
+	ASPEED_PINCTRL_FUNC(SGMII),
+	ASPEED_PINCTRL_FUNC(PCIERC),
+	ASPEED_PINCTRL_FUNC(USB2C),
+	ASPEED_PINCTRL_FUNC(USB2D),
+};
+
+/* number, name, drv_data */
+static const struct pinctrl_pin_desc aspeed_g7_soc1_pins[] = {
+	PINCTRL_PIN(C16, "C16"),
+	PINCTRL_PIN(C14, "C14"),
+	PINCTRL_PIN(C11, "C11"),
+	PINCTRL_PIN(D9, "D9"),
+	PINCTRL_PIN(F14, "F14"),
+	PINCTRL_PIN(D10, "D10"),
+	PINCTRL_PIN(C12, "C12"),
+	PINCTRL_PIN(C13, "C13"),
+	PINCTRL_PIN(AC26, "AC26"),
+	PINCTRL_PIN(AA25, "AA25"),
+	PINCTRL_PIN(AB23, "AB23"),
+	PINCTRL_PIN(U22, "U22"),
+	PINCTRL_PIN(V21, "V21"),
+	PINCTRL_PIN(N26, "N26"),
+	PINCTRL_PIN(P25, "P25"),
+	PINCTRL_PIN(N25, "N25"),
+	PINCTRL_PIN(V23, "V23"),
+	PINCTRL_PIN(W22, "W22"),
+	PINCTRL_PIN(AB26, "AB26"),
+	PINCTRL_PIN(AD26, "AD26"),
+	PINCTRL_PIN(P26, "P26"),
+	PINCTRL_PIN(AE26, "AE26"),
+	PINCTRL_PIN(AF26, "AF26"),
+	PINCTRL_PIN(AF25, "AF25"),
+	PINCTRL_PIN(AE25, "AE25"),
+	PINCTRL_PIN(AD25, "AD25"),
+	PINCTRL_PIN(AF23, "AF23"),
+	PINCTRL_PIN(AF20, "AF20"),
+	PINCTRL_PIN(AF21, "AF21"),
+	PINCTRL_PIN(AE21, "AE21"),
+	PINCTRL_PIN(AE23, "AE23"),
+	PINCTRL_PIN(AD22, "AD22"),
+	PINCTRL_PIN(AF17, "AF17"),
+	PINCTRL_PIN(AA16, "AA16"),
+	PINCTRL_PIN(Y16, "Y16"),
+	PINCTRL_PIN(V17, "V17"),
+	PINCTRL_PIN(J13, "J13"),
+	PINCTRL_PIN(AB16, "AB16"),
+	PINCTRL_PIN(AC16, "AC16"),
+	PINCTRL_PIN(AF16, "AF16"),
+	PINCTRL_PIN(AA15, "AA15"),
+	PINCTRL_PIN(AB15, "AB15"),
+	PINCTRL_PIN(AC15, "AC15"),
+	PINCTRL_PIN(AD15, "AD15"),
+	PINCTRL_PIN(Y15, "Y15"),
+	PINCTRL_PIN(AA14, "AA14"),
+	PINCTRL_PIN(W16, "W16"),
+	PINCTRL_PIN(V16, "V16"),
+	PINCTRL_PIN(AB18, "AB18"),
+	PINCTRL_PIN(AC18, "AC18"),
+	PINCTRL_PIN(K13, "K13"),
+	PINCTRL_PIN(AA17, "AA17"),
+	PINCTRL_PIN(AB17, "AB17"),
+	PINCTRL_PIN(AD16, "AD16"),
+	PINCTRL_PIN(AC17, "AC17"),
+	PINCTRL_PIN(AD17, "AD17"),
+	PINCTRL_PIN(AE16, "AE16"),
+	PINCTRL_PIN(AE17, "AE17"),
+	PINCTRL_PIN(AB24, "AB24"),
+	PINCTRL_PIN(W26, "W26"),
+	PINCTRL_PIN(HOLE0, "HOLE0"),
+	PINCTRL_PIN(HOLE1, "HOLE1"),
+	PINCTRL_PIN(HOLE2, "HOLE2"),
+	PINCTRL_PIN(HOLE3, "HOLE3"),
+	PINCTRL_PIN(W25, "W25"),
+	PINCTRL_PIN(Y23, "Y23"),
+	PINCTRL_PIN(Y24, "Y24"),
+	PINCTRL_PIN(W21, "W21"),
+	PINCTRL_PIN(AA23, "AA23"),
+	PINCTRL_PIN(AC22, "AC22"),
+	PINCTRL_PIN(AB22, "AB22"),
+	PINCTRL_PIN(Y21, "Y21"),
+	PINCTRL_PIN(AE20, "AE20"),
+	PINCTRL_PIN(AF19, "AF19"),
+	PINCTRL_PIN(Y22, "Y22"),
+	PINCTRL_PIN(AA20, "AA20"),
+	PINCTRL_PIN(AA22, "AA22"),
+	PINCTRL_PIN(AB20, "AB20"),
+	PINCTRL_PIN(AF18, "AF18"),
+	PINCTRL_PIN(AE19, "AE19"),
+	PINCTRL_PIN(AD20, "AD20"),
+	PINCTRL_PIN(AC20, "AC20"),
+	PINCTRL_PIN(AA21, "AA21"),
+	PINCTRL_PIN(AB21, "AB21"),
+	PINCTRL_PIN(AC19, "AC19"),
+	PINCTRL_PIN(AE18, "AE18"),
+	PINCTRL_PIN(AD19, "AD19"),
+	PINCTRL_PIN(AD18, "AD18"),
+	PINCTRL_PIN(U25, "U25"),
+	PINCTRL_PIN(U26, "U26"),
+	PINCTRL_PIN(Y26, "Y26"),
+	PINCTRL_PIN(AA24, "AA24"),
+	PINCTRL_PIN(R25, "R25"),
+	PINCTRL_PIN(AA26, "AA26"),
+	PINCTRL_PIN(R26, "R26"),
+	PINCTRL_PIN(Y25, "Y25"),
+	PINCTRL_PIN(B16, "B16"),
+	PINCTRL_PIN(D14, "D14"),
+	PINCTRL_PIN(B15, "B15"),
+	PINCTRL_PIN(B14, "B14"),
+	PINCTRL_PIN(C17, "C17"),
+	PINCTRL_PIN(B13, "B13"),
+	PINCTRL_PIN(E14, "E14"),
+	PINCTRL_PIN(C15, "C15"),
+	PINCTRL_PIN(D24, "D24"),
+	PINCTRL_PIN(B23, "B23"),
+	PINCTRL_PIN(B22, "B22"),
+	PINCTRL_PIN(C23, "C23"),
+	PINCTRL_PIN(B18, "B18"),
+	PINCTRL_PIN(B21, "B21"),
+	PINCTRL_PIN(M15, "M15"),
+	PINCTRL_PIN(B19, "B19"),
+	PINCTRL_PIN(B26, "B26"),
+	PINCTRL_PIN(A25, "A25"),
+	PINCTRL_PIN(A24, "A24"),
+	PINCTRL_PIN(B24, "B24"),
+	PINCTRL_PIN(E26, "E26"),
+	PINCTRL_PIN(A21, "A21"),
+	PINCTRL_PIN(A19, "A19"),
+	PINCTRL_PIN(A18, "A18"),
+	PINCTRL_PIN(D26, "D26"),
+	PINCTRL_PIN(C26, "C26"),
+	PINCTRL_PIN(A23, "A23"),
+	PINCTRL_PIN(A22, "A22"),
+	PINCTRL_PIN(B25, "B25"),
+	PINCTRL_PIN(F26, "F26"),
+	PINCTRL_PIN(A26, "A26"),
+	PINCTRL_PIN(A14, "A14"),
+	PINCTRL_PIN(E10, "E10"),
+	PINCTRL_PIN(E13, "E13"),
+	PINCTRL_PIN(D12, "D12"),
+	PINCTRL_PIN(F10, "F10"),
+	PINCTRL_PIN(E11, "E11"),
+	PINCTRL_PIN(F11, "F11"),
+	PINCTRL_PIN(F13, "F13"),
+	PINCTRL_PIN(N15, "N15"),
+	PINCTRL_PIN(C20, "C20"),
+	PINCTRL_PIN(C19, "C19"),
+	PINCTRL_PIN(A8, "A8"),
+	PINCTRL_PIN(R14, "R14"),
+	PINCTRL_PIN(A7, "A7"),
+	PINCTRL_PIN(P14, "P14"),
+	PINCTRL_PIN(D20, "D20"),
+	PINCTRL_PIN(A6, "A6"),
+	PINCTRL_PIN(B6, "B6"),
+	PINCTRL_PIN(N14, "N14"),
+	PINCTRL_PIN(B7, "B7"),
+	PINCTRL_PIN(B8, "B8"),
+	PINCTRL_PIN(B9, "B9"),
+	PINCTRL_PIN(M14, "M14"),
+	PINCTRL_PIN(J11, "J11"),
+	PINCTRL_PIN(E7, "E7"),
+	PINCTRL_PIN(D19, "D19"),
+	PINCTRL_PIN(B11, "B11"),
+	PINCTRL_PIN(D15, "D15"),
+	PINCTRL_PIN(B12, "B12"),
+	PINCTRL_PIN(B10, "B10"),
+	PINCTRL_PIN(P13, "P13"),
+	PINCTRL_PIN(C18, "C18"),
+	PINCTRL_PIN(C6, "C6"),
+	PINCTRL_PIN(C7, "C7"),
+	PINCTRL_PIN(D7, "D7"),
+	PINCTRL_PIN(N13, "N13"),
+	PINCTRL_PIN(C8, "C8"),
+	PINCTRL_PIN(C9, "C9"),
+	PINCTRL_PIN(C10, "C10"),
+	PINCTRL_PIN(M16, "M16"),
+	PINCTRL_PIN(A15, "A15"),
+	PINCTRL_PIN(G11, "G11"),
+	PINCTRL_PIN(H7, "H7"),
+	PINCTRL_PIN(H8, "H8"),
+	PINCTRL_PIN(H9, "H9"),
+	PINCTRL_PIN(H10, "H10"),
+	PINCTRL_PIN(H11, "H11"),
+	PINCTRL_PIN(J9, "J9"),
+	PINCTRL_PIN(J10, "J10"),
+	PINCTRL_PIN(E9, "E9"),
+	PINCTRL_PIN(F9, "F9"),
+	PINCTRL_PIN(F8, "F8"),
+	PINCTRL_PIN(M13, "M13"),
+	PINCTRL_PIN(F7, "F7"),
+	PINCTRL_PIN(D8, "D8"),
+	PINCTRL_PIN(E8, "E8"),
+	PINCTRL_PIN(L12, "L12"),
+	PINCTRL_PIN(F12, "F12"),
+	PINCTRL_PIN(E12, "E12"),
+	PINCTRL_PIN(J12, "J12"),
+	PINCTRL_PIN(G7, "G7"),
+	PINCTRL_PIN(G8, "G8"),
+	PINCTRL_PIN(G9, "G9"),
+	PINCTRL_PIN(G10, "G10"),
+	PINCTRL_PIN(K12, "K12"),
+	PINCTRL_PIN(W17, "W17"),
+	PINCTRL_PIN(V18, "V18"),
+	PINCTRL_PIN(W18, "W18"),
+	PINCTRL_PIN(Y17, "Y17"),
+	PINCTRL_PIN(AA18, "AA18"),
+	PINCTRL_PIN(AA13, "AA13"),
+	PINCTRL_PIN(Y18, "Y18"),
+	PINCTRL_PIN(AA12, "AA12"),
+	PINCTRL_PIN(W20, "W20"),
+	PINCTRL_PIN(V20, "V20"),
+	PINCTRL_PIN(Y11, "Y11"),
+	PINCTRL_PIN(V14, "V14"),
+	PINCTRL_PIN(V19, "V19"),
+	PINCTRL_PIN(W14, "W14"),
+	PINCTRL_PIN(Y20, "Y20"),
+	PINCTRL_PIN(AB19, "AB19"),
+	PINCTRL_PIN(U21, "U21"),
+	PINCTRL_PIN(T24, "T24"),
+	PINCTRL_PIN(V24, "V24"),
+	PINCTRL_PIN(V22, "V22"),
+	PINCTRL_PIN(T23, "T23"),
+	PINCTRL_PIN(AC25, "AC25"),
+	PINCTRL_PIN(AB25, "AB25"),
+	PINCTRL_PIN(AC24, "AC24"),
+	PINCTRL_PIN(SGMII0, "SGMII0"),
+	PINCTRL_PIN(PCIERC2_PERST, "PCIERC2_PERST"),
+	PINCTRL_PIN(PORTC_MODE, "PORTC_MODE"),
+	PINCTRL_PIN(PORTD_MODE, "PORTD_MODE"),
+};
+
+FUNCFG_DESCL(C16, PIN_CFG(ESPI1, SCU400, GENMASK(2, 0), 1),
+	     PIN_CFG(LPC1, SCU400, GENMASK(2, 0), 2),
+	     PIN_CFG(SD, SCU400, GENMASK(2, 0), 3),
+	     PIN_CFG(DI2C0, SCU400, GENMASK(2, 0), 4),
+	     PIN_CFG(VPI, SCU400, GENMASK(2, 0), 5));
+FUNCFG_DESCL(C14, PIN_CFG(ESPI1, SCU400, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(LPC1, SCU400, GENMASK(6, 4), (2 << 4)),
+	     PIN_CFG(SD, SCU400, GENMASK(6, 4), (3 << 4)),
+	     PIN_CFG(DI2C1, SCU400, GENMASK(6, 4), (4 << 4)),
+	     PIN_CFG(VPI, SCU400, GENMASK(6, 4), (5 << 4)));
+FUNCFG_DESCL(C11, PIN_CFG(ESPI1, SCU400, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(LPC1, SCU400, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(SD, SCU400, GENMASK(10, 8), (3 << 8)),
+	     PIN_CFG(DI2C3, SCU400, GENMASK(10, 8), (4 << 8)),
+	     PIN_CFG(VPI, SCU400, GENMASK(10, 8), (5 << 8)));
+FUNCFG_DESCL(D9, PIN_CFG(ESPI1, SCU400, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(LPC1, SCU400, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(SD, SCU400, GENMASK(14, 12), (3 << 12)),
+	     PIN_CFG(DI2C0, SCU400, GENMASK(14, 12), (4 << 12)),
+	     PIN_CFG(VPI, SCU400, GENMASK(14, 12), (5 << 12)));
+FUNCFG_DESCL(F14, PIN_CFG(ESPI1, SCU400, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(LPC1, SCU400, GENMASK(18, 16), (2 << 16)),
+	     PIN_CFG(SD, SCU400, GENMASK(18, 16), (3 << 16)),
+	     PIN_CFG(DI2C1, SCU400, GENMASK(18, 16), (4 << 16)),
+	     PIN_CFG(VPI, SCU400, GENMASK(18, 16), (5 << 16)));
+FUNCFG_DESCL(D10, PIN_CFG(ESPI1, SCU400, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(LPC1, SCU400, GENMASK(22, 20), (2 << 20)),
+	     PIN_CFG(SD, SCU400, GENMASK(22, 20), (3 << 20)),
+	     PIN_CFG(DI2C2, SCU400, GENMASK(22, 20), (4 << 20)),
+	     PIN_CFG(VPI, SCU400, GENMASK(22, 20), (5 << 20)));
+FUNCFG_DESCL(C12, PIN_CFG(ESPI1, SCU400, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(LPC1, SCU400, GENMASK(26, 24), (2 << 24)),
+	     PIN_CFG(SD, SCU400, GENMASK(26, 24), (3 << 24)),
+	     PIN_CFG(DI2C2, SCU400, GENMASK(26, 24), (4 << 24)));
+FUNCFG_DESCL(C13, PIN_CFG(ESPI1, SCU400, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(LPC1, SCU400, GENMASK(30, 28), (2 << 28)),
+	     PIN_CFG(SD, SCU400, GENMASK(30, 28), (3 << 28)),
+	     PIN_CFG(DI2C3, SCU400, GENMASK(30, 28), (4 << 28)));
+FUNCFG_DESCL(AC26, PIN_CFG(TACH0, SCU404, GENMASK(2, 0), 1),
+	     PIN_CFG(THRU0, SCU404, GENMASK(2, 0), 2),
+	     PIN_CFG(VPI, SCU404, GENMASK(2, 0), 3));
+FUNCFG_DESCL(AA25, PIN_CFG(TACH1, SCU404, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(THRU0, SCU404, GENMASK(6, 4), (2 << 4)),
+	     PIN_CFG(VPI, SCU404, GENMASK(6, 4), (3 << 4)));
+FUNCFG_DESCL(AB23, PIN_CFG(TACH2, SCU404, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(THRU1, SCU404, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(VPI, SCU404, GENMASK(10, 8), (3 << 8)));
+FUNCFG_DESCL(U22, PIN_CFG(TACH3, SCU404, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(THRU1, SCU404, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(VPI, SCU404, GENMASK(14, 12), (3 << 12)));
+FUNCFG_DESCL(V21, PIN_CFG(TACH4, SCU404, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(VPI, SCU404, GENMASK(18, 16), (3 << 16)),
+	     PIN_CFG(NCTS5, SCU404, GENMASK(18, 16), (4 << 16)));
+FUNCFG_DESCL(N26, PIN_CFG(TACH5, SCU404, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(VPI, SCU404, GENMASK(22, 20), (3 << 20)),
+	     PIN_CFG(NDCD5, SCU404, GENMASK(22, 20), (4 << 20)));
+FUNCFG_DESCL(P25, PIN_CFG(TACH6, SCU404, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(VPI, SCU404, GENMASK(26, 24), (3 << 24)),
+	     PIN_CFG(NDSR5, SCU404, GENMASK(26, 24), (4 << 24)));
+FUNCFG_DESCL(N25, PIN_CFG(TACH7, SCU404, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(VPI, SCU404, GENMASK(30, 28), (3 << 28)),
+	     PIN_CFG(NRI5, SCU404, GENMASK(30, 28), (4 << 28)));
+FUNCFG_DESCL(V23, PIN_CFG(TACH8, SCU408, GENMASK(2, 0), 1),
+	     PIN_CFG(VPI, SCU408, GENMASK(2, 0), 3),
+	     PIN_CFG(NDTR5, SCU408, GENMASK(2, 0), 4));
+FUNCFG_DESCL(W22, PIN_CFG(TACH9, SCU408, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(VPI, SCU408, GENMASK(6, 4), (3 << 4)),
+	     PIN_CFG(NRTS5, SCU408, GENMASK(6, 4), (4 << 4)));
+FUNCFG_DESCL(AB26, PIN_CFG(TACH10, SCU408, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(SALT12, SCU408, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(VPI, SCU408, GENMASK(10, 8), (3 << 8)),
+	     PIN_CFG(NCTS6, SCU408, GENMASK(10, 8), (4 << 8)));
+FUNCFG_DESCL(AD26, PIN_CFG(TACH11, SCU408, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SALT13, SCU408, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(VPI, SCU408, GENMASK(14, 12), (3 << 12)),
+	     PIN_CFG(NDCD6, SCU408, GENMASK(14, 12), (4 << 12)));
+FUNCFG_DESCL(P26, PIN_CFG(TACH12, SCU408, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(SALT14, SCU408, GENMASK(18, 16), (2 << 16)),
+	     PIN_CFG(VPI, SCU408, GENMASK(18, 16), (3 << 16)),
+	     PIN_CFG(NDSR6, SCU408, GENMASK(18, 16), (4 << 16)));
+FUNCFG_DESCL(AE26, PIN_CFG(TACH13, SCU408, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(SALT15, SCU408, GENMASK(22, 20), (2 << 20)),
+	     PIN_CFG(VPI, SCU408, GENMASK(22, 20), (3 << 20)),
+	     PIN_CFG(NRI6, SCU408, GENMASK(22, 20), (4 << 20)));
+FUNCFG_DESCL(AF26, PIN_CFG(TACH14, SCU408, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(LPC0, SCU408, GENMASK(26, 24), (2 << 24)),
+	     PIN_CFG(VPI, SCU408, GENMASK(26, 24), (3 << 24)),
+	     PIN_CFG(NDTR6, SCU408, GENMASK(26, 24), (4 << 24)));
+FUNCFG_DESCL(AF25, PIN_CFG(TACH15, SCU408, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(LPC0, SCU408, GENMASK(30, 28), (2 << 28)),
+	     PIN_CFG(VPI, SCU408, GENMASK(30, 28), (3 << 28)),
+	     PIN_CFG(NRTS6, SCU408, GENMASK(30, 28), (4 << 28)));
+FUNCFG_DESCL(AE25, PIN_CFG(PWM0, SCU40C, GENMASK(2, 0), 1),
+	     PIN_CFG(SIOPBON0, SCU40C, GENMASK(2, 0), 2),
+	     PIN_CFG(VPI, SCU40C, GENMASK(2, 0), 3),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(2, 0), 4));
+FUNCFG_DESCL(AD25, PIN_CFG(PWM1, SCU40C, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(SIOPBIN0, SCU40C, GENMASK(6, 4), (2 << 4)),
+	     PIN_CFG(VPI, SCU40C, GENMASK(6, 4), (3 << 4)),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(6, 4), (4 << 4)));
+FUNCFG_DESCL(AF23, PIN_CFG(PWM2, SCU40C, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(SIOSCIN0, SCU40C, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(VPI, SCU40C, GENMASK(10, 8), (3 << 8)),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(10, 8), (4 << 8)));
+FUNCFG_DESCL(AF20, PIN_CFG(PWM3, SCU40C, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SIOS3N0, SCU40C, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(VPI, SCU40C, GENMASK(14, 12), (3 << 12)),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(14, 12), (4 << 12)));
+FUNCFG_DESCL(AF21, PIN_CFG(PWM4, SCU40C, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(SIOS5N0, SCU40C, GENMASK(18, 16), (2 << 16)),
+	     PIN_CFG(VPI, SCU40C, GENMASK(18, 16), (3 << 16)),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(18, 16), (4 << 16)));
+FUNCFG_DESCL(AE21, PIN_CFG(PWM5, SCU40C, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(SIOPWREQN0, SCU40C, GENMASK(22, 20), (2 << 20)),
+	     PIN_CFG(VPI, SCU40C, GENMASK(22, 20), (3 << 20)),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(22, 20), (4 << 20)));
+FUNCFG_DESCL(AE23, PIN_CFG(PWM6, SCU40C, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(SIOONCTRLN0, SCU40C, GENMASK(26, 24), (2 << 24)),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(26, 24), (4 << 24)));
+FUNCFG_DESCL(AD22, PIN_CFG(PWM7, SCU40C, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(SPIM0, SCU40C, GENMASK(30, 28), (4 << 28)));
+FUNCFG_DESCL(AF17, PIN_CFG(NCTS0, SCU410, GENMASK(2, 0), 1),
+	     PIN_CFG(SIOPBON1, SCU410, GENMASK(2, 0), 2));
+FUNCFG_DESCL(AA16, PIN_CFG(NDCD0, SCU410, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(SIOPBIN1, SCU410, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(Y16, PIN_CFG(NDSR0, SCU410, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(SIOSCIN1, SCU410, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(V17, PIN_CFG(NRI0, SCU410, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SIOS3N1, SCU410, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(J13, PIN_CFG(NDTR0, SCU410, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(SIOS5N1, SCU410, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(AB16, PIN_CFG(NRTS0, SCU410, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(SIOPWREQN1, SCU410, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(AC16, PIN_CFG(TXD0, SCU410, GENMASK(26, 24), (1 << 24)));
+FUNCFG_DESCL(AF16, PIN_CFG(RXD0, SCU410, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(AA15, PIN_CFG(NCTS1, SCU414, GENMASK(2, 0), 1),
+	     PIN_CFG(SIOONCTRLN1, SCU414, GENMASK(2, 0), 2));
+FUNCFG_DESCL(AB15, PIN_CFG(NDCD1, SCU414, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(SIOPWRGD1, SCU414, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(AC15, PIN_CFG(NDSR1, SCU414, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(SALT2, SCU414, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(AD15, PIN_CFG(NRI1, SCU414, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SALT3, SCU414, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(Y15, PIN_CFG(NDTR1, SCU414, GENMASK(18, 16), (1 << 16)));
+FUNCFG_DESCL(AA14, PIN_CFG(NRTS1, SCU414, GENMASK(22, 20), (1 << 20)));
+FUNCFG_DESCL(W16, PIN_CFG(TXD1, SCU414, GENMASK(26, 24), (1 << 24)));
+FUNCFG_DESCL(V16, PIN_CFG(RXD1, SCU414, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(AB18, PIN_CFG(TXD2, SCU418, GENMASK(2, 0), 1));
+FUNCFG_DESCL(AC18, PIN_CFG(RXD2, SCU418, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(I2C12, SCU418, GENMASK(6, 4), (4 << 4)));
+FUNCFG_DESCL(K13, PIN_CFG(TXD3, SCU418, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(WDTRST0N, SCU418, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(PWM8, SCU418, GENMASK(10, 8), (3 << 8)),
+	     PIN_CFG(SPIM1, SCU418, GENMASK(10, 8), (5 << 8)));
+FUNCFG_DESCL(AA17, PIN_CFG(RXD3, SCU418, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(WDTRST1N, SCU418, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(PWM9, SCU418, GENMASK(14, 12), (3 << 12)),
+	     PIN_CFG(I2C12, SCU418, GENMASK(14, 12), (4 << 12)),
+	     PIN_CFG(SPIM1, SCU418, GENMASK(14, 12), (5 << 12)));
+FUNCFG_DESCL(AB17, PIN_CFG(TXD5, SCU418, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(WDTRST2N, SCU418, GENMASK(18, 16), (2 << 16)),
+	     PIN_CFG(PWM10, SCU418, GENMASK(18, 16), (3 << 16)),
+	     PIN_CFG(I2C13, SCU418, GENMASK(18, 16), (4 << 16)),
+	     PIN_CFG(SPIM1, SCU418, GENMASK(18, 16), (5 << 16)));
+FUNCFG_DESCL(AD16, PIN_CFG(RXD5, SCU418, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(WDTRST3N, SCU418, GENMASK(22, 20), (2 << 20)),
+	     PIN_CFG(PWM11, SCU418, GENMASK(22, 20), (3 << 20)),
+	     PIN_CFG(I2C13, SCU418, GENMASK(22, 20), (4 << 20)),
+	     PIN_CFG(SPIM1, SCU418, GENMASK(22, 20), (5 << 20)));
+FUNCFG_DESCL(AC17, PIN_CFG(TXD6, SCU418, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(SALT0, SCU418, GENMASK(26, 24), (2 << 24)),
+	     PIN_CFG(PWM12, SCU418, GENMASK(26, 24), (3 << 24)),
+	     PIN_CFG(I2C14, SCU418, GENMASK(26, 24), (4 << 24)),
+	     PIN_CFG(SPIM1, SCU418, GENMASK(26, 24), (5 << 24)));
+FUNCFG_DESCL(AD17, PIN_CFG(RXD6, SCU418, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(SALT1, SCU418, GENMASK(30, 28), (2 << 28)),
+	     PIN_CFG(PWM13, SCU418, GENMASK(30, 28), (3 << 28)),
+	     PIN_CFG(I2C14, SCU418, GENMASK(30, 28), (4 << 28)),
+	     PIN_CFG(SPIM1, SCU418, GENMASK(30, 28), (5 << 28)));
+FUNCFG_DESCL(AE16, PIN_CFG(TXD7, SCU41C, GENMASK(2, 0), 1),
+	     PIN_CFG(I2C15, SCU41C, GENMASK(2, 0), 2),
+	     PIN_CFG(PWM14, SCU41C, GENMASK(2, 0), 3),
+	     PIN_CFG(LPC1, SCU41C, GENMASK(2, 0), 4),
+	     PIN_CFG(SPIM1, SCU41C, GENMASK(2, 0), 5));
+FUNCFG_DESCL(AE17, PIN_CFG(RXD7, SCU41C, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(I2C15, SCU41C, GENMASK(6, 4), (2 << 4)),
+	     PIN_CFG(PWM15, SCU41C, GENMASK(6, 4), (3 << 4)),
+	     PIN_CFG(LPC1, SCU41C, GENMASK(6, 4), (4 << 4)),
+	     PIN_CFG(SPIM1, SCU41C, GENMASK(6, 4), (5 << 4)));
+FUNCFG_DESCL(AB24, PIN_CFG(SGPM1, SCU41C, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(WDTRST7N, SCU41C, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(PESGWAKEN, SCU41C, GENMASK(10, 8), (3 << 8)),
+	     PIN_CFG(SMON1, SCU41C, GENMASK(10, 8), (5 << 8)));
+FUNCFG_DESCL(W26, PIN_CFG(SGPM1, SCU41C, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SMON1, SCU41C, GENMASK(14, 12), (5 << 12)));
+FUNCFG_DESCL(HOLE0);
+FUNCFG_DESCL(HOLE1);
+FUNCFG_DESCL(HOLE2);
+FUNCFG_DESCL(HOLE3);
+FUNCFG_DESCL(W25, PIN_CFG(HVI3C12, SCU420, GENMASK(2, 0), 1),
+	     PIN_CFG(DI2C12, SCU420, GENMASK(2, 0), 2));
+FUNCFG_DESCL(Y23, PIN_CFG(HVI3C12, SCU420, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(DI2C12, SCU420, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(Y24, PIN_CFG(HVI3C13, SCU420, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(DI2C13, SCU420, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(W21, PIN_CFG(HVI3C13, SCU420, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(DI2C13, SCU420, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(AA23, PIN_CFG(HVI3C14, SCU420, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(DI2C14, SCU420, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(AC22, PIN_CFG(HVI3C14, SCU420, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(DI2C14, SCU420, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(AB22, PIN_CFG(HVI3C15, SCU420, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(DI2C15, SCU420, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(Y21, PIN_CFG(HVI3C15, SCU420, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(DI2C15, SCU420, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(AE20, PIN_CFG(I3C4, SCU424, GENMASK(2, 0), 1));
+FUNCFG_DESCL(AF19, PIN_CFG(I3C4, SCU424, GENMASK(6, 4), (1 << 4)));
+FUNCFG_DESCL(Y22, PIN_CFG(I3C5, SCU424, GENMASK(10, 8), (1 << 8)));
+FUNCFG_DESCL(AA20, PIN_CFG(I3C5, SCU424, GENMASK(14, 12), (1 << 12)));
+FUNCFG_DESCL(AA22, PIN_CFG(I3C6, SCU424, GENMASK(18, 16), (1 << 16)));
+FUNCFG_DESCL(AB20, PIN_CFG(I3C6, SCU424, GENMASK(22, 20), (1 << 20)));
+FUNCFG_DESCL(AF18, PIN_CFG(I3C7, SCU424, GENMASK(26, 24), (1 << 24)));
+FUNCFG_DESCL(AE19, PIN_CFG(I3C7, SCU424, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(AD20, PIN_CFG(I3C8, SCU428, GENMASK(2, 0), 1),
+	     PIN_CFG(FSI0, SCU428, GENMASK(2, 0), 2));
+FUNCFG_DESCL(AC20, PIN_CFG(I3C8, SCU428, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(FSI0, SCU428, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(AA21, PIN_CFG(I3C9, SCU428, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(FSI1, SCU428, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(AB21, PIN_CFG(I3C9, SCU428, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(FSI1, SCU428, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(AC19, PIN_CFG(I3C10, SCU428, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(FSI2, SCU428, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(AE18, PIN_CFG(I3C10, SCU428, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(FSI2, SCU428, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(AD19, PIN_CFG(I3C11, SCU428, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(FSI3, SCU428, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(AD18, PIN_CFG(I3C11, SCU428, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(FSI3, SCU428, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(U25, PIN_CFG(HVI3C0, SCU42C, GENMASK(2, 0), 1),
+	     PIN_CFG(DI2C8, SCU42C, GENMASK(2, 0), 2));
+FUNCFG_DESCL(U26, PIN_CFG(HVI3C0, SCU42C, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(DI2C8, SCU42C, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(Y26, PIN_CFG(HVI3C1, SCU42C, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(DI2C9, SCU42C, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(AA24, PIN_CFG(HVI3C1, SCU42C, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(DI2C9, SCU42C, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(R25, PIN_CFG(HVI3C2, SCU42C, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(DI2C10, SCU42C, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(AA26, PIN_CFG(HVI3C2, SCU42C, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(DI2C10, SCU42C, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(R26, PIN_CFG(HVI3C3, SCU42C, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(DI2C11, SCU42C, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(Y25, PIN_CFG(HVI3C3, SCU42C, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(DI2C11, SCU42C, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(B16, PIN_CFG(ESPI0, SCU430, GENMASK(2, 0), 1),
+	     PIN_CFG(LPC0, SCU430, GENMASK(2, 0), 2));
+FUNCFG_DESCL(D14, PIN_CFG(ESPI0, SCU430, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(LPC0, SCU430, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(B15, PIN_CFG(ESPI0, SCU430, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(LPC0, SCU430, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(B14, PIN_CFG(ESPI0, SCU430, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(LPC0, SCU430, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(C17, PIN_CFG(ESPI0, SCU430, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(LPC0, SCU430, GENMASK(18, 16), (2 << 16)),
+	     PIN_CFG(OSCCLK, SCU430, GENMASK(18, 16), (3 << 16)));
+FUNCFG_DESCL(B13, PIN_CFG(ESPI0, SCU430, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(LPC0, SCU430, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(E14, PIN_CFG(ESPI0, SCU430, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(LPC0, SCU430, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(C15, PIN_CFG(ESPI0, SCU430, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(LPC0, SCU430, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(D24, PIN_CFG(SPI0, SCU434, GENMASK(2, 0), 1));
+FUNCFG_DESCL(B23, PIN_CFG(SPI0, SCU434, GENMASK(6, 4), (1 << 4)));
+FUNCFG_DESCL(B22, PIN_CFG(SPI0, SCU434, GENMASK(10, 8), (1 << 8)));
+FUNCFG_DESCL(C23, PIN_CFG(QSPI0, SCU434, GENMASK(14, 12), (1 << 12)));
+FUNCFG_DESCL(B18, PIN_CFG(QSPI0, SCU434, GENMASK(18, 16), (1 << 16)));
+FUNCFG_DESCL(B21, PIN_CFG(SPI0CS1, SCU434, GENMASK(22, 20), (1 << 20)));
+FUNCFG_DESCL(M15, PIN_CFG(SPI0ABR, SCU434, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(TXD8, SCU434, GENMASK(26, 24), (3 << 24)));
+FUNCFG_DESCL(B19, PIN_CFG(SPI0WPN, SCU434, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(RXD8, SCU434, GENMASK(30, 28), (3 << 28)));
+FUNCFG_DESCL(B26, PIN_CFG(SPI1, SCU438, GENMASK(2, 0), 1),
+	     PIN_CFG(TXD9, SCU438, GENMASK(2, 0), 3));
+FUNCFG_DESCL(A25, PIN_CFG(SPI1, SCU438, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(RXD9, SCU438, GENMASK(6, 4), (3 << 4)));
+FUNCFG_DESCL(A24, PIN_CFG(SPI1, SCU438, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(TXD10, SCU438, GENMASK(10, 8), (3 << 8)));
+FUNCFG_DESCL(B24, PIN_CFG(QSPI1, SCU438, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(RXD10, SCU438, GENMASK(14, 12), (3 << 12)));
+FUNCFG_DESCL(E26, PIN_CFG(QSPI1, SCU438, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(TXD11, SCU438, GENMASK(18, 16), (3 << 16)));
+FUNCFG_DESCL(A21, PIN_CFG(SPI1CS1, SCU438, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(RXD11, SCU438, GENMASK(22, 20), (3 << 20)));
+FUNCFG_DESCL(A19, PIN_CFG(SPI1ABR, SCU438, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(THRU2, SCU438, GENMASK(26, 24), (4 << 24)));
+FUNCFG_DESCL(A18, PIN_CFG(SPI1WPN, SCU438, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(THRU2, SCU438, GENMASK(30, 28), (4 << 28)));
+FUNCFG_DESCL(D26, PIN_CFG(SPI2, SCU43C, GENMASK(2, 0), 1));
+FUNCFG_DESCL(C26, PIN_CFG(SPI2, SCU43C, GENMASK(6, 4), (1 << 4)));
+FUNCFG_DESCL(A23, PIN_CFG(SPI2, SCU43C, GENMASK(10, 8), (1 << 8)));
+FUNCFG_DESCL(A22, PIN_CFG(SPI2, SCU43C, GENMASK(14, 12), (1 << 12)));
+FUNCFG_DESCL(B25, PIN_CFG(QSPI2, SCU43C, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(THRU3, SCU43C, GENMASK(18, 16), (4 << 16)));
+FUNCFG_DESCL(F26, PIN_CFG(QSPI2, SCU43C, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(THRU3, SCU43C, GENMASK(22, 20), (4 << 20)));
+FUNCFG_DESCL(A26, PIN_CFG(SPI2CS1, SCU43C, GENMASK(26, 24), (1 << 24)));
+FUNCFG_DESCL(A14, PIN_CFG(FWSPIABR, SCU43C, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(E10, PIN_CFG(MDIO2, SCU440, GENMASK(2, 0), 1),
+	     PIN_CFG(PE2SGRSTN, SCU440, GENMASK(2, 0), 2));
+FUNCFG_DESCL(E13, PIN_CFG(MDIO2, SCU440, GENMASK(6, 4), (1 << 4)));
+FUNCFG_DESCL(D12, PIN_CFG(JTAGM1, SCU440, GENMASK(10, 8), (1 << 8)));
+FUNCFG_DESCL(F10, PIN_CFG(JTAGM1, SCU440, GENMASK(14, 12), (1 << 12)));
+FUNCFG_DESCL(E11, PIN_CFG(JTAGM1, SCU440, GENMASK(18, 16), (1 << 16)));
+FUNCFG_DESCL(F11, PIN_CFG(JTAGM1, SCU440, GENMASK(22, 20), (1 << 20)));
+FUNCFG_DESCL(F13, PIN_CFG(JTAGM1, SCU440, GENMASK(26, 24), (1 << 24)));
+FUNCFG_DESCL(N15, PIN_CFG(FWSPIWPEN, SCU440, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(C20, PIN_CFG(RGMII0, SCU444, GENMASK(2, 0), 1),
+	     PIN_CFG(RMII0, SCU444, GENMASK(2, 0), 2));
+FUNCFG_DESCL(C19, PIN_CFG(RGMII0, SCU444, GENMASK(6, 4), (1 << 4)));
+FUNCFG_DESCL(A8, PIN_CFG(RGMII0, SCU444, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(RMII0, SCU444, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(R14, PIN_CFG(RGMII0, SCU444, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(RMII0, SCU444, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(A7, PIN_CFG(RGMII0, SCU444, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(RMII0, SCU444, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(P14, PIN_CFG(RGMII0, SCU444, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(RMII0, SCU444, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(D20, PIN_CFG(RGMII0, SCU444, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(RMII0RCLKO, SCU444, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(A6, PIN_CFG(RGMII0, SCU444, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(RMII0, SCU444, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(B6, PIN_CFG(RGMII0, SCU448, GENMASK(2, 0), 1),
+	     PIN_CFG(RMII0, SCU448, GENMASK(2, 0), 2));
+FUNCFG_DESCL(N14, PIN_CFG(RGMII0, SCU448, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(RMII0, SCU448, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(B7, PIN_CFG(RGMII0, SCU448, GENMASK(10, 8), (1 << 8)));
+FUNCFG_DESCL(B8, PIN_CFG(RGMII0, SCU448, GENMASK(14, 12), (1 << 12)));
+FUNCFG_DESCL(B9, PIN_CFG(MDIO0, SCU448, GENMASK(18, 16), (1 << 16)));
+FUNCFG_DESCL(M14, PIN_CFG(MDIO0, SCU448, GENMASK(22, 20), (1 << 20)));
+FUNCFG_DESCL(J11, PIN_CFG(VGA, SCU448, GENMASK(26, 24), (1 << 24)));
+FUNCFG_DESCL(E7, PIN_CFG(VGA, SCU448, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(D19, PIN_CFG(RGMII1, SCU44C, GENMASK(2, 0), 1),
+	     PIN_CFG(RMII1, SCU44C, GENMASK(2, 0), 2),
+	     PIN_CFG(DSGPM1, SCU44C, GENMASK(2, 0), 4));
+FUNCFG_DESCL(B11, PIN_CFG(RGMII1, SCU44C, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(SGPS, SCU44C, GENMASK(6, 4), (5 << 4)));
+FUNCFG_DESCL(D15, PIN_CFG(RGMII1, SCU44C, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(RMII1, SCU44C, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(TXD3, SCU44C, GENMASK(10, 8), (4 << 8)));
+FUNCFG_DESCL(B12, PIN_CFG(RGMII1, SCU44C, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(RMII1, SCU44C, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(RXD3, SCU44C, GENMASK(14, 12), (4 << 12)));
+FUNCFG_DESCL(B10, PIN_CFG(RGMII1, SCU44C, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(RMII1, SCU44C, GENMASK(18, 16), (2 << 16)),
+	     PIN_CFG(DSGPM1, SCU44C, GENMASK(18, 16), (4 << 16)));
+FUNCFG_DESCL(P13, PIN_CFG(RGMII1, SCU44C, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(RMII1, SCU44C, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(C18, PIN_CFG(RGMII1, SCU44C, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(RMII1RCLKO, SCU44C, GENMASK(26, 24), (2 << 24)),
+	     PIN_CFG(SGPS, SCU44C, GENMASK(26, 24), (5 << 24)));
+FUNCFG_DESCL(C6, PIN_CFG(RGMII1, SCU44C, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(RMII1, SCU44C, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(C7, PIN_CFG(RGMII1, SCU450, GENMASK(2, 0), 1),
+	     PIN_CFG(RMII1, SCU450, GENMASK(2, 0), 2),
+	     PIN_CFG(DSGPM1, SCU450, GENMASK(2, 0), 4));
+FUNCFG_DESCL(D7, PIN_CFG(RGMII1, SCU450, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(RMII1, SCU450, GENMASK(6, 4), (2 << 4)),
+	     PIN_CFG(DSGPM1, SCU450, GENMASK(6, 4), (4 << 4)));
+FUNCFG_DESCL(N13, PIN_CFG(RGMII1, SCU450, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(SGPS, SCU450, GENMASK(10, 8), (5 << 8)));
+FUNCFG_DESCL(C8, PIN_CFG(RGMII1, SCU450, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SGPS, SCU450, GENMASK(14, 12), (5 << 12)));
+FUNCFG_DESCL(C9, PIN_CFG(MDIO1, SCU450, GENMASK(18, 16), (1 << 16)));
+FUNCFG_DESCL(C10, PIN_CFG(MDIO1, SCU450, GENMASK(22, 20), (1 << 20)));
+FUNCFG_DESCL(M16, PIN_CFG(FWQSPI, SCU450, GENMASK(26, 24), (1 << 24)));
+FUNCFG_DESCL(A15, PIN_CFG(FWQSPI, SCU450, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(G11, PIN_CFG(I2C0, SCU454, GENMASK(2, 0), 1),
+	     PIN_CFG(LTPI_I2C0, SCU454, GENMASK(2, 0), 2));
+FUNCFG_DESCL(H7, PIN_CFG(I2C0, SCU454, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(LTPI_I2C0, SCU454, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(H8, PIN_CFG(I2C1, SCU454, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(LTPI_I2C1, SCU454, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(H9, PIN_CFG(I2C1, SCU454, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(LTPI_I2C1, SCU454, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(H10, PIN_CFG(I2C2, SCU454, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(LTPI_I2C2, SCU454, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(H11, PIN_CFG(I2C2, SCU454, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(LTPI_I2C2, SCU454, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(J9, PIN_CFG(I2C3, SCU454, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(LTPI_I2C3, SCU454, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(J10, PIN_CFG(I2C3, SCU454, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(LTPI_I2C3, SCU454, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(E9, PIN_CFG(I2C4, SCU458, GENMASK(2, 0), 1),
+	     PIN_CFG(I2CF1, SCU458, GENMASK(2, 0), 5));
+FUNCFG_DESCL(F9, PIN_CFG(I2C4, SCU458, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(I2CF1, SCU458, GENMASK(6, 4), (5 << 4)));
+FUNCFG_DESCL(F8, PIN_CFG(I2C5, SCU458, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(I2CF1, SCU458, GENMASK(10, 8), (5 << 8)));
+FUNCFG_DESCL(M13, PIN_CFG(I2C5, SCU458, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(I2CF1, SCU458, GENMASK(14, 12), (5 << 12)));
+FUNCFG_DESCL(F7, PIN_CFG(I2C6, SCU458, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(I2CF2, SCU458, GENMASK(18, 16), (5 << 16)));
+FUNCFG_DESCL(D8, PIN_CFG(I2C6, SCU458, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(I2CF2, SCU458, GENMASK(22, 20), (5 << 20)));
+FUNCFG_DESCL(E8, PIN_CFG(I2C7, SCU458, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(I2CF2, SCU458, GENMASK(26, 24), (5 << 24)));
+FUNCFG_DESCL(L12, PIN_CFG(I2C7, SCU458, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(I2CF2, SCU458, GENMASK(30, 28), (5 << 28)));
+FUNCFG_DESCL(F12, PIN_CFG(I2C8, SCU45C, GENMASK(2, 0), 1),
+	     PIN_CFG(I2CF0, SCU45C, GENMASK(2, 0), 5));
+FUNCFG_DESCL(E12, PIN_CFG(I2C8, SCU45C, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(I2CF0, SCU45C, GENMASK(6, 4), (5 << 4)));
+FUNCFG_DESCL(J12, PIN_CFG(I2C9, SCU45C, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(I2CF0, SCU45C, GENMASK(10, 8), (5 << 8)));
+FUNCFG_DESCL(G7, PIN_CFG(I2C9, SCU45C, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(CANBUS, SCU45C, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(I2CF0, SCU45C, GENMASK(14, 12), (5 << 12)));
+FUNCFG_DESCL(G8, PIN_CFG(I2C10, SCU45C, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(CANBUS, SCU45C, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(G9, PIN_CFG(I2C10, SCU45C, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(CANBUS, SCU45C, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(G10, PIN_CFG(I2C11, SCU45C, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(USBUART, SCU45C, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(K12, PIN_CFG(I2C11, SCU45C, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(USBUART, SCU45C, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(W17, PIN_CFG(ADC0, SCU460, GENMASK(2, 0), 0),
+	     PIN_CFG(GPIY0, SCU460, GENMASK(2, 0), 1),
+	     PIN_CFG(SALT4, SCU460, GENMASK(2, 0), 2));
+FUNCFG_DESCL(V18, PIN_CFG(ADC1, SCU460, GENMASK(6, 4), 0),
+	     PIN_CFG(GPIY1, SCU460, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(SALT5, SCU460, GENMASK(6, 4), (2 << 4)));
+FUNCFG_DESCL(W18, PIN_CFG(ADC2, SCU460, GENMASK(10, 8), 0),
+	     PIN_CFG(GPIY2, SCU460, GENMASK(10, 8), (1 << 8)),
+	     PIN_CFG(SALT6, SCU460, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(Y17, PIN_CFG(ADC3, SCU460, GENMASK(14, 12), 0),
+	     PIN_CFG(GPIY3, SCU460, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SALT7, SCU460, GENMASK(14, 12), (2 << 12)));
+FUNCFG_DESCL(AA18, PIN_CFG(ADC4, SCU460, GENMASK(18, 16), 0),
+	     PIN_CFG(GPIY4, SCU460, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(SALT8, SCU460, GENMASK(18, 16), (2 << 16)));
+FUNCFG_DESCL(AA13, PIN_CFG(ADC5, SCU460, GENMASK(22, 20), 0),
+	     PIN_CFG(GPIY5, SCU460, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(SALT9, SCU460, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(Y18, PIN_CFG(ADC6, SCU460, GENMASK(26, 24), 0),
+	     PIN_CFG(GPIY6, SCU460, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(SALT10, SCU460, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(AA12, PIN_CFG(ADC7, SCU460, GENMASK(30, 28), 0),
+	     PIN_CFG(GPIY7, SCU460, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(SALT11, SCU460, GENMASK(30, 28), (2 << 28)));
+FUNCFG_DESCL(W20, PIN_CFG(ADC8, SCU464, GENMASK(2, 0), 0),
+	     PIN_CFG(GPIZ0, SCU464, GENMASK(2, 0), 1));
+FUNCFG_DESCL(V20, PIN_CFG(ADC9, SCU464, GENMASK(6, 4), 0),
+	     PIN_CFG(GPIZ1, SCU464, GENMASK(6, 4), (1 << 4)));
+FUNCFG_DESCL(Y11, PIN_CFG(ADC10, SCU464, GENMASK(10, 8), 0),
+	     PIN_CFG(GPIZ2, SCU464, GENMASK(10, 8), (1 << 8)));
+FUNCFG_DESCL(V14, PIN_CFG(ADC11, SCU464, GENMASK(14, 12), 0),
+	     PIN_CFG(GPIZ3, SCU464, GENMASK(14, 12), (1 << 12)));
+FUNCFG_DESCL(V19, PIN_CFG(ADC12, SCU464, GENMASK(18, 16), 0),
+	     PIN_CFG(GPIZ4, SCU464, GENMASK(18, 16), (1 << 16)));
+FUNCFG_DESCL(W14, PIN_CFG(ADC13, SCU464, GENMASK(22, 20), 0),
+	     PIN_CFG(GPIZ5, SCU464, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(AUXPWRGOOD0, SCU464, GENMASK(22, 20), (2 << 20)));
+FUNCFG_DESCL(Y20, PIN_CFG(ADC14, SCU464, GENMASK(26, 24), 0),
+	     PIN_CFG(GPIZ6, SCU464, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(AUXPWRGOOD1, SCU464, GENMASK(26, 24), (2 << 24)));
+FUNCFG_DESCL(AB19, PIN_CFG(ADC15, SCU464, GENMASK(30, 28), 0),
+	     PIN_CFG(GPIZ7, SCU464, GENMASK(30, 28), (1 << 28)));
+FUNCFG_DESCL(U21, PIN_CFG(SGPM0, SCU468, GENMASK(2, 0), 1),
+	     PIN_CFG(SMON0, SCU468, GENMASK(2, 0), 2),
+	     PIN_CFG(NCTS2, SCU468, GENMASK(2, 0), 3),
+	     PIN_CFG(MACLINK0, SCU468, GENMASK(2, 0), 4));
+FUNCFG_DESCL(T24, PIN_CFG(SGPM0, SCU468, GENMASK(6, 4), (1 << 4)),
+	     PIN_CFG(SMON0, SCU468, GENMASK(6, 4), (2 << 4)),
+	     PIN_CFG(NDCD2, SCU468, GENMASK(6, 4), (3 << 4)),
+	     PIN_CFG(MACLINK2, SCU468, GENMASK(6, 4), (4 << 4)));
+FUNCFG_DESCL(V24, PIN_CFG(SGPM0LD_R, SCU468, GENMASK(10, 8), (2 << 8)),
+	     PIN_CFG(HBLED, SCU468, GENMASK(10, 8), (2 << 8)));
+FUNCFG_DESCL(V22, PIN_CFG(SGPM0, SCU468, GENMASK(14, 12), (1 << 12)),
+	     PIN_CFG(SMON0, SCU468, GENMASK(14, 12), (2 << 12)),
+	     PIN_CFG(NDSR2, SCU468, GENMASK(14, 12), (3 << 12)));
+FUNCFG_DESCL(T23, PIN_CFG(SGPM0, SCU468, GENMASK(18, 16), (1 << 16)),
+	     PIN_CFG(SMON0, SCU468, GENMASK(18, 16), (2 << 16)),
+	     PIN_CFG(NRI2, SCU468, GENMASK(18, 16), (3 << 16)));
+FUNCFG_DESCL(AC25, PIN_CFG(SGPM1, SCU468, GENMASK(22, 20), (1 << 20)),
+	     PIN_CFG(WDTRST4N, SCU468, GENMASK(22, 20), (2 << 20)),
+	     PIN_CFG(NDTR2, SCU468, GENMASK(22, 20), (3 << 20)),
+	     PIN_CFG(SMON1, SCU468, GENMASK(22, 20), (4 << 20)));
+FUNCFG_DESCL(AB25, PIN_CFG(SGPM1, SCU468, GENMASK(26, 24), (1 << 24)),
+	     PIN_CFG(WDTRST5N, SCU468, GENMASK(26, 24), (2 << 24)),
+	     PIN_CFG(NRTS2, SCU468, GENMASK(26, 24), (3 << 24)),
+	     PIN_CFG(SMON1, SCU468, GENMASK(26, 24), (4 << 24)));
+FUNCFG_DESCL(AC24, PIN_CFG(SGPM1LD_R, SCU468, GENMASK(30, 28), (1 << 28)),
+	     PIN_CFG(WDTRST6N, SCU468, GENMASK(30, 28), (2 << 28)),
+	     PIN_CFG(MACLINK1, SCU468, GENMASK(30, 28), (3 << 28)));
+FUNCFG_DESCL(SGMII0, PIN_CFG(SGMII, SCU47C, BIT(0), 1 << 0));
+FUNCFG_DESCL(PCIERC2_PERST, PIN_CFG(PE2SGRSTN, SCU908, BIT(1), 1 << 1));
+FUNCFG_DESCL(PORTC_MODE, PIN_CFG(USB2CUD, SCU3B0, GENMASK(1, 0), 0),
+	     PIN_CFG(USB2CD, SCU3B0, GENMASK(1, 0), 1 << 0),
+	     PIN_CFG(USB2CH, SCU3B0, GENMASK(1, 0), 2 << 0),
+	     PIN_CFG(USB2CU, SCU3B0, GENMASK(1, 0), 3 << 0));
+FUNCFG_DESCL(PORTD_MODE, PIN_CFG(USB2DD, SCU3B0, GENMASK(3, 2), 1 << 2),
+	     PIN_CFG(USB2DH, SCU3B0, GENMASK(3, 2), 2 << 2));
+
+static const struct aspeed_g7_pincfg pin_cfg[] = {
+	PINCFG_PIN(C16),    PINCFG_PIN(C14),   PINCFG_PIN(C11),
+	PINCFG_PIN(D9),	    PINCFG_PIN(F14),   PINCFG_PIN(D10),
+	PINCFG_PIN(C12),    PINCFG_PIN(C13),   PINCFG_PIN(AC26),
+	PINCFG_PIN(AA25),   PINCFG_PIN(AB23),  PINCFG_PIN(U22),
+	PINCFG_PIN(V21),   PINCFG_PIN(N26),  PINCFG_PIN(P25),
+	PINCFG_PIN(N25),   PINCFG_PIN(V23),  PINCFG_PIN(W22),
+	PINCFG_PIN(AB26),    PINCFG_PIN(AD26),  PINCFG_PIN(P26),
+	PINCFG_PIN(AE26),   PINCFG_PIN(AF26),  PINCFG_PIN(AF25),
+	PINCFG_PIN(AE25),   PINCFG_PIN(AD25),   PINCFG_PIN(AF23),
+	PINCFG_PIN(AF20),   PINCFG_PIN(AF21),  PINCFG_PIN(AE21),
+	PINCFG_PIN(AE23),   PINCFG_PIN(AD22),  PINCFG_PIN(AF17),
+	PINCFG_PIN(AA16),   PINCFG_PIN(Y16),   PINCFG_PIN(V17),
+	PINCFG_PIN(J13),    PINCFG_PIN(AB16),  PINCFG_PIN(AC16),
+	PINCFG_PIN(AF16),   PINCFG_PIN(AA15),  PINCFG_PIN(AB15),
+	PINCFG_PIN(AC15),   PINCFG_PIN(AD15),  PINCFG_PIN(Y15),
+	PINCFG_PIN(AA14),   PINCFG_PIN(W16),   PINCFG_PIN(V16),
+	PINCFG_PIN(AB18),   PINCFG_PIN(AC18),  PINCFG_PIN(K13),
+	PINCFG_PIN(AA17),   PINCFG_PIN(AB17),  PINCFG_PIN(AD16),
+	PINCFG_PIN(AC17),   PINCFG_PIN(AD17),  PINCFG_PIN(AE16),
+	PINCFG_PIN(AE17),   PINCFG_PIN(AB24),   PINCFG_PIN(W26),
+	PINCFG_PIN(HOLE0),  PINCFG_PIN(HOLE1), PINCFG_PIN(HOLE2),
+	PINCFG_PIN(HOLE3),  PINCFG_PIN(W25),  PINCFG_PIN(Y23),
+	PINCFG_PIN(Y24),   PINCFG_PIN(W21),  PINCFG_PIN(AA23),
+	PINCFG_PIN(AC22),    PINCFG_PIN(AB22),  PINCFG_PIN(Y21),
+	PINCFG_PIN(AE20),   PINCFG_PIN(AF19),  PINCFG_PIN(Y22),
+	PINCFG_PIN(AA20),    PINCFG_PIN(AA22),  PINCFG_PIN(AB20),
+	PINCFG_PIN(AF18),   PINCFG_PIN(AE19),  PINCFG_PIN(AD20),
+	PINCFG_PIN(AC20),   PINCFG_PIN(AA21),   PINCFG_PIN(AB21),
+	PINCFG_PIN(AC19),    PINCFG_PIN(AE18),  PINCFG_PIN(AD19),
+	PINCFG_PIN(AD18),   PINCFG_PIN(U25),   PINCFG_PIN(U26),
+	PINCFG_PIN(Y26),    PINCFG_PIN(AA24),   PINCFG_PIN(R25),
+	PINCFG_PIN(AA26),   PINCFG_PIN(R26),   PINCFG_PIN(Y25),
+	PINCFG_PIN(B16),    PINCFG_PIN(D14),   PINCFG_PIN(B15),
+	PINCFG_PIN(B14),    PINCFG_PIN(C17),   PINCFG_PIN(B13),
+	PINCFG_PIN(E14),    PINCFG_PIN(C15),   PINCFG_PIN(D24),
+	PINCFG_PIN(B23),    PINCFG_PIN(B22),   PINCFG_PIN(C23),
+	PINCFG_PIN(B18),    PINCFG_PIN(B21),   PINCFG_PIN(M15),
+	PINCFG_PIN(B19),    PINCFG_PIN(B26),   PINCFG_PIN(A25),
+	PINCFG_PIN(A24),    PINCFG_PIN(B24),   PINCFG_PIN(E26),
+	PINCFG_PIN(A21),    PINCFG_PIN(A19),   PINCFG_PIN(A18),
+	PINCFG_PIN(D26),    PINCFG_PIN(C26),   PINCFG_PIN(A23),
+	PINCFG_PIN(A22),    PINCFG_PIN(B25),   PINCFG_PIN(F26),
+	PINCFG_PIN(A26),    PINCFG_PIN(A14),   PINCFG_PIN(E10),
+	PINCFG_PIN(E13),    PINCFG_PIN(D12),   PINCFG_PIN(F10),
+	PINCFG_PIN(E11),    PINCFG_PIN(F11),   PINCFG_PIN(F13),
+	PINCFG_PIN(N15),    PINCFG_PIN(C20),   PINCFG_PIN(C19),
+	PINCFG_PIN(A8),	    PINCFG_PIN(R14),   PINCFG_PIN(A7),
+	PINCFG_PIN(P14),    PINCFG_PIN(D20),   PINCFG_PIN(A6),
+	PINCFG_PIN(B6),	    PINCFG_PIN(N14),   PINCFG_PIN(B7),
+	PINCFG_PIN(B8),	    PINCFG_PIN(B9),    PINCFG_PIN(M14),
+	PINCFG_PIN(J11),    PINCFG_PIN(E7),    PINCFG_PIN(D19),
+	PINCFG_PIN(B11),    PINCFG_PIN(D15),   PINCFG_PIN(B12),
+	PINCFG_PIN(B10),    PINCFG_PIN(P13),   PINCFG_PIN(C18),
+	PINCFG_PIN(C6),	    PINCFG_PIN(C7),    PINCFG_PIN(D7),
+	PINCFG_PIN(N13),    PINCFG_PIN(C8),    PINCFG_PIN(C9),
+	PINCFG_PIN(C10),    PINCFG_PIN(M16),   PINCFG_PIN(A15),
+	PINCFG_PIN(G11),    PINCFG_PIN(H7),    PINCFG_PIN(H8),
+	PINCFG_PIN(H9),	    PINCFG_PIN(H10),   PINCFG_PIN(H11),
+	PINCFG_PIN(J9),	    PINCFG_PIN(J10),   PINCFG_PIN(E9),
+	PINCFG_PIN(F9),	    PINCFG_PIN(F8),    PINCFG_PIN(M13),
+	PINCFG_PIN(F7),	    PINCFG_PIN(D8),    PINCFG_PIN(E8),
+	PINCFG_PIN(L12),    PINCFG_PIN(F12),   PINCFG_PIN(E12),
+	PINCFG_PIN(J12),    PINCFG_PIN(G7),    PINCFG_PIN(G8),
+	PINCFG_PIN(G9),	    PINCFG_PIN(G10),   PINCFG_PIN(K12),
+	PINCFG_PIN(W17),    PINCFG_PIN(V18),   PINCFG_PIN(W18),
+	PINCFG_PIN(Y17),    PINCFG_PIN(AA18),  PINCFG_PIN(AA13),
+	PINCFG_PIN(Y18),    PINCFG_PIN(AA12),  PINCFG_PIN(W20),
+	PINCFG_PIN(V20),    PINCFG_PIN(Y11),   PINCFG_PIN(V14),
+	PINCFG_PIN(V19),    PINCFG_PIN(W14),   PINCFG_PIN(Y20),
+	PINCFG_PIN(AB19),   PINCFG_PIN(U21),   PINCFG_PIN(T24),
+	PINCFG_PIN(V24),    PINCFG_PIN(V22),   PINCFG_PIN(T23),
+	PINCFG_PIN(AC25),    PINCFG_PIN(AB25),   PINCFG_PIN(AC24),
+	PINCFG_PIN(SGMII0), PINCFG_PIN(PCIERC2_PERST),
+	PINCFG_PIN(PORTC_MODE), PINCFG_PIN(PORTD_MODE),
+};
+
+static int aspeed_g7_soc1_dt_node_to_map(struct pinctrl_dev *pctldev,
+					 struct device_node *np_config,
+					 struct pinctrl_map **map, u32 *num_maps)
+{
+	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
+					      PIN_MAP_TYPE_INVALID);
+}
+
+static void aspeed_g7_soc1_dt_free_map(struct pinctrl_dev *pctldev,
+				       struct pinctrl_map *map, u32 num_maps)
+{
+	kfree(map);
+}
+
+static const struct pinctrl_ops aspeed_g7_soc1_pinctrl_ops = {
+	.get_groups_count = aspeed_pinctrl_get_groups_count,
+	.get_group_name = aspeed_pinctrl_get_group_name,
+	.get_group_pins = aspeed_pinctrl_get_group_pins,
+	.pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
+	.dt_node_to_map = aspeed_g7_soc1_dt_node_to_map,
+	.dt_free_map = aspeed_g7_soc1_dt_free_map,
+};
+
+static const struct pinmux_ops aspeed_g7_soc1_pinmux_ops = {
+	.get_functions_count = aspeed_pinmux_get_fn_count,
+	.get_function_name = aspeed_pinmux_get_fn_name,
+	.get_function_groups = aspeed_pinmux_get_fn_groups,
+	.set_mux = aspeed_g7_pinmux_set_mux,
+	.gpio_request_enable = aspeed_g7_gpio_request_enable,
+	.strict = true,
+};
+
+static const struct pinconf_ops aspeed_g7_soc1_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = aspeed_pin_config_get,
+	.pin_config_set = aspeed_pin_config_set,
+	.pin_config_group_get = aspeed_pin_config_group_get,
+	.pin_config_group_set = aspeed_pin_config_group_set,
+};
+
+/* pinctrl_desc */
+static struct pinctrl_desc aspeed_g7_soc1_pinctrl_desc = {
+	.name = "aspeed-g7-soc1-pinctrl",
+	.pins = aspeed_g7_soc1_pins,
+	.npins = ARRAY_SIZE(aspeed_g7_soc1_pins),
+	.pctlops = &aspeed_g7_soc1_pinctrl_ops,
+	.pmxops = &aspeed_g7_soc1_pinmux_ops,
+	.confops = &aspeed_g7_soc1_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static struct aspeed_pin_config aspeed_g7_configs[] = {
+	/* GPIOA */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C16, C16 }, SCU4C0, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C14, C14 }, SCU4C0, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C11, C11 }, SCU4C0, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D9, D9 }, SCU4C0, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F14, F14 }, SCU4C0, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D10, D10 }, SCU4C0, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C12, C12 }, SCU4C0, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C13, C13 }, SCU4C0, GENMASK(15, 14) },
+	{ PIN_CONFIG_POWER_SOURCE, { C16, C13 }, SCU4A0, BIT_MASK(4) },
+	/* GPIOI */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { W25, W25 }, SCU4C0, GENMASK(17, 16) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { Y23, Y23 }, SCU4C0, GENMASK(19, 18) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { Y24, Y24 }, SCU4C0, GENMASK(21, 20) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { W21, W21 }, SCU4C0, GENMASK(23, 22) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AA23, AA23 }, SCU4C0, GENMASK(25, 24) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AC22, AC22 }, SCU4C0, GENMASK(27, 26) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AB22, AB22 }, SCU4C0, GENMASK(29, 28) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { Y21, Y21 }, SCU4C0, GENMASK(31, 30) },
+	{ PIN_CONFIG_POWER_SOURCE, { W25, Y21 }, SCU4A0, BIT_MASK(12) },
+	/* GPIOJ */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AE20, AE20 }, SCU4C4, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AF19, AF19 }, SCU4C4, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { Y22, Y22 }, SCU4C4, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AA20, AA20 }, SCU4C4, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AA22, AA22 }, SCU4C4, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AB20, AB20 }, SCU4C4, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AF18, AF18 }, SCU4C4, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AE19, AE19 }, SCU4C4, GENMASK(15, 14) },
+	/* GPIOK */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AD20, AD20 }, SCU4C4, GENMASK(17, 16) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AC20, AC20 }, SCU4C4, GENMASK(19, 18) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AA21, AA21 }, SCU4C4, GENMASK(21, 20) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AB21, AB21 }, SCU4C4, GENMASK(23, 22) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AC19, AC19 }, SCU4C4, GENMASK(25, 24) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AE18, AE18 }, SCU4C4, GENMASK(27, 26) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AD19, AD19 }, SCU4C4, GENMASK(29, 28) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AD18, AD18 }, SCU4C4, GENMASK(31, 30) },
+	/* GPIOL */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { U25, U25 }, SCU4C8, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { U26, U26 }, SCU4C8, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { Y26, Y26 }, SCU4C8, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AA24, AA24 }, SCU4C8, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { R25, R25 }, SCU4C8, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { AA26, AA26 }, SCU4C8, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { R26, R26 }, SCU4C8, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { Y25, Y25 }, SCU4C8, GENMASK(15, 14) },
+	{ PIN_CONFIG_POWER_SOURCE, { U25, Y25 }, SCU4A0, BIT_MASK(15) },
+	/* GPIOM */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B16, B16 }, SCU4C8, GENMASK(17, 16) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D14, D14 }, SCU4C8, GENMASK(19, 18) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B15, B15 }, SCU4C8, GENMASK(21, 20) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B14, B14 }, SCU4C8, GENMASK(23, 22) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C17, C17 }, SCU4C8, GENMASK(25, 24) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B13, B13 }, SCU4C8, GENMASK(27, 26) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E14, E14 }, SCU4C8, GENMASK(29, 28) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C15, C15 }, SCU4C8, GENMASK(31, 30) },
+	{ PIN_CONFIG_POWER_SOURCE, { B16, C15 }, SCU4A0, BIT_MASK(16) },
+	/* GPION */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D24, D24 }, SCU4CC, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B23, B23 }, SCU4CC, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B22, B22 }, SCU4CC, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C23, C23 }, SCU4CC, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B18, B18 }, SCU4CC, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B21, B21 }, SCU4CC, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { M15, M15 }, SCU4CC, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B19, B19 }, SCU4CC, GENMASK(15, 14) },
+	{ PIN_CONFIG_POWER_SOURCE, { D24, B19 }, SCU4A0, BIT_MASK(17) },
+	/* GPIOO */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B26, B26 }, SCU4CC, GENMASK(17, 16) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A25, A25 }, SCU4CC, GENMASK(19, 18) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A24, A24 }, SCU4CC, GENMASK(21, 20) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B24, B24 }, SCU4CC, GENMASK(23, 22) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E26, E26 }, SCU4CC, GENMASK(25, 24) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A21, A21 }, SCU4CC, GENMASK(27, 26) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A19, A19 }, SCU4CC, GENMASK(29, 28) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A18, A18 }, SCU4CC, GENMASK(31, 30) },
+	{ PIN_CONFIG_POWER_SOURCE, { B26, A18 }, SCU4A0, BIT_MASK(18) },
+	/* GPIOP */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D26, D26 }, SCU4D0, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C26, C26 }, SCU4D0, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A23, A23 }, SCU4D0, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A22, A22 }, SCU4D0, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B25, B25 }, SCU4D0, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F26, F26 }, SCU4D0, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A26, A26 }, SCU4D0, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A14, A14 }, SCU4D0, GENMASK(15, 14) },
+	{ PIN_CONFIG_POWER_SOURCE, { D26, A14 }, SCU4A0, BIT_MASK(19) },
+	/* GPIOQ */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E10, E10 }, SCU4D0, GENMASK(17, 16) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E13, E13 }, SCU4D0, GENMASK(19, 18) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D12, D12 }, SCU4D0, GENMASK(21, 20) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F10, F10 }, SCU4D0, GENMASK(23, 22) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E11, E11 }, SCU4D0, GENMASK(25, 24) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F11, F11 }, SCU4D0, GENMASK(27, 26) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F13, F13 }, SCU4D0, GENMASK(29, 28) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { N15, N15 }, SCU4D0, GENMASK(31, 30) },
+	/* GPIOR */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C20, C20 }, SCU4D4, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C19, C19 }, SCU4D4, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A8, A8 }, SCU4D4, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { R14, R14 }, SCU4D4, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A7, A7 }, SCU4D4, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { P14, P14 }, SCU4D4, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D20, D20 }, SCU4D4, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A6, A6 }, SCU4D4, GENMASK(15, 14) },
+	{ PIN_CONFIG_POWER_SOURCE, { C20, A6 }, SCU4A0, BIT_MASK(21) },
+	/* GPIOS */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B6, B6 }, SCU4D4, GENMASK(17, 16) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { N14, N14 }, SCU4D4, GENMASK(19, 18) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B7, B7 }, SCU4D4, GENMASK(21, 20) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B8, B8 }, SCU4D4, GENMASK(23, 22) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B9, B9 }, SCU4D4, GENMASK(25, 24) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { M14, M14 }, SCU4D4, GENMASK(27, 26) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { J11, J11 }, SCU4D4, GENMASK(29, 28) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E7, E7 }, SCU4D4, GENMASK(31, 30) },
+	{ PIN_CONFIG_POWER_SOURCE, { B6, E7 }, SCU4A0, BIT_MASK(22) },
+	/* GPIOT */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D19, D19 }, SCU4D8, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B11, B11 }, SCU4D8, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D15, D15 }, SCU4D8, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B12, B12 }, SCU4D8, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { B10, B10 }, SCU4D8, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { P13, P13 }, SCU4D8, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C18, C18 }, SCU4D8, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C6, C6 }, SCU4D8, GENMASK(15, 14) },
+	{ PIN_CONFIG_POWER_SOURCE, { D19, C6 }, SCU4A0, BIT_MASK(23) },
+	/* GPIOU */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C7, C7 }, SCU4D8, GENMASK(17, 16) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D7, D7 }, SCU4D8, GENMASK(19, 18) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { N13, N13 }, SCU4D8, GENMASK(21, 20) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C8, C8 }, SCU4D8, GENMASK(23, 22) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C9, C9 }, SCU4D8, GENMASK(25, 24) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { C10, C10 }, SCU4D8, GENMASK(27, 26) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { M16, M16 }, SCU4D8, GENMASK(29, 28) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { A15, A15 }, SCU4D8, GENMASK(31, 30) },
+	{ PIN_CONFIG_POWER_SOURCE, { C7, A15 }, SCU4A0, BIT_MASK(24) },
+	/* GPIOW */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E9, E9 }, SCU4DC, GENMASK(1, 0) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F9, F9 }, SCU4DC, GENMASK(3, 2) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F8, F8 }, SCU4DC, GENMASK(5, 4) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { M13, M13 }, SCU4DC, GENMASK(7, 6) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { F7, F7 }, SCU4DC, GENMASK(9, 8) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D8, D8 }, SCU4DC, GENMASK(11, 10) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E8, E8 }, SCU4DC, GENMASK(13, 12) },
+	{ PIN_CONFIG_DRIVE_STRENGTH, { L12, L12 }, SCU4DC, GENMASK(15, 14) },
+	{ PIN_CONFIG_POWER_SOURCE, { E9, L12 }, SCU4A0, BIT_MASK(26) },
+
+	ASPEED_PULL_DOWN_PINCONF(C16, SCU480, 0),
+	ASPEED_PULL_DOWN_PINCONF(C14, SCU480, 1),
+	ASPEED_PULL_DOWN_PINCONF(C11, SCU480, 2),
+	ASPEED_PULL_DOWN_PINCONF(D9, SCU480, 3),
+	ASPEED_PULL_DOWN_PINCONF(F14, SCU480, 4),
+	ASPEED_PULL_DOWN_PINCONF(D10, SCU480, 5),
+	ASPEED_PULL_DOWN_PINCONF(C12, SCU480, 6),
+	ASPEED_PULL_DOWN_PINCONF(C13, SCU480, 7),
+	ASPEED_PULL_DOWN_PINCONF(AC26, SCU480, 8),
+	ASPEED_PULL_DOWN_PINCONF(AA25, SCU480, 9),
+	ASPEED_PULL_DOWN_PINCONF(AB23, SCU480, 10),
+	ASPEED_PULL_DOWN_PINCONF(U22, SCU480, 11),
+	ASPEED_PULL_DOWN_PINCONF(V21, SCU480, 12),
+	ASPEED_PULL_DOWN_PINCONF(N26, SCU480, 13),
+	ASPEED_PULL_DOWN_PINCONF(P25, SCU480, 14),
+	ASPEED_PULL_DOWN_PINCONF(N25, SCU480, 15),
+	ASPEED_PULL_DOWN_PINCONF(V23, SCU480, 16),
+	ASPEED_PULL_DOWN_PINCONF(W22, SCU480, 17),
+	ASPEED_PULL_DOWN_PINCONF(AB26, SCU480, 18),
+	ASPEED_PULL_DOWN_PINCONF(AD26, SCU480, 19),
+	ASPEED_PULL_DOWN_PINCONF(P26, SCU480, 20),
+	ASPEED_PULL_DOWN_PINCONF(AE26, SCU480, 21),
+	ASPEED_PULL_DOWN_PINCONF(AF26, SCU480, 22),
+	ASPEED_PULL_DOWN_PINCONF(AF25, SCU480, 23),
+	ASPEED_PULL_DOWN_PINCONF(AE25, SCU480, 24),
+	ASPEED_PULL_DOWN_PINCONF(AD25, SCU480, 25),
+	ASPEED_PULL_DOWN_PINCONF(AF23, SCU480, 26),
+	ASPEED_PULL_DOWN_PINCONF(AF20, SCU480, 27),
+	ASPEED_PULL_DOWN_PINCONF(AF21, SCU480, 28),
+	ASPEED_PULL_DOWN_PINCONF(AE21, SCU480, 29),
+	ASPEED_PULL_DOWN_PINCONF(AE23, SCU480, 30),
+	ASPEED_PULL_DOWN_PINCONF(AD22, SCU480, 31),
+	ASPEED_PULL_DOWN_PINCONF(AF17, SCU484, 0),
+	ASPEED_PULL_DOWN_PINCONF(AA16, SCU484, 1),
+	ASPEED_PULL_DOWN_PINCONF(Y16, SCU484, 2),
+	ASPEED_PULL_DOWN_PINCONF(V17, SCU484, 3),
+	ASPEED_PULL_DOWN_PINCONF(J13, SCU484, 4),
+	ASPEED_PULL_DOWN_PINCONF(AB16, SCU484, 5),
+	ASPEED_PULL_DOWN_PINCONF(AC16, SCU484, 6),
+	ASPEED_PULL_DOWN_PINCONF(AF16, SCU484, 7),
+	ASPEED_PULL_DOWN_PINCONF(AA15, SCU484, 8),
+	ASPEED_PULL_DOWN_PINCONF(AB15, SCU484, 9),
+	ASPEED_PULL_DOWN_PINCONF(AC15, SCU484, 10),
+	ASPEED_PULL_DOWN_PINCONF(AD15, SCU484, 11),
+	ASPEED_PULL_DOWN_PINCONF(Y15, SCU484, 12),
+	ASPEED_PULL_DOWN_PINCONF(AA14, SCU484, 13),
+	ASPEED_PULL_DOWN_PINCONF(W16, SCU484, 14),
+	ASPEED_PULL_DOWN_PINCONF(V16, SCU484, 15),
+	ASPEED_PULL_DOWN_PINCONF(AB18, SCU484, 16),
+	ASPEED_PULL_DOWN_PINCONF(AC18, SCU484, 17),
+	ASPEED_PULL_DOWN_PINCONF(K13, SCU484, 18),
+	ASPEED_PULL_DOWN_PINCONF(AA17, SCU484, 19),
+	ASPEED_PULL_DOWN_PINCONF(AB17, SCU484, 20),
+	ASPEED_PULL_DOWN_PINCONF(AD16, SCU484, 21),
+	ASPEED_PULL_DOWN_PINCONF(AC17, SCU484, 22),
+	ASPEED_PULL_DOWN_PINCONF(AD17, SCU484, 23),
+	ASPEED_PULL_DOWN_PINCONF(AE16, SCU484, 24),
+	ASPEED_PULL_DOWN_PINCONF(AE17, SCU484, 25),
+	ASPEED_PULL_DOWN_PINCONF(AB24, SCU484, 26),
+	ASPEED_PULL_DOWN_PINCONF(W26, SCU484, 27),
+	ASPEED_PULL_DOWN_PINCONF(HOLE0, SCU484, 28),
+	ASPEED_PULL_DOWN_PINCONF(HOLE1, SCU484, 29),
+	ASPEED_PULL_DOWN_PINCONF(HOLE2, SCU484, 30),
+	ASPEED_PULL_DOWN_PINCONF(HOLE3, SCU484, 31),
+	ASPEED_PULL_DOWN_PINCONF(W25, SCU488, 0),
+	ASPEED_PULL_DOWN_PINCONF(Y23, SCU488, 1),
+	ASPEED_PULL_DOWN_PINCONF(Y24, SCU488, 2),
+	ASPEED_PULL_DOWN_PINCONF(W21, SCU488, 3),
+	ASPEED_PULL_DOWN_PINCONF(AA23, SCU488, 4),
+	ASPEED_PULL_DOWN_PINCONF(AC22, SCU488, 5),
+	ASPEED_PULL_DOWN_PINCONF(AB22, SCU488, 6),
+	ASPEED_PULL_DOWN_PINCONF(Y21, SCU488, 7),
+	ASPEED_PULL_DOWN_PINCONF(AE20, SCU488, 8),
+	ASPEED_PULL_DOWN_PINCONF(AF19, SCU488, 9),
+	ASPEED_PULL_DOWN_PINCONF(Y22, SCU488, 10),
+	ASPEED_PULL_DOWN_PINCONF(AA20, SCU488, 11),
+	ASPEED_PULL_DOWN_PINCONF(AA22, SCU488, 12),
+	ASPEED_PULL_DOWN_PINCONF(AB20, SCU488, 13),
+	ASPEED_PULL_DOWN_PINCONF(AF18, SCU488, 14),
+	ASPEED_PULL_DOWN_PINCONF(AE19, SCU488, 15),
+	ASPEED_PULL_DOWN_PINCONF(AD20, SCU488, 16),
+	ASPEED_PULL_DOWN_PINCONF(AC20, SCU488, 17),
+	ASPEED_PULL_DOWN_PINCONF(AA21, SCU488, 18),
+	ASPEED_PULL_DOWN_PINCONF(AB21, SCU488, 19),
+	ASPEED_PULL_DOWN_PINCONF(AC19, SCU488, 20),
+	ASPEED_PULL_DOWN_PINCONF(AE18, SCU488, 21),
+	ASPEED_PULL_DOWN_PINCONF(AD19, SCU488, 22),
+	ASPEED_PULL_DOWN_PINCONF(AD18, SCU488, 23),
+	ASPEED_PULL_DOWN_PINCONF(U25, SCU488, 24),
+	ASPEED_PULL_DOWN_PINCONF(U26, SCU488, 25),
+	ASPEED_PULL_DOWN_PINCONF(Y26, SCU488, 26),
+	ASPEED_PULL_DOWN_PINCONF(AA24, SCU488, 27),
+	ASPEED_PULL_DOWN_PINCONF(R25, SCU488, 28),
+	ASPEED_PULL_DOWN_PINCONF(AA26, SCU488, 29),
+	ASPEED_PULL_DOWN_PINCONF(R26, SCU488, 30),
+	ASPEED_PULL_DOWN_PINCONF(Y25, SCU488, 31),
+	ASPEED_PULL_DOWN_PINCONF(B16, SCU48C, 0),
+	ASPEED_PULL_DOWN_PINCONF(D14, SCU48C, 1),
+	ASPEED_PULL_DOWN_PINCONF(B15, SCU48C, 2),
+	ASPEED_PULL_DOWN_PINCONF(B14, SCU48C, 3),
+	ASPEED_PULL_DOWN_PINCONF(C17, SCU48C, 4),
+	ASPEED_PULL_DOWN_PINCONF(B13, SCU48C, 5),
+	ASPEED_PULL_DOWN_PINCONF(E14, SCU48C, 6),
+	ASPEED_PULL_DOWN_PINCONF(C15, SCU48C, 7),
+	ASPEED_PULL_DOWN_PINCONF(D24, SCU48C, 8),
+	ASPEED_PULL_DOWN_PINCONF(B23, SCU48C, 9),
+	ASPEED_PULL_DOWN_PINCONF(B22, SCU48C, 10),
+	ASPEED_PULL_DOWN_PINCONF(C23, SCU48C, 11),
+	ASPEED_PULL_DOWN_PINCONF(B18, SCU48C, 12),
+	ASPEED_PULL_DOWN_PINCONF(B21, SCU48C, 13),
+	ASPEED_PULL_DOWN_PINCONF(M15, SCU48C, 14),
+	ASPEED_PULL_DOWN_PINCONF(B19, SCU48C, 15),
+	ASPEED_PULL_DOWN_PINCONF(B26, SCU48C, 16),
+	ASPEED_PULL_DOWN_PINCONF(A25, SCU48C, 17),
+	ASPEED_PULL_DOWN_PINCONF(A24, SCU48C, 18),
+	ASPEED_PULL_DOWN_PINCONF(B24, SCU48C, 19),
+	ASPEED_PULL_DOWN_PINCONF(E26, SCU48C, 20),
+	ASPEED_PULL_DOWN_PINCONF(A21, SCU48C, 21),
+	ASPEED_PULL_DOWN_PINCONF(A19, SCU48C, 22),
+	ASPEED_PULL_DOWN_PINCONF(A18, SCU48C, 23),
+	ASPEED_PULL_DOWN_PINCONF(D26, SCU48C, 24),
+	ASPEED_PULL_DOWN_PINCONF(C26, SCU48C, 25),
+	ASPEED_PULL_DOWN_PINCONF(A23, SCU48C, 26),
+	ASPEED_PULL_DOWN_PINCONF(A22, SCU48C, 27),
+	ASPEED_PULL_DOWN_PINCONF(B25, SCU48C, 28),
+	ASPEED_PULL_DOWN_PINCONF(F26, SCU48C, 29),
+	ASPEED_PULL_DOWN_PINCONF(A26, SCU48C, 30),
+	ASPEED_PULL_DOWN_PINCONF(A14, SCU48C, 31),
+	ASPEED_PULL_DOWN_PINCONF(E10, SCU490, 0),
+	ASPEED_PULL_DOWN_PINCONF(E13, SCU490, 1),
+	ASPEED_PULL_DOWN_PINCONF(D12, SCU490, 2),
+	ASPEED_PULL_DOWN_PINCONF(F10, SCU490, 3),
+	ASPEED_PULL_DOWN_PINCONF(E11, SCU490, 4),
+	ASPEED_PULL_DOWN_PINCONF(F11, SCU490, 5),
+	ASPEED_PULL_DOWN_PINCONF(F13, SCU490, 6),
+	ASPEED_PULL_DOWN_PINCONF(N15, SCU490, 7),
+	ASPEED_PULL_DOWN_PINCONF(C20, SCU490, 8),
+	ASPEED_PULL_DOWN_PINCONF(C19, SCU490, 9),
+	ASPEED_PULL_DOWN_PINCONF(A8, SCU490, 10),
+	ASPEED_PULL_DOWN_PINCONF(R14, SCU490, 11),
+	ASPEED_PULL_DOWN_PINCONF(A7, SCU490, 12),
+	ASPEED_PULL_DOWN_PINCONF(P14, SCU490, 13),
+	ASPEED_PULL_DOWN_PINCONF(D20, SCU490, 14),
+	ASPEED_PULL_DOWN_PINCONF(A6, SCU490, 15),
+	ASPEED_PULL_DOWN_PINCONF(B6, SCU490, 16),
+	ASPEED_PULL_DOWN_PINCONF(N14, SCU490, 17),
+	ASPEED_PULL_DOWN_PINCONF(B7, SCU490, 18),
+	ASPEED_PULL_DOWN_PINCONF(B8, SCU490, 19),
+	ASPEED_PULL_DOWN_PINCONF(B9, SCU490, 20),
+	ASPEED_PULL_DOWN_PINCONF(M14, SCU490, 21),
+	ASPEED_PULL_DOWN_PINCONF(J11, SCU490, 22),
+	ASPEED_PULL_DOWN_PINCONF(E7, SCU490, 23),
+	ASPEED_PULL_DOWN_PINCONF(D19, SCU490, 24),
+	ASPEED_PULL_DOWN_PINCONF(B11, SCU490, 25),
+	ASPEED_PULL_DOWN_PINCONF(D15, SCU490, 26),
+	ASPEED_PULL_DOWN_PINCONF(B12, SCU490, 27),
+	ASPEED_PULL_DOWN_PINCONF(B10, SCU490, 28),
+	ASPEED_PULL_DOWN_PINCONF(P13, SCU490, 29),
+	ASPEED_PULL_DOWN_PINCONF(C18, SCU490, 30),
+	ASPEED_PULL_DOWN_PINCONF(C6, SCU490, 31),
+	ASPEED_PULL_DOWN_PINCONF(C7, SCU494, 0),
+	ASPEED_PULL_DOWN_PINCONF(D7, SCU494, 1),
+	ASPEED_PULL_DOWN_PINCONF(N13, SCU494, 2),
+	ASPEED_PULL_DOWN_PINCONF(C8, SCU494, 3),
+	ASPEED_PULL_DOWN_PINCONF(C9, SCU494, 4),
+	ASPEED_PULL_DOWN_PINCONF(C10, SCU494, 5),
+	ASPEED_PULL_DOWN_PINCONF(M16, SCU494, 6),
+	ASPEED_PULL_DOWN_PINCONF(A15, SCU494, 7),
+	ASPEED_PULL_DOWN_PINCONF(G11, SCU494, 8),
+	ASPEED_PULL_DOWN_PINCONF(H7, SCU494, 9),
+	ASPEED_PULL_DOWN_PINCONF(H8, SCU494, 10),
+	ASPEED_PULL_DOWN_PINCONF(H9, SCU494, 11),
+	ASPEED_PULL_DOWN_PINCONF(H10, SCU494, 12),
+	ASPEED_PULL_DOWN_PINCONF(H11, SCU494, 13),
+	ASPEED_PULL_DOWN_PINCONF(J9, SCU494, 14),
+	ASPEED_PULL_DOWN_PINCONF(J10, SCU494, 15),
+	ASPEED_PULL_DOWN_PINCONF(E9, SCU494, 16),
+	ASPEED_PULL_DOWN_PINCONF(F9, SCU494, 17),
+	ASPEED_PULL_DOWN_PINCONF(F8, SCU494, 18),
+	ASPEED_PULL_DOWN_PINCONF(M13, SCU494, 19),
+	ASPEED_PULL_DOWN_PINCONF(F7, SCU494, 20),
+	ASPEED_PULL_DOWN_PINCONF(D8, SCU494, 21),
+	ASPEED_PULL_DOWN_PINCONF(E8, SCU494, 22),
+	ASPEED_PULL_DOWN_PINCONF(L12, SCU494, 23),
+	ASPEED_PULL_DOWN_PINCONF(F12, SCU494, 24),
+	ASPEED_PULL_DOWN_PINCONF(E12, SCU494, 25),
+	ASPEED_PULL_DOWN_PINCONF(J12, SCU494, 26),
+	ASPEED_PULL_DOWN_PINCONF(G7, SCU494, 27),
+	ASPEED_PULL_DOWN_PINCONF(G8, SCU494, 28),
+	ASPEED_PULL_DOWN_PINCONF(G9, SCU494, 29),
+	ASPEED_PULL_DOWN_PINCONF(G10, SCU494, 30),
+	ASPEED_PULL_DOWN_PINCONF(K12, SCU494, 31),
+	ASPEED_PULL_DOWN_PINCONF(W17, SCU498, 0),
+	ASPEED_PULL_DOWN_PINCONF(V18, SCU498, 1),
+	ASPEED_PULL_DOWN_PINCONF(W18, SCU498, 2),
+	ASPEED_PULL_DOWN_PINCONF(Y17, SCU498, 3),
+	ASPEED_PULL_DOWN_PINCONF(AA18, SCU498, 4),
+	ASPEED_PULL_DOWN_PINCONF(AA13, SCU498, 5),
+	ASPEED_PULL_DOWN_PINCONF(Y18, SCU498, 6),
+	ASPEED_PULL_DOWN_PINCONF(AA12, SCU498, 7),
+	ASPEED_PULL_DOWN_PINCONF(W20, SCU498, 8),
+	ASPEED_PULL_DOWN_PINCONF(V20, SCU498, 9),
+	ASPEED_PULL_DOWN_PINCONF(Y11, SCU498, 10),
+	ASPEED_PULL_DOWN_PINCONF(V14, SCU498, 11),
+	ASPEED_PULL_DOWN_PINCONF(V19, SCU498, 12),
+	ASPEED_PULL_DOWN_PINCONF(W14, SCU498, 13),
+	ASPEED_PULL_DOWN_PINCONF(Y20, SCU498, 14),
+	ASPEED_PULL_DOWN_PINCONF(AB19, SCU498, 15),
+	ASPEED_PULL_DOWN_PINCONF(U21, SCU498, 16),
+	ASPEED_PULL_DOWN_PINCONF(T24, SCU498, 17),
+	ASPEED_PULL_DOWN_PINCONF(V24, SCU498, 18),
+	ASPEED_PULL_DOWN_PINCONF(V22, SCU498, 19),
+	ASPEED_PULL_DOWN_PINCONF(T23, SCU498, 20),
+	ASPEED_PULL_DOWN_PINCONF(AC25, SCU498, 21),
+	ASPEED_PULL_DOWN_PINCONF(AB25, SCU498, 22),
+	ASPEED_PULL_DOWN_PINCONF(AC24, SCU498, 23),
+};
+
+static const struct aspeed_pin_config_map aspeed_g7_pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0,   1, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1,   0, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_PULL_UP,    0,   1, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_PULL_UP,   -1,   0, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1,   1, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  0,   0, GENMASK(1, 0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  1,   1, GENMASK(1, 0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  2,   2, GENMASK(1, 0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  3,   3, GENMASK(1, 0)},
+	{ PIN_CONFIG_POWER_SOURCE,   3300, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_POWER_SOURCE,   1800, 1, BIT_MASK(0)},
+};
+
+static struct aspeed_pinctrl_data aspeed_g7_pinctrl_data = {
+	.pins = aspeed_g7_soc1_pins,
+	.npins = ARRAY_SIZE(aspeed_g7_soc1_pins),
+	.pinmux = {
+		.groups = aspeed_g7_soc1_pingroups,
+		.ngroups = ARRAY_SIZE(aspeed_g7_soc1_pingroups),
+		.functions = aspeed_g7_soc1_funcs,
+		.nfunctions = ARRAY_SIZE(aspeed_g7_soc1_funcs),
+		.configs_g7 = pin_cfg,
+		.nconfigs_g7 = ARRAY_SIZE(pin_cfg),
+	},
+	.configs = aspeed_g7_configs,
+	.nconfigs = ARRAY_SIZE(aspeed_g7_configs),
+	.confmaps = aspeed_g7_pin_config_map,
+	.nconfmaps = ARRAY_SIZE(aspeed_g7_pin_config_map),
+};
+
+static int aspeed_g7_soc1_pinctrl_probe(struct platform_device *pdev)
+{
+	return aspeed_pinctrl_probe(pdev, &aspeed_g7_soc1_pinctrl_desc,
+				    &aspeed_g7_pinctrl_data);
+}
+
+static const struct of_device_id aspeed_g7_soc1_pinctrl_match[] = {
+	{ .compatible = "aspeed,ast2700-soc1-pinctrl" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_g7_soc1_pinctrl_match);
+
+static struct platform_driver aspeed_g7_soc1_pinctrl_driver = {
+	.probe = aspeed_g7_soc1_pinctrl_probe,
+	.driver = {
+		.name = "aspeed-g7-soc1-pinctrl",
+		.of_match_table = aspeed_g7_soc1_pinctrl_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init aspeed_g7_soc1_pinctrl_register(void)
+{
+	return platform_driver_register(&aspeed_g7_soc1_pinctrl_driver);
+}
+arch_initcall(aspeed_g7_soc1_pinctrl_register);
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..75ca0b3f21a1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -285,6 +285,32 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	return 0;
 }
 
+int aspeed_g7_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
+			     unsigned int group)
+{
+	int i, j;
+	int pin;
+	const struct aspeed_g7_funcfg *funcfg;
+	struct aspeed_pinctrl_data *pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct aspeed_pin_group *pingroup =
+		&pinctrl->pinmux.groups[group];
+	const struct aspeed_g7_pincfg *pin_cfg = pinctrl->pinmux.configs_g7;
+
+	for (i = 0; i < pingroup->npins; i++) {
+		pin = pingroup->pins[i];
+		funcfg = pin_cfg[pin].funcfg;
+
+		for (j = 0; j < pin_cfg[pin].nfuncfg; j++) {
+			if (strcmp(funcfg[j].name,  pingroup->name) == 0) {
+				regmap_update_bits(pinctrl->scu, funcfg[j].reg,
+						   funcfg[j].mask,
+						   funcfg[j].val);
+			}
+		}
+	}
+	return 0;
+}
+
 static bool aspeed_expr_is_gpio(const struct aspeed_sig_expr *expr)
 {
 	/*
@@ -440,6 +466,27 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+int aspeed_g7_gpio_request_enable(struct pinctrl_dev *pctldev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int offset)
+{
+	int i;
+	struct aspeed_pinctrl_data *pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct aspeed_g7_pincfg *pin_cfg = pinctrl->pinmux.configs_g7;
+	const struct aspeed_g7_funcfg *funcfg = pin_cfg[offset].funcfg;
+
+	for (i = 0; i < pin_cfg[offset].nfuncfg; i++) {
+		if (!strncmp(funcfg[i].name, "GPI", 3)) {
+			regmap_update_bits(pinctrl->scu, funcfg[i].reg,
+					   funcfg[i].mask, funcfg[i].val);
+			break;
+		}
+		regmap_update_bits(pinctrl->scu, funcfg[i].reg, funcfg[i].mask,
+				   0);
+	}
+	return 0;
+}
+
 int aspeed_pinctrl_probe(struct platform_device *pdev,
 			 const struct pinctrl_desc *pdesc,
 			 struct aspeed_pinctrl_data *pdata)
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 28f3bde25081..e3d9b857f1a6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -70,15 +70,15 @@ struct aspeed_pinctrl_data {
 	struct regmap *scu;
 
 	const struct pinctrl_pin_desc *pins;
-	const unsigned int npins;
+	unsigned int npins;
 
 	const struct aspeed_pin_config *configs;
-	const unsigned int nconfigs;
+	unsigned int nconfigs;
 
 	struct aspeed_pinmux_data pinmux;
 
 	const struct aspeed_pin_config_map *confmaps;
-	const unsigned int nconfmaps;
+	unsigned int nconfmaps;
 };
 
 /* Aspeed pinctrl helpers */
@@ -98,9 +98,14 @@ int aspeed_pinmux_get_fn_groups(struct pinctrl_dev *pctldev,
 		unsigned int * const num_groups);
 int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		unsigned int group);
+int aspeed_g7_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
+			     unsigned int group);
 int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned int offset);
+int aspeed_g7_gpio_request_enable(struct pinctrl_dev *pctldev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int offset);
 int aspeed_pinctrl_probe(struct platform_device *pdev,
 		const struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index aaa78a613196..35a23139874f 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -792,6 +792,33 @@ struct aspeed_pinmux_ops {
 		   const struct aspeed_sig_expr *expr, bool enabled);
 };
 
+struct aspeed_g7_funcfg {
+	char *name;
+	u32 reg;
+	u32 mask;
+	int val;
+};
+
+struct aspeed_g7_pincfg {
+	struct aspeed_g7_funcfg *funcfg;
+	unsigned int nfuncfg;
+};
+
+#define PIN_CFG(cfg_name, cfg_reg, cfg_mask, cfg_val)                \
+	{                                                            \
+		.name = #cfg_name, .reg = cfg_reg, .mask = cfg_mask, \
+		.val = cfg_val                                       \
+	}
+#define FUNCFG_SYM(pin) funcfg_ ## pin
+#define FUNCFG_PTR(pin) (&FUNCFG_SYM(pin))
+
+#define FUNCFG_DESCL(pin, ...) \
+	static const struct aspeed_g7_funcfg FUNCFG_SYM(pin)[] = { __VA_ARGS__ }
+
+#define PINCFG_PIN(pin)                                                 \
+	[pin] = { .funcfg = (struct aspeed_g7_funcfg *)FUNCFG_PTR(pin), \
+		  .nfuncfg = ARRAY_SIZE(FUNCFG_SYM(pin)) }
+
 struct aspeed_pinmux_data {
 	struct device *dev;
 	struct regmap *maps[ASPEED_NR_PINMUX_IPS];
@@ -799,10 +826,14 @@ struct aspeed_pinmux_data {
 	const struct aspeed_pinmux_ops *ops;
 
 	const struct aspeed_pin_group *groups;
-	const unsigned int ngroups;
+	unsigned int ngroups;
 
 	const struct aspeed_pin_function *functions;
-	const unsigned int nfunctions;
+	unsigned int nfunctions;
+
+	const struct aspeed_g7_pincfg *configs_g7;
+	unsigned int nconfigs_g7;
+
 };
 
 int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc, bool enabled,
-- 
2.25.1


