Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BFC3EE77D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 09:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238767AbhHQHqu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 03:46:50 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:48760 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238455AbhHQHqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 03:46:48 -0400
X-UUID: 2c581d11634145cd82dfc81fdfb32e20-20210817
X-UUID: 2c581d11634145cd82dfc81fdfb32e20-20210817
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2092774595; Tue, 17 Aug 2021 15:46:12 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 15:46:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 15:46:10 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: [v2,02/12] clk: mediatek: add mt7986 clock IDs
Date:   Tue, 17 Aug 2021 15:45:47 +0800
Message-ID: <20210817074557.30953-3-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210817074557.30953-1-sam.shih@mediatek.com>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add MT7986 clock dt-bindings, include topckgen, apmixedsys,
infracfg, and ethernet subsystem clocks.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v2: changed to dual licience
    applied the comment suggested by reviewers:
    - removed 1:1 factor clock
    - renamed factor clock for easier to understand

---
 include/dt-bindings/clock/mt7986-clk.h | 169 +++++++++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 include/dt-bindings/clock/mt7986-clk.h

diff --git a/include/dt-bindings/clock/mt7986-clk.h b/include/dt-bindings/clock/mt7986-clk.h
new file mode 100644
index 000000000000..4799007c4755
--- /dev/null
+++ b/include/dt-bindings/clock/mt7986-clk.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Sam Shih <sam.shih@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT7986_H
+#define _DT_BINDINGS_CLK_MT7986_H
+
+/* APMIXEDSYS */
+
+#define CLK_APMIXED_ARMPLL		0
+#define CLK_APMIXED_NET2PLL		1
+#define CLK_APMIXED_MMPLL		2
+#define CLK_APMIXED_SGMPLL		3
+#define CLK_APMIXED_WEDMCUPLL		4
+#define CLK_APMIXED_NET1PLL		5
+#define CLK_APMIXED_MPLL		6
+#define CLK_APMIXED_APLL2		7
+
+/* TOPCKGEN */
+
+#define CLK_TOP_XTAL			0
+#define CLK_TOP_XTAL_D2			1
+#define CLK_TOP_RTC_32K			2
+#define CLK_TOP_RTC_32P7K		3
+#define CLK_TOP_MPLL_D2			4
+#define CLK_TOP_MPLL_D4			5
+#define CLK_TOP_MPLL_D8			6
+#define CLK_TOP_MPLL_D8_D2		7
+#define CLK_TOP_MPLL_D3_D2		8
+#define CLK_TOP_MMPLL_D2		9
+#define CLK_TOP_MMPLL_D4		10
+#define CLK_TOP_MMPLL_D8		11
+#define CLK_TOP_MMPLL_D8_D2		12
+#define CLK_TOP_MMPLL_D3_D8		13
+#define CLK_TOP_MMPLL_U2PHY		14
+#define CLK_TOP_APLL2_D4		15
+#define CLK_TOP_NET1PLL_D4		16
+#define CLK_TOP_NET1PLL_D5		17
+#define CLK_TOP_NET1PLL_D5_D2		18
+#define CLK_TOP_NET1PLL_D5_D4		19
+#define CLK_TOP_NET1PLL_D8_D2		20
+#define CLK_TOP_NET1PLL_D8_D4		21
+#define CLK_TOP_NET2PLL_D4		22
+#define CLK_TOP_NET2PLL_D4_D2		23
+#define CLK_TOP_NET2PLL_D3_D2		24
+#define CLK_TOP_WEDMCUPLL_D5_D2		25
+#define CLK_TOP_NFI1X_SEL		26
+#define CLK_TOP_SPINFI_SEL		27
+#define CLK_TOP_SPI_SEL			28
+#define CLK_TOP_SPIM_MST_SEL		29
+#define CLK_TOP_UART_SEL		30
+#define CLK_TOP_PWM_SEL			31
+#define CLK_TOP_I2C_SEL			32
+#define CLK_TOP_PEXTP_TL_SEL		33
+#define CLK_TOP_EMMC_250M_SEL		34
+#define CLK_TOP_EMMC_416M_SEL		35
+#define CLK_TOP_F_26M_ADC_SEL		36
+#define CLK_TOP_DRAMC_SEL		37
+#define CLK_TOP_DRAMC_MD32_SEL		38
+#define CLK_TOP_SYSAXI_SEL		39
+#define CLK_TOP_SYSAPB_SEL		40
+#define CLK_TOP_ARM_DB_MAIN_SEL		41
+#define CLK_TOP_ARM_DB_JTSEL		42
+#define CLK_TOP_NETSYS_SEL		43
+#define CLK_TOP_NETSYS_500M_SEL		44
+#define CLK_TOP_NETSYS_MCU_SEL		45
+#define CLK_TOP_NETSYS_2X_SEL		46
+#define CLK_TOP_SGM_325M_SEL		47
+#define CLK_TOP_SGM_REG_SEL		48
+#define CLK_TOP_A1SYS_SEL		49
+#define CLK_TOP_CONN_MCUSYS_SEL		50
+#define CLK_TOP_EIP_B_SEL		51
+#define CLK_TOP_PCIE_PHY_SEL		52
+#define CLK_TOP_USB3_PHY_SEL		53
+#define CLK_TOP_F26M_SEL		54
+#define CLK_TOP_AUD_L_SEL		55
+#define CLK_TOP_A_TUNER_SEL		56
+#define CLK_TOP_U2U3_SEL		57
+#define CLK_TOP_U2U3_SYS_SEL		58
+#define CLK_TOP_U2U3_XHCI_SEL		59
+#define CLK_TOP_DA_U2_REFSEL		60
+#define CLK_TOP_DA_U2_CK_1P_SEL		61
+#define CLK_TOP_AP2CNN_HOST_SEL		62
+#define CLK_TOP_JTAG			63
+
+/* INFRACFG */
+
+#define CLK_INFRA_SYSAXI_D2		0
+#define CLK_INFRA_UART0_SEL		1
+#define CLK_INFRA_UART1_SEL		2
+#define CLK_INFRA_UART2_SEL		3
+#define CLK_INFRA_SPI0_SEL		4
+#define CLK_INFRA_SPI1_SEL		5
+#define CLK_INFRA_PWM1_SEL		6
+#define CLK_INFRA_PWM2_SEL		7
+#define CLK_INFRA_PWM_BSEL		8
+#define CLK_INFRA_PCIE_SEL		9
+#define CLK_INFRA_GPT_STA		10
+#define CLK_INFRA_PWM_HCK		11
+#define CLK_INFRA_PWM_STA		12
+#define CLK_INFRA_PWM1_CK		13
+#define CLK_INFRA_PWM2_CK		14
+#define CLK_INFRA_CQ_DMA_CK		15
+#define CLK_INFRA_EIP97_CK		16
+#define CLK_INFRA_AUD_BUS_CK		17
+#define CLK_INFRA_AUD_26M_CK		18
+#define CLK_INFRA_AUD_L_CK		19
+#define CLK_INFRA_AUD_AUD_CK		20
+#define CLK_INFRA_AUD_EG2_CK		21
+#define CLK_INFRA_DRAMC_26M_CK		22
+#define CLK_INFRA_DBG_CK		23
+#define CLK_INFRA_AP_DMA_CK		24
+#define CLK_INFRA_SEJ_CK		25
+#define CLK_INFRA_SEJ_13M_CK		26
+#define CLK_INFRA_THERM_CK		27
+#define CLK_INFRA_I2C0_CK		28
+#define CLK_INFRA_UART0_CK		29
+#define CLK_INFRA_UART1_CK		30
+#define CLK_INFRA_UART2_CK		31
+#define CLK_INFRA_NFI1_CK		32
+#define CLK_INFRA_SPINFI1_CK		33
+#define CLK_INFRA_NFI_HCK_CK		34
+#define CLK_INFRA_SPI0_CK		35
+#define CLK_INFRA_SPI1_CK		36
+#define CLK_INFRA_SPI0_HCK_CK		37
+#define CLK_INFRA_SPI1_HCK_CK		38
+#define CLK_INFRA_FRTC_CK		39
+#define CLK_INFRA_MSDC_CK		40
+#define CLK_INFRA_MSDC_HCK_CK		41
+#define CLK_INFRA_MSDC_133M_CK		42
+#define CLK_INFRA_MSDC_66M_CK		43
+#define CLK_INFRA_ADC_26M_CK		44
+#define CLK_INFRA_ADC_FRC_CK		45
+#define CLK_INFRA_FBIST2FPC_CK		46
+#define CLK_INFRA_IUSB_133_CK		47
+#define CLK_INFRA_IUSB_66M_CK		48
+#define CLK_INFRA_IUSB_SYS_CK		49
+#define CLK_INFRA_IUSB_CK		50
+#define CLK_INFRA_IPCIE_CK		51
+#define CLK_INFRA_IPCIE_PIPE_CK		52
+#define CLK_INFRA_IPCIER_CK		53
+#define CLK_INFRA_IPCIEB_CK		54
+#define CLK_INFRA_TRNG_CK		55
+
+/* SGMIISYS_0 */
+
+#define CLK_SGMII0_TX250M_EN		0
+#define CLK_SGMII0_RX250M_EN		1
+#define CLK_SGMII0_CDR_REF		2
+#define CLK_SGMII0_CDR_FB		2
+
+/* SGMIISYS_1 */
+
+#define CLK_SGMII1_TX250M_EN		0
+#define CLK_SGMII1_RX250M_EN		1
+#define CLK_SGMII1_CDR_REF		2
+#define CLK_SGMII1_CDR_FB		2
+
+/* ETHSYS */
+
+#define CLK_ETH_FE_EN			0
+#define CLK_ETH_GP2_EN			1
+#define CLK_ETH_GP1_EN			2
+#define CLK_ETH_WOCPU1_EN		3
+#define CLK_ETH_WOCPU0_EN		4
+
+#endif /* _DT_BINDINGS_CLK_MT7986_H */
-- 
2.29.2

