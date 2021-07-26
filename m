Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82133D53E2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 09:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbhGZGhM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 02:37:12 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:46704 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232367AbhGZGhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 02:37:04 -0400
X-UUID: 0e856443db9a4e8bb333924e1b872f71-20210726
X-UUID: 0e856443db9a4e8bb333924e1b872f71-20210726
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1914989587; Mon, 26 Jul 2021 15:17:30 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:17:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 15:17:28 +0800
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
Subject: [PATCH 05/12] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date:   Mon, 26 Jul 2021 15:14:32 +0800
Message-ID: <20210726071439.14248-6-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726071439.14248-1-sam.shih@mediatek.com>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This updates bindings for MT7986 pinctrl driver.
The difference of pinctrl between mt7986a and mt7986b
is that pin-41 to pin-65 do not exist on mt7986b

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt7622.txt       | 284 ++++++++++++++++++
 1 file changed, 284 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
index 7a7aca1ed705..3c42eaad7a5e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
@@ -4,6 +4,8 @@ Required properties for the root node:
  - compatible: Should be one of the following
 	       "mediatek,mt7622-pinctrl" for MT7622 SoC
 	       "mediatek,mt7629-pinctrl" for MT7629 SoC
+	       "mediatek,mt7986a-pinctrl" for MT7986a SoC
+	       "mediatek,mt7986b-pinctrl" for MT7986b SoC
  - reg: offset and length of the pinctrl space
 
  - gpio-controller: Marks the device node as a GPIO controller.
@@ -455,6 +457,288 @@ Valid values for groups are:
 	"wf0_5g"			"wifi"		0, 1, 2, 3, 4, 5, 6,
 							7, 8, 9, 10
 
+== Valid values for pins, function and groups on MT7986a ==
+
+Valid values for pins are:
+pins can be referenced via the pin names as the below table shown and the
+related physical number is also put ahead of those names which helps cross
+references to pins between groups to know whether pins assignment conflict
+happens among devices try to acquire those available pins.
+
+	Pin #:  Valid values for pins
+	-----------------------------
+	PIN 0: "SYS_WATCHDOG"
+	PIN 1: "WF2G_LED"
+	PIN 2: "WF5G_LED"
+	PIN 3: "I2C_SCL"
+	PIN 4: "I2C_SDA"
+	PIN 5: "GPIO_0"
+	PIN 6: "GPIO_1"
+	PIN 7: "GPIO_2"
+	PIN 8: "GPIO_3"
+	PIN 9: "GPIO_4"
+	PIN 10: "GPIO_5"
+	PIN 11: "GPIO_6"
+	PIN 12: "GPIO_7"
+	PIN 13: "GPIO_8"
+	PIN 14: "GPIO_9"
+	PIN 15: "GPIO_10"
+	PIN 16: "GPIO_11"
+	PIN 17: "GPIO_12"
+	PIN 18: "GPIO_13"
+	PIN 19: "GPIO_14"
+	PIN 20: "GPIO_15"
+	PIN 21: "PWM0"
+	PIN 22: "PWM1"
+	PIN 23: "SPI0_CLK"
+	PIN 24: "SPI0_MOSI"
+	PIN 25: "SPI0_MISO"
+	PIN 26: "SPI0_CS"
+	PIN 27: "SPI0_HOLD"
+	PIN 28: "SPI0_WP"
+	PIN 29: "SPI1_CLK"
+	PIN 30: "SPI1_MOSI"
+	PIN 31: "SPI1_MISO"
+	PIN 32: "SPI1_CS"
+	PIN 33: "SPI2_CLK"
+	PIN 34: "SPI2_MOSI"
+	PIN 35: "SPI2_MISO"
+	PIN 36: "SPI2_CS"
+	PIN 37: "SPI2_HOLD"
+	PIN 38: "SPI2_WP"
+	PIN 39: "UART0_RXD"
+	PIN 40: "UART0_TXD"
+	PIN 41: "PCIE_PERESET_N"
+	PIN 42: "UART1_RXD"
+	PIN 43: "UART1_TXD"
+	PIN 44: "UART1_CTS"
+	PIN 45: "UART1_RTS"
+	PIN 46: "UART2_RXD"
+	PIN 47: "UART2_TXD"
+	PIN 48: "UART2_CTS"
+	PIN 49: "UART2_RTS"
+	PIN 50: "EMMC_DATA_0"
+	PIN 51: "EMMC_DATA_1"
+	PIN 52: "EMMC_DATA_2"
+	PIN 53: "EMMC_DATA_3"
+	PIN 54: "EMMC_DATA_4"
+	PIN 55: "EMMC_DATA_5"
+	PIN 56: "EMMC_DATA_6"
+	PIN 57: "EMMC_DATA_7"
+	PIN 58: "EMMC_CMD"
+	PIN 59: "EMMC_CK"
+	PIN 60: "EMMC_DSL"
+	PIN 61: "EMMC_RSTB"
+	PIN 62: "PCM_DTX"
+	PIN 63: "PCM_DRX"
+	PIN 64: "PCM_CLK"
+	PIN 65: "PCM_FS"
+	PIN 66: "MT7531_INT"
+	PIN 67: "SMI_MDC"
+	PIN 68: "SMI_MDIO"
+	PIN 69: "WF0_DIG_RESETB"
+	PIN 70: "WF0_CBA_RESETB"
+	PIN 71: "WF0_XO_REQ"
+	PIN 72: "WF0_TOP_CLK"
+	PIN 73: "WF0_TOP_DATA"
+	PIN 74: "WF0_HB1"
+	PIN 75: "WF0_HB2"
+	PIN 76: "WF0_HB3"
+	PIN 77: "WF0_HB4"
+	PIN 78: "WF0_HB0"
+	PIN 79: "WF0_HB0_B"
+	PIN 80: "WF0_HB5"
+	PIN 81: "WF0_HB6"
+	PIN 82: "WF0_HB7"
+	PIN 83: "WF0_HB8"
+	PIN 84: "WF0_HB9"
+	PIN 85: "WF0_HB10"
+	PIN 86: "WF1_DIG_RESETB"
+	PIN 87: "WF1_CBA_RESETB"
+	PIN 88: "WF1_XO_REQ"
+	PIN 89: "WF1_TOP_CLK"
+	PIN 90: "WF1_TOP_DATA"
+	PIN 91: "WF1_HB1"
+	PIN 92: "WF1_HB2"
+	PIN 93: "WF1_HB3"
+	PIN 94: "WF1_HB4"
+	PIN 95: "WF1_HB0"
+	PIN 96: "WF1_HB0_B"
+	PIN 97: "WF1_HB5"
+	PIN 98: "WF1_HB6"
+	PIN 99: "WF1_HB7"
+	PIN 100: "WF1_HB8"
+
+Valid values for function are:
+	"audio, "emmc", "eth", "i2c", "wifi", "led", "flash", "pcie",
+	"pwm", "spi", "uart", "watchdog"
+
+Valid values for groups are:
+additional data is put followingly with valid value allowing us to know which
+applicable function and which relevant pins (in pin#) are able applied for that
+group.
+
+	Valid value			function	pins (in pin#)
+	-------------------------------------------------------------------------
+	"watchdog"			"watchdog"	0
+	"wifi_led"			"led"		1, 2
+	"i2c"				"i2c"		3, 4
+	"uart1_0"			"uart"		7, 8, 9, 10
+	"pcie_clk"			"pcie"		9
+	"pcie_wake"			"pcie"		10
+	"spi1_0"			"spi"		11, 12, 13, 14
+	"pwm1_1"			"pwm"		20,
+	"pwm0"				"pwm"		21,
+	"pwm1_0"			"pwm"		22,
+	"snfi"				"flash"		23, 24, 25, 26, 27, 28
+	"spi1_2"			"spi"		29, 30, 31, 32
+	"emmc_45"			"emmc"		22, 23, 24, 25, 26, 27,
+							28, 29, 30, 31, 32
+	"spi1_1"			"spi"		23, 24, 25, 26
+	"uart1_2"			"uart"		29, 30, 31, 32
+	"uart1_1"			"uart"		23, 24, 25, 26
+	"uart2_0"			"uart"		29, 30, 31, 32
+	"spi0"				"spi"		33, 34, 35, 36
+	"spi0_wp_hold"			"spi"		37, 38
+	"uart1_3_rx_tx"			"uart"		35, 36
+	"uart1_3_cts_rts"		"uart"		37, 38
+	"uart2_1"			"uart"		33, 34, 35, 36
+	"spi1_3"			"spi"		33, 34, 35, 36
+	"uart0"				"uart"		39, 40
+	"pcie_pereset"			"pcie"		41
+	"uart1"				"uart"		42, 43, 44, 45
+	"uart2"				"uart"		46, 47, 48, 49
+	"emmc_51"			"emmc"		50, 51, 52, 53, 54, 55,
+							56, 57, 57, 59, 60, 61
+	"pcm"				"audio"		62, 63, 64, 65
+	"i2s"				"audio"		62, 63, 64, 65
+	"switch_int"			"eth"		66
+	"mdc_mdio"			"eth"		67
+
+== Valid values for pins, function and groups on MT7986b ==
+
+Valid values for pins are:
+pins can be referenced via the pin names as the below table shown and the
+related physical number is also put ahead of those names which helps cross
+references to pins between groups to know whether pins assignment conflict
+happens among devices try to acquire those available pins.
+
+	Pin #:  Valid values for pins
+	-----------------------------
+	PIN 0: "SYS_WATCHDOG"
+	PIN 1: "WF2G_LED"
+	PIN 2: "WF5G_LED"
+	PIN 3: "I2C_SCL"
+	PIN 4: "I2C_SDA"
+	PIN 5: "GPIO_0"
+	PIN 6: "GPIO_1"
+	PIN 7: "GPIO_2"
+	PIN 8: "GPIO_3"
+	PIN 9: "GPIO_4"
+	PIN 10: "GPIO_5"
+	PIN 11: "GPIO_6"
+	PIN 12: "GPIO_7"
+	PIN 13: "GPIO_8"
+	PIN 14: "GPIO_9"
+	PIN 15: "GPIO_10"
+	PIN 16: "GPIO_11"
+	PIN 17: "GPIO_12"
+	PIN 18: "GPIO_13"
+	PIN 19: "GPIO_14"
+	PIN 20: "GPIO_15"
+	PIN 21: "PWM0"
+	PIN 22: "PWM1"
+	PIN 23: "SPI0_CLK"
+	PIN 24: "SPI0_MOSI"
+	PIN 25: "SPI0_MISO"
+	PIN 26: "SPI0_CS"
+	PIN 27: "SPI0_HOLD"
+	PIN 28: "SPI0_WP"
+	PIN 29: "SPI1_CLK"
+	PIN 30: "SPI1_MOSI"
+	PIN 31: "SPI1_MISO"
+	PIN 32: "SPI1_CS"
+	PIN 33: "SPI2_CLK"
+	PIN 34: "SPI2_MOSI"
+	PIN 35: "SPI2_MISO"
+	PIN 36: "SPI2_CS"
+	PIN 37: "SPI2_HOLD"
+	PIN 38: "SPI2_WP"
+	PIN 39: "UART0_RXD"
+	PIN 40: "UART0_TXD"
+	PIN 66: "MT7531_INT"
+	PIN 67: "SMI_MDC"
+	PIN 68: "SMI_MDIO"
+	PIN 69: "WF0_DIG_RESETB"
+	PIN 70: "WF0_CBA_RESETB"
+	PIN 71: "WF0_XO_REQ"
+	PIN 72: "WF0_TOP_CLK"
+	PIN 73: "WF0_TOP_DATA"
+	PIN 74: "WF0_HB1"
+	PIN 75: "WF0_HB2"
+	PIN 76: "WF0_HB3"
+	PIN 77: "WF0_HB4"
+	PIN 78: "WF0_HB0"
+	PIN 79: "WF0_HB0_B"
+	PIN 80: "WF0_HB5"
+	PIN 81: "WF0_HB6"
+	PIN 82: "WF0_HB7"
+	PIN 83: "WF0_HB8"
+	PIN 84: "WF0_HB9"
+	PIN 85: "WF0_HB10"
+	PIN 86: "WF1_DIG_RESETB"
+	PIN 87: "WF1_CBA_RESETB"
+	PIN 88: "WF1_XO_REQ"
+	PIN 89: "WF1_TOP_CLK"
+	PIN 90: "WF1_TOP_DATA"
+	PIN 91: "WF1_HB1"
+	PIN 92: "WF1_HB2"
+	PIN 93: "WF1_HB3"
+	PIN 94: "WF1_HB4"
+	PIN 95: "WF1_HB0"
+	PIN 96: "WF1_HB0_B"
+	PIN 97: "WF1_HB5"
+	PIN 98: "WF1_HB6"
+	PIN 99: "WF1_HB7"
+	PIN 100: "WF1_HB8"
+
+Valid values for function are:
+	"emmc", "eth", "i2c", "wifi", "led", "flash", "pwm", "spi",
+	"uart", "watchdog"
+
+Valid values for groups are:
+additional data is put followingly with valid value allowing us to know which
+applicable function and which relevant pins (in pin#) are able applied for that
+group.
+
+	Valid value			function	pins (in pin#)
+	-------------------------------------------------------------------------
+	"watchdog"			"watchdog"	0
+	"wifi_led"			"led"		1, 2
+	"i2c"				"i2c"		3, 4
+	"uart1_0"			"uart"		7, 8, 9, 10
+	"spi1_0"			"spi"		11, 12, 13, 14
+	"pwm1_1"			"pwm"		20,
+	"pwm0"				"pwm"		21,
+	"pwm1_0"			"pwm"		22,
+	"snfi"				"flash"		23, 24, 25, 26, 27, 28
+	"spi1_2"			"spi"		29, 30, 31, 32
+	"emmc_45"			"emmc"		22, 23, 24, 25, 26, 27,
+							28, 29, 30, 31, 32
+	"spi1_1"			"spi"		23, 24, 25, 26
+	"uart1_2"			"uart"		29, 30, 31, 32
+	"uart1_1"			"uart"		23, 24, 25, 26
+	"uart2_0"			"uart"		29, 30, 31, 32
+	"spi0"				"spi"		33, 34, 35, 36
+	"spi0_wp_hold"			"spi"		37, 38
+	"uart1_3_rx_tx"			"uart"		35, 36
+	"uart1_3_cts_rts"		"uart"		37, 38
+	"uart2_1"			"uart"		33, 34, 35, 36
+	"spi1_3"			"spi"		33, 34, 35, 36
+	"switch_int"			"eth"		66
+	"mdc_mdio"			"eth"		67
+
+
 Example:
 
 	pio: pinctrl@10211000 {
-- 
2.29.2

