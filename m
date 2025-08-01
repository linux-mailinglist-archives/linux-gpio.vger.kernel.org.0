Return-Path: <linux-gpio+bounces-23938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25AB180CE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5454A174C30
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFE724418E;
	Fri,  1 Aug 2025 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kyAnGIB9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A70239E69;
	Fri,  1 Aug 2025 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047090; cv=none; b=lq4R85hCwDDUJgzPAbAgDMDTxA9Gt0qAVVW1vyjgMiwdHi7ysOisV9ELxAvSlk7ggdQogj5aAbQNkL3voFE9UnI0UQTdpXkaxiGefc39C3EVcfkqJcn8unmFzm7ivtmixVsOg1GDczjB4MYQQ62Gb982n7g16/J3S47af6ZR4Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047090; c=relaxed/simple;
	bh=vU24Rbtm0qkvmBCpmr+GYFE8OyNzvp1wYgPZVrYsMQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=abAKMciuUUD3prp/Eb0ZECcZHdCGszLEMaCi+mvnkYi8SDxVWvKrWgv91ynd56xWQHz/wY9+tDaT+HOnO9vqBuAC2y9E7Hv6W8cpogPmsWgdZEBQEj1yXeKwwFfhDRofbtEE6oRmd3ZAZxCSCBPIguxBvndXhJlTE733r60qGlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kyAnGIB9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047087;
	bh=vU24Rbtm0qkvmBCpmr+GYFE8OyNzvp1wYgPZVrYsMQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kyAnGIB98LHZRdNTavPx6q1F35dD8JxU7OTKE/GovJYD2QCneLHNNMusM/Nuauwkm
	 lea4bGbFwhrne0by4YUTPvTOC6U3KnKcBD6+LoqV7vz5f/lHf5e8CPjiWHQCz+Fwvk
	 5nyMhpgQluT/QGcXGSc9FLSgqSy1SoefIYDKkIk6OGm1eN/QgdW5Ad27Dj2APN2Emt
	 xtorYFTGeVaPeIjlSzzM3SdMT8D3rSPj7bDGO0v6hCUYCojAEpzwPswIRCmmQOY5gH
	 yPHe4H79ib6M+OO5CKPNb2lqd5Mbs8EaLItATf+pznXn1uoS2YOGX1t+QNyYxnf5eM
	 oQfH1/W4HJg5A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04F6417E0256;
	Fri,  1 Aug 2025 13:18:05 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:03 +0200
Subject: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
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

Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/clock/mediatek,syscon.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
index a86a64893c675ac134af609b3a49242565db6ad8..1011bc46cfcb97b90b86019e95a7e4bc8a819342 100644
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
 

-- 
2.50.1


