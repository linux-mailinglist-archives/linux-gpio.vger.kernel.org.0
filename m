Return-Path: <linux-gpio+bounces-20519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE95AC1FF2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 11:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BCBEA227ED
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 09:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754A3226CF9;
	Fri, 23 May 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BaLO/mhh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C322370F;
	Fri, 23 May 2025 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993418; cv=none; b=JztsuHCXYo18WbTFpVgwanx7HXZ1flpSsyvMKjWSLkDIFLi5GKJ0SUDfoAVvi6xl6QxIg7WxX00sKCHza+MHnV7D1eGu22lnrvwwuo0OgtJG3O8QvXR9a21szLS3bgVEGe+vLPBnC2Lz/BPJvmOlv6jDBrxYQO7d/i4NgxZZZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993418; c=relaxed/simple;
	bh=1ECTelfWqXCaOQoF6kmFgO3nVJTMlJfzIF3ZGSZHX2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhNtysgQm6581MYbQPghTlTWBkYNf9Fl/ai5MzmADrxAAFk6VRSdg08uWTua0F7VRolItjKQwLCo+qXM7YQGBFRGF5OuTofPCoFM4k/C1lumgHvT7ekTaEs72UJUaS3TuRNSNO7Qj6J20edBCGT3pJ9mEJ+WMh9QCQg0NUGuzMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BaLO/mhh; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 61fc7bce37ba11f082f7f7ac98dee637-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dvm35dOkcaEMch7TguVNHocpxtv2bihtt0YbpKwsuLQ=;
	b=BaLO/mhh7BeEhGOvI7Jv7Xn/2KhfARyhT4N8WMgpD+wSK1J5EeXzn62JBTDab3cgsx165YYlrhRXJqhbjrqoi2vKxp+oW+UbD/L73xhwEcOq75df02cNWqRkXs5/MYRMjzTczOYJnFqvJxdiVNCBlK6BH/v4PpprMnvvaOItcrk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e27118cd-c05a-4354-be7d-dacdf1eb5888,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fb7e0959-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 61fc7bce37ba11f082f7f7ac98dee637-20250523
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 127239695; Fri, 23 May 2025 17:43:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 17:43:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 17:43:26 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>,
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe Yang <Axe.Yang@mediatek.com>, Cathy
 Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add support for mt8189
Date: Fri, 23 May 2025 17:42:46 +0800
Message-ID: <20250523094319.10377-2-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the new binding document for pinctrl on MediaTek mt8189.

Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
---
 .../pinctrl/mediatek,mt8189-pinctrl.yaml      | 217 ++++++++++++++++++
 1 file changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
new file mode 100644
index 000000000000..43b6f15efad8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
@@ -0,0 +1,217 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8189 Pin Controller
+
+maintainers:
+  - Lei Xue <lei.xue@mediatek.com>
+  - Cathy Xu <ot_cathy.xu@mediatek.com>
+
+description:
+  The MediaTek's MT8189 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8189-pinctrl
+
+  reg:
+    items:
+      - description: gpio base
+      - description: lm group IO
+      - description: rb0 group IO
+      - description: rb1 group IO
+      - description: bm0 group IO
+      - description: bm1 group IO
+      - description: bm2 group IO
+      - description: lt0 group IO
+      - description: lt1 group IO
+      - description: rt group IO
+      - description: eint0 group IO
+      - description: eint1 group IO
+      - description: eint2 group IO
+      - description: eint3 group IO
+      - description: eint4 group IO
+
+  reg-names:
+    items:
+      - const: base
+      - const: lm
+      - const: rb0
+      - const: rb1
+      - const: bm0
+      - const: bm1
+      - const: bm2
+      - const: lt0
+      - const: lt1
+      - const: rt
+      - const: eint0
+      - const: eint1
+      - const: eint2
+      - const: eint3
+      - const: eint4
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
+              defined as macros in arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
+              directly, for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8189 pull down PUPD/R0/R1 type define value.
+              - enum: [75000, 5000]
+                description: mt8189 pull down RSEL type si unit value(ohm).
+            description: |
+              For pull down type is normal, it doesn't need add R1R0 define
+              and resistance value.
+              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8189.
+              For pull down type is PD/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit". It can support resistance
+              value(ohm) "75000" & "5000" in mt8189.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: mt8189 pull up PUPD/R0/R1 type define value.
+              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 75000]
+                description: mt8189 pull up RSEL type si unit value(ohm).
+            description: |
+              For pull up type is normal, it don't need add R1R0 define
+              and resistance value.
+              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8189.
+              For pull up type is PU/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit". It can support resistance
+              value(ohm) "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
+              "75000" in mt8189.
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
+    #define PINMUX_GPIO51__FUNC_SCL0 (MTK_PIN_NO(51) | 2)
+    #define PINMUX_GPIO52__FUNC_SDA0 (MTK_PIN_NO(52) | 2)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt8189-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11b50000 0x1000>,
+              <0x11c50000 0x1000>,
+              <0x11c60000 0x1000>,
+              <0x11d20000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11e20000 0x1000>,
+              <0x11e30000 0x1000>,
+              <0x11f20000 0x1000>,
+              <0x11ce0000 0x1000>,
+              <0x11de0000 0x1000>,
+              <0x11e60000 0x1000>,
+              <0x1c01e000 0x1000>,
+              <0x11f00000 0x1000>;
+        reg-names = "base", "lm", "rb0", "rb1", "bm0" , "bm1",
+                    "bm2", "lt0", "lt1", "rt", "eint0", "eint1",
+                    "eint2", "eint3", "eint4";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 182>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        i2c0-pins {
+            pins {
+                pinmux = <PINMUX_GPIO51__FUNC_SCL0>,
+                         <PINMUX_GPIO52__FUNC_SDA0>;
+                bias-disable;
+            };
+        };
+    };
-- 
2.45.2


