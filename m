Return-Path: <linux-gpio+bounces-23715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24045B1043E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21AE17B766D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9BC289E12;
	Thu, 24 Jul 2025 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A0xSFSrw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89C288CBF;
	Thu, 24 Jul 2025 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346395; cv=none; b=I6Y9ityBbfR9h1DOW1QAQ+8Gjt6WbQowSQ/j8cvQDG6Yf215XMqPOAnIjLMVFNZEnUYBpGroKTO/3l7guiZ0MSxPq4VZWTm8YL/OkkjAvlJWb+qJl+sYD9ZXfYcrh+Oaw+WnNHr8BCIzF8hp1IwRcgZ4RBJGoFJr5L66uF49neA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346395; c=relaxed/simple;
	bh=HaevetnnFKHRcc+1X06S28eq0CnYSBndrM5Inix6OWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHdPB/AUtW1HLrMoTw0y8cLx5W2Gf6Ci0s4q1xfnkCtJXhJcMGiJ76A0R4ra/ff2exYEiL/2V/6DK4wZ8b+8xygVQg1e9rWymiyk90XUoFPifTphEoR79W3sEy3CQluFDJawDEt2r64ojBVAqMTylS24mFhGeqAFdnhxei9aSuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A0xSFSrw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346392;
	bh=HaevetnnFKHRcc+1X06S28eq0CnYSBndrM5Inix6OWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0xSFSrwXmhFdEpFiRIOiNyey3TgbknRE5XDUw1F5tUVQsL5f3WK/l2eKQoWsNmRo
	 yH8XaCq0zkGZRPW0Qgi9g5jVNN3j1g7JR6PJlOCxt4ruz0mWBJHOnyRy6d4XxDyqf0
	 UQobqYC9ol5z4zOej529l1Qe/7xQbkJrMikUfRAXGUlnIM3wcHdbWcfzzjCPLEF50z
	 CGAwS4lSyM6+9V3UFJKb0Utew0gYeNpbHXhNhTQIEuPEJ6c/uCBh8SehctDl/Faqy5
	 OcQu8iPCfO1jKE/q7cjVlaxxRtDcPl8qvYVc67mm4HXEsdsNdl8WYHzRWlYtMBnqX/
	 9TwJmccLNoygw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8073D17E1298;
	Thu, 24 Jul 2025 10:39:49 +0200 (CEST)
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
Subject: [PATCH 10/38] dt-bindings: regulator: mediatek,mt6332-regulator: Add missing compatible
Date: Thu, 24 Jul 2025 10:38:46 +0200
Message-ID: <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>
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

This binding had no compatible and for this reason would not be
applied to anything: add the missing "mediatek,mt6332-regulator"
compatible.

Fixes: e22943e32e1f regulator: ("Add bindings for MT6332 regulator")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6332-regulator.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
index 2eb512c29a0d..475f18d4f261 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
@@ -15,6 +15,10 @@ description: |
   buck-<name> and ldo-<name>.
   MT6332 regulators node should be sub node of the MT6397 MFD node.
 
+properties:
+  compatible:
+    const: mediatek,mt6332-regulator
+
 patternProperties:
   "^buck-v(dram|dvfs2|pa|rf18a|rf18b|sbst)$":
     type: object
@@ -36,6 +40,9 @@ patternProperties:
 
     unevaluatedProperties: false
 
+required:
+  - compatible
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


