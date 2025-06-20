Return-Path: <linux-gpio+bounces-21928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D0AE1803
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 11:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C8225A5300
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 09:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D5D28B408;
	Fri, 20 Jun 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AxB48K1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF1F2874E0;
	Fri, 20 Jun 2025 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412536; cv=none; b=HGgcfny0An4lLD4bbvi0RkGriDEgkhcZWhh7+ol6n7WUV9C7OfcT5ylao5vYnyUOC8GPhzANMRtjkeFhd7Xv1ssTU9jelikOkO6AQW/UQFqgPDXpGpYUuSfqHqQjknGaV7i4lVSdYP9XAm3mx3YayY7h+VF9gfxHib5tcbFpDP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412536; c=relaxed/simple;
	bh=uiXSe0wxYZ4BRpTi+yfMdLn+n3ng6Y3zswzO12G6348=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L8676HH/CNi+DKpIe6VEAQSYdloLlwudjeYGc0jPvPQ2oJqxBFCMhq84X3JSC8eO2ohK2PTpRTqUhhgccATdScIYYbu3mwQojE+70IezmrLVqmjLJkQCVm6d/t93o5AsBEs/6JZYRuBCZWsRAA193vP0uK4j7PBhlBtpeLAguGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AxB48K1d; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d5933d144dba11f0b910cdf5d4d8066a-20250620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6Z0BMlDcqn4E4cqFhk9MnMqrOq0vBBFZoW9QiLj1MBs=;
	b=AxB48K1dyHuyuKj7/zRJoRUFytLZiD1T2LG7rMmS0ZkdM8ZjeDxMY0MGkWGWwi+UJNcxyYIsfSRNnCk26g5g2FlyFjRQ8oTbMvcEQJ1zGbEOW8f9P1L1AeACMKZj5+o6fSA96BvnrPKggjF39/+YDN6W29Q0OmZ/upNPUu16SgA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:210a71e7-5ad8-410a-8fa6-3c17595cb4d2,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:09905cf,CLOUDID:24243277-7521-4364-b0ef-cd7d9c0ecbde,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d5933d144dba11f0b910cdf5d4d8066a-20250620
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1974806918; Fri, 20 Jun 2025 17:42:09 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 20 Jun 2025 17:42:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 20 Jun 2025 17:42:06 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH v5 10/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card
Date: Fri, 20 Jun 2025 17:40:43 +0800
Message-ID: <20250620094140.11093-11-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250620094140.11093-1-darren.ye@mediatek.com>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Darren Ye <darren.ye@mediatek.com>

Add soundcard bindings for the MT8196 SoC with the NAU8825 audio codec.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../sound/mediatek,mt8196-nau8825.yaml        | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
new file mode 100644
index 000000000000..5c4162e64004
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8196-nau8825.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 ASoC sound card
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-nau8825-sound
+      - mediatek,mt8196-rt5682s-sound
+      - mediatek,mt8196-rt5650-sound
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8188 ASoC platform.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description:
+          This property corresponds to the name of the BE dai-link to which
+          we are going to update parameters in this node.
+        items:
+          enum:
+            - TDM_DPTX_BE
+            - I2SOUT6_BE
+            - I2SIN6_BE
+            - I2SOUT4_BE
+            - I2SOUT3_BE
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      dai-format:
+        description: audio format.
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        enum:
+          - cpu
+          - codec
+
+    additionalProperties: false
+
+    required:
+      - link-name
+
+required:
+  - compatible
+  - mediatek,platform
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8196-nau8825-sound";
+        model = "mt8196-nau8825";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+        dai-link-0 {
+            link-name = "I2SOUT6_BE";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&nau8825>;
+            };
+        };
+    };
+
+...
-- 
2.45.2


