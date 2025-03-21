Return-Path: <linux-gpio+bounces-17840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D1A6B687
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 10:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EAF43B5AF8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061F61F03F8;
	Fri, 21 Mar 2025 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PboPnvDa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5D1EFFB3;
	Fri, 21 Mar 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547551; cv=none; b=TGMnPqstjUtGUcnnpd3Eiw2xv+0FcuVZQ5dqiNTViQ8xJYjLKW6yiko2HiQPNNg1ibGLkcqHP2xV4A/6Wsx5ba65QViXfGc8EDFscYWU+tEVAKnDSgsmMbtG8DOz2AiIDTmPu/BwWCvfUXFvtz5CPViUfUG72mlBfOG49dyuOvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547551; c=relaxed/simple;
	bh=wlY3BMc0nF9qDXRDPMy5JzdAUxZruwIwYNRockyy+6k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pATvzzSpHW87kPYU42J7ldHI5D9NsMFOOL/0VYABZvo5tFnUaZgCgQQ2eVQogvkPDSBfJcK5jSMYywQ8A9C+CERPRax+WVmrlmIGeAMWDr5n12DGI2Q1RwL9HIsEe/xF+m6RLpAw2CcxkDtXI6059FhqpNZl7gXHlkpzF5988j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PboPnvDa; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: bc58cf6e063211f08eb9c36241bbb6fb-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D/df5DGySplatrBP3SQSZzM8eiYSS2Tmx+LkG6lH8d8=;
	b=PboPnvDaCcM/vrUsdTLdPLlAtAiVVZIU9hGe/zn9VOf7AhglMYoNuOOSP1FE3V+eQVKWs1A6OT/0wMTSc3AqcaW8BumyaxNYujMQ+8JLtcikih/AEpjhXwBkFpS3rQEwvfpAhV8pSNzbwewY3igMhEvQ41/+MQWAH5MZSZI/uMI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d059fcb8-e763-44a1-a3d8-c325874700f6,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1ba4a98c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: bc58cf6e063211f08eb9c36241bbb6fb-20250321
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1533717955; Fri, 21 Mar 2025 16:59:02 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 21 Mar 2025 16:59:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 21 Mar 2025 16:59:00 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: Lei Xue <lei.xue@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<yong.mao@mediatek.com>, <Axe.Yang@mediatek.com>, <Jimin.Wang@mediatek.com>,
	<Wenbin.Mei@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: mediatek: Add support for mt8196
Date: Fri, 21 Mar 2025 16:39:12 +0800
Message-ID: <20250321084142.18563-2-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
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
 .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
new file mode 100644
index 000000000000..d863cb7a301a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
@@ -0,0 +1,223 @@
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
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #define PINMUX_GPIO99__FUNC_SCL0 (MTK_PIN_NO(99) | 1)
+    #define PINMUX_GPIO100__FUNC_SDA0 (MTK_PIN_NO(100) | 1)
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


