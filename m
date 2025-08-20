Return-Path: <linux-gpio+bounces-24629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60210B2DE2A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D6B64E555A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC2632253C;
	Wed, 20 Aug 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P5Weazqw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC153218B7;
	Wed, 20 Aug 2025 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697508; cv=none; b=ij8/mn7lZuDOrmFbN2dVamoahwzk103gFUyVrGH7qPUijTNaTt0m/fbNb7JhTWu2KrHzbwLURYZIIc2DPWT0SyIJ/QKgReAKtgRNXbtUIQges1U0RD26bbxL5CSQbN8eXqkxT0U5YcVQqWjgxHxPhM9W0A8vO9EnbWNfUpZ4W/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697508; c=relaxed/simple;
	bh=kAfaoM+sI7FQ9MCblVppc0VqNecjv7SuoMhbMLV6t1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Snt/YmSXlx8M8lMsk7zHiw6oibF18MFVMAY1blOcTKhDMlRjaFXDtHZISvAc+BrO6QUgcOajMPGRSZA+GvwVYkiEZ3q5FmlNhEI29ifODpH6Z5WZbU6r+TyZ0X89h7DcWvF+ts2Of6SwUF0EhGbKZiMHDBOtP2M4I5pCtKWNE8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P5Weazqw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697504;
	bh=kAfaoM+sI7FQ9MCblVppc0VqNecjv7SuoMhbMLV6t1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P5WeazqwT4f0T3N3ttOnDzmvLGw0+33ceE+5j3YRyJ79JYwkhtMFfn4XdsiUCQqe6
	 JDgyApF4rqMCbbyIdxeoaAJNQut6E1rq27AxTg9SGyD2Y/t3u40tO1c/o4Y+K8bY0u
	 JxSkumEIc/2ihT1IH/bdHC/kQoEg2iBdF8kOA7s+qArSgcV7FNPSxu4GiSCd6umCpA
	 HmUwBbZ+Ubof3KEigAJ21NUmkYrWeI+0xsEbFOFN4IHRpwYV+FBfLnRfJhpMFNfMXR
	 N/68tLQcVwGi5+/R4d9Safpogj1jDQOu4kk5De2OxLKfcYJgj6w0cyU3elOHQx3RBU
	 YeUVXXFwUTBYQ==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6490817E12FF;
	Wed, 20 Aug 2025 15:45:03 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 20 Aug 2025 15:44:54 +0200
Subject: [PATCH v2 3/6] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-mtk-dtb-warnings-v2-3-cf4721e58f4e@collabora.com>
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

Update the mediatek,audsys binding to support the mt8183-audiosys
compatible, which uses a different audio controller binding
(mediatek,mt8183-audio.yaml) compared to the legacy mt2701-audio
controller.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.yaml           | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..f3a761cbd0fd44e2f7ff35c274dd170bbb177e96 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -23,6 +23,7 @@ properties:
               - mediatek,mt7622-audsys
               - mediatek,mt8167-audsys
               - mediatek,mt8173-audsys
+              - mediatek,mt8183-audiosys
               - mediatek,mt8183-audsys
               - mediatek,mt8186-audsys
               - mediatek,mt8192-audsys
@@ -41,13 +42,26 @@ properties:
     const: 1
 
   audio-controller:
-    $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
     type: object
 
 required:
   - compatible
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8183-audiosys
+then:
+  properties:
+    audio-controller:
+      $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
+else:
+  properties:
+    audio-controller:
+      $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+
 additionalProperties: false
 
 examples:

-- 
2.50.1


