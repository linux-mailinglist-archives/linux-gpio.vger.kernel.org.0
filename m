Return-Path: <linux-gpio+bounces-11902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B69ADC75
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA0171F22103
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAD7189F55;
	Thu, 24 Oct 2024 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyTHxk5Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A3189B8C;
	Thu, 24 Oct 2024 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752264; cv=none; b=KgfRE+mlhDx5tNJ6j6Bck9Q2Yh2gTacbzus7WnZ3mbLh2qFEcsHvxwQMUo+r5rxMqHkULF+DT4DS4peFGZtbMJE8PaeEZ0ehBCRwdjzxtD/n0KNl7dtcdRztyk2WuJ2v7IF4SWlT9r/eF7+GtU4uz4BrKV8fhvAWri9d6OyHEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752264; c=relaxed/simple;
	bh=erRqhP/GIcwDwGBF2BiTS8UnQh/X5gz/AydmJZiTqqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChR2piKGA+1DRNW32uRZXF3Ui0mRQGjnV133mlYCTo0xCwfh6+DlJtUnscAhxuhCCVLq6mZtERoiqpFS0PAxhq/YwhK1A97/dECWv4fm4M5shWJhj27z6fSprToASbIqkDMKBg5hFDL4k7byBxLKkQeDfCsQQ4fuZj0JPsQ9dx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyTHxk5Q; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e18293a5efso427723a91.3;
        Wed, 23 Oct 2024 23:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729752261; x=1730357061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaogxiHUoCYyHxAdte/yNMniP8G2o14XXGmFLTDHNXU=;
        b=EyTHxk5Qpbs4YhdqdNzV8ETyR71IxanH++ovI1h3GAtdFSXpS/BL2kJhReFwkqrb5c
         /AjrDqTW/eZ5hrd+h0Y8V77siQYrA9Iqx9mc0E1WpyWbsxWhu/QHONzUurxdpOVFuuse
         v285LlorQj6ImUy9zwRASrR68Qvd28xNRkFsV9sd3529BCh+JKmgoFTecYsmbnAlOyjn
         SZZ+EtvyPotVrkKTZa/H/vFTIf53SOzCYiXoAyHUwnmjLxryQKvmp/YxQThQxfCvNCnV
         lpG4GnOyHkURX+H4baigTp2BWKCeppx7XWdoCXcZdQQZ6jHO9kFR5ienjiDifMLF3MBh
         1m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752261; x=1730357061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaogxiHUoCYyHxAdte/yNMniP8G2o14XXGmFLTDHNXU=;
        b=BrUQ59X7mSbTGLoj+P8jDRjP/G3N4b3fAIkNYp5zLrgxb8vGYS/qgFtoTuv9fdSB3k
         6u5lRK9npYxY7TmU4c+jTtbfog41lCxytVarggTdZscjWfkSypYJWM+ePgywG8JRsvk0
         56sVbF2SvJ/cyBPSuRR7R2WZcZpqRljZw0tXo/b/4Be+BuppayNb9KCMeJAQlDe3MmTw
         5/d001dSY+OMBL2ea6wcsMt7Oa8WMqR4wj+TKCDHGX0WjkFVS0gPpxCpk9DowF95rnFc
         i8di82qhBLKCdSAOoDIPCxpUDuwSsBKwNd5x9/MhkPTxhi3FpNMDvQrJBvONab2e1TUS
         edmw==
X-Forwarded-Encrypted: i=1; AJvYcCU2B7AIC8cVBGuoMbELlTbaGJkhk/5paKkWqllCHJzjh6iFcBOAWtRcob4Qxnr7FfpdoiPZkSuMw3dNLQ==@vger.kernel.org, AJvYcCWTN1xSE6wmM7G9ReXTEwOP5OtGBSZsukA4Emw8SpSywT8CBusgIiHiut2s+yB19Y8hmKAVOwnsycyt@vger.kernel.org, AJvYcCXqDbUJHoxG43VEBop2LexCiLEI7IImH4wRIk7ZtmmA9bt7FGFAIo+JSjRBkTc2n+fhMuJbPv/9Ez34/Q6v@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuiwi08Zm33WSgmvax1Jhy8eEzx+OMco/i36AI0gK+PF5YCiOi
	HvqVdCFMugVUTLe3cP239gplRG7NH65Z6yxIhXkXjzd8CiJ6HPle
X-Google-Smtp-Source: AGHT+IFO3UiABhI+bPJ0y2wgQJOiCFf/0oQbrvXjoKa6w6HlFw6fHRVp+DnR2U0pG+alS4yvg04Xdw==
X-Received: by 2002:a17:90b:3007:b0:2e0:a926:19b1 with SMTP id 98e67ed59e1d1-2e77f74ef8fmr957730a91.38.1729752260937;
        Wed, 23 Oct 2024 23:44:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76df29f23sm2654774a91.3.2024.10.23.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:44:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
Date: Thu, 24 Oct 2024 14:43:54 +0800
Message-ID: <20241024064356.865055-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024064356.865055-1-inochiama@gmail.com>
References: <20241024064356.865055-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SG2042 introduces a simple pinctrl device for all configurable pins.
The pinconf and pinmux are mixed in a 16 bits register for each pin.
It supports setting pull up/down, drive strength and input schmitt
trigger.

Add support for SG2042 pinctrl device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../pinctrl/sophgo,sg2042-pinctrl.yaml        |  96 +++++++++
 include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++++++++++++++
 2 files changed, 292 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
new file mode 100644
index 000000000000..5060deacd580
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/sophgo,sg2042-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Pin Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2042-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-cfg$':
+    type: object
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias input
+          enable/disable, input schmitt trigger enable, drive strength
+          output enable/disable state. For configuration detail,
+          refer to https://github.com/sophgo/sophgo-doc/.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the GPIOMUX
+              macro.
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength-microamp:
+            description: typical current when output high level.
+            enum: [ 4300, 6400, 8500, 10600, 12800, 14900, 17000, 19100,
+                    21200, 23300, 25500, 27600, 29700, 31800, 33900, 36000]
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-sg2042.h>
+
+    pinctrl@30011000 {
+        compatible = "sophgo,sg2042-pinctrl";
+        reg = <30011000 0x1000>;
+
+        uart0_cfg: uart0-cfg {
+            uart0-pins {
+                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+                         <PINMUX(PIN_UART0_RX, 0)>;
+                bias-pull-up;
+                drive-strength-microamp = <10600>;
+            };
+        };
+    };
+
+...
diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2042.h b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
new file mode 100644
index 000000000000..79d5bb8e04f8
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SG2042_H
+#define _DT_BINDINGS_PINCTRL_SG2042_H
+
+#define PINMUX(pin, mux) \
+	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
+
+#define PIN_LPC_LCLK			0
+#define PIN_LPC_LFRAME			1
+#define PIN_LPC_LAD0			2
+#define PIN_LPC_LAD1			3
+#define PIN_LPC_LAD2			4
+#define PIN_LPC_LAD3			5
+#define PIN_LPC_LDRQ0			6
+#define PIN_LPC_LDRQ1			7
+#define PIN_LPC_SERIRQ			8
+#define PIN_LPC_CLKRUN			9
+#define PIN_LPC_LPME			10
+#define PIN_LPC_LPCPD			11
+#define PIN_LPC_LSMI			12
+#define PIN_PCIE0_L0_RESET		13
+#define PIN_PCIE0_L1_RESET		14
+#define PIN_PCIE0_L0_WAKEUP		15
+#define PIN_PCIE0_L1_WAKEUP		16
+#define PIN_PCIE0_L0_CLKREQ_IN		17
+#define PIN_PCIE0_L1_CLKREQ_IN		18
+#define PIN_PCIE1_L0_RESET		19
+#define PIN_PCIE1_L1_RESET		20
+#define PIN_PCIE1_L0_WAKEUP		21
+#define PIN_PCIE1_L1_WAKEUP		22
+#define PIN_PCIE1_L0_CLKREQ_IN		23
+#define PIN_PCIE1_L1_CLKREQ_IN		24
+#define PIN_SPIF0_CLK_SEL1		25
+#define PIN_SPIF0_CLK_SEL0		26
+#define PIN_SPIF0_WP			27
+#define PIN_SPIF0_HOLD			28
+#define PIN_SPIF0_SDI			29
+#define PIN_SPIF0_CS			30
+#define PIN_SPIF0_SCK			31
+#define PIN_SPIF0_SDO			32
+#define PIN_SPIF1_CLK_SEL1		33
+#define PIN_SPIF1_CLK_SEL0		34
+#define PIN_SPIF1_WP			35
+#define PIN_SPIF1_HOLD			36
+#define PIN_SPIF1_SDI			37
+#define PIN_SPIF1_CS			38
+#define PIN_SPIF1_SCK			39
+#define PIN_SPIF1_SDO			40
+#define PIN_EMMC_WP			41
+#define PIN_EMMC_CD			42
+#define PIN_EMMC_RST			43
+#define PIN_EMMC_PWR_EN			44
+#define PIN_SDIO_CD			45
+#define PIN_SDIO_WP			46
+#define PIN_SDIO_RST			47
+#define PIN_SDIO_PWR_EN			48
+#define PIN_RGMII0_TXD0			49
+#define PIN_RGMII0_TXD1			50
+#define PIN_RGMII0_TXD2			51
+#define PIN_RGMII0_TXD3			52
+#define PIN_RGMII0_TXCTRL		53
+#define PIN_RGMII0_RXD0			54
+#define PIN_RGMII0_RXD1			55
+#define PIN_RGMII0_RXD2			56
+#define PIN_RGMII0_RXD3			57
+#define PIN_RGMII0_RXCTRL		58
+#define PIN_RGMII0_TXC			59
+#define PIN_RGMII0_RXC			60
+#define PIN_RGMII0_REFCLKO		61
+#define PIN_RGMII0_IRQ			62
+#define PIN_RGMII0_MDC			63
+#define PIN_RGMII0_MDIO			64
+#define PIN_PWM0			65
+#define PIN_PWM1			66
+#define PIN_PWM2			67
+#define PIN_PWM3			68
+#define PIN_FAN0			69
+#define PIN_FAN1			70
+#define PIN_FAN2			71
+#define PIN_FAN3			72
+#define PIN_IIC0_SDA			73
+#define PIN_IIC0_SCL			74
+#define PIN_IIC1_SDA			75
+#define PIN_IIC1_SCL			76
+#define PIN_IIC2_SDA			77
+#define PIN_IIC2_SCL			78
+#define PIN_IIC3_SDA			79
+#define PIN_IIC3_SCL			80
+#define PIN_UART0_TX			81
+#define PIN_UART0_RX			82
+#define PIN_UART0_RTS			83
+#define PIN_UART0_CTS			84
+#define PIN_UART1_TX			85
+#define PIN_UART1_RX			86
+#define PIN_UART1_RTS			87
+#define PIN_UART1_CTS			88
+#define PIN_UART2_TX			89
+#define PIN_UART2_RX			90
+#define PIN_UART2_RTS			91
+#define PIN_UART2_CTS			92
+#define PIN_UART3_TX			93
+#define PIN_UART3_RX			94
+#define PIN_UART3_RTS			95
+#define PIN_UART3_CTS			96
+#define PIN_SPI0_CS0			97
+#define PIN_SPI0_CS1			98
+#define PIN_SPI0_SDI			99
+#define PIN_SPI0_SDO			100
+#define PIN_SPI0_SCK			101
+#define PIN_SPI1_CS0			102
+#define PIN_SPI1_CS1			103
+#define PIN_SPI1_SDI			104
+#define PIN_SPI1_SDO			105
+#define PIN_SPI1_SCK			106
+#define PIN_JTAG0_TDO			107
+#define PIN_JTAG0_TCK			108
+#define PIN_JTAG0_TDI			109
+#define PIN_JTAG0_TMS			110
+#define PIN_JTAG0_TRST			111
+#define PIN_JTAG0_SRST			112
+#define PIN_JTAG1_TDO			113
+#define PIN_JTAG1_TCK			114
+#define PIN_JTAG1_TDI			115
+#define PIN_JTAG1_TMS			116
+#define PIN_JTAG1_TRST			117
+#define PIN_JTAG1_SRST			118
+#define PIN_JTAG2_TDO			119
+#define PIN_JTAG2_TCK			120
+#define PIN_JTAG2_TDI			121
+#define PIN_JTAG2_TMS			122
+#define PIN_JTAG2_TRST			123
+#define PIN_JTAG2_SRST			124
+#define PIN_GPIO0			125
+#define PIN_GPIO1			126
+#define PIN_GPIO2			127
+#define PIN_GPIO3			128
+#define PIN_GPIO4			129
+#define PIN_GPIO5			130
+#define PIN_GPIO6			131
+#define PIN_GPIO7			132
+#define PIN_GPIO8			133
+#define PIN_GPIO9			134
+#define PIN_GPIO10			135
+#define PIN_GPIO11			136
+#define PIN_GPIO12			137
+#define PIN_GPIO13			138
+#define PIN_GPIO14			139
+#define PIN_GPIO15			140
+#define PIN_GPIO16			141
+#define PIN_GPIO17			142
+#define PIN_GPIO18			143
+#define PIN_GPIO19			144
+#define PIN_GPIO20			145
+#define PIN_GPIO21			146
+#define PIN_GPIO22			147
+#define PIN_GPIO23			148
+#define PIN_GPIO24			149
+#define PIN_GPIO25			150
+#define PIN_GPIO26			151
+#define PIN_GPIO27			152
+#define PIN_GPIO28			153
+#define PIN_GPIO29			154
+#define PIN_GPIO30			155
+#define PIN_GPIO31			156
+#define PIN_MODE_SEL0			157
+#define PIN_MODE_SEL1			158
+#define PIN_MODE_SEL2			159
+#define PIN_BOOT_SEL0			160
+#define PIN_BOOT_SEL1			161
+#define PIN_BOOT_SEL2			162
+#define PIN_BOOT_SEL3			163
+#define PIN_BOOT_SEL4			164
+#define PIN_BOOT_SEL5			165
+#define PIN_BOOT_SEL6			166
+#define PIN_BOOT_SEL7			167
+#define PIN_MULTI_SCKT			168
+#define PIN_SCKT_ID0			169
+#define PIN_SCKT_ID1			170
+#define PIN_PLL_CLK_IN_MAIN		171
+#define PIN_PLL_CLK_IN_DDR_L		172
+#define PIN_PLL_CLK_IN_DDR_R		173
+#define PIN_XTAL_32K			174
+#define PIN_SYS_RST			175
+#define PIN_PWR_BUTTON			176
+#define PIN_TEST_EN			177
+#define PIN_TEST_MODE_MBIST		178
+#define PIN_TEST_MODE_SCAN		179
+#define PIN_TEST_MODE_BSD		180
+#define PIN_BISR_BYP			181
+
+#endif /* _DT_BINDINGS_PINCTRL_SG2042_H */
-- 
2.47.0


