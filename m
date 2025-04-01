Return-Path: <linux-gpio+bounces-18134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC862A7741B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 07:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E783AD145
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 05:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BF435966;
	Tue,  1 Apr 2025 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L1V0QSBT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E515C1DE4D8;
	Tue,  1 Apr 2025 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743486549; cv=none; b=HX9X4ZWuDC1dahkc1XxumCEwigXPzq5Hn/M85FFgEoftnGhDBRaMl1nN5BWLCguWNpa7yWZrQ6Kt8iC2pbwC+NWyIICfF8+VdCzjYN+pq9Q+VmIV7MVGeMXcLBtLUOWrsLVlASmeo/V4PzzMSD9YGuC2LYfzYWDB+dAb90SlDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743486549; c=relaxed/simple;
	bh=LxRD0t6NK6iC+E5e9HSS/D7TgVDLY84E0VmJUO0gM/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQjnBuQaDaOztvkP9OU8NTUyYgg4l17VdO8HqChkM3dQco4pdlEmpGMcSUQXcHSKnLCMLpaG+A4ISg92mi2nNVxeCTKyfvFW3Cm9/jJt8DH6HwvpJcgz8PZNt+5M71ZXDY1+HRfqt8swCWM+24s9NYC2SrMCWbGgXexiKsGEEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=L1V0QSBT; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 009971d20ebd11f0aae1fd9735fae912-20250401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UArewHpW++Ja8wHQ4rXErRsdg7BmGgcBoY0TuBj078Y=;
	b=L1V0QSBTscRSQqQ+FTGkEYKeN8Y7PCLut5Bjg/PG0FTWybaDpLJRalGeqIOlCrwtoGwnIqRDs3ourstctwBcfaQvPVXKDgy4renfynBhfaar9KT6p8IV0BlM00x5NMD/FWFn7H06K50tCY1SEBh1BefvPBEnQoDhSj54x2fKXu8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7af794b1-e9ea-487b-bdaa-f9724673582e,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6cc50ac7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 009971d20ebd11f0aae1fd9735fae912-20250401
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 128784931; Tue, 01 Apr 2025 13:48:57 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Apr 2025 13:48:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 1 Apr 2025 13:48:54 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <yong.mao@mediatek.com>,
	<Axe.Yang@mediatek.com>, <Jimin.Wang@mediatek.com>,
	<Wenbin.Mei@mediatek.com>, <Andy-ld.Lu@mediatek.com>, Cathy Xu
	<ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for mt8196
Date: Tue, 1 Apr 2025 13:48:10 +0800
Message-ID: <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
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
 .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
new file mode 100644
index 000000000000..cef7e0321722
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
@@ -0,0 +1,220 @@
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
+  reg:
+    items:
+      - description: gpio base
+      - description: rt group IO
+      - description: rm1 group IO
+      - description: rm2 group IO
+      - description: rb group IO
+      - description: bm1 group IO
+      - description: bm2 group IO
+      - description: bm3 group IO
+      - description: lt group IO
+      - description: lm1 group IO
+      - description: lm2 group IO
+      - description: lb1 group IO
+      - description: lb2 group IO
+      - description: tm1 group IO
+      - description: tm2 group IO
+      - description: tm3 group IO
+
+  reg-names:
+    items:
+      - const: base
+      - const: rt
+      - const: rm1
+      - const: rm2
+      - const: rb
+      - const: bm1
+      - const: bm2
+      - const: bm3
+      - const: lt
+      - const: lm1
+      - const: lm2
+      - const: lb1
+      - const: lb2
+      - const: tm1
+      - const: tm2
+      - const: tm3
+
+  interrupts:
+    description: The interrupt outputs to sysirq.
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
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
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #define PINMUX_GPIO99__FUNC_SCL0 (MTK_PIN_NO(99) | 1)
+    #define PINMUX_GPIO100__FUNC_SDA0 (MTK_PIN_NO(100) | 1)
+
+    pio: pinctrl@1002d000 {
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
+        reg-names = "base", "rt","rm1", "rm2", "rb",
+                    "bm1", "bm2", "bm3","lt", "lm1",
+                    "lm2","lb1", "lb2", "tm1","tm2", "tm3";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 271>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
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


