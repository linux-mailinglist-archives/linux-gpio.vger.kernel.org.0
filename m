Return-Path: <linux-gpio+bounces-24627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71311B2DE45
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8AF1889E49
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACF42E54D0;
	Wed, 20 Aug 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eLu8swv6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1531B135;
	Wed, 20 Aug 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697505; cv=none; b=CY0QuLa8x1v1BG3+fxBlwDQtgFHk381V7F2uF6Ks2lbUGH1/h/Q/Iwcluy5qeMt25N3DgnEpC3sYNzGIoBBNmblwNuOJUjYnDkI96EFXsQa3DuQWN2vc26CovCRyRTfJPm47wLr9qb680JsjszDi4oU1zjQgoXV3P1wsN076wMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697505; c=relaxed/simple;
	bh=M2JSTPKjyC2uRzfPqh059736CpYrmwrQssTYdHL6Cto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wp7GFN1tN8QDMeslLeZoZJdbujZpd30EUmHKg0tdGlbNRRCZ8xq4LgPbaw4HKTzHnB0joGI5pLZzN8ImokJysLgZgjhxN1rObLir2tDP7GTLWH9G2GK8RQVMbmdeTf8sEWbekNOvAefiM9PZ2bNXwKorK8ftPc+8VALrCVpjSnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eLu8swv6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697502;
	bh=M2JSTPKjyC2uRzfPqh059736CpYrmwrQssTYdHL6Cto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eLu8swv61TMlyKu2OxiDhrkSLdrky7tjAVAtsSdlpHfKEKUsU5pJzzlr1VfO+e8UF
	 7EvMPWZtzbRVqOJgoOV7Rk9lt46lr//irFRzHm71AZu43xVE0LB9Yr40q56jd8smEZ
	 l8DNwOHv0OmdzDiiOUr5vY8WlGWGRPprKxzomGOm6rPYPrBTz9b2gnh/6PVqtIBogu
	 G1D4YLoQQMhoeGjXKrF/txbfxUS5GB8SgZg+AhT69Iundi61R/hl6+spJKdTpbWbmV
	 jmX+p5HwFqRkhiouLGhtIeOZzCbts0tzYPNugY8c8ww9emCHo4LH11rQbB1hb/55ll
	 YnRgul0KZ3t7g==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D754817E0483;
	Wed, 20 Aug 2025 15:45:00 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 20 Aug 2025 15:44:52 +0200
Subject: [PATCH v2 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-mtk-dtb-warnings-v2-1-cf4721e58f4e@collabora.com>
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

The mt8183-mfgcfg node uses a power domain in its device tree node.
To prevent schema validation warnings, add the optional `power-domains`
property to the binding schema for mediatek syscon clocks.

Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../devicetree/bindings/clock/mediatek,syscon.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
index a86a64893c675ac134af609b3a49242565db6ad8..a52f90bfc9f92b52feb9f488db5550630ac55f0a 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
@@ -76,6 +76,9 @@ properties:
           - const: mediatek,mt2701-vdecsys
           - const: syscon
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 
@@ -86,6 +89,18 @@ required:
   - compatible
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8183-mfgcfg
+then:
+  properties:
+    power-domains: true
+else:
+  properties:
+    power-domains: false
+
 additionalProperties: false
 
 examples:

-- 
2.50.1


