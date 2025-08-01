Return-Path: <linux-gpio+bounces-23944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E71B180E8
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D59D189BC0B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4381A25A322;
	Fri,  1 Aug 2025 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m3LwZhp+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B35256C9B;
	Fri,  1 Aug 2025 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047098; cv=none; b=p9wZj+nQ/+PzaT0ZySBtOjLbtMiYiPYnzCfsKXMJJh/YL49epmL75bXlXEl0wVWyVoBnZlyq9p05YR/LfIrr05p4HyoCpH45j/SsyhdOCSI7Ef2tOqqxdOI1niGsVXQVRbnKACOzDil0hz6SUCzymuGQ5zxXvsUnANk5qUJ/2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047098; c=relaxed/simple;
	bh=K5AbZextcpwEgRWA7lPB+7MDIAc4lIHBqrMIoAN7CP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PR1c7CGjEL7FuaiH3sWgcUSxvXgkwJxYLBhpzt9C9rVR0s3TbYSXPw/2rt4sP9HhIeXuqJALAKKqVEgTmO+//PY2ppVcWbZD5AEvUyIepqeSucl2ItHVtFRxFSVddDYAmAdR/ez3bgj1G9js1sKEXKIsO9krOjuHd8QntbEEt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m3LwZhp+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047093;
	bh=K5AbZextcpwEgRWA7lPB+7MDIAc4lIHBqrMIoAN7CP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m3LwZhp+kS20jA83BOT5cV8bzc4Cma2vF38v03WGF1SiNrmgWfnlsG6mFvH7GH/NF
	 Jz6xVnlaN/g7L8yHum9QeRFAqlQWbwgx1A9hVQzDTEd5rtspanalFjxU6nDIQ2maQL
	 EJy4PfFMn0oiEhL5Msm8vfRxbFaFQRO+eCHsprpq4xi4WvZwjWpKWd6kS1vu5yCJl2
	 IVYzFdIBFg+oYqbwsrtP1cFAFo7LjSw7HNQbvtFJBx57d4AII1evPVZjRYx9GUtYSa
	 m+eCXDx9m1nhC/kTIVBf3dMEVtQ3E9PK+WH1tufGM5xLJnc+GckgBff8w1yVI/Do4c
	 rV9xHmMrdGJvQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6658217E01FD;
	Fri,  1 Aug 2025 13:18:12 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:08 +0200
Subject: [PATCH 6/9] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
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

Convert the existing text-based DT binding for MT8183 sound cards using
MT6358 and various other codecs to a YAML schema.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       | 25 ---------
 .../devicetree/bindings/sound/mt8183-mt6358.yaml   | 59 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
deleted file mode 100644
index ecd46ed8eb98b99d0f2cc9eeca5f6d0aef6a5ada..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MT8183 with MT6358, TS3A227, MAX98357, and RT1015 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
-               "mediatek,mt8183_mt6358_ts3a227_max98357b" for MAX98357B codec
-               "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
-               "mediatek,mt8183_mt6358_ts3a227_rt1015p" for RT1015P codec
-- mediatek,platform: the phandle of MT8183 ASoC platform
-
-Optional properties:
-- mediatek,headset-codec: the phandles of ts3a227 codecs
-- mediatek,ec-codec: the phandle of EC codecs.
-                     See google,cros-ec-codec.txt for more details.
-- mediatek,hdmi-codec: the phandles of HDMI codec
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
-		mediatek,headset-codec = <&ts3a227>;
-		mediatek,ec-codec = <&ec_codec>;
-		mediatek,hdmi-codec = <&it6505dptx>;
-		mediatek,platform = <&afe>;
-	};
-
diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml b/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a50dc109e8f307cfb08504a9143a178e880266c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8183-mt6358.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8183 sound card with MT6358, TS3A227, and MAX98357/RT1015 codecs
+
+maintainers:
+  - Julien Massot <julien.massot@collabora.com>
+
+description:
+  Binding for MediaTek MT8183 SoC-based sound cards using the MT6358 codec,
+  with optional TS3A227 headset codec, EC codec (via Chrome EC), and HDMI audio.
+  Speaker amplifier can be one of MAX98357A/B, RT1015, or RT1015P.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183_mt6358_ts3a227_max98357
+      - mediatek,mt8183_mt6358_ts3a227_max98357b
+      - mediatek,mt8183_mt6358_ts3a227_rt1015
+      - mediatek,mt8183_mt6358_ts3a227_rt1015p
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the MT8183 ASoC platform node (e.g., AFE).
+
+  mediatek,headset-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the TS3A227 headset codec.
+
+  mediatek,ec-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Optional phandle to a ChromeOS EC codec node.
+      See bindings in google,cros-ec-codec.yaml.
+
+  mediatek,hdmi-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Optional phandle to an HDMI audio codec node.
+
+required:
+  - compatible
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
+        mediatek,headset-codec = <&ts3a227>;
+        mediatek,ec-codec = <&ec_codec>;
+        mediatek,hdmi-codec = <&it6505dptx>;
+        mediatek,platform = <&afe>;
+    };
+
+...

-- 
2.50.1


