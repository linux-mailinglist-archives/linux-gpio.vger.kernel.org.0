Return-Path: <linux-gpio+bounces-23943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2965B180E1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69302A84ECD
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B163B254AFF;
	Fri,  1 Aug 2025 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Uj/tFHGM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E15248F47;
	Fri,  1 Aug 2025 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047095; cv=none; b=CIi5bzCMzkiuUg+gLZ3tQQLpElIvT3Y0+gXGrrJfZRqAJM/ukdawyjkZ/n+MmI/v8QK8Ot6DLuY7fD3QRUKplSxtumd6sEmstm1f4Vzs6yfNFw/pNDUOR6jql/KOPgL8Pt+6IBOxUPNts/Tnn7z7H+qY2zXVvDYmTk/Iigw+NXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047095; c=relaxed/simple;
	bh=wgQXtFlBffsJMdtzb8h8rV8iabe3a1/i/jY6Gh4CFGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oqsrHGfbiSaRuRMKO4CpTdx4OVdFHfdM4R1sek80eKrwt6eAlNPLGW2Yox/jXmLE33R4hhyoa9IS9ZhQhdeqGxRQhO0I71EVnnXUL60qo6E+1AoxQa0tQMm9zBQ619OTjcP840n2AcE6pwtk6HocRRY79AYETjP1/ugKZofscy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Uj/tFHGM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047092;
	bh=wgQXtFlBffsJMdtzb8h8rV8iabe3a1/i/jY6Gh4CFGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Uj/tFHGMsRwfP8KBREkN1pi1C+bzKBX8JOgZNVAD2F/11IYg8ZuwApRWgZHAjFe7J
	 01d9r7FHQ9T3mImASP+UepU2VyntyZMjiPWpJJsDrwn2yzrW5z3mf6WkDJCiYNb1nQ
	 KesXhTZvyTNmk/7Jwxu089JHpBift2XWiDdSQSk9271/KAUZrb5Ldb2+Q5MjcHJCth
	 vghGnidKKedCb6CHex2iEEVLrchOQB8Vht9FbRGZvlZxOksXFw83NhAo3zTNU64w/D
	 J6o3OJbLuMAQRFx8DhuneWY8Vhx/TxJqRs8ANHjsWSHowibcBY8FracucTV8Qwjq60
	 05FTCvHhVREgQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2280B17E129E;
	Fri,  1 Aug 2025 13:18:11 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:07 +0200
Subject: [PATCH 5/9] dt-bindings: sound: Convert MT8183 DA7219 sound card
 bindings to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
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

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/sound/mt8183-da7219-max98357.txt      | 21 ----------
 .../devicetree/bindings/sound/mt8183-da7219.yaml   | 49 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 21 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/sound/mt8183-da7219.yaml b/Documentation/devicetree/bindings/sound/mt8183-da7219.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6c5098b450cd1b183c8e41325cbeedd9aec91b5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8183-da7219.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8183-da7219.yaml#
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

-- 
2.50.1


