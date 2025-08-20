Return-Path: <linux-gpio+bounces-24631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CAEB2DE43
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A91BF16A6E2
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECBA1C3C04;
	Wed, 20 Aug 2025 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RwoDY1kp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADF2E11AB;
	Wed, 20 Aug 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697510; cv=none; b=om7Uls47+6mt12J6VONXsMxjR9aWTxL2kr4ZhSJFkFak1HQkwvZVb9yX/2/S4nS/0+FDWPOksv1DECeql3u0Uruv5ljhnVEtluKPlfMHq4n4y28FFyNSGGeMuNCsKQdvh+pUpzkZ5/29ocxeIPtCU37Q6tRCqiVMPTYQuDmucQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697510; c=relaxed/simple;
	bh=2lm7cLxnjaAb1QcD+qj7EeyjDise3Nnw8EH5IyGWS6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pay5cfKluEBiSODXVNWKk/+qrJRLS0NipbYaLFdcRWt6qPEOsaTiZjYrvYgFDdg3/Rrrvhs5lm2P679xf3YDQ+3HAUvGLetpYHI3OZAHSrDqoz0cr5ozOXo0UgqQ4e+KCd/q39mh1W+vOXE8sg1jXog1vHgZOjpdYXQQ+Zwytq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RwoDY1kp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697507;
	bh=2lm7cLxnjaAb1QcD+qj7EeyjDise3Nnw8EH5IyGWS6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RwoDY1kpgq4zNPgiPJBqVKrzkUaHxHkL2jptJK0MySsXp4zhEoPUvMqg21jattXiS
	 VFKrf4/kKsJQAwf3y/7uB4oBB+KXiauM8/LURjECMwfXNFW14KCVk43kKQ7DNZO6Tl
	 MDoDphzLQoIn4N9VyZ2u3MHh1yGcgK9ce8lcqIEEmDLwdUW9gsjTAtdN0qkfC0XUEQ
	 TO/Y3ItJ6SpNJndVptK4+2y4oVEAnVIHNgfxxDecft1SL15ALHD27X2j78T50sOyGR
	 Y2fj2ucIrDXjNwLcvpd0jPBCSUUGqQop2Yd1yCeFjRDuc+Y7o2cfI69mftz2CqB45F
	 U9sRUEO5RhDhA==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DCB4D17E01F5;
	Wed, 20 Aug 2025 15:45:05 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 20 Aug 2025 15:44:56 +0200
Subject: [PATCH v2 5/6] dt-bindings: sound: Convert MT8183 DA7219 sound
 card bindings to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-mtk-dtb-warnings-v2-5-cf4721e58f4e@collabora.com>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
In-Reply-To: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Convert the Device Tree binding for MT8183-based boards using the
DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
amplifiers from the legacy .txt format to YAML schema.

This improves binding validation and removes DT schema warnings
for boards using these audio components.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/sound/mediatek,mt8183_da7219.yaml     | 49 ++++++++++++++++++++++
 .../bindings/sound/mt8183-da7219-max98357.txt      | 21 ----------
 2 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b6fee3ff3af9a90820ee57efdf8efb3f3d474804
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8183_da7219.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8183 sound card with external codecs
+
+maintainers:
+  - Julien Massot <jmassot@collabora.com>
+
+description:
+  Binding for MediaTek MT8183 SoC-based sound cards with DA7219 as headset codec,
+  and MAX98357A, RT1015 or RT1015P as speaker amplifiers. Optionally includes HDMI codec.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183_da7219_max98357
+      - mediatek,mt8183_da7219_rt1015
+      - mediatek,mt8183_da7219_rt1015p
+
+  mediatek,headset-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the DA7219 headset codec.
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the MT8183 ASoC platform (e.g., AFE node).
+
+  mediatek,hdmi-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Optional phandle to the HDMI codec (e.g., IT6505).
+
+required:
+  - compatible
+  - mediatek,headset-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8183_da7219_max98357";
+        mediatek,headset-codec = <&da7219>;
+        mediatek,hdmi-codec = <&it6505dptx>;
+        mediatek,platform = <&afe>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
deleted file mode 100644
index f276dfc74b4654deb0867f830e17a92638b39e23..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-MT8183 with MT6358, DA7219, MAX98357, and RT1015 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8183_da7219_max98357" for MAX98357A codec
-               "mediatek,mt8183_da7219_rt1015" for RT1015 codec
-               "mediatek,mt8183_da7219_rt1015p" for RT1015P codec
-- mediatek,headset-codec: the phandles of da7219 codecs
-- mediatek,platform: the phandle of MT8183 ASoC platform
-
-Optional properties:
-- mediatek,hdmi-codec: the phandles of HDMI codec
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8183_da7219_max98357";
-		mediatek,headset-codec = <&da7219>;
-		mediatek,hdmi-codec = <&it6505dptx>;
-		mediatek,platform = <&afe>;
-	};
-

-- 
2.50.1


