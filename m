Return-Path: <linux-gpio+bounces-24955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB87B355C9
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EA1B7A65AF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 07:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97BF2F6574;
	Tue, 26 Aug 2025 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JlRvaWF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897BB259CB6;
	Tue, 26 Aug 2025 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193982; cv=none; b=kuGn1hqTZqUwOPfRAN6DJnLjoTVszImvfbVIwt/7IrFC8EieZDR587zxa8Rn/MHhLL8xQ7mR4BONLMMAJtj+1s+gkm8aK4/TE0xxZDXuvFSbBKv/bs3JvWnCQhv9p54uRhcMHD/3EhIz6yFYcCGE4FjRUNdHV/qbpbSYK2/IApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193982; c=relaxed/simple;
	bh=RxFt5IVTUDQtMRnz+kIvAEi3r6lg/xIgb5vkotIBCak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKh5rm6rMlqGtHbkWTgSX9y1nIVsvcfU5FINmrd69VNM5QKAT66zCPEzLZCliobxVulPuLyxA3GW28LI5NrlKbktfiGC+dEjAWHRB0XVMRkaJIAotP72jwfUDdAm2PpY2QoLROfKxTwexuNF2yXkazJPZq/BC8/JbzHOLW9BYMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JlRvaWF6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193978;
	bh=RxFt5IVTUDQtMRnz+kIvAEi3r6lg/xIgb5vkotIBCak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JlRvaWF6aIZXqncQh3CJPV3C3H5m3WZfJcpGKgsXjNd1gu8WmqMicUqj00wMkpkAF
	 1Z2TKtTGL7m+WGARPg07OglJ/MX2wGQLpOo8ieJXVHm3aRmCPGSyczEhtvpMguLAfg
	 PPCD3XouAI0Nc4mGWNMlw2V/L0MjzeMQkb0okyA0HiMLs0UUuOsrMZV3JGGqo8YavG
	 06WPCls+umGNsZDr2mAlHxXeMbJd2rpOACOlfIZ32xb5CbYoXwDFj6kE2bxzzI6kp4
	 PHY5rDwgd5vZ0yvVRKeZyCznRY+HkhQrT5AINjb2z+z8neQ8ZUaZeLz6nQA2qRwpbo
	 gf40/dW2tzW9w==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF04217E0A28;
	Tue, 26 Aug 2025 09:39:37 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 09:39:34 +0200
Subject: [PATCH v3 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

The mt8183-mfgcfg node uses a power domain in its device tree node.
To prevent schema validation warnings, add the optional `power-domains`
property to the binding schema for mediatek syscon clocks.

Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../devicetree/bindings/clock/mediatek,syscon.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
index a86a64893c675ac134af609b3a49242565db6ad8..a52f90bfc9f92b52feb9f488db5550630ac55f0a 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
@@ -76,6 +76,9 @@ properties:
           - const: mediatek,mt2701-vdecsys
           - const: syscon
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 
@@ -86,6 +89,18 @@ required:
   - compatible
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8183-mfgcfg
+then:
+  properties:
+    power-domains: true
+else:
+  properties:
+    power-domains: false
+
 additionalProperties: false
 
 examples:

-- 
2.50.1


