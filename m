Return-Path: <linux-gpio+bounces-23706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2855CB103F1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 660B156557A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAFA279907;
	Thu, 24 Jul 2025 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PiWWw/qQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E514927933E;
	Thu, 24 Jul 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346371; cv=none; b=MKVS7Jmd1k9bXQoN4rusWZEzWz7OCMspNEMa2KLJ8jqXNfzayZHg5cAaxGOO2EgfraOBh7wWmy+upxfXNRpbYz5VuFbZj8YlYlG3jB7v+Lb5bnS5wU9ChgId/Z9nZc+r9qhNGGgACFeOFEnziTFBaxstVMane8kP0WQQf1uvuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346371; c=relaxed/simple;
	bh=C1+/i/ErI18ZOP+0IOrZb/kmhFbH+QoSzn1301uaDD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyBkoWdw+pIsyb7YgdVTSci6XNhofeW+d/AufAA84SgEVyptjr43eVo8c2y63sqUY3B8HYpy9hg0WvWYZ17TkRcgYO3VHPi7Qu62tvULLV5Ui8BdknJAP+ibebfruYHcG9MY8QzfJY9USsSeFCsmkpS8xzYTi4U4Q2Au8P93rU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PiWWw/qQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346368;
	bh=C1+/i/ErI18ZOP+0IOrZb/kmhFbH+QoSzn1301uaDD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PiWWw/qQ53kM3WLXlRAKjBf2BkR9Z5X/5+/9OP78d9b3B2H+qS9HDBeUZyRsiSXun
	 TlvGTve+71b2zEzW8W3RXGPmtHTLIlcHBd9VnhL/tb+kvCHb/8YA4xG89kmIWyqSpU
	 numRbZSkwVBk8s0zwBhKrdbOHXYPHrK2ERgqfrIizezf+sjtucdb9xsakpVgrZmC5n
	 XD2ZgAIZAivRK5MbdH00EBnTiCtnxYhnDi+lENbqQwf0mKbVv2kT9nbx7cNNWsXnKN
	 q58VF56KGmFrYHCPzmYUuqQJS3dQKCRYqw2l5Cyiyl4ZX71tmENhYaz/LXl8IO6awZ
	 9Oa9gSCeSEzZw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB66117E1062;
	Thu, 24 Jul 2025 10:39:25 +0200 (CEST)
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
Subject: [PATCH 01/38] dt-bindings: display: mediatek: dpi: Allow specifying resets
Date: Thu, 24 Jul 2025 10:38:37 +0200
Message-ID: <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
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

Even though the DPI IP has a reset bit on all MediaTek SoCs, it
is optional, and has always been unused until MT8195; specifically:
on older SoCs, like MT8173, the reset bit is located in MMSYS, and
on newer SoCs, like MT8195, it is located in VDOSYS.

For this reason, allow specifying the resets and reset-names on
all MediaTek SoCs.

Those properties are optional because there are multiple ways to
reset this IP and the reset lines in MM/VDO are used only if the
IP cannot perform warm-reset.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index b659d79393a8..eb4f276e8dc4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -102,6 +102,13 @@ properties:
       - port@0
       - port@1
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: dpi
+
 required:
   - compatible
   - reg
-- 
2.50.1


