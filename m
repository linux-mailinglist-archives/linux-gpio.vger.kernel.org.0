Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A923CB22
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 14:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389344AbfFKMYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 08:24:15 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52446 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389076AbfFKMYN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 08:24:13 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6FBCB200A13;
        Tue, 11 Jun 2019 14:24:02 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A1ED9200A02;
        Tue, 11 Jun 2019 14:23:51 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2D509402DD;
        Tue, 11 Jun 2019 20:23:39 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        catalin.marinas@arm.com, will.deacon@arm.com,
        maxime.ripard@bootlin.com, olof@lixom.net,
        horms+renesas@verge.net.au, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, leonard.crestez@nxp.com,
        dinguyen@kernel.org, enric.balletbo@collabora.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
Date:   Tue, 11 Jun 2019 20:25:33 +0800
Message-Id: <20190611122535.23583-1-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add binding doc for i.MX8MN pinctrl driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Acked-by: Dong Aisheng <aisheng.dong@nxp.com>
---
No change.
---
 .../bindings/pinctrl/fsl,imx8mn-pinctrl.txt        |  39 ++
 arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h     | 646 +++++++++++++++++++++
 2 files changed, 685 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
new file mode 100644
index 0000000..330716c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.txt
@@ -0,0 +1,39 @@
+* Freescale IMX8MN IOMUX Controller
+
+Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+for common binding part and usage.
+
+Required properties:
+- compatible: "fsl,imx8mn-iomuxc"
+- reg: should contain the base physical address and size of the iomuxc
+  registers.
+
+Required properties in sub-nodes:
+- fsl,pins: each entry consists of 6 integers and represents the mux and config
+  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
+  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
+  <arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h>. The last integer CONFIG is
+  the pad setting value like pull-up on this pin. Please refer to i.MX8M Nano
+  Reference Manual for detailed CONFIG settings.
+
+Examples:
+
+&uart1 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&pinctrl_uart1>;
+};
+
+iomuxc: pinctrl@30330000 {
+        compatible = "fsl,imx8mn-iomuxc";
+        reg = <0x0 0x30330000 0x0 0x10000>;
+
+        pinctrl_uart1: uart1grp {
+                fsl,pins = <
+			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MN_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MN_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MN_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0x19
+                >;
+        };
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h
new file mode 100644
index 0000000..faf1e69
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-pinfunc.h
@@ -0,0 +1,646 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2018-2019 NXP
+ */
+
+#ifndef __DTS_IMX8MN_PINFUNC_H
+#define __DTS_IMX8MN_PINFUNC_H
+
+/*
+ * The pin function ID is a tuple of
+ * <mux_reg conf_reg input_reg mux_mode input_val>
+ */
+
+#define MX8MN_IOMUXC_BOOT_MODE2_CCMSRCGPCMIX_BOOT_MODE2                        0x020 0x25C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_BOOT_MODE2_I2C1_SCL                                       0x020 0x25C 0x55C 0x1 0x3
+#define MX8MN_IOMUXC_BOOT_MODE3_CCMSRCGPCMIX_BOOT_MODE3                        0x024 0x260 0x000 0x0 0x0
+#define MX8MN_IOMUXC_BOOT_MODE3_I2C1_SDA                                       0x024 0x260 0x56C 0x1 0x3
+#define MX8MN_IOMUXC_GPIO1_IO00_GPIO1_IO0                                      0x028 0x290 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO00_CCMSRCGPCMIX_ENET_PHY_REF_CLK_ROOT             0x028 0x290 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K                             0x028 0x290 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO00_CCMSRCGPCMIX_EXT_CLK1                          0x028 0x290 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO01_GPIO1_IO1                                      0x02C 0x294 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO01_PWM1_OUT                                       0x02C 0x294 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO01_ANAMIX_REF_CLK_24M                             0x02C 0x294 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO01_CCMSRCGPCMIX_EXT_CLK2                          0x02C 0x294 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO02_GPIO1_IO2                                      0x030 0x298 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B                                   0x030 0x298 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_ANY                                 0x030 0x298 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3                                      0x034 0x29C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO03_USDHC1_VSELECT                                 0x034 0x29C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO03_SDMA1_EXT_EVENT0                               0x034 0x29C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO03_ANAMIX_XTAL_OK                                 0x034 0x29C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO04_GPIO1_IO4                                      0x038 0x2A0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT                                 0x038 0x2A0 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO04_SDMA1_EXT_EVENT1                               0x038 0x2A0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO04_ANAMIX_XTAL_OK_LV                              0x038 0x2A0 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5                                      0x03C 0x2A4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO05_M4_NMI                                         0x03C 0x2A4 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO05_CCMSRCGPCMIX_PMIC_READY                        0x03C 0x2A4 0x4BC 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO05_CCMSRCGPCMIX_INT_BOOT                          0x03C 0x2A4 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6                                      0x040 0x2A8 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO06_ENET1_MDC                                      0x040 0x2A8 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO06_USDHC1_CD_B                                    0x040 0x2A8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO06_CCMSRCGPCMIX_EXT_CLK3                          0x040 0x2A8 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7                                      0x044 0x2AC 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO07_ENET1_MDIO                                     0x044 0x2AC 0x4C0 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO07_USDHC1_WP                                      0x044 0x2AC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO07_CCMSRCGPCMIX_EXT_CLK4                          0x044 0x2AC 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8                                      0x048 0x2B0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO08_ENET1_1588_EVENT0_IN                           0x048 0x2B0 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO08_PWM1_OUT                                       0x048 0x2B0 0x000 0x2 0x0
+#define MX8MN_IOMUXC_GPIO1_IO08_USDHC2_RESET_B                                 0x048 0x2B0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO08_CCMSRCGPCMIX_WAIT                              0x048 0x2B0 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9                                      0x04C 0x2B4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO09_ENET1_1588_EVENT0_OUT                          0x04C 0x2B4 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO09_PWM2_OUT                                       0x04C 0x2B4 0x000 0x2 0x0
+#define MX8MN_IOMUXC_GPIO1_IO09_USDHC3_RESET_B                                 0x04C 0x2B4 0x000 0x4 0x0
+#define MX8MN_IOMUXC_GPIO1_IO09_SDMA2_EXT_EVENT0                               0x04C 0x2B4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO09_CCMSRCGPCMIX_STOP                              0x04C 0x2B4 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10                                     0x050 0x2B8 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO10_USB1_OTG_ID                                    0x050 0x2B8 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO10_PWM3_OUT                                       0x050 0x2B8 0x000 0x2 0x0
+#define MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11                                     0x054 0x2BC 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO11_PWM2_OUT                                       0x054 0x2BC 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO11_USDHC3_VSELECT                                 0x054 0x2BC 0x000 0x4 0x0
+#define MX8MN_IOMUXC_GPIO1_IO11_CCMSRCGPCMIX_PMIC_READY                        0x054 0x2BC 0x4BC 0x5 0x1
+#define MX8MN_IOMUXC_GPIO1_IO11_CCMSRCGPCMIX_OUT0                              0x054 0x2BC 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO12_GPIO1_IO12                                     0x058 0x2C0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO12_USB1_OTG_PWR                                   0x058 0x2C0 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO12_SDMA2_EXT_EVENT1                               0x058 0x2C0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO12_CCMSRCGPCMIX_OUT1                              0x058 0x2C0 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13                                     0x05C 0x2C4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO13_USB1_OTG_OC                                    0x05C 0x2C4 0x000 0x1 0x0
+#define MX8MN_IOMUXC_GPIO1_IO13_PWM2_OUT                                       0x05C 0x2C4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO13_CCMSRCGPCMIX_OUT2                              0x05C 0x2C4 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO14_GPIO1_IO14                                     0x060 0x2C8 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO14_USDHC3_CD_B                                    0x060 0x2C8 0x598 0x4 0x2
+#define MX8MN_IOMUXC_GPIO1_IO14_PWM3_OUT                                       0x060 0x2C8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO14_CCMSRCGPCMIX_CLKO1                             0x060 0x2C8 0x000 0x6 0x0
+#define MX8MN_IOMUXC_GPIO1_IO15_GPIO1_IO15                                     0x064 0x2CC 0x000 0x0 0x0
+#define MX8MN_IOMUXC_GPIO1_IO15_USDHC3_WP                                      0x064 0x2CC 0x5B8 0x4 0x2
+#define MX8MN_IOMUXC_GPIO1_IO15_PWM4_OUT                                       0x064 0x2CC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_GPIO1_IO15_CCMSRCGPCMIX_CLKO2                             0x064 0x2CC 0x000 0x6 0x0
+#define MX8MN_IOMUXC_ENET_MDC_ENET1_MDC                                        0x068 0x2D0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_MDC_SAI6_TX_DATA0                                    0x068 0x2D0 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_MDC_PDM_BIT_STREAM3                                  0x068 0x2D0 0x540 0x3 0x1
+#define MX8MN_IOMUXC_ENET_MDC_SPDIF1_OUT                                       0x068 0x2D0 0x000 0x4 0x0
+#define MX8MN_IOMUXC_ENET_MDC_GPIO1_IO16                                       0x068 0x2D0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_MDC_USDHC3_STROBE                                    0x068 0x2D0 0x59C 0x6 0x1
+#define MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO                                      0x06C 0x2D4 0x4C0 0x0 0x1
+#define MX8MN_IOMUXC_ENET_MDIO_SAI6_TX_SYNC                                    0x06C 0x2D4 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_MDIO_PDM_BIT_STREAM2                                 0x06C 0x2D4 0x53C 0x3 0x1
+#define MX8MN_IOMUXC_ENET_MDIO_SPDIF1_IN                                       0x06C 0x2D4 0x5CC 0x4 0x1
+#define MX8MN_IOMUXC_ENET_MDIO_GPIO1_IO17                                      0x06C 0x2D4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_MDIO_USDHC3_DATA5                                    0x06C 0x2D4 0x550 0x6 0x1
+#define MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3                                  0x070 0x2D8 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_TD3_SAI6_TX_BCLK                                     0x070 0x2D8 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_TD3_PDM_BIT_STREAM1                                  0x070 0x2D8 0x538 0x3 0x1
+#define MX8MN_IOMUXC_ENET_TD3_SPDIF1_EXT_CLK                                   0x070 0x2D8 0x568 0x4 0x1
+#define MX8MN_IOMUXC_ENET_TD3_GPIO1_IO18                                       0x070 0x2D8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_TD3_USDHC3_DATA6                                     0x070 0x2D8 0x584 0x6 0x1
+#define MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2                                  0x074 0x2DC 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_TD2_ENET1_TX_CLK                                     0x074 0x2DC 0x5A4 0x1 0x0
+#define MX8MN_IOMUXC_ENET_TD2_CCMSRCGPCMIX_ENET_REF_CLK_ROOT                   0x074 0x2DC 0x5A4 0x1 0x0
+#define MX8MN_IOMUXC_ENET_TD2_SAI6_RX_DATA0                                    0x074 0x2DC 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_TD2_PDM_BIT_STREAM3                                  0x074 0x2DC 0x540 0x3 0x2
+#define MX8MN_IOMUXC_ENET_TD2_GPIO1_IO19                                       0x074 0x2DC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_TD2_USDHC3_DATA7                                     0x074 0x2DC 0x54C 0x6 0x1
+#define MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1                                  0x078 0x2E0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_TD1_SAI6_RX_SYNC                                     0x078 0x2E0 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_TD1_PDM_BIT_STREAM2                                  0x078 0x2E0 0x53C 0x3 0x2
+#define MX8MN_IOMUXC_ENET_TD1_GPIO1_IO20                                       0x078 0x2E0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_TD1_USDHC3_CD_B                                      0x078 0x2E0 0x598 0x6 0x3
+#define MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0                                  0x07C 0x2E4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_TD0_SAI6_RX_BCLK                                     0x07C 0x2E4 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_TD0_PDM_BIT_STREAM1                                  0x07C 0x2E4 0x538 0x3 0x2
+#define MX8MN_IOMUXC_ENET_TD0_GPIO1_IO21                                       0x07C 0x2E4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_TD0_USDHC3_WP                                        0x07C 0x2E4 0x5B8 0x6 0x3
+#define MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL                            0x080 0x2E8 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_TX_CTL_SAI6_MCLK                                     0x080 0x2E8 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_TX_CTL_GPIO1_IO22                                    0x080 0x2E8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_TX_CTL_USDHC3_DATA0                                  0x080 0x2E8 0x5B4 0x6 0x1
+#define MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC                                  0x084 0x2EC 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_TXC_ENET1_TX_ER                                      0x084 0x2EC 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ENET_TXC_SAI7_TX_DATA0                                    0x084 0x2EC 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_TXC_GPIO1_IO23                                       0x084 0x2EC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_TXC_USDHC3_DATA1                                     0x084 0x2EC 0x5B0 0x6 0x1
+#define MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL                            0x088 0x2F0 0x574 0x0 0x0
+#define MX8MN_IOMUXC_ENET_RX_CTL_SAI7_TX_SYNC                                  0x088 0x2F0 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_RX_CTL_PDM_BIT_STREAM3                               0x088 0x2F0 0x540 0x3 0x3
+#define MX8MN_IOMUXC_ENET_RX_CTL_GPIO1_IO24                                    0x088 0x2F0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_RX_CTL_USDHC3_DATA2                                  0x088 0x2F0 0x5E4 0x6 0x1
+#define MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC                                  0x08C 0x2F4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_RXC_ENET1_RX_ER                                      0x08C 0x2F4 0x5C8 0x1 0x0
+#define MX8MN_IOMUXC_ENET_RXC_SAI7_TX_BCLK                                     0x08C 0x2F4 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_RXC_PDM_BIT_STREAM2                                  0x08C 0x2F4 0x53C 0x3 0x3
+#define MX8MN_IOMUXC_ENET_RXC_GPIO1_IO25                                       0x08C 0x2F4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_RXC_USDHC3_DATA3                                     0x08C 0x2F4 0x5E0 0x6 0x1
+#define MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0                                  0x090 0x2F8 0x57C 0x0 0x0
+#define MX8MN_IOMUXC_ENET_RD0_SAI7_RX_DATA0                                    0x090 0x2F8 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_RD0_PDM_BIT_STREAM1                                  0x090 0x2F8 0x538 0x3 0x3
+#define MX8MN_IOMUXC_ENET_RD0_GPIO1_IO26                                       0x090 0x2F8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_RD0_USDHC3_DATA4                                     0x090 0x2F8 0x558 0x6 0x1
+#define MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1                                  0x094 0x2FC 0x554 0x0 0x0
+#define MX8MN_IOMUXC_ENET_RD1_SAI7_RX_SYNC                                     0x094 0x2FC 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_RD1_PDM_BIT_STREAM0                                  0x094 0x2FC 0x534 0x3 0x1
+#define MX8MN_IOMUXC_ENET_RD1_GPIO1_IO27                                       0x094 0x2FC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_RD1_USDHC3_RESET_B                                   0x094 0x2FC 0x000 0x6 0x0
+#define MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2                                  0x098 0x300 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_RD2_SAI7_RX_BCLK                                     0x098 0x300 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_RD2_PDM_CLK                                          0x098 0x300 0x000 0x3 0x0
+#define MX8MN_IOMUXC_ENET_RD2_GPIO1_IO28                                       0x098 0x300 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_RD2_USDHC3_CLK                                       0x098 0x300 0x5A0 0x6 0x1
+#define MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3                                  0x09C 0x304 0x000 0x0 0x0
+#define MX8MN_IOMUXC_ENET_RD3_SAI7_MCLK                                        0x09C 0x304 0x000 0x2 0x0
+#define MX8MN_IOMUXC_ENET_RD3_SPDIF1_IN                                        0x09C 0x304 0x5CC 0x3 0x5
+#define MX8MN_IOMUXC_ENET_RD3_GPIO1_IO29                                       0x09C 0x304 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ENET_RD3_USDHC3_CMD                                       0x09C 0x304 0x5DC 0x6 0x1
+#define MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK                                        0x0A0 0x308 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_CLK_ENET1_MDC                                         0x0A0 0x308 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SD1_CLK_UART1_DCE_TX                                      0x0A0 0x308 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_CLK_UART1_DTE_RX                                      0x0A0 0x308 0x4F4 0x4 0x4
+#define MX8MN_IOMUXC_SD1_CLK_GPIO2_IO0                                         0x0A0 0x308 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD                                        0x0A4 0x30C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_CMD_ENET1_MDIO                                        0x0A4 0x30C 0x4C0 0x1 0x3
+#define MX8MN_IOMUXC_SD1_CMD_UART1_DCE_RX                                      0x0A4 0x30C 0x4F4 0x4 0x5
+#define MX8MN_IOMUXC_SD1_CMD_UART1_DTE_TX                                      0x0A4 0x30C 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_CMD_GPIO2_IO1                                         0x0A4 0x30C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0                                    0x0A8 0x310 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA0_ENET1_RGMII_TD1                                 0x0A8 0x310 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SD1_DATA0_UART1_DCE_RTS_B                                 0x0A8 0x310 0x4F0 0x4 0x4
+#define MX8MN_IOMUXC_SD1_DATA0_UART1_DTE_CTS_B                                 0x0A8 0x310 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA0_GPIO2_IO2                                       0x0A8 0x310 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1                                    0x0AC 0x314 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA1_ENET1_RGMII_TD0                                 0x0AC 0x314 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SD1_DATA1_UART1_DCE_CTS_B                                 0x0AC 0x314 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA1_UART1_DTE_RTS_B                                 0x0AC 0x314 0x4F0 0x4 0x5
+#define MX8MN_IOMUXC_SD1_DATA1_GPIO2_IO3                                       0x0AC 0x314 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2                                    0x0B0 0x318 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA2_ENET1_RGMII_RD0                                 0x0B0 0x318 0x57C 0x1 0x1
+#define MX8MN_IOMUXC_SD1_DATA2_UART2_DCE_TX                                    0x0B0 0x318 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA2_UART2_DTE_RX                                    0x0B0 0x318 0x4FC 0x4 0x4
+#define MX8MN_IOMUXC_SD1_DATA2_GPIO2_IO4                                       0x0B0 0x318 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3                                    0x0B4 0x31C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA3_ENET1_RGMII_RD1                                 0x0B4 0x31C 0x554 0x1 0x1
+#define MX8MN_IOMUXC_SD1_DATA3_UART2_DCE_RX                                    0x0B4 0x31C 0x4FC 0x4 0x5
+#define MX8MN_IOMUXC_SD1_DATA3_UART2_DTE_TX                                    0x0B4 0x31C 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA3_GPIO2_IO5                                       0x0B4 0x31C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA4_USDHC1_DATA4                                    0x0B8 0x320 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA4_ENET1_RGMII_TX_CTL                              0x0B8 0x320 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SD1_DATA4_I2C1_SCL                                        0x0B8 0x320 0x55C 0x3 0x1
+#define MX8MN_IOMUXC_SD1_DATA4_UART2_DCE_RTS_B                                 0x0B8 0x320 0x4F8 0x4 0x4
+#define MX8MN_IOMUXC_SD1_DATA4_UART2_DTE_CTS_B                                 0x0B8 0x320 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6                                       0x0B8 0x320 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA5_USDHC1_DATA5                                    0x0BC 0x324 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA5_ENET1_TX_ER                                     0x0BC 0x324 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SD1_DATA5_I2C1_SDA                                        0x0BC 0x324 0x56C 0x3 0x1
+#define MX8MN_IOMUXC_SD1_DATA5_UART2_DCE_CTS_B                                 0x0BC 0x324 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA5_UART2_DTE_RTS_B                                 0x0BC 0x324 0x4F8 0x4 0x5
+#define MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7                                       0x0BC 0x324 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA6_USDHC1_DATA6                                    0x0C0 0x328 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA6_ENET1_RGMII_RX_CTL                              0x0C0 0x328 0x574 0x1 0x1
+#define MX8MN_IOMUXC_SD1_DATA6_I2C2_SCL                                        0x0C0 0x328 0x5D0 0x3 0x1
+#define MX8MN_IOMUXC_SD1_DATA6_UART3_DCE_TX                                    0x0C0 0x328 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA6_UART3_DTE_RX                                    0x0C0 0x328 0x504 0x4 0x4
+#define MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8                                       0x0C0 0x328 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_DATA7_USDHC1_DATA7                                    0x0C4 0x32C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_DATA7_ENET1_RX_ER                                     0x0C4 0x32C 0x5C8 0x1 0x1
+#define MX8MN_IOMUXC_SD1_DATA7_I2C2_SDA                                        0x0C4 0x32C 0x560 0x3 0x1
+#define MX8MN_IOMUXC_SD1_DATA7_UART3_DCE_RX                                    0x0C4 0x32C 0x504 0x4 0x5
+#define MX8MN_IOMUXC_SD1_DATA7_UART3_DTE_TX                                    0x0C4 0x32C 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9                                       0x0C4 0x32C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_RESET_B_USDHC1_RESET_B                                0x0C8 0x330 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_RESET_B_ENET1_TX_CLK                                  0x0C8 0x330 0x5A4 0x1 0x1
+#define MX8MN_IOMUXC_SD1_RESET_B_CCMSRCGPCMIX_ENET_REF_CLK_ROOT                0x0C8 0x330 0x5A4 0x1 0x0
+#define MX8MN_IOMUXC_SD1_RESET_B_I2C3_SCL                                      0x0C8 0x330 0x588 0x3 0x1
+#define MX8MN_IOMUXC_SD1_RESET_B_UART3_DCE_RTS_B                               0x0C8 0x330 0x500 0x4 0x2
+#define MX8MN_IOMUXC_SD1_RESET_B_UART3_DTE_CTS_B                               0x0C8 0x330 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10                                    0x0C8 0x330 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD1_STROBE_USDHC1_STROBE                                  0x0CC 0x334 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD1_STROBE_I2C3_SDA                                       0x0CC 0x334 0x5BC 0x3 0x1
+#define MX8MN_IOMUXC_SD1_STROBE_UART3_DCE_CTS_B                                0x0CC 0x334 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD1_STROBE_UART3_DTE_RTS_B                                0x0CC 0x334 0x500 0x4 0x3
+#define MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11                                     0x0CC 0x334 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B                                      0x0D0 0x338 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_CD_B_GPIO2_IO12                                       0x0D0 0x338 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_CD_B_CCMSRCGPCMIX_TESTER_ACK                          0x0D0 0x338 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK                                        0x0D4 0x33C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_CLK_SAI5_RX_SYNC                                      0x0D4 0x33C 0x4E4 0x1 0x1
+#define MX8MN_IOMUXC_SD2_CLK_ECSPI2_SCLK                                       0x0D4 0x33C 0x580 0x2 0x1
+#define MX8MN_IOMUXC_SD2_CLK_UART4_DCE_RX                                      0x0D4 0x33C 0x50C 0x3 0x4
+#define MX8MN_IOMUXC_SD2_CLK_UART4_DTE_TX                                      0x0D4 0x33C 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SD2_CLK_SAI5_MCLK                                         0x0D4 0x33C 0x594 0x4 0x1
+#define MX8MN_IOMUXC_SD2_CLK_GPIO2_IO13                                        0x0D4 0x33C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_CLK_CCMSRCGPCMIX_OBSERVE0                             0x0D4 0x33C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD                                        0x0D8 0x340 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_CMD_SAI5_RX_BCLK                                      0x0D8 0x340 0x4D0 0x1 0x1
+#define MX8MN_IOMUXC_SD2_CMD_ECSPI2_MOSI                                       0x0D8 0x340 0x590 0x2 0x1
+#define MX8MN_IOMUXC_SD2_CMD_UART4_DCE_TX                                      0x0D8 0x340 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SD2_CMD_UART4_DTE_RX                                      0x0D8 0x340 0x50C 0x3 0x5
+#define MX8MN_IOMUXC_SD2_CMD_PDM_CLK                                           0x0D8 0x340 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SD2_CMD_GPIO2_IO14                                        0x0D8 0x340 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_CMD_CCMSRCGPCMIX_OBSERVE1                             0x0D8 0x340 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0                                    0x0DC 0x344 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_DATA0_SAI5_RX_DATA0                                   0x0DC 0x344 0x4D4 0x1 0x1
+#define MX8MN_IOMUXC_SD2_DATA0_I2C4_SDA                                        0x0DC 0x344 0x58C 0x2 0x1
+#define MX8MN_IOMUXC_SD2_DATA0_UART2_DCE_RX                                    0x0DC 0x344 0x4FC 0x3 0x6
+#define MX8MN_IOMUXC_SD2_DATA0_UART2_DTE_TX                                    0x0DC 0x344 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SD2_DATA0_PDM_BIT_STREAM0                                 0x0DC 0x344 0x534 0x4 0x2
+#define MX8MN_IOMUXC_SD2_DATA0_GPIO2_IO15                                      0x0DC 0x344 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_DATA0_CCMSRCGPCMIX_OBSERVE2                           0x0DC 0x344 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1                                    0x0E0 0x348 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_DATA1_SAI5_TX_SYNC                                    0x0E0 0x348 0x4EC 0x1 0x1
+#define MX8MN_IOMUXC_SD2_DATA1_I2C4_SCL                                        0x0E0 0x348 0x5D4 0x2 0x1
+#define MX8MN_IOMUXC_SD2_DATA1_UART2_DCE_TX                                    0x0E0 0x348 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SD2_DATA1_UART2_DTE_RX                                    0x0E0 0x348 0x4FC 0x3 0x7
+#define MX8MN_IOMUXC_SD2_DATA1_PDM_BIT_STREAM1                                 0x0E0 0x348 0x538 0x4 0x4
+#define MX8MN_IOMUXC_SD2_DATA1_GPIO2_IO16                                      0x0E0 0x348 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_DATA1_CCMSRCGPCMIX_WAIT                               0x0E0 0x348 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2                                    0x0E4 0x34C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_DATA2_SAI5_TX_BCLK                                    0x0E4 0x34C 0x4E8 0x1 0x1
+#define MX8MN_IOMUXC_SD2_DATA2_ECSPI2_SS0                                      0x0E4 0x34C 0x570 0x2 0x2
+#define MX8MN_IOMUXC_SD2_DATA2_SPDIF1_OUT                                      0x0E4 0x34C 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SD2_DATA2_PDM_BIT_STREAM2                                 0x0E4 0x34C 0x53C 0x4 0x4
+#define MX8MN_IOMUXC_SD2_DATA2_GPIO2_IO17                                      0x0E4 0x34C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_DATA2_CCMSRCGPCMIX_STOP                               0x0E4 0x34C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3                                    0x0E8 0x350 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_DATA3_SAI5_TX_DATA0                                   0x0E8 0x350 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SD2_DATA3_ECSPI2_MISO                                     0x0E8 0x350 0x578 0x2 0x1
+#define MX8MN_IOMUXC_SD2_DATA3_SPDIF1_IN                                       0x0E8 0x350 0x5CC 0x3 0x2
+#define MX8MN_IOMUXC_SD2_DATA3_PDM_BIT_STREAM3                                 0x0E8 0x350 0x540 0x4 0x4
+#define MX8MN_IOMUXC_SD2_DATA3_GPIO2_IO18                                      0x0E8 0x350 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_DATA3_CCMSRCGPCMIX_EARLY_RESET                        0x0E8 0x350 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_RESET_B_USDHC2_RESET_B                                0x0EC 0x354 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19                                    0x0EC 0x354 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_RESET_B_CCMSRCGPCMIX_SYSTEM_RESET                     0x0EC 0x354 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SD2_WP_USDHC2_WP                                          0x0F0 0x358 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SD2_WP_GPIO2_IO20                                         0x0F0 0x358 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SD2_WP_CORESIGHT_EVENTI                                   0x0F0 0x358 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_ALE_RAWNAND_ALE                                      0x0F4 0x35C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_ALE_QSPI_A_SCLK                                      0x0F4 0x35C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_ALE_PDM_BIT_STREAM0                                  0x0F4 0x35C 0x534 0x3 0x3
+#define MX8MN_IOMUXC_NAND_ALE_UART3_DCE_RX                                     0x0F4 0x35C 0x504 0x4 0x6
+#define MX8MN_IOMUXC_NAND_ALE_UART3_DTE_TX                                     0x0F4 0x35C 0x000 0x4 0x0
+#define MX8MN_IOMUXC_NAND_ALE_GPIO3_IO0                                        0x0F4 0x35C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_ALE_CORESIGHT_TRACE_CLK                              0x0F4 0x35C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_CE0_B_RAWNAND_CE0_B                                  0x0F8 0x360 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B                                   0x0F8 0x360 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_CE0_B_PDM_BIT_STREAM1                                0x0F8 0x360 0x538 0x3 0x5
+#define MX8MN_IOMUXC_NAND_CE0_B_UART3_DCE_TX                                   0x0F8 0x360 0x000 0x4 0x0
+#define MX8MN_IOMUXC_NAND_CE0_B_UART3_DTE_RX                                   0x0F8 0x360 0x504 0x4 0x7
+#define MX8MN_IOMUXC_NAND_CE0_B_GPIO3_IO1                                      0x0F8 0x360 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_CE0_B_CORESIGHT_TRACE_CTL                            0x0F8 0x360 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_CE1_B_RAWNAND_CE1_B                                  0x0FC 0x364 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_CE1_B_QSPI_A_SS1_B                                   0x0FC 0x364 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE                                  0x0FC 0x364 0x59C 0x2 0x0
+#define MX8MN_IOMUXC_NAND_CE1_B_PDM_BIT_STREAM0                                0x0FC 0x364 0x534 0x3 0x4
+#define MX8MN_IOMUXC_NAND_CE1_B_I2C4_SCL                                       0x0FC 0x364 0x5D4 0x4 0x2
+#define MX8MN_IOMUXC_NAND_CE1_B_GPIO3_IO2                                      0x0FC 0x364 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_CE1_B_CORESIGHT_TRACE0                               0x0FC 0x364 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_CE2_B_RAWNAND_CE2_B                                  0x100 0x368 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_CE2_B_QSPI_B_SS0_B                                   0x100 0x368 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5                                   0x100 0x368 0x550 0x2 0x0
+#define MX8MN_IOMUXC_NAND_CE2_B_PDM_BIT_STREAM1                                0x100 0x368 0x538 0x3 0x6
+#define MX8MN_IOMUXC_NAND_CE2_B_I2C4_SDA                                       0x100 0x368 0x58C 0x4 0x2
+#define MX8MN_IOMUXC_NAND_CE2_B_GPIO3_IO3                                      0x100 0x368 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_CE2_B_CORESIGHT_TRACE1                               0x100 0x368 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_CE3_B_RAWNAND_CE3_B                                  0x104 0x36C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_CE3_B_QSPI_B_SS1_B                                   0x104 0x36C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6                                   0x104 0x36C 0x584 0x2 0x0
+#define MX8MN_IOMUXC_NAND_CE3_B_PDM_BIT_STREAM2                                0x104 0x36C 0x53C 0x3 0x5
+#define MX8MN_IOMUXC_NAND_CE3_B_I2C3_SDA                                       0x104 0x36C 0x5BC 0x4 0x2
+#define MX8MN_IOMUXC_NAND_CE3_B_GPIO3_IO4                                      0x104 0x36C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_CE3_B_CORESIGHT_TRACE2                               0x104 0x36C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_CLE_RAWNAND_CLE                                      0x108 0x370 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_CLE_QSPI_B_SCLK                                      0x108 0x370 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7                                     0x108 0x370 0x54C 0x2 0x0
+#define MX8MN_IOMUXC_NAND_CLE_GPIO3_IO5                                        0x108 0x370 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_CLE_CORESIGHT_TRACE3                                 0x108 0x370 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA00_RAWNAND_DATA00                                0x10C 0x374 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA00_QSPI_A_DATA0                                  0x10C 0x374 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA00_PDM_BIT_STREAM2                               0x10C 0x374 0x53C 0x3 0x6
+#define MX8MN_IOMUXC_NAND_DATA00_UART4_DCE_RX                                  0x10C 0x374 0x50C 0x4 0x6
+#define MX8MN_IOMUXC_NAND_DATA00_UART4_DTE_TX                                  0x10C 0x374 0x000 0x4 0x0
+#define MX8MN_IOMUXC_NAND_DATA00_GPIO3_IO6                                     0x10C 0x374 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA00_CORESIGHT_TRACE4                              0x10C 0x374 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA01_RAWNAND_DATA01                                0x110 0x378 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA01_QSPI_A_DATA1                                  0x110 0x378 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA01_PDM_BIT_STREAM3                               0x110 0x378 0x540 0x3 0x5
+#define MX8MN_IOMUXC_NAND_DATA01_UART4_DCE_TX                                  0x110 0x378 0x000 0x4 0x0
+#define MX8MN_IOMUXC_NAND_DATA01_UART4_DTE_RX                                  0x110 0x378 0x50C 0x4 0x7
+#define MX8MN_IOMUXC_NAND_DATA01_GPIO3_IO7                                     0x110 0x378 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA01_CORESIGHT_TRACE5                              0x110 0x378 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA02_RAWNAND_DATA02                                0x114 0x37C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA02_QSPI_A_DATA2                                  0x114 0x37C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA02_USDHC3_CD_B                                   0x114 0x37C 0x598 0x2 0x0
+#define MX8MN_IOMUXC_NAND_DATA02_I2C4_SDA                                      0x114 0x37C 0x58C 0x4 0x3
+#define MX8MN_IOMUXC_NAND_DATA02_GPIO3_IO8                                     0x114 0x37C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA02_CORESIGHT_TRACE6                              0x114 0x37C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA03_RAWNAND_DATA03                                0x118 0x380 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA03_QSPI_A_DATA3                                  0x118 0x380 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA03_USDHC3_WP                                     0x118 0x380 0x5B8 0x2 0x0
+#define MX8MN_IOMUXC_NAND_DATA03_GPIO3_IO9                                     0x118 0x380 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA03_CORESIGHT_TRACE7                              0x118 0x380 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA04_RAWNAND_DATA04                                0x11C 0x384 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA04_QSPI_B_DATA0                                  0x11C 0x384 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0                                  0x11C 0x384 0x5B4 0x2 0x0
+#define MX8MN_IOMUXC_NAND_DATA04_GPIO3_IO10                                    0x11C 0x384 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA04_CORESIGHT_TRACE8                              0x11C 0x384 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA05_RAWNAND_DATA05                                0x120 0x388 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA05_QSPI_B_DATA1                                  0x120 0x388 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1                                  0x120 0x388 0x5B0 0x2 0x0
+#define MX8MN_IOMUXC_NAND_DATA05_GPIO3_IO11                                    0x120 0x388 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA05_CORESIGHT_TRACE9                              0x120 0x388 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA06_RAWNAND_DATA06                                0x124 0x38C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA06_QSPI_B_DATA2                                  0x124 0x38C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2                                  0x124 0x38C 0x5E4 0x2 0x0
+#define MX8MN_IOMUXC_NAND_DATA06_GPIO3_IO12                                    0x124 0x38C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA06_CORESIGHT_TRACE10                             0x124 0x38C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DATA07_RAWNAND_DATA07                                0x128 0x390 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DATA07_QSPI_B_DATA3                                  0x128 0x390 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3                                  0x128 0x390 0x5E0 0x2 0x0
+#define MX8MN_IOMUXC_NAND_DATA07_GPIO3_IO13                                    0x128 0x390 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DATA07_CORESIGHT_TRACE11                             0x128 0x390 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_DQS_RAWNAND_DQS                                      0x12C 0x394 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_DQS_QSPI_A_DQS                                       0x12C 0x394 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_DQS_PDM_CLK                                          0x12C 0x394 0x000 0x3 0x0
+#define MX8MN_IOMUXC_NAND_DQS_I2C3_SCL                                         0x12C 0x394 0x588 0x4 0x2
+#define MX8MN_IOMUXC_NAND_DQS_GPIO3_IO14                                       0x12C 0x394 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_DQS_CORESIGHT_TRACE12                                0x12C 0x394 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_RE_B_RAWNAND_RE_B                                    0x130 0x398 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_RE_B_QSPI_B_DQS                                      0x130 0x398 0x000 0x1 0x0
+#define MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4                                    0x130 0x398 0x558 0x2 0x0
+#define MX8MN_IOMUXC_NAND_RE_B_PDM_BIT_STREAM1                                 0x130 0x398 0x538 0x3 0x7
+#define MX8MN_IOMUXC_NAND_RE_B_GPIO3_IO15                                      0x130 0x398 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_RE_B_CORESIGHT_TRACE13                               0x130 0x398 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_READY_B_RAWNAND_READY_B                              0x134 0x39C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_READY_B_USDHC3_RESET_B                               0x134 0x39C 0x000 0x2 0x0
+#define MX8MN_IOMUXC_NAND_READY_B_PDM_BIT_STREAM3                              0x134 0x39C 0x540 0x3 0x6
+#define MX8MN_IOMUXC_NAND_READY_B_I2C3_SCL                                     0x134 0x39C 0x588 0x4 0x3
+#define MX8MN_IOMUXC_NAND_READY_B_GPIO3_IO16                                   0x134 0x39C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_READY_B_CORESIGHT_TRACE14                            0x134 0x39C 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_WE_B_RAWNAND_WE_B                                    0x138 0x3A0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK                                      0x138 0x3A0 0x5A0 0x2 0x0
+#define MX8MN_IOMUXC_NAND_WE_B_I2C3_SDA                                        0x138 0x3A0 0x5BC 0x4 0x3
+#define MX8MN_IOMUXC_NAND_WE_B_GPIO3_IO17                                      0x138 0x3A0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_WE_B_CORESIGHT_TRACE15                               0x138 0x3A0 0x000 0x6 0x0
+#define MX8MN_IOMUXC_NAND_WP_B_RAWNAND_WP_B                                    0x13C 0x3A4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD                                      0x13C 0x3A4 0x5DC 0x2 0x0
+#define MX8MN_IOMUXC_NAND_WP_B_I2C4_SDA                                        0x13C 0x3A4 0x58C 0x4 0x4
+#define MX8MN_IOMUXC_NAND_WP_B_GPIO3_IO18                                      0x13C 0x3A4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_NAND_WP_B_CORESIGHT_EVENTO                                0x13C 0x3A4 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC                                    0x140 0x3A8 0x4E4 0x0 0x0
+#define MX8MN_IOMUXC_SAI5_RXFS_GPIO3_IO19                                      0x140 0x3A8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI5_RXC_SAI5_RX_BCLK                                     0x144 0x3AC 0x4D0 0x0 0x0
+#define MX8MN_IOMUXC_SAI5_RXC_PDM_CLK                                          0x144 0x3AC 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI5_RXC_GPIO3_IO20                                       0x144 0x3AC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0                                   0x148 0x3B0 0x4D4 0x0 0x0
+#define MX8MN_IOMUXC_SAI5_RXD0_PDM_BIT_STREAM0                                 0x148 0x3B0 0x534 0x4 0x0
+#define MX8MN_IOMUXC_SAI5_RXD0_GPIO3_IO21                                      0x148 0x3B0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI5_RXD1_SAI5_RX_DATA1                                   0x14C 0x3B4 0x4D8 0x0 0x0
+#define MX8MN_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC                                    0x14C 0x3B4 0x4EC 0x3 0x0
+#define MX8MN_IOMUXC_SAI5_RXD1_PDM_BIT_STREAM1                                 0x14C 0x3B4 0x538 0x4 0x0
+#define MX8MN_IOMUXC_SAI5_RXD1_GPIO3_IO22                                      0x14C 0x3B4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI5_RXD2_SAI5_RX_DATA2                                   0x150 0x3B8 0x4DC 0x0 0x0
+#define MX8MN_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK                                    0x150 0x3B8 0x4E8 0x3 0x0
+#define MX8MN_IOMUXC_SAI5_RXD2_PDM_BIT_STREAM2                                 0x150 0x3B8 0x53C 0x4 0x0
+#define MX8MN_IOMUXC_SAI5_RXD2_GPIO3_IO23                                      0x150 0x3B8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI5_RXD3_SAI5_RX_DATA3                                   0x154 0x3BC 0x4E0 0x0 0x0
+#define MX8MN_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0                                   0x154 0x3BC 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SAI5_RXD3_PDM_BIT_STREAM3                                 0x154 0x3BC 0x540 0x4 0x0
+#define MX8MN_IOMUXC_SAI5_RXD3_GPIO3_IO24                                      0x154 0x3BC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI5_MCLK_SAI5_MCLK                                       0x158 0x3C0 0x594 0x0 0x0
+#define MX8MN_IOMUXC_SAI5_MCLK_GPIO3_IO25                                      0x158 0x3C0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_RXFS_SAI2_RX_SYNC                                    0x1B0 0x418 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI2_RXFS_SAI5_TX_SYNC                                    0x1B0 0x418 0x4EC 0x1 0x2
+#define MX8MN_IOMUXC_SAI2_RXFS_SAI5_TX_DATA1                                   0x1B0 0x418 0x000 0x2 0x0
+#define MX8MN_IOMUXC_SAI2_RXFS_SAI2_RX_DATA1                                   0x1B0 0x418 0x5AC 0x3 0x0
+#define MX8MN_IOMUXC_SAI2_RXFS_UART1_DCE_TX                                    0x1B0 0x418 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI2_RXFS_UART1_DTE_RX                                    0x1B0 0x418 0x4F4 0x4 0x2
+#define MX8MN_IOMUXC_SAI2_RXFS_GPIO4_IO21                                      0x1B0 0x418 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_RXFS_PDM_BIT_STREAM2                                 0x1B0 0x418 0x53C 0x6 0x7
+#define MX8MN_IOMUXC_SAI2_RXC_SAI2_RX_BCLK                                     0x1B4 0x41C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI2_RXC_SAI5_TX_BCLK                                     0x1B4 0x41C 0x4E8 0x1 0x2
+#define MX8MN_IOMUXC_SAI2_RXC_UART1_DCE_RX                                     0x1B4 0x41C 0x4F4 0x4 0x3
+#define MX8MN_IOMUXC_SAI2_RXC_UART1_DTE_TX                                     0x1B4 0x41C 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22                                       0x1B4 0x41C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_RXC_PDM_BIT_STREAM1                                  0x1B4 0x41C 0x538 0x6 0x8
+#define MX8MN_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0                                   0x1B8 0x420 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI2_RXD0_SAI5_TX_DATA0                                   0x1B8 0x420 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI2_RXD0_SAI2_TX_DATA1                                   0x1B8 0x420 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SAI2_RXD0_UART1_DCE_RTS_B                                 0x1B8 0x420 0x4F0 0x4 0x2
+#define MX8MN_IOMUXC_SAI2_RXD0_UART1_DTE_CTS_B                                 0x1B8 0x420 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI2_RXD0_GPIO4_IO23                                      0x1B8 0x420 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_RXD0_PDM_BIT_STREAM3                                 0x1B8 0x420 0x540 0x6 0x7
+#define MX8MN_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC                                    0x1BC 0x424 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI2_TXFS_SAI5_TX_DATA1                                   0x1BC 0x424 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI2_TXFS_SAI2_TX_DATA1                                   0x1BC 0x424 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SAI2_TXFS_UART1_DCE_CTS_B                                 0x1BC 0x424 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI2_TXFS_UART1_DTE_RTS_B                                 0x1BC 0x424 0x4F0 0x4 0x3
+#define MX8MN_IOMUXC_SAI2_TXFS_GPIO4_IO24                                      0x1BC 0x424 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_TXFS_PDM_BIT_STREAM2                                 0x1BC 0x424 0x53C 0x6 0x8
+#define MX8MN_IOMUXC_SAI2_TXC_SAI2_TX_BCLK                                     0x1C0 0x428 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI2_TXC_SAI5_TX_DATA2                                    0x1C0 0x428 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI2_TXC_GPIO4_IO25                                       0x1C0 0x428 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_TXC_PDM_BIT_STREAM1                                  0x1C0 0x428 0x538 0x6 0x9
+#define MX8MN_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0                                   0x1C4 0x42C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI2_TXD0_SAI5_TX_DATA3                                   0x1C4 0x42C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI2_TXD0_GPIO4_IO26                                      0x1C4 0x42C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_TXD0_CCMSRCGPCMIX_BOOT_MODE4                         0x1C4 0x42C 0x540 0x6 0x8
+#define MX8MN_IOMUXC_SAI2_MCLK_SAI2_MCLK                                       0x1C8 0x430 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI2_MCLK_SAI5_MCLK                                       0x1C8 0x430 0x594 0x1 0x2
+#define MX8MN_IOMUXC_SAI2_MCLK_GPIO4_IO27                                      0x1C8 0x430 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI2_MCLK_SAI3_MCLK                                       0x1C8 0x430 0x5C0 0x6 0x1
+#define MX8MN_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC                                    0x1CC 0x434 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI3_RXFS_GPT1_CAPTURE1                                   0x1CC 0x434 0x5F0 0x1 0x0
+#define MX8MN_IOMUXC_SAI3_RXFS_SAI5_RX_SYNC                                    0x1CC 0x434 0x4E4 0x2 0x2
+#define MX8MN_IOMUXC_SAI3_RXFS_SAI3_RX_DATA1                                   0x1CC 0x434 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SAI3_RXFS_SPDIF1_IN                                       0x1CC 0x434 0x5CC 0x4 0x3
+#define MX8MN_IOMUXC_SAI3_RXFS_GPIO4_IO28                                      0x1CC 0x434 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI3_RXFS_PDM_BIT_STREAM0                                 0x1CC 0x434 0x534 0x6 0x5
+#define MX8MN_IOMUXC_SAI3_RXC_SAI3_RX_BCLK                                     0x1D0 0x438 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI3_RXC_GPT1_CLK                                         0x1D0 0x438 0x5E8 0x1 0x0
+#define MX8MN_IOMUXC_SAI3_RXC_SAI5_RX_BCLK                                     0x1D0 0x438 0x4D0 0x2 0x2
+#define MX8MN_IOMUXC_SAI3_RXC_SAI2_RX_DATA1                                    0x1D0 0x438 0x5AC 0x3 0x2
+#define MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B                                  0x1D0 0x438 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI3_RXC_UART2_DTE_RTS_B                                  0x1D0 0x438 0x4F8 0x4 0x2
+#define MX8MN_IOMUXC_SAI3_RXC_GPIO4_IO29                                       0x1D0 0x438 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI3_RXC_PDM_CLK                                          0x1D0 0x438 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SAI3_RXD_SAI3_RX_DATA0                                    0x1D4 0x43C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI3_RXD_GPT1_COMPARE1                                    0x1D4 0x43C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI3_RXD_SAI5_RX_DATA0                                    0x1D4 0x43C 0x4D4 0x2 0x2
+#define MX8MN_IOMUXC_SAI3_RXD_SAI3_TX_DATA1                                    0x1D4 0x43C 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B                                  0x1D4 0x43C 0x4F8 0x4 0x3
+#define MX8MN_IOMUXC_SAI3_RXD_UART2_DTE_CTS_B                                  0x1D4 0x43C 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI3_RXD_GPIO4_IO30                                       0x1D4 0x43C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI3_RXD_PDM_BIT_STREAM1                                  0x1D4 0x43C 0x538 0x6 0x10
+#define MX8MN_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC                                    0x1D8 0x440 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI3_TXFS_GPT1_CAPTURE2                                   0x1D8 0x440 0x5EC 0x1 0x0
+#define MX8MN_IOMUXC_SAI3_TXFS_SAI5_RX_DATA1                                   0x1D8 0x440 0x4D8 0x2 0x1
+#define MX8MN_IOMUXC_SAI3_TXFS_SAI3_TX_DATA1                                   0x1D8 0x440 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX                                    0x1D8 0x440 0x4FC 0x4 0x2
+#define MX8MN_IOMUXC_SAI3_TXFS_UART2_DTE_TX                                    0x1D8 0x440 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI3_TXFS_GPIO4_IO31                                      0x1D8 0x440 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI3_TXFS_PDM_BIT_STREAM3                                 0x1D8 0x440 0x540 0x6 0x9
+#define MX8MN_IOMUXC_SAI3_TXC_SAI3_TX_BCLK                                     0x1DC 0x444 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI3_TXC_GPT1_COMPARE2                                    0x1DC 0x444 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI3_TXC_SAI5_RX_DATA2                                    0x1DC 0x444 0x4DC 0x2 0x1
+#define MX8MN_IOMUXC_SAI3_TXC_SAI2_TX_DATA1                                    0x1DC 0x444 0x000 0x3 0x0
+#define MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX                                     0x1DC 0x444 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI3_TXC_UART2_DTE_RX                                     0x1DC 0x444 0x4FC 0x4 0x3
+#define MX8MN_IOMUXC_SAI3_TXC_GPIO5_IO0                                        0x1DC 0x444 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI3_TXC_PDM_BIT_STREAM2                                  0x1DC 0x444 0x53C 0x6 0x9
+#define MX8MN_IOMUXC_SAI3_TXD_SAI3_TX_DATA0                                    0x1E0 0x448 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SAI3_TXD_GPT1_COMPARE3                                    0x1E0 0x448 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI3_TXD_SAI5_RX_DATA3                                    0x1E0 0x448 0x4E0 0x2 0x1
+#define MX8MN_IOMUXC_SAI3_TXD_SPDIF1_EXT_CLK                                   0x1E0 0x448 0x568 0x4 0x2
+#define MX8MN_IOMUXC_SAI3_TXD_GPIO5_IO1                                        0x1E0 0x448 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI3_TXD_CCMSRCGPCMIX_BOOT_MODE5                          0x1E0 0x448 0x000 0x6 0x0
+#define MX8MN_IOMUXC_SAI3_MCLK_SAI3_MCLK                                       0x1E4 0x44C 0x5C0 0x0 0x0
+#define MX8MN_IOMUXC_SAI3_MCLK_PWM4_OUT                                        0x1E4 0x44C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SAI3_MCLK_SAI5_MCLK                                       0x1E4 0x44C 0x594 0x2 0x3
+#define MX8MN_IOMUXC_SAI3_MCLK_SPDIF1_OUT                                      0x1E4 0x44C 0x000 0x4 0x0
+#define MX8MN_IOMUXC_SAI3_MCLK_GPIO5_IO2                                       0x1E4 0x44C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SAI3_MCLK_SPDIF1_IN                                       0x1E4 0x44C 0x5CC 0x6 0x4
+#define MX8MN_IOMUXC_SPDIF_TX_SPDIF1_OUT                                       0x1E8 0x450 0x000 0x0 0x0
+#define MX8MN_IOMUXC_SPDIF_TX_PWM3_OUT                                         0x1E8 0x450 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3                                        0x1E8 0x450 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SPDIF_RX_SPDIF1_IN                                        0x1EC 0x454 0x5CC 0x0 0x0
+#define MX8MN_IOMUXC_SPDIF_RX_PWM2_OUT                                         0x1EC 0x454 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4                                        0x1EC 0x454 0x000 0x5 0x0
+#define MX8MN_IOMUXC_SPDIF_EXT_CLK_SPDIF1_EXT_CLK                              0x1F0 0x458 0x568 0x0 0x0
+#define MX8MN_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT                                    0x1F0 0x458 0x000 0x1 0x0
+#define MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5                                   0x1F0 0x458 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK                                   0x1F4 0x45C 0x5D8 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX                                  0x1F4 0x45C 0x504 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI1_SCLK_UART3_DTE_TX                                  0x1F4 0x45C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI1_SCLK_I2C1_SCL                                      0x1F4 0x45C 0x55C 0x2 0x2
+#define MX8MN_IOMUXC_ECSPI1_SCLK_SAI5_RX_SYNC                                  0x1F4 0x45C 0x4DC 0x3 0x2
+#define MX8MN_IOMUXC_ECSPI1_SCLK_GPIO5_IO6                                     0x1F4 0x45C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI                                   0x1F8 0x460 0x5A8 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI1_MOSI_UART3_DCE_TX                                  0x1F8 0x460 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI1_MOSI_UART3_DTE_RX                                  0x1F8 0x460 0x504 0x1 0x1
+#define MX8MN_IOMUXC_ECSPI1_MOSI_I2C1_SDA                                      0x1F8 0x460 0x56C 0x2 0x2
+#define MX8MN_IOMUXC_ECSPI1_MOSI_SAI5_RX_BCLK                                  0x1F8 0x460 0x4D0 0x3 0x3
+#define MX8MN_IOMUXC_ECSPI1_MOSI_GPIO5_IO7                                     0x1F8 0x460 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI1_MISO_ECSPI1_MISO                                   0x1FC 0x464 0x5C4 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B                               0x1FC 0x464 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI1_MISO_UART3_DTE_RTS_B                               0x1FC 0x464 0x500 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI1_MISO_I2C2_SCL                                      0x1FC 0x464 0x5D0 0x2 0x2
+#define MX8MN_IOMUXC_ECSPI1_MISO_SAI5_RX_DATA0                                 0x1FC 0x464 0x4D4 0x3 0x3
+#define MX8MN_IOMUXC_ECSPI1_MISO_GPIO5_IO8                                     0x1FC 0x464 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI1_SS0_ECSPI1_SS0                                     0x200 0x468 0x564 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B                                0x200 0x468 0x500 0x1 0x1
+#define MX8MN_IOMUXC_ECSPI1_SS0_UART3_DTE_CTS_B                                0x200 0x468 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI1_SS0_I2C2_SDA                                       0x200 0x468 0x560 0x2 0x2
+#define MX8MN_IOMUXC_ECSPI1_SS0_SAI5_RX_DATA1                                  0x200 0x468 0x4D8 0x3 0x2
+#define MX8MN_IOMUXC_ECSPI1_SS0_SAI5_TX_SYNC                                   0x200 0x468 0x4EC 0x4 0x3
+#define MX8MN_IOMUXC_ECSPI1_SS0_GPIO5_IO9                                      0x200 0x468 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK                                   0x204 0x46C 0x580 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX                                  0x204 0x46C 0x50C 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI2_SCLK_UART4_DTE_TX                                  0x204 0x46C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI2_SCLK_I2C3_SCL                                      0x204 0x46C 0x588 0x2 0x4
+#define MX8MN_IOMUXC_ECSPI2_SCLK_SAI5_RX_DATA2                                 0x204 0x46C 0x000 0x3 0x0
+#define MX8MN_IOMUXC_ECSPI2_SCLK_SAI5_TX_BCLK                                  0x204 0x46C 0x4E8 0x4 0x3
+#define MX8MN_IOMUXC_ECSPI2_SCLK_GPIO5_IO10                                    0x204 0x46C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI                                   0x208 0x470 0x590 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI2_MOSI_UART4_DCE_TX                                  0x208 0x470 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI2_MOSI_UART4_DTE_RX                                  0x208 0x470 0x50C 0x1 0x1
+#define MX8MN_IOMUXC_ECSPI2_MOSI_I2C3_SDA                                      0x208 0x470 0x5BC 0x2 0x4
+#define MX8MN_IOMUXC_ECSPI2_MOSI_SAI5_RX_DATA3                                 0x208 0x470 0x4E0 0x3 0x2
+#define MX8MN_IOMUXC_ECSPI2_MOSI_SAI5_TX_DATA0                                 0x208 0x470 0x000 0x4 0x0
+#define MX8MN_IOMUXC_ECSPI2_MOSI_GPIO5_IO11                                    0x208 0x470 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO                                   0x20C 0x474 0x578 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI2_MISO_UART4_DCE_CTS_B                               0x20C 0x474 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI2_MISO_UART4_DTE_RTS_B                               0x20C 0x474 0x508 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI2_MISO_I2C4_SCL                                      0x20C 0x474 0x5D4 0x2 0x3
+#define MX8MN_IOMUXC_ECSPI2_MISO_SAI5_MCLK                                     0x20C 0x474 0x594 0x3 0x4
+#define MX8MN_IOMUXC_ECSPI2_MISO_GPIO5_IO12                                    0x20C 0x474 0x000 0x5 0x0
+#define MX8MN_IOMUXC_ECSPI2_SS0_ECSPI2_SS0                                     0x210 0x478 0x570 0x0 0x0
+#define MX8MN_IOMUXC_ECSPI2_SS0_UART4_DCE_RTS_B                                0x210 0x478 0x508 0x1 0x1
+#define MX8MN_IOMUXC_ECSPI2_SS0_UART4_DTE_CTS_B                                0x210 0x478 0x000 0x1 0x0
+#define MX8MN_IOMUXC_ECSPI2_SS0_I2C4_SDA                                       0x210 0x478 0x58C 0x2 0x5
+#define MX8MN_IOMUXC_ECSPI2_SS0_GPIO5_IO13                                     0x210 0x478 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL                                         0x214 0x47C 0x55C 0x0 0x0
+#define MX8MN_IOMUXC_I2C1_SCL_ENET1_MDC                                        0x214 0x47C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_I2C1_SCL_ECSPI1_SCLK                                      0x214 0x47C 0x5D8 0x3 0x1
+#define MX8MN_IOMUXC_I2C1_SCL_GPIO5_IO14                                       0x214 0x47C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA                                         0x218 0x480 0x56C 0x0 0x0
+#define MX8MN_IOMUXC_I2C1_SDA_ENET1_MDIO                                       0x218 0x480 0x4C0 0x1 0x2
+#define MX8MN_IOMUXC_I2C1_SDA_ECSPI1_MOSI                                      0x218 0x480 0x5A8 0x3 0x1
+#define MX8MN_IOMUXC_I2C1_SDA_GPIO5_IO15                                       0x218 0x480 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL                                         0x21C 0x484 0x5D0 0x0 0x0
+#define MX8MN_IOMUXC_I2C2_SCL_ENET1_1588_EVENT1_IN                             0x21C 0x484 0x000 0x1 0x0
+#define MX8MN_IOMUXC_I2C2_SCL_USDHC3_CD_B                                      0x21C 0x484 0x598 0x2 0x1
+#define MX8MN_IOMUXC_I2C2_SCL_ECSPI1_MISO                                      0x21C 0x484 0x5C4 0x3 0x1
+#define MX8MN_IOMUXC_I2C2_SCL_GPIO5_IO16                                       0x21C 0x484 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA                                         0x220 0x488 0x560 0x0 0x0
+#define MX8MN_IOMUXC_I2C2_SDA_ENET1_1588_EVENT1_OUT                            0x220 0x488 0x000 0x1 0x0
+#define MX8MN_IOMUXC_I2C2_SDA_USDHC3_WP                                        0x220 0x488 0x5B8 0x2 0x1
+#define MX8MN_IOMUXC_I2C2_SDA_ECSPI1_SS0                                       0x220 0x488 0x564 0x3 0x1
+#define MX8MN_IOMUXC_I2C2_SDA_GPIO5_IO17                                       0x220 0x488 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL                                         0x224 0x48C 0x588 0x0 0x0
+#define MX8MN_IOMUXC_I2C3_SCL_PWM4_OUT                                         0x224 0x48C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_I2C3_SCL_GPT2_CLK                                         0x224 0x48C 0x000 0x2 0x0
+#define MX8MN_IOMUXC_I2C3_SCL_ECSPI2_SCLK                                      0x224 0x48C 0x580 0x3 0x2
+#define MX8MN_IOMUXC_I2C3_SCL_GPIO5_IO18                                       0x224 0x48C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA                                         0x228 0x490 0x5BC 0x0 0x0
+#define MX8MN_IOMUXC_I2C3_SDA_PWM3_OUT                                         0x228 0x490 0x000 0x1 0x0
+#define MX8MN_IOMUXC_I2C3_SDA_GPT3_CLK                                         0x228 0x490 0x000 0x2 0x0
+#define MX8MN_IOMUXC_I2C3_SDA_ECSPI2_MOSI                                      0x228 0x490 0x590 0x3 0x2
+#define MX8MN_IOMUXC_I2C3_SDA_GPIO5_IO19                                       0x228 0x490 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL                                         0x22C 0x494 0x5D4 0x0 0x0
+#define MX8MN_IOMUXC_I2C4_SCL_PWM2_OUT                                         0x22C 0x494 0x000 0x1 0x0
+#define MX8MN_IOMUXC_I2C4_SCL_ECSPI2_MISO                                      0x22C 0x494 0x578 0x3 0x2
+#define MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20                                       0x22C 0x494 0x000 0x5 0x0
+#define MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA                                         0x230 0x498 0x58C 0x0 0x0
+#define MX8MN_IOMUXC_I2C4_SDA_PWM1_OUT                                         0x230 0x498 0x000 0x1 0x0
+#define MX8MN_IOMUXC_I2C4_SDA_ECSPI2_SS0                                       0x230 0x498 0x570 0x3 0x1
+#define MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21                                       0x230 0x498 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX                                    0x234 0x49C 0x4F4 0x0 0x0
+#define MX8MN_IOMUXC_UART1_RXD_UART1_DTE_TX                                    0x234 0x49C 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART1_RXD_ECSPI3_SCLK                                     0x234 0x49C 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART1_RXD_GPIO5_IO22                                      0x234 0x49C 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART1_TXD_UART1_DCE_TX                                    0x238 0x4A0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART1_TXD_UART1_DTE_RX                                    0x238 0x4A0 0x4F4 0x0 0x1
+#define MX8MN_IOMUXC_UART1_TXD_ECSPI3_MOSI                                     0x238 0x4A0 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART1_TXD_GPIO5_IO23                                      0x238 0x4A0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX                                    0x23C 0x4A4 0x4FC 0x0 0x0
+#define MX8MN_IOMUXC_UART2_RXD_UART2_DTE_TX                                    0x23C 0x4A4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART2_RXD_ECSPI3_MISO                                     0x23C 0x4A4 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART2_RXD_GPT1_COMPARE3                                   0x23C 0x4A4 0x000 0x3 0x0
+#define MX8MN_IOMUXC_UART2_RXD_GPIO5_IO24                                      0x23C 0x4A4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART2_TXD_UART2_DCE_TX                                    0x240 0x4A8 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART2_TXD_UART2_DTE_RX                                    0x240 0x4A8 0x4FC 0x0 0x1
+#define MX8MN_IOMUXC_UART2_TXD_ECSPI3_SS0                                      0x240 0x4A8 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART2_TXD_GPT1_COMPARE2                                   0x240 0x4A8 0x000 0x3 0x0
+#define MX8MN_IOMUXC_UART2_TXD_GPIO5_IO25                                      0x240 0x4A8 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX                                    0x244 0x4AC 0x504 0x0 0x2
+#define MX8MN_IOMUXC_UART3_RXD_UART3_DTE_TX                                    0x244 0x4AC 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART3_RXD_UART1_DCE_CTS_B                                 0x244 0x4AC 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART3_RXD_UART1_DTE_RTS_B                                 0x244 0x4AC 0x4F0 0x1 0x0
+#define MX8MN_IOMUXC_UART3_RXD_USDHC3_RESET_B                                  0x244 0x4AC 0x000 0x2 0x0
+#define MX8MN_IOMUXC_UART3_RXD_GPT1_CAPTURE2                                   0x244 0x4AC 0x5EC 0x3 0x1
+#define MX8MN_IOMUXC_UART3_RXD_GPIO5_IO26                                      0x244 0x4AC 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX                                    0x248 0x4B0 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART3_TXD_UART3_DTE_RX                                    0x248 0x4B0 0x504 0x0 0x3
+#define MX8MN_IOMUXC_UART3_TXD_UART1_DCE_RTS_B                                 0x248 0x4B0 0x4F0 0x1 0x1
+#define MX8MN_IOMUXC_UART3_TXD_UART1_DTE_CTS_B                                 0x248 0x4B0 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART3_TXD_USDHC3_VSELECT                                  0x248 0x4B0 0x000 0x2 0x0
+#define MX8MN_IOMUXC_UART3_TXD_GPT1_CLK                                        0x248 0x4B0 0x5E8 0x3 0x1
+#define MX8MN_IOMUXC_UART3_TXD_GPIO5_IO27                                      0x248 0x4B0 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX                                    0x24C 0x4B4 0x50C 0x0 0x2
+#define MX8MN_IOMUXC_UART4_RXD_UART4_DTE_TX                                    0x24C 0x4B4 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART4_RXD_UART2_DCE_CTS_B                                 0x24C 0x4B4 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART4_RXD_UART2_DTE_RTS_B                                 0x24C 0x4B4 0x4F8 0x1 0x0
+#define MX8MN_IOMUXC_UART4_RXD_GPT1_COMPARE1                                   0x24C 0x4B4 0x000 0x3 0x0
+#define MX8MN_IOMUXC_UART4_RXD_GPIO5_IO28                                      0x24C 0x4B4 0x000 0x5 0x0
+#define MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX                                    0x250 0x4B8 0x000 0x0 0x0
+#define MX8MN_IOMUXC_UART4_TXD_UART4_DTE_RX                                    0x250 0x4B8 0x50C 0x0 0x3
+#define MX8MN_IOMUXC_UART4_TXD_UART2_DCE_RTS_B                                 0x250 0x4B8 0x4F8 0x1 0x1
+#define MX8MN_IOMUXC_UART4_TXD_UART2_DTE_CTS_B                                 0x250 0x4B8 0x000 0x1 0x0
+#define MX8MN_IOMUXC_UART4_TXD_GPT1_CAPTURE1                                   0x250 0x4B8 0x5F0 0x3 0x1
+#define MX8MN_IOMUXC_UART4_TXD_GPIO5_IO29                                      0x250 0x4B8 0x000 0x5 0x0
+
+#endif /* __DTS_IMX8MN_PINFUNC_H */
-- 
2.7.4

