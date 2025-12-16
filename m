Return-Path: <linux-gpio+bounces-29620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B443CC3CF1
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 16:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C865430B43E2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 14:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A1A34FF70;
	Tue, 16 Dec 2025 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ULTOS+Rs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49239.qiye.163.com (mail-m49239.qiye.163.com [45.254.49.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5734EEFC;
	Tue, 16 Dec 2025 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896624; cv=none; b=u0dlb0LQ45yv1YVOV55WM3nmrWj8qi608E3iDBwl1Ij3raJVo7uD/C2vfT2+UfDVr9i4BIryNiGLwC4zkhNp21vRYwYjq3xufGVk5JodeN56A7yaAXF2zibsqZl+R2xbYGqcOwLfIlMS2tIyx0XRnmLTIpcMW7WOWGDl2J/WMQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896624; c=relaxed/simple;
	bh=bbU46KCi04GsaMDU6LJPZUfiVi/OpeLYaBWOL2lkWqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kCocFr0DN6TdGC3sMvAWsmY8/yunsbbw/b5t+qTqS/XddDC7MrqAaS7YWDiINhwNZp+jxtY/cEijSIuElIAfYwPs7HWVdaxFB51h7JDjznSGLANKRciPxDYyhradpbhDyVT7te4/cbCyopsnSIEN7gJfwddCPG/B81FFdb/efLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ULTOS+Rs; arc=none smtp.client-ip=45.254.49.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1fa0;
	Tue, 16 Dec 2025 19:21:01 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO controller binding
Date: Tue, 16 Dec 2025 19:20:52 +0800
Message-Id: <20251216112053.1927852-7-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e4691409d8kunm7ab62e1d2a7b3bf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkpLTlZKSkgfQklNTh1MSx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ULTOS+RsdtB/JaLyeX8BDv5ZWIBiA1Hp4yQl5a7ZSQaKB8imQVtmxx7Ry0jGp6rSXU8KOdBKCRGEXr5HOp2669uXa3czx0WTv1xiwls4l72xGef1mZBiY8QwKH+2X8o7E1gSba3dVWMjs26pWGI8yTQfDwcOJe6HtegA0IjIw78=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9YZsNhFzzR6dDdU0HTPthyvmRQ2DTHuowAWIUZgM/GY=;
	h=date:mime-version:subject:message-id:from;

1. Add header file with constants for RMIO function IDs for the Rockchip
RK3506 SoC.
2. Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
which is a sub-device of the main pinctrl on some Rockchip SoCs.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
 .../bindings/pinctrl/rockchip,rmio.yaml       | 106 +++++++++++++++++
 .../pinctrl/rockchip,rk3506-rmio.h            | 109 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 97960245676d..9a27eaf7942b 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -82,6 +82,15 @@ required:
   - rockchip,grf
 
 patternProperties:
+  "rmio[0-9]*$":
+    type: object
+
+    $ref: "/schemas/pinctrl/rockchip,rmio.yaml#"
+
+    description:
+      The RMIO (Rockchip Matrix I/O) controller node which functions as a
+      sub-device of the main pinctrl to handle flexible function routing.
+
   "gpio@[0-9a-f]+$":
     type: object
 
diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
new file mode 100644
index 000000000000..af0b34512fb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/rockchip,rmio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RMIO (Rockchip Matrix I/O) Controller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The RMIO controller provides a flexible routing matrix that allows mapping
+  various internal peripheral functions (UART, SPI, PWM, etc.) to specific
+  physical pins. This block is typically a sub-block of the GRF
+  (General Register Files) or PMU (Power Management Unit).
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rockchip,rk3506-rmio
+      - const: rockchip,rmio
+
+  rockchip,rmio-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node (GRF or PMU) containing the RMIO registers.
+      This property is required if the RMIO registers are located in a different
+      syscon than the parent pinctrl node.
+
+  rockchip,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The offset of the RMIO configuration registers within the GRF.
+
+  rockchip,pins-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The number of physical pins supported by this RMIO instance.
+      Used for boundary checking and driver initialization.
+
+patternProperties:
+  "^[a-z0-9-]+$":
+    type: object
+    description:
+      Function node grouping multiple groups.
+
+    patternProperties:
+      "^[a-z0-9-]+$":
+        type: object
+        description:
+          Group node containing the pinmux configuration.
+
+        properties:
+          rockchip,rmio:
+            $ref: /schemas/types.yaml#/definitions/uint32-matrix
+            description:
+              A list of pin-function pairs. The format is <pin_id function_id>.
+            minItems: 1
+            items:
+              items:
+                - description: RMIO Pin ID (0 to pins-num - 1)
+                  minimum: 0
+                  maximum: 31
+                - description: Function ID
+                  minimum: 0
+                  maximum: 98
+
+        required:
+          - rockchip,rmio
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - rockchip,rmio-grf
+  - rockchip,offset
+  - rockchip,pins-num
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/rockchip,rk3506-rmio.h>
+
+    pinctrl: pinctrl {
+        rmio: rmio {
+            compatible = "rockchip,rk3506-rmio", "rockchip,rmio";
+            rockchip,rmio-grf = <&grf_pmu>;
+            rockchip,offset = <0x80>;
+            rockchip,pins-num = <32>;
+
+            rmio-uart {
+                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
+                    rockchip,rmio = <27 RMIO_UART1_TX>;
+                };
+
+                rmio_pin28_uart1_rx: rmio-pin28-uart1-rx {
+                    rockchip,rmio = <28 RMIO_UART1_RX>;
+                };
+            };
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
new file mode 100644
index 000000000000..b129e9a8c287
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
+
+/* RMIO function definition */
+#define RMIO_UART1_TX			1
+#define RMIO_UART1_RX			2
+#define RMIO_UART2_TX			3
+#define RMIO_UART2_RX			4
+#define RMIO_UART3_TX			5
+#define RMIO_UART3_RX			6
+#define RMIO_UART3_CTSN			7
+#define RMIO_UART3_RTSN			8
+#define RMIO_UART4_TX			9
+#define RMIO_UART4_RX			10
+#define RMIO_UART4_CTSN			11
+#define RMIO_UART4_RTSN			12
+#define RMIO_MIPITE			13
+#define RMIO_CLK_32K			14
+#define RMIO_I2C0_SCL			15
+#define RMIO_I2C0_SDA			16
+#define RMIO_I2C1_SCL			17
+#define RMIO_I2C1_SDA			18
+#define RMIO_I2C2_SCL			19
+#define RMIO_I2C2_SDA			20
+#define RMIO_PDM_CLK0			21
+#define RMIO_PDM_SDI0			22
+#define RMIO_PDM_SDI1			23
+#define RMIO_PDM_SDI2			24
+#define RMIO_PDM_SDI3			25
+#define RMIO_CAN1_TX			26
+#define RMIO_CAN1_RX			27
+#define RMIO_CAN0_TX			28
+#define RMIO_CAN0_RX			29
+#define RMIO_PWM0_CH0			30
+#define RMIO_PWM0_CH1			31
+#define RMIO_PWM0_CH2			32
+#define RMIO_PWM0_CH3			33
+#define RMIO_PWM1_CH0			34
+#define RMIO_PWM1_CH1			35
+#define RMIO_PWM1_CH2			36
+#define RMIO_PWM1_CH3			37
+#define RMIO_PWM1_CH4			38
+#define RMIO_PWM1_CH5			39
+#define RMIO_PWM1_CH6			40
+#define RMIO_PWM1_CH7			41
+#define RMIO_TOUCH_KEY_DRIVE		42
+#define RMIO_TOUCH_KEY_IN0		43
+#define RMIO_TOUCH_KEY_IN1		44
+#define RMIO_TOUCH_KEY_IN2		45
+#define RMIO_TOUCH_KEY_IN3		46
+#define RMIO_TOUCH_KEY_IN4		47
+#define RMIO_TOUCH_KEY_IN5		48
+#define RMIO_TOUCH_KEY_IN6		49
+#define RMIO_TOUCH_KEY_IN7		50
+#define RMIO_SAI0_MCLK			51
+#define RMIO_SAI0_SCLK			52
+#define RMIO_SAI0_LRCK			53
+#define RMIO_SAI0_SDI0			54
+#define RMIO_SAI0_SDI1			55
+#define RMIO_SAI0_SDI2			56
+#define RMIO_SAI0_SDI3			57
+#define RMIO_SAI0_SDO			58
+#define RMIO_SAI1_MCLK			59
+#define RMIO_SAI1_SCLK			60
+#define RMIO_SAI1_LRCK			61
+#define RMIO_SAI1_SDI			62
+#define RMIO_SAI1_SDO0			63
+#define RMIO_SAI1_SDO1			64
+#define RMIO_SAI1_SDO2			65
+#define RMIO_SAI1_SDO3			66
+#define RMIO_SPI0_CLK			67
+#define RMIO_SPI0_MOSI			68
+#define RMIO_SPI0_MISO			69
+#define RMIO_SPI0_CSN0			70
+#define RMIO_SPI0_CSN1			71
+#define RMIO_SPI1_CLK			72
+#define RMIO_SPI1_MOSI			73
+#define RMIO_SPI1_MISO			74
+#define RMIO_SPI1_CSN0			75
+#define RMIO_SPI1_CSN1			76
+#define RMIO_WDT_TSADC_SHUT		77
+#define RMIO_PMU_SLEEP			78
+#define RMIO_CORE_POWER_OFF		79
+#define RMIO_SPDIF_TX			80
+#define RMIO_SPDIF_RX			81
+#define RMIO_PWM1_BIP_CNTR_A0		82
+#define RMIO_PWM1_BIP_CNTR_A1		83
+#define RMIO_PWM1_BIP_CNTR_A2		84
+#define RMIO_PWM1_BIP_CNTR_A3		85
+#define RMIO_PWM1_BIP_CNTR_A4		86
+#define RMIO_PWM1_BIP_CNTR_A5		87
+#define RMIO_PWM1_BIP_CNTR_B0		88
+#define RMIO_PWM1_BIP_CNTR_B1		89
+#define RMIO_PWM1_BIP_CNTR_B2		90
+#define RMIO_PWM1_BIP_CNTR_B3		91
+#define RMIO_PWM1_BIP_CNTR_B4		92
+#define RMIO_PWM1_BIP_CNTR_B5		93
+#define RMIO_PDM_CLK1			94
+#define RMIO_ETH_RMII0_PPSCLK		95
+#define RMIO_ETH_RMII0_PPSTRIG		96
+#define RMIO_ETH_RMII1_PPSCLK		97
+#define RMIO_ETH_RMII1_PPSTRIG		98
+
+#endif /* __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H */
-- 
2.34.1


