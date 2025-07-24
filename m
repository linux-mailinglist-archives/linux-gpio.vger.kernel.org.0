Return-Path: <linux-gpio+bounces-23708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41389B10402
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 976841CC4CF1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3209327F19F;
	Thu, 24 Jul 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oOtIKsc0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D32275104;
	Thu, 24 Jul 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346379; cv=none; b=gPPTzMLIvD9TcSaapDY0Y17koQoselhsEB4i944rAS7uQz8jf2fcvYoblAxeaNSFK0u5uS120RIeOsEyz9e2eAKZZ+wkhxluT7rulPpF0j9/yp86VmOMDQSUGQI5Qv0NtoLnCqZsPmdSbahPjGXRdtK0GHsgtuUMWX3CkxQc4rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346379; c=relaxed/simple;
	bh=JpQk+FGZsDFw2WNBbFKeKhta2M3RGl/yx4vMeoVONmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFo3NYgqY4sVrPYNm5FRKGYLtrYB1j4Ho7RCf5yDh8T9PoSMEj9+cmGa5vo5bMWSO2L5Jb1WcdqWl9d4VQNAaFRFjfPPxh9N6neuFcAWQpCFyTQXfRBTr/MrVYYeKwasv5YTrtkf5eAkldY6g2VBaqDyIpS2d2pKpf9JYI4CcW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oOtIKsc0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346373;
	bh=JpQk+FGZsDFw2WNBbFKeKhta2M3RGl/yx4vMeoVONmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oOtIKsc0p7Y/dpdGR5/Mn8nvRa1T1EtOXoL59Vd5dV6TXjXHxTWeVn3lcw6mhzTbv
	 80vFyrBxNI5Hzlo7MJW/MB5jjTz76t+v0HaHX/YpfDpseR6cYhTVWrK19EZy2X5B2N
	 B1ygduk3LZTL5l2kceKyxA6i55igPGeFcy9EaCFz8BjLFp/PNnWrQeaock6NbiwR2q
	 t8VD/W7Eg5NSqFcI9/XRqyRzU2Ob/bTPPSTr1Snf7JFQAzOVrNWXDznN4Bz23aKTwV
	 4fkaj9azqpu1VQkmtBrk0kR+FNJrV3Rxmm2fG20vWxAtPOJ8SAXbw9KIqjhmNyy32Q
	 h83XdTw5L9clg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2F9617E128C;
	Thu, 24 Jul 2025 10:39:30 +0200 (CEST)
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
Subject: [PATCH 03/38] dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional
Date: Thu, 24 Jul 2025 10:38:39 +0200
Message-ID: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
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

The GCE Mailbox needs only one clock and the clock-names can be
used only by the driver (which, for instance, does not use it),
and this is true for all of the currently supported MediaTek SoCs.

Stop requiring to specify clock-names on all non-MT8195 GCEs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index 73d6db34d64a..587126d03fc6 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -60,17 +60,6 @@ required:
   - interrupts
   - clocks
 
-allOf:
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              const: mediatek,mt8195-gce
-    then:
-      required:
-        - clock-names
-
 additionalProperties: false
 
 examples:
-- 
2.50.1


