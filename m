Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C7B40A9D6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 10:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbhINIyZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 04:54:25 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51454 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231373AbhINIyJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 04:54:09 -0400
X-UUID: 3d3f165535184697a29a56baab31ac5e-20210914
X-UUID: 3d3f165535184697a29a56baab31ac5e-20210914
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1511170435; Tue, 14 Sep 2021 16:52:48 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 16:52:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 14 Sep
 2021 16:52:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 16:52:46 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
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
        "Sam Shih" <sam.shih@mediatek.com>
Subject: [v3,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date:   Tue, 14 Sep 2021 16:51:33 +0800
Message-ID: <20210914085137.31761-6-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210914085137.31761-1-sam.shih@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This updates bindings for MT7986 pinctrl driver. The
difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
do not exist on mt7986b

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v3 : make mt7986 pinctrl bindings as a separate file
v2 : deleted the redundant description of mt7986a/mt7986b
---
 .../pinctrl/mediatek,mt7986-pinctrl.txt       | 300 ++++++++++++++++++
 1 file changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt
new file mode 100644
index 000000000000..5805e53d5924
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt
@@ -0,0 +1,300 @@
+* Mediatek MT7986 Pin Controller
+
+The Mediatek's Pin controller is used to control SoC pins.
+
+Required properties for the root node:
+ - compatible: Should be one of the following
+	       "mediatek,mt7986a-pinctrl" for MT7986a SoC
+	       "mediatek,mt7986b-pinctrl" for MT7986b SoC
+ - gpio-controller: Marks the device node as a GPIO controller.
+ - #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
+   binding is used, the amount of cells must be specified as 2. See the below
+   mentioned gpio binding representation for description of particular cells.
+ - gpio-ranges : gpio valid number range.
+ - reg: physical address base for gpio base registers. There are 8 GPIO
+   physical address base in mt8183.
+
+Optional properties:
+- reg-names: gpio base register names. There are 8 gpio base register
+  names in mt7986. They are "gpio_base", "iocfg_rt_base", "iocfg_rb_base",
+  "iocfg_lt_base", "iocfg_lb_base", "iocfg_tr_base", "iocfg_tl_base", "eint".
+- interrupt-controller: Marks the device node as an interrupt controller
+
+If the property interrupt-controller is defined, following property is required
+- interrupts : The interrupt outputs to gic.
+- #interrupt-cells: Should be two.
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices, including the meaning of the
+phrase "pin configuration node".
+
+MT7986 pin configuration nodes act as a container for an arbitrary number of
+subnodes. Each of these subnodes represents some desired configuration for a
+pin, a group, or a list of pins or groups. This configuration can include the
+mux function to select on those pin(s)/group(s), and various pin configuration
+parameters, such as pull-up, drive-strength, etc.
+
+We support 2 types of configuration nodes. Those nodes can be either pinmux
+nodes or pinconf nodes. Each configuration node can consist of multiple nodes
+describing the pinmux and pinconf options.
+
+The name of each subnode doesn't matter as long as it is unique; all subnodes
+should be enumerated and processed purely based on their content.
+
+== pinmux nodes content ==
+
+The following generic properties as defined in pinctrl-bindings.txt are valid
+to specify in a pinmux subnode:
+
+Required properties are:
+ - groups: An array of strings. Each string contains the name of a group.
+  Valid values for these names are listed below.
+ - function: A string containing the name of the function to mux to the
+  group. Valid values for function names are listed below.
+
+== pinconf nodes content ==
+
+The following generic properties as defined in pinctrl-bindings.txt are valid
+to specify in a pinconf subnode:
+
+Required properties are:
+ - pins: An array of strings. Each string contains the name of a pin.
+  Valid values for these names are listed below.
+ - groups: An array of strings. Each string contains the name of a group.
+  Valid values for these names are listed below.
+
+Optional properies are:
+ - GENERIC_PINCONFIG: is the generic pinconfig options to use, bias-disable,
+   bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
+   output-high, input-schmitt-enable, input-schmitt-disable
+   and drive-strength are valid.
+  Valid arguments for 'drive-strength': 2, 4, 6, 8, 10, 12, 14, 16 in mA.
+ - mediatek,pull-up-adv
+  Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
+  Pull up setings for 2 pull resistors, R0 and R1. User can
+  configure those special pins. Valid arguments are described as below:
+  0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+  1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+  2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+  3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+ - mediatek,pull-down-adv
+  Valid arguments for 'mediatek,pull-down-adv' are '0', '1', '2', '3'
+  Pull down settings for 2 pull resistors, R0 and R1. User can
+  configure those special pins. Valid arguments are described as below:
+  0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+  1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+  2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+  3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+ - mediatek,tdsel: An integer describing the steps for output level shifter duty
+   cycle when asserted (high pulse width adjustment). Valid arguments are from 0
+   to 15.
+ - mediatek,rdsel: An integer describing the steps for input level shifter duty
+   cycle when asserted (high pulse width adjustment). Valid arguments are from 0
+   to 63.
+
+== Valid values for pins, function and groups on MT7986a and MT7986b  ==
+
+Valid values for pins are:
+pins can be referenced via the pin names as the below table shown and the
+related physical number is also put ahead of those names which helps cross
+references to pins between groups to know whether pins assignment conflict
+happens among devices try to acquire those available pins.
+
+There is no PIN 41 to PIN 65 on mt7686b, you can only use those pins on mt7986a.
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
+There is no "audio", "pcie" functions on mt7986b, you can only use those
+functions on mt7986a.
+
+Valid values for groups are:
+additional data is put followingly with valid value allowing us to know which
+applicable function and which relevant pins (in pin#) are able applied for that
+group.
+
+There is no "pcie_pereset", "uart1", "uart2" "emmc_51", "pcm", and "i2s" groups
+on mt7986b, you can only use those groups on mt7986a.
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
+Example:
+
+{
+	pio: pinctrl@1001f000 {
+		compatible = "mediatek,mt7986a-pinctrl";
+		reg = <0 0x1001f000 0 0x1000>,
+		      <0 0x11c30000 0 0x1000>,
+		      <0 0x11c40000 0 0x1000>,
+		      <0 0x11e20000 0 0x1000>,
+		      <0 0x11e30000 0 0x1000>,
+		      <0 0x11f00000 0 0x1000>,
+		      <0 0x11f10000 0 0x1000>,
+		      <0 0x1000b000 0 0x1000>;
+		reg-names = "gpio_base", "iocfg_rt_base", "iocfg_rb_base",
+			    "iocfg_lt_base", "iocfg_lb_base", "iocfg_tr_base",
+			    "iocfg_tl_base", "eint";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pio 0 0 100>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <2>;
+
+		uart1_pins: uart1-pins-42-to-45 {
+			mux {
+				function = "uart";
+				groups = "uart1";
+			};
+		};
+
+		uart2_pins: uart1-pins-46-to-49 {
+			mux {
+				function = "uart";
+				groups = "uart2";
+			};
+		};
+		...
+	};
+}
-- 
2.29.2

