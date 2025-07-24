Return-Path: <linux-gpio+bounces-23712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66442B10418
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E90E51CC4CF1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D772857CB;
	Thu, 24 Jul 2025 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C+91o06L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A17283FF5;
	Thu, 24 Jul 2025 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346387; cv=none; b=G1up+XUM7YUm6occ5KX46AvVz7cs9jmuE+deWntsoIz1XAw2EuFNiLfR4oyWrhu2+TBnQTxtJeyew8QI4QWupv3bWuzjkx19E9ZKKvMCCyUM0y0/AFhQZggvV2fMtc9BzvpvQ9qMyeSe6puFs70as/S0sUsLkq+J+uuEMjMmM9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346387; c=relaxed/simple;
	bh=2Ol/rXh3JePROm0kGdOiJwqhaq28C241b3Z5h9WBx58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLKLivndOEayPM6YNj4ec6K59biLKSbBWxK3D/WmqFSux44FiSD4GmNXvqb3Y3xfGAP+6ue51bGfriB+Rm1kKS3K5cSwPnYmOfELfx/LosHzSxC1tb/djzVcXhe/nO43WmRQBKM9E0wZxfYNo/G9XZFXHXOTWKDcMWk+UixvMnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C+91o06L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346384;
	bh=2Ol/rXh3JePROm0kGdOiJwqhaq28C241b3Z5h9WBx58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+91o06L67bZlF3uFLuTSAY5uiIfp+CXLEY6o9toNih2gZ1dZFnNGalpl0YULHlej
	 ed7B4UX98wAJvv0iAZ/7SBXv8QQXdrTq++9HvFn0oaP7Wu3WnCZX8dj0+6Hg1ekGQK
	 Y33VrP18aZV4JNB4gEruOO4BWO1cEHHmzh3ohVTY/T1jFpRb13+5hwKM83HdyiMsBm
	 22PauR22qAZRpeXO3arjJ36Z5IaSXzZshV17UF4IXuxQ0sJPW186pXj/H5+cW/Vzwo
	 RWZo7iOJK34hSkz8HRlV8G36UH5k3CY3z0u5JGhjFNTMk3MWd0Ss3n3b/cjucvV18j
	 8LQ8qI5Ouy1Lg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 918F617E1314;
	Thu, 24 Jul 2025 10:39:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	jassisinghbrar@gmail.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	atenart@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	houlong.wei@mediatek.com,
	kyrie.wu@mediatek.corp-partner.google.com,
	andy.teng@mediatek.com,
	tinghan.shen@mediatek.com,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	olivia.wen@mediatek.com,
	granquet@baylibre.com,
	eugen.hristev@linaro.org,
	arnd@arndb.de,
	sam.shih@mediatek.com,
	jieyy.yang@mediatek.com,
	frank-w@public-files.de,
	mwalle@kernel.org,
	fparent@baylibre.com,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 07/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing pwm_ch7_2
Date: Thu, 24 Jul 2025 10:38:43 +0200
Message-ID: <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7622 SoC has a PWM channel 7-2 group for the pwm7 IP: add
the missing pwm_ch7_2 group.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 9acca85184fa..57b19031925d 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -204,7 +204,7 @@ patternProperties:
                            pwm_ch2_2, pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0,
                            pwm_ch4_1, pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1,
                            pwm_ch5_2, pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3,
-                           pwm_ch7_0, pwm_0, pwm_1]
+                           pwm_ch7_0, pwm_ch7_2, pwm_0, pwm_1]
           - if:
               properties:
                 function:
-- 
2.50.1


