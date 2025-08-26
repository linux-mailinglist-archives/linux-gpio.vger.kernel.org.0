Return-Path: <linux-gpio+bounces-24959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9AB355D7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4759C3A6B62
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 07:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B712F9C38;
	Tue, 26 Aug 2025 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A74t7wdu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9C2F99A9;
	Tue, 26 Aug 2025 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193988; cv=none; b=eQEblE4EoxXIvVQryL2kji6ej4vmoB8Cq/10Gt4d/2WM5veo5qidjdo9R/ZT/QJQbvHScTpnxy0RX2XsMo8zyFYFYU2HZt7cR2yOvtROMTAez1RGtIkO6G2v0jphdBiSWQY1BcOJduEXqftJIMfge4jKm8X2KC5bZBlncQi+3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193988; c=relaxed/simple;
	bh=ZzK0YMyw8Cz7e8uao/AQQ99iaeD+bkVcWkBHzn18opA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kR/H8mcuQxj6fc7mBnTX6jGCj/fn25ZdRc4oHINJQBgdM6V5YNRgGfZFhSa7SDOkPSLojTWPLUozCX70JSlFtCapCoGvI2VH6gtu/YGICnYQC10gzJXqw1klRaLZZUbDm3pcsSsZoEbLlxSMLj1+uYYc5LmyqvdvEfwXvZ009M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A74t7wdu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193984;
	bh=ZzK0YMyw8Cz7e8uao/AQQ99iaeD+bkVcWkBHzn18opA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A74t7wduMGyeW6R+BrlrYiawQEj1SIwPi+HHZajGBls91RooeouHe9k6sTXza6mrZ
	 SYNWZv+MINSgdHBwjVAqbMU51KxC1fH2tnYihduaKVZwtLLkJbaELqNLMZcs6UoLvi
	 Moc+X9wB7xZPMSME2+n6slHo6L3V9wxon4RdfScZyZqR9eLtpJwxFEtlaiKq2OF2US
	 bzz5chtacYCFSAjB0fbkzCcrVAkEEpFd8GZ33q0hU2tpCG1YA67yYh+UyZplXjjhsR
	 2kmOJL4KeEoqzRIQsbwB8gRFRKF3dzdJyTeGHWhQJCo4FfmSExKluE9Loee2BZULet
	 1rVATimsKHCtw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDF2917E0985;
	Tue, 26 Aug 2025 09:39:42 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 09:39:38 +0200
Subject: [PATCH v3 5/6] dt-bindings: sound: Convert MT8183 DA7219 sound
 card to DT schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mtk-dtb-warnings-v3-5-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
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
amplifiers from the legacy .txt format to DT schema.

This improves binding validation and removes DT schema warnings
for boards using these audio components.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/sound/mediatek,mt8183_da7219.yaml     | 49 ++++++++++++++++++++++
 .../bindings/sound/mt8183-da7219-max98357.txt      | 21 ----------
 2 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b526e8123182bce87a8996928c4cf5f1f60264a6
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
+  MediaTek MT8183 SoC-based sound cards with DA7219 as headset codec,
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


