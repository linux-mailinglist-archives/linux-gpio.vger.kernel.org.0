Return-Path: <linux-gpio+bounces-23717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1856B1043C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 026E4584C30
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC33E28C877;
	Thu, 24 Jul 2025 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OlrWJURe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A9E28C2AA;
	Thu, 24 Jul 2025 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346400; cv=none; b=IYj80zLCKsxHPoqaNjW3BXUqR8gh09CzEEp+q6iCXCyBB7EetnIA2j4tBDX/vrqs8Y8iRH2IcDy7KIftL62IptxpsylAcizuPj+B0sPK5LhyKu288c1ecvy71j2yxi+Bm12TYfm+n8qvBSoGlPu6vw7+2laus+kY6QLyyHzbzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346400; c=relaxed/simple;
	bh=jcKtkqOWpg9P4oY5xy/RlTOoT9vxXXHhnzs4o6P45RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+/wnhmGanaWli8smQvRGmvPUh3vKbHJEnFvsuzhdvU9DWVdf1cKQbne6XGm1EUw2Zk5wMjnYyROeJx+DuRphQEWCIYHX+7qVyqAVsudfkZxATPsbKDgOT2ZaOT73GMy9DgU56tQQSox/pSE2rwCAtj3UrsTs8cLWHJeI7A2W1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OlrWJURe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346397;
	bh=jcKtkqOWpg9P4oY5xy/RlTOoT9vxXXHhnzs4o6P45RI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OlrWJUReDGWMJT23zcuQ9RsovThXX4BJuN2UJNnZR51ml3FJ0erxI3z3G3S8ti8ch
	 ptKwHGjnOxZde1q79v+oaF6DHpQOBI7ZDZ9q8DkLIIAC7E0FWlZIeOnZBrQsxiNS9m
	 PxEy0BwDsy8UCcDUUw47Qiq1+q3xByx76ovR65S4gHLTYypU/8XWtoY7IX7p55RXLT
	 yCfU/pnW5ND1sK/F6n9ho/Pu/vdsuIZ6w4wy3FqfqcXWU4CkNvulQIn0qfMmnvVMsI
	 z/E21qE4992P42BWn/v5qCaz8LomrXr77gZ/7O0mrJNMDNog9bOJ5HF2cIpqH76GB+
	 RsTrGA9xlCo+g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C89E917E1110;
	Thu, 24 Jul 2025 10:39:54 +0200 (CEST)
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
Subject: [PATCH 12/38] dt-bindings: regulator: mediatek,mt6331: Add missing compatible
Date: Thu, 24 Jul 2025 10:38:48 +0200
Message-ID: <20250724083914.61351-13-angelogioacchino.delregno@collabora.com>
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
applied to anything: add the missing "mediatek,mt6331-regulator"
comaptible.

Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6331-regulator.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
index 6006a973b865..c654acf13768 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
@@ -15,6 +15,10 @@ description: |
   buck-<name> and ldo-<name>.
   MT6331 regulators node should be sub node of the MT6397 MFD node.
 
+properties:
+  compatible:
+    const: mediatek,mt6331-regulator
+
 patternProperties:
   "^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$":
     type: object
@@ -82,6 +86,9 @@ patternProperties:
 
     unevaluatedProperties: false
 
+required:
+  - compatible
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


