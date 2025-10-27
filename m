Return-Path: <linux-gpio+bounces-27677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83540C0E066
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB333189C23A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBD52D879C;
	Mon, 27 Oct 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="fLi9+wPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC2D1DFCB;
	Mon, 27 Oct 2025 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571716; cv=none; b=ZsgxNLoryNxXkdah0iENWN0do7aQPbTMOH0fV34HisUAfqJIwvQjQbdxmKkDKOcV2dKlU/41kNuaD6Ghy+yaaIvEl4nhJztsa4m9kYwO1TkG/BaQ8je3AkeV0FWxLdqdU6uD+9uMkv6FZ/nMyJ98/iItkk4Oj5BFmJVDg+JJCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571716; c=relaxed/simple;
	bh=JWbfASbuimZETtXEN0KByOooU+J3m3fugxGcCOzsO8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WuG0e4uR/qdQy6prOE11JfXl2HJ0kp6HSWUmArojKvxBDVK2RdZzmqMJng8zrMAduXpkvIvnGIcJkTDXfMfhyRkXANZfGfR2rT6+3vCFac+vrB/WWN3EADoVdgCTViBgn+GiB2nC/uCf9MHXUOLADaLjc2uSYVLI+jkaTBbzfeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=fLi9+wPM; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 84C9F40387;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqlIcQ125tvk4GEsuF0dRqlzo9uSCVG9LCT4o/o97ao=;
	b=fLi9+wPMwhG7i0jNQFK+RZTNCe5HSZM/u7QhAOyR4HIwX3g4oeuZtksXy55V4Vs0LAuf68
	KgJiQ+XfhDSFQyuONuhgYS3DZhy2WaeRfcJ5gC6VbykHgfkL9QhgaiFoLMkqJLUJuQlisQ
	vMl//6Qtm9UDyXZ2cKobLjdnYkNJLuw=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 4F6761226C0;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 2/6] dt-bindings: arm: mediatek: add BPI-R4 Pro board
Date: Mon, 27 Oct 2025 14:28:12 +0100
Message-ID: <20251027132817.212534-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027132817.212534-1-linux@fw-web.de>
References: <20251027132817.212534-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

Add compatibles for Bananapi R4 Pro boards.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..d09732ec8c89 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -113,6 +113,12 @@ properties:
           - const: bananapi,bpi-r4-2g5
           - const: bananapi,bpi-r4
           - const: mediatek,mt7988a
+      - items:
+          - enum:
+              - bananapi,bpi-r4-pro-4e
+              - bananapi,bpi-r4-pro-8x
+          - const: bananapi,bpi-r4-pro
+          - const: mediatek,mt7988a
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.43.0


