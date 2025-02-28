Return-Path: <linux-gpio+bounces-16751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A622A48DCC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 02:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FAA23A8106
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 01:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B58126C02;
	Fri, 28 Feb 2025 01:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jFf2Q3Yv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32522097;
	Fri, 28 Feb 2025 01:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740705565; cv=none; b=aThPkai9VjUzp9lHpAcy3Cy7IH/+eNfTg17dcnAkYJgUj4X0YuFv7/cJV8dimsUD0+XSAhLw0Y4Bc7Q6BQWub9DTPGlXLFiS4x/dkrtQs+gLTt0a2U9sFNV7R7dxDxee2hCnKxirbv8i9L+HgdqWt36gl1HCVQVwzRN9gxcYw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740705565; c=relaxed/simple;
	bh=dGsuXZzsxJD6kdAmlgy8Lt3TXeza7VXIT5UjU5l6Ou4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XVFs8QMRIXeMndEon9r73v80RuW/zsW420DZLsREnXK/jcDqKgpvpgvbg40OHgXZuS5frq3OdABXR9jB6TU4VZ8nuPEHmzGBP40NPEm3muCrGlKR25/bTq4GxdxguXeAy51CWJKC/9B6uvfWcY3EKDcBt4icluI9EB4DDXzNMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jFf2Q3Yv; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 01439e6ef57211efaae1fd9735fae912-20250228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TqwDG9UH3rob70SESaiLXw5aIga92vca0kZfxMsPGkM=;
	b=jFf2Q3YvqIj/pdnKeV0jSihV0CyNb59QbfVYgoVglGMwVNvNTLXtpkLcF3K7ShxsSstMLqR+yr876kLf0H7gRjtkAQoWiU1e4LpqXoF3anJiWr8Myz3r+eu7Wz5iCMmxMC+row8ykH3P72Hr+t6zmcl0XI2ff9Z4z7A7F0SpwDE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:26561d89-1c70-42b6-8724-999ab90464e9,IP:0,U
	RL:25,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:d4e7abb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 01439e6ef57211efaae1fd9735fae912-20250228
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 605364764; Fri, 28 Feb 2025 09:19:06 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 09:19:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 09:19:04 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>, Axe
 Yang <axe.yang@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>, Lei Xue
	<lei.xue@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for mt8196
Date: Fri, 28 Feb 2025 09:16:25 +0800
Message-ID: <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the new binding document for pinctrl on MediaTek mt8196.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
---
 .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 241 ++++++++++++++++++
 1 file changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
new file mode 100644
index 000000000000..3100455c3c9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
@@ -0,0 +1,241 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8196-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 Pin Controller
+
+maintainers:
+  - Lei Xue <lei.xue@mediatek.com>
+  - Cathy Xu <ot_cathy.xu@mediatek.com>
+
+description:
+  The MediaTek's MT8196 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier, should be two. The first cell is the
+      pin number, the second cell is used to specify optional parameters which
+      are defined in <dt-bindings/gpio/gpio.h>.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names: true
+
+  reg:
+    items:
+      - description: gpio registers base address
+      - description: rt group io configuration registers base address
+      - description: rm1 group io configuration registers base address
+      - description: rm2 group io configuration registers base address
+      - description: rb group io configuration registers base address
+      - description: bm1 group io configuration registers base address
+      - description: bm2 group io configuration registers base address
+      - description: bm3 group io configuration registers base address
+      - description: lt group io configuration registers base address
+      - description: lm1 group io configuration registers base address
+      - description: lm2 group io configuration registers base address
+      - description: lb1 group io configuration registers base address
+      - description: lb2 group io configuration registers base address
+      - description: tm1 group io configuration registers base address
+      - description: tm2 group io configuration registers base address
+      - description: tm3 group io configuration registers base address
+
+  reg-names:
+    items:
+      - const: iocfg0
+      - const: iocfg_rt
+      - const: iocfg_rm1
+      - const: iocfg_rm2
+      - const: iocfg_rb
+      - const: iocfg_bm1
+      - const: iocfg_bm2
+      - const: iocfg_bm3
+      - const: iocfg_lt
+      - const: iocfg_lm1
+      - const: iocfg_lm2
+      - const: iocfg_lb1
+      - const: iocfg_lb2
+      - const: iocfg_tm1
+      - const: iocfg_tm2
+      - const: iocfg_tm3
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    description: The interrupt outputs to sysirq.
+    maxItems: 1
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+        description:
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
+              directly, for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8196 pull down PUPD/R0/R1 type define value.
+              - enum: [75000, 5000]
+                description: mt8196 pull down RSEL type si unit value(ohm).
+            description: |
+              For pull down type is normal, it doesn't need add R1R0 define
+              and resistance value.
+              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8196.
+              For pull down type is PD/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit". It can support resistance
+              value(ohm) "75000" & "5000" in mt8196.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8196 pull up PUPD/R0/R1 type define value.
+              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 75000]
+                description: mt8196 pull up RSEL type si unit value(ohm).
+            description: |
+              For pull up type is normal, it don't need add R1R0 define
+              and resistance value.
+              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8196.
+              For pull up type is PU/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit". It can support resistance
+              value(ohm) "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
+              "75000" in mt8196.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "../../../../arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h"
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt8196-pinctrl";
+        reg = <0x1002d000 0x1000>,
+              <0x12000000 0x1000>,
+              <0x12020000 0x1000>,
+              <0x12040000 0x1000>,
+              <0x12060000 0x1000>,
+              <0x12820000 0x1000>,
+              <0x12840000 0x1000>,
+              <0x12860000 0x1000>,
+              <0x13000000 0x1000>,
+              <0x13020000 0x1000>,
+              <0x13040000 0x1000>,
+              <0x130f0000 0x1000>,
+              <0x13110000 0x1000>,
+              <0x13800000 0x1000>,
+              <0x13820000 0x1000>,
+              <0x13860000 0x1000>;
+        reg-names = "iocfg0", "iocfg_rt",
+                    "iocfg_rm1", "iocfg_rm2", "iocfg_rb",
+                    "iocfg_bm1", "iocfg_bm2", "iocfg_bm3",
+                    "iocfg_lt", "iocfg_lm1", "iocfg_lm2",
+                    "iocfg_lb1", "iocfg_lb2", "iocfg_tm1",
+                    "iocfg_tm2", "iocfg_tm3";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 271>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        pio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                output-low;
+            };
+        };
+
+        spi0-pins {
+            pins-spi {
+                pinmux = <PINMUX_GPIO110__FUNC_SPI1_CLK>,
+                         <PINMUX_GPIO111__FUNC_SPI1_CSB>,
+                         <PINMUX_GPIO112__FUNC_SPI1_MO>;
+                drive-strength = <6>;
+            };
+            pins-spi-mi {
+                pinmux = <PINMUX_GPIO113__FUNC_SPI1_MI>;
+                bias-pull-down;
+            };
+        };
+
+        i2c0-pins {
+            pins {
+                pinmux = <PINMUX_GPIO99__FUNC_SCL0>,
+                         <PINMUX_GPIO100__FUNC_SDA0>;
+                bias-disable;
+            };
+        };
+    };
-- 
2.45.2


