Return-Path: <linux-gpio+bounces-23149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14CB01917
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6134F17410A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 10:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7003E27F4D9;
	Fri, 11 Jul 2025 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XzrkEgMC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E534427FD40;
	Fri, 11 Jul 2025 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228042; cv=none; b=UsQu5I+niS5sdgG5Qi189GZVkunYDZ1jcI7xpXCnEoQXK6aAln58zQoLFcft9rYzSVRaEdBQ21+lvvGGhrE1yO9xxulM5bm0nis5IQozBfoR1O2giAPBHUVvydS+t2DlpyvRrWYVoarU0pt4GUsIJu17IdNq6eyFu7nYtG+wSlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228042; c=relaxed/simple;
	bh=KqqF/lZSiJHdQ+0LsQspVZaqAlDYuxiCOHRS/1UhIII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfUu/MJ5ySrhhZ1rKk6U7kWUZ2KdfZEDZJdJl/b2SmZtj8uEHlLIpTG6jcerhBNNbGLYZQXBMlwI8+tCiZI4v9PwSZWBHZMKq5lhXKzAhlU8LjXPTWgzDVKV5DRAbdny2mw1xNAZ6iLM1DwtkuY87zN/F8WHQYFx/IvO6aYM+Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=XzrkEgMC; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c4546ab45e3b11f0b33aeb1e7f16c2b6-20250711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Uod/JMQEO4KbUCsWai7WYan9PqxL0GvkbMgC6cj/V5A=;
	b=XzrkEgMC3M2EEOZcDh7zSTBkt5GqTUJsOxLcn99q+0gKF0MqgOrM3MryZQdtN4fLr9C1mqL3gLBJ5vontdkvg1Q4F9EDZZSLU00cY6a4pW9xdp4LafrFqudJKuCFzbn3U2/EabPpF4VDV0incA8d9hls17Y9FzKShB+p/6ZpLmU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:4b19f819-e482-4cc8-9eda-568084dbf49b,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3eee19d8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:97|99|83|106|11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c4546ab45e3b11f0b33aeb1e7f16c2b6-20250711
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 274200033; Fri, 11 Jul 2025 17:45:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Jul 2025 17:45:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Jul 2025 17:45:20 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: Lei Xue <lei.xue@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe
 Yang <Axe.Yang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: mediatek: Add support for mt8189
Date: Fri, 11 Jul 2025 17:44:57 +0800
Message-ID: <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
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
 .../pinctrl/mediatek,mt8189-pinctrl.yaml      | 213 ++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
new file mode 100644
index 000000000000..32e4653da5db
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
@@ -0,0 +1,213 @@
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
+
+              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8189.
+
+              For pull down type is PD/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit".
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
+
+              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
+              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
+              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
+              "MTK_PUPD_SET_R1R0_11" define in mt8189.
+
+              For pull up type is PU/RSEL, it can add resistance value(ohm)
+              to set different resistance by identifying property
+              "mediatek,rsel-resistance-in-si-unit".
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


