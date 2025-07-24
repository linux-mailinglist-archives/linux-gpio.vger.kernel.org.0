Return-Path: <linux-gpio+bounces-23710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FFBB1040D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B035B5652FD
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723FD28136E;
	Thu, 24 Jul 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CmSfABGE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5CB27FB2E;
	Thu, 24 Jul 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346382; cv=none; b=Tqtpfm6I2wDR4qY+evJTQsU98iLLTFQbaGh5UlxEMVerjnO6z7dmFGOQSe3VKEQJ0crdK6zlJwumDFqq3R/YIKnXPGD8hOFiyCceuE/DDIBryhLj17l5QnyGDZAwr/YJDkFryxjPHD7ervO57jzAVCEq7wGqfPkS+D21cufN6sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346382; c=relaxed/simple;
	bh=6CgbYs3SG2IR6WIZz01cZuVTz2VzyFQJdQsRvlhNBo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wm85qBkUS2uxCqb2zdqaiFGGnfpKFjBdY38jgKPrqQ1wGAl1P+XbEt8d0SusomrXV+Sf6hjdp2qic+lsOOGc8H2mc/bf3j4KSgEZbeK/Y0ZnpJuRShfBPFqO9zikOXbT71GkZJn0r1M182szAfg/jERovGv7H6mn9+26wqGxRkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CmSfABGE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346378;
	bh=6CgbYs3SG2IR6WIZz01cZuVTz2VzyFQJdQsRvlhNBo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CmSfABGEc8SQw0UJmpA97+uocr/ZovezaTEshYPAzq55rdKnILTp02leZFhic30z3
	 cEZMbLP47944DCFUF6i5hI3ulQ6p3hP2CXBQqtSTH9WyfHjaJqfQdgD/1jkxOg4K0y
	 ivNDqW4PrzDlDnVh8RbG5CTNHbf4S1e52ykLUeMwhQk5ZG10tmXT/kF2Xl3VAOT8Sb
	 5Qwy5Hpw0T0eJoipf68Fm84rCeWcLNGbJnDUQ8l4IvK+FV5zvw33JDLSCUwhXyDDaY
	 0i6lz2f2l63t0ZHd17QgS9tyn8gI/yEUCZ2dvE2gcvA23e0D1LLQ4MsqMnSe2PxrWh
	 xziwGKfC63Lyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4679617E129E;
	Thu, 24 Jul 2025 10:39:36 +0200 (CEST)
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
Subject: [PATCH 05/38] dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
Date: Thu, 24 Jul 2025 10:38:41 +0200
Message-ID: <20250724083914.61351-6-angelogioacchino.delregno@collabora.com>
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

Not all IP implementations of EIP97 and EIP197 have the EIP and
MEM interrupts hooked up to the SoC, and those are not required
for functionality as status for both can be polled (and anyway
there's even no real need to poll, but that's another story).

As an example of this, the MediaTek MT7968A and MT7986B SoCs do
not have those two interrupts hooked up to their irq controlller.

For this reason, make the EIP and MEM interrupt optional.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/crypto/inside-secure,safexcel.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 343e2d04c797..22025b23d580 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -26,9 +26,11 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 4
     maxItems: 6
 
   interrupt-names:
+    minItems: 4
     items:
       - const: ring0
       - const: ring1
-- 
2.50.1


