Return-Path: <linux-gpio+bounces-28143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D0C378BE
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 20:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ABF2534F658
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 19:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DE63446A0;
	Wed,  5 Nov 2025 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="PvthaO8x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E946D343D9C;
	Wed,  5 Nov 2025 19:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372255; cv=none; b=Us5MgQVn8by/4upNwnd9u24V4Y4X1pbYTMrpB9KMOpR2rGHUP1LEPjkhMmd4RWhjtjjjvXqTxSLfg38cjD4rkJIrMQ0yl+PYsiFA5QwbVskzx/ols+y6bIS5MxVtrJXRfV8IvyMQSwC6MUXs8E3aZkqBK2u/zI8k9aCY2Jz+JXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372255; c=relaxed/simple;
	bh=BApIC7WC/UGDPeLW7zSedilTChUVgLVE+Zp2wFmqjV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUeBISU0+ZNd2SX5KBHBeqQtHF5HEXBmGcweJ9LgDN4RbhFnxI/ftEk4KMJyz8r1z9pOe4IUF8tBcKzTwiORFIHKUEhLAAqDg7Nm8ICoNO0L0agfFCgFkT4nXDAHiloMR90rqw1DIHZYTCPttu9XsXrZwo6N3b7e9O98wPtOogQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=PvthaO8x; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 0F7CF3FE64;
	Wed,  5 Nov 2025 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762372246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGHvmclXM9H1P2h0/NKYUnu6Tdto8R0Fejc6gXiCl9U=;
	b=PvthaO8xcw9IhbK8S4BV8rxbncbqKRxoLxJdRfXb9z3+wIUopkR+ur8DFq+DsYWbBH6qRz
	NtvSjzoCdXwmf+EPLsWhjUJdYleg/9xrBlBbJnB+7tr16OvZh1G42I7Rve6M/BqtAjjtUm
	FBxCLbqJSI82mBA94c/lOC0fhWvghjg=
Received: from frank-u24.. (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id C9147122700;
	Wed,  5 Nov 2025 19:50:45 +0000 (UTC)
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
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
Date: Wed,  5 Nov 2025 20:50:01 +0100
Message-ID: <20251105195007.199229-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105195007.199229-1-linux@fw-web.de>
References: <20251105195007.199229-1-linux@fw-web.de>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
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


