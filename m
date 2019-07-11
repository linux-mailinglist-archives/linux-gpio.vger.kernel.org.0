Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 713DE650D4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 06:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbfGKET7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 00:19:59 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:57417 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726119AbfGKET6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 00:19:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 918242EE3;
        Thu, 11 Jul 2019 00:19:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 11 Jul 2019 00:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=GOsamnhL9NfGE
        lhnvB1DWrI70yYLMfud0MVd7AWlK6A=; b=YrgvIb6H0Pd30dHQULH+rsjZo3Pu1
        82zH4Vq7yXoQfhsATJsCeaEGBnc5lHhuUz7ju3SSNfogej+asLYun6Bs5TccEGjm
        5GY3A6j50zvfQNaSkdHIeM0LTmX1Yu4ShMYbG7s4eUtgPwKAqDT5Ye8M5rfq6uXr
        0a/yMBMyEeSN3ktkmTzXk6uo1mVgj3GUgK5TXH6kwF7SKWEoDYNbEBvjIp30RSRZ
        KX2Pckbce7Gy+Hw3eb5vEwb0BBCfI4McR9q+tSc/NiHiC11wo9rhm0vPItSFozd1
        PyxtEPcg3Eu1GThDcyn4oUC6RlS5pnCoPBrH+ttetbuqhkngQ1O3+IzUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=GOsamnhL9NfGElhnvB1DWrI70yYLMfud0MVd7AWlK6A=; b=vDfBfisP
        tshSqMwt2Ei29GFkd+yGdF5MvXmb1+Vsn24SocEuw6zxJ6vOdJxHtbQBURJ5wjmg
        AP4FvkicAuj73phowvCRSQ5Pu2PjGsy6ccV71+MYUHifA9El+P+MdulyGr0kgQ2j
        YvhYGO8u1vfmyKmEVnY300zsgtW43UI/piVUb6RxRS2HAlZAxkzFbO6zOCA0W24Q
        3eFQUHezCQWtfggbfb0Qk4KgYj8/aU7IthGGdP07GDXZ9uuvg1RWweovyq9ax5d6
        yF5a/hGWiKUpqvIEUJ4rnTmNb7XTIGxrihDErcYXSxo1i+7+J7yPfOkwNJ0Lx1jf
        SytviL0r7eY2Yg==
X-ME-Sender: <xms:7LgmXaKxVF2vgaIScJe4ZQsvMdrdMMVXetob53iubmAvjEWC6f1o0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeejgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppe
    dvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
    segrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:7LgmXWYjJLMsRAYdypD7Z6KHGC2XuvkNGFoGvJY0XPwgGyDpOi0Hyw>
    <xmx:7LgmXVuj45XZnatyMy6kWf1WPLK_Bm8ZHwQTKnfzvGqvxWBXSVLDAg>
    <xmx:7LgmXTtZk-cb45j4w-PrYp6cft2nFXR25Tha5Ej3atC-qS7ezkHUPA>
    <xmx:7LgmXbavrKSaOlKClt2TDlnTeuSSg0T76aFaM4LrBW5ttEaneb7t2w>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BA2A8005B;
        Thu, 11 Jul 2019 00:19:52 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
Date:   Thu, 11 Jul 2019 13:49:37 +0930
Message-Id: <20190711041942.23202-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711041942.23202-1-andrew@aj.id.au>
References: <20190711041942.23202-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The AST260 differs from the 2400 and 2500 in that it supports multiple
groups for a subset of functions.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
new file mode 100644
index 000000000000..dd31f8e62433
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: GPL-2.0+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 Pin Controller
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description: |+
+  The pin controller node should be the child of a syscon node with the
+  required property:
+
+  - compatible: Should be one of the following:
+                "aspeed,ast2600-scu", "syscon", "simple-mfd"
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.txt
+
+properties:
+  compatible:
+    const: aspeed,ast2600-pinctrl
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+    then:
+      patternProperties:
+        "^function$":
+          allOf:
+            - $ref: "/schemas/types.yaml#/definitions/string"
+            - enum: [ "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
+              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
+              "ADC8", "ADC9", "BMCINT", "ESPI", "ESPIALT", "FSI1", "FSI2",
+              "FWSPIABR", "FWSPID", "FWSPIWP", "GPIT0", "GPIT1", "GPIT2",
+              "GPIT3", "GPIT4", "GPIT5", "GPIT6", "GPIT7", "GPIU0", "GPIU1",
+              "GPIU2", "GPIU3", "GPIU4", "GPIU5", "GPIU6", "GPIU7", "I2C1",
+              "I2C10", "I2C11", "I2C12", "I2C13", "I2C14", "I2C15", "I2C16",
+              "I2C2", "I2C3", "I2C4", "I2C5", "I2C6", "I2C7", "I2C8", "I2C9",
+              "I3C3", "I3C4", "I3C5", "I3C6", "JTAGM", "LHPD", "LHSIRQ", "LPC",
+              "LPCHC", "LPCPD", "LPCPME", "LPCSMI", "LSIRQ", "MACLINK1",
+              "MACLINK2", "MACLINK3", "MACLINK4", "MDIO1", "MDIO2", "MDIO3",
+              "MDIO4", "NCTS1", "NCTS2", "NCTS3", "NCTS4", "NDCD1", "NDCD2",
+              "NDCD3", "NDCD4", "NDSR1", "NDSR2", "NDSR3", "NDSR4", "NDTR1",
+              "NDTR2", "NDTR3", "NDTR4", "NRI1", "NRI2", "NRI3", "NRI4",
+              "NRTS1", "NRTS2", "NRTS3", "NRTS4", "OSCCLK", "PEWAKE", "PWM0",
+              "PWM1", "PWM10", "PWM11", "PWM12", "PWM13", "PWM14", "PWM15",
+              "PWM2", "PWM3", "PWM4", "PWM5", "PWM6", "PWM7", "PWM8", "PWM9",
+              "RGMII1", "RGMII2", "RGMII3", "RGMII4", "RMII1", "RMII2",
+              "RMII3", "RMII4", "RXD1", "RXD2", "RXD3", "RXD4", "SALT1",
+              "SALT10", "SALT11", "SALT12", "SALT13", "SALT14", "SALT15",
+              "SALT16", "SALT2", "SALT3", "SALT4", "SALT5", "SALT6", "SALT7",
+              "SALT8", "SALT9", "SD1", "SD2", "SD3", "SD3DAT4", "SD3DAT5",
+              "SD3DAT6", "SD3DAT7", "SGPM1", "SGPS1", "SIOONCTRL", "SIOPBI",
+              "SIOPBO", "SIOPWREQ", "SIOPWRGD", "SIOS3", "SIOS5", "SIOSCI",
+              "SPI1", "SPI1ABR", "SPI1CS1", "SPI1WP", "SPI2", "SPI2CS1",
+              "SPI2CS2", "TACH0", "TACH1", "TACH10", "TACH11", "TACH12",
+              "TACH13", "TACH14", "TACH15", "TACH2", "TACH3", "TACH4", "TACH5",
+              "TACH6", "TACH7", "TACH8", "TACH9", "THRU0", "THRU1", "THRU2",
+              "THRU3", "TXD1", "TXD2", "TXD3", "TXD4", "UART10", "UART11",
+              "UART12", "UART13", "UART6", "UART7", "UART8", "UART9", "VB",
+              "VGAHS", "VGAVS", "WDTRST1", "WDTRST2", "WDTRST3", "WDTRST4", ]
+        "^groups$":
+          allOf:
+            - $ref: "/schemas/types.yaml#/definitions/string"
+            - enum: [ "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
+              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
+              "ADC8", "ADC9", "BMCINT", "ESPI", "ESPIALT", "FSI1", "FSI2",
+              "FWSPIABR", "FWSPID", "FWQSPID", "FWSPIWP", "GPIT0", "GPIT1",
+              "GPIT2", "GPIT3", "GPIT4", "GPIT5", "GPIT6", "GPIT7", "GPIU0",
+              "GPIU1", "GPIU2", "GPIU3", "GPIU4", "GPIU5", "GPIU6", "GPIU7",
+              "HVI3C3", "HVI3C4", "I2C1", "I2C10", "I2C11", "I2C12", "I2C13",
+              "I2C14", "I2C15", "I2C16", "I2C2", "I2C3", "I2C4", "I2C5",
+              "I2C6", "I2C7", "I2C8", "I2C9", "I3C3", "I3C4", "I3C5", "I3C6",
+              "JTAGM", "LHPD", "LHSIRQ", "LPC", "LPCHC", "LPCPD", "LPCPME",
+              "LPCSMI", "LSIRQ", "MACLINK1", "MACLINK2", "MACLINK3",
+              "MACLINK4", "MDIO1", "MDIO2", "MDIO3", "MDIO4", "NCTS1", "NCTS2",
+              "NCTS3", "NCTS4", "NDCD1", "NDCD2", "NDCD3", "NDCD4", "NDSR1",
+              "NDSR2", "NDSR3", "NDSR4", "NDTR1", "NDTR2", "NDTR3", "NDTR4",
+              "NRI1", "NRI2", "NRI3", "NRI4", "NRTS1", "NRTS2", "NRTS3",
+              "NRTS4", "OSCCLK", "PEWAKE", "PWM0", "PWM1", "PWM10G0",
+              "PWM10G1", "PWM11G0", "PWM11G1", "PWM12G0", "PWM12G1", "PWM13G0",
+              "PWM13G1", "PWM14G0", "PWM14G1", "PWM15G0", "PWM15G1", "PWM2",
+              "PWM3", "PWM4", "PWM5", "PWM6", "PWM7", "PWM8G0", "PWM8G1",
+              "PWM9G0", "PWM9G1", "QSPI1", "QSPI2", "RGMII1", "RGMII2",
+              "RGMII3", "RGMII4", "RMII1", "RMII2", "RMII3", "RMII4", "RXD1",
+              "RXD2", "RXD3", "RXD4", "SALT1", "SALT10G0", "SALT10G1",
+              "SALT11G0", "SALT11G1", "SALT12G0", "SALT12G1", "SALT13G0",
+              "SALT13G1", "SALT14G0", "SALT14G1", "SALT15G0", "SALT15G1",
+              "SALT16G0", "SALT16G1", "SALT2", "SALT3", "SALT4", "SALT5",
+              "SALT6", "SALT7", "SALT8", "SALT9G0", "SALT9G1", "SD1", "SD2",
+              "SD3", "SD3DAT4", "SD3DAT5", "SD3DAT6", "SD3DAT7", "SGPM1",
+              "SGPS1", "SIOONCTRL", "SIOPBI", "SIOPBO", "SIOPWREQ", "SIOPWRGD",
+              "SIOS3", "SIOS5", "SIOSCI", "SPI1", "SPI1ABR", "SPI1CS1",
+              "SPI1WP", "SPI2", "SPI2CS1", "SPI2CS2", "TACH0", "TACH1",
+              "TACH10", "TACH11", "TACH12", "TACH13", "TACH14", "TACH15",
+              "TACH2", "TACH3", "TACH4", "TACH5", "TACH6", "TACH7", "TACH8",
+              "TACH9", "THRU0", "THRU1", "THRU2", "THRU3", "TXD1", "TXD2",
+              "TXD3", "TXD4", "UART10", "UART11", "UART12G0", "UART12G1",
+              "UART13G0", "UART13G1", "UART6", "UART7", "UART8", "UART9", "VB",
+              "VGAHS", "VGAVS", "WDTRST1", "WDTRST2", "WDTRST3", "WDTRST4", ]
+
+required:
+  - compatible
+
+examples:
+  - |
+    syscon: scu@1e6e2000 {
+        compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
+        reg = <0x1e6e2000 0xf6c>;
+
+        pinctrl: pinctrl {
+            compatible = "aspeed,g6-pinctrl";
+
+            pinctrl_pwm10g1_default: pwm10g1_default {
+                function = "PWM10";
+                groups = "PWM10G1";
+            };
+
+            pinctrl_gpioh0_unbiased_default: gpioh0 {
+                pins = "A18";
+                bias-disable;
+            };
+        };
+    };
-- 
2.20.1

