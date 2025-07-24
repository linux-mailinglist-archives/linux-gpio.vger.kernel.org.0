Return-Path: <linux-gpio+bounces-23719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0436B1044A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E15B35640EA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289BC292B33;
	Thu, 24 Jul 2025 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B1EOpJ3E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06330290BCD;
	Thu, 24 Jul 2025 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346405; cv=none; b=i3xsjts/EffOpB9Nk+gpID5AvbkQyggam5L3L5Ns1DQo4xE42Q/Ftj6gnhfkvxzffsk2Q/oPfQ9FEr6XNSnmSCHH3Ne6D7hAW8v3O3YL2N7M08yF6BBYNWFjbUbAfVlW+uw+6X7KbvMycsr94nSot9x1v0P8YBkW/ciiETeDdTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346405; c=relaxed/simple;
	bh=esBSalMVnvl0Uf4eNeIJU2nxBczdBlqdpwKmxJ5zN5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUHy7Cphl5ShnwK9B/NJk9Y9wpAnw/IJKi5u2+BlV9IqGYLVzfEwnGTr6Sb2lfMc8wjIWeSFDWni0/f6PEXGd7R63Yyzlm2VDNRnXgGxBufG4KFvYX8qW2I/mw3RN+FYLfL7f0do0YrWJnaHJbnNq7AIlTMmV1ugZvCkC27PsGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B1EOpJ3E; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346402;
	bh=esBSalMVnvl0Uf4eNeIJU2nxBczdBlqdpwKmxJ5zN5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1EOpJ3Eqbl29y8r6oaLBY7j7IrxKo1uw6DqBtdSpcprT97dX94NoRrGNqs799uv/
	 OlimjamnTTT+8gY2wRdNRZ61pzdyEc5ZsC2/h8sOsefn52CyCAh8Okvd13e/RohBSU
	 /U2dzL1B9O13FUb74tiGJVyrJROoMLC692X8aHLNG7iTD+/VkyxFHkhP2HO1qZcOoC
	 svwb0ewQQTNn88/QLa3MxNv8j5v3URZ0oAYlOcBu9R8It5pyByyOjo2LH9yR+TwLTE
	 kT5ZYUhHvKJ/dyMfr/OYikieVSmpbRoFefLoFGl2vCmQaABALWN8dIXuVPOam2bd9T
	 Ytcqr2afnyM+g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C67E17E11EE;
	Thu, 24 Jul 2025 10:40:00 +0200 (CEST)
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
Subject: [PATCH 14/38] dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node address
Date: Thu, 24 Jul 2025 10:38:50 +0200
Message-ID: <20250724083914.61351-15-angelogioacchino.delregno@collabora.com>
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

The dual and triple core jpeg encoder and decoder (respectively)
on MT8195 are far apart: the only way to have this to make sense
is to split those in multiple address ranges in device trees as
one big range would overlap with other IP in at least the MT8195
SoC.

Change both the jpegdec and jpegenc bindings to allow specifying
children nodes such as "jpegdec@0,10000", "jpegdec@1,0" or for
encoder "jpegenc@0,0", "jpegenc@1,0" to resolve dtbs_check issues.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml      | 2 +-
 .../devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index e5448c60e3eb..935f124a9c05 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -36,7 +36,7 @@ properties:
 
 # Required child node:
 patternProperties:
-  "^jpgdec@[0-9a-f]+$":
+  "^jpgdec@([0-9],)?[0-9a-f]+$":
     type: object
     description:
       The jpeg decoder hardware device node which should be added as subnodes to
diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index 596186497b68..d7a8f2e3bc1a 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -36,7 +36,7 @@ properties:
 
 # Required child node:
 patternProperties:
-  "^jpgenc@[0-9a-f]+$":
+  "^jpgenc@([0-9],)?[0-9a-f]+$":
     type: object
     description:
       The jpeg encoder hardware device node which should be added as subnodes to
-- 
2.50.1


