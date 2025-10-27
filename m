Return-Path: <linux-gpio+bounces-27675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F65C0E057
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5D71894E51
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59E92D7DD8;
	Mon, 27 Oct 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="p3ZmxgUN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0E29B20D;
	Mon, 27 Oct 2025 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571716; cv=none; b=KgyioLpoySJXvRD/BCDwhjB9FdSDteaiwZU7ktdS3SM2ziwxAYA+o48RsHdr1Nt/RNADmPTN2etLEXAceLORg4Mkho8mQ5mBWzRRxxQ9yUi/YFYC3FDNqcxTFthhhwveqOdyzyyUoYspP6ElHoa3f08KYRiQZxxlujLrXMlwmrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571716; c=relaxed/simple;
	bh=rtRyEZxh/e/3s1Pc99Lo5xagFYojwdziJp+Jh62MM20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIkxdS0NevarrsBYgEZCDWwCWBbXiUe4BXvEQ0B4e8y0wEuP456LWO51NO18eQLwF4Xb0pdBe41W2+yor1jVTDOOuT2sQUUQZrs3j5nPq4R5ldOB9pg43MMR32p+ITvn3VAsviR8t8RZVc6QXB5O1I32KLInQpTU+feaelSzaAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=p3ZmxgUN; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 4B64A100158;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfxtG6mCBUgxRKKh/xqX5BFjaduIh8xakoWKvO9aMcE=;
	b=p3ZmxgUNL2BJpE5yYiFbABjhAXEsuIKc/vR5NX2oYkiA7pq0kqVPNonXB2pn4J7a2hehmL
	F0F5M/TBubVwi4Mig3SMyrB7hQjPhdY+3VBxCUjrsIHZBeT4AJjLEAbkiH36ty43vPuGEL
	LQGUo1uK2nDfYEa2CVzMRZTUxVq7gNQ=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 1934E122702;
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
Subject: [PATCH v1 1/6] dt-bindings: pinctrl: mt7988: allow gpio-hogs
Date: Mon, 27 Oct 2025 14:28:11 +0100
Message-ID: <20251027132817.212534-2-linux@fw-web.de>
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

Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
index 26dfe7e7735a..1f31b520cb43 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
@@ -61,6 +61,11 @@ required:
   - "#gpio-cells"
 
 patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
   '-pins$':
     type: object
     additionalProperties: false
-- 
2.43.0


