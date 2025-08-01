Return-Path: <linux-gpio+bounces-23945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFAB180E7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94F8A564744
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A6B261393;
	Fri,  1 Aug 2025 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sylu1IPz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02A2571D8;
	Fri,  1 Aug 2025 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047098; cv=none; b=DieI9aUmV1+vPUn2FRLtsp0CyByk3Sbg9RxcB1AvE0KHFpUfK5YdWw9shpbIbHLKUtrc447FsB7T8/8yO009U7pHX7aEPeyUyyortKJW9M3YnjZmlZTeaFYT6ggbYqv7x4HUIMaSghF/HtCVC4gL3ucEONWppza0ubm8ukjlwGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047098; c=relaxed/simple;
	bh=qCAbH5/K+Dtx0sCXtdtamZe11GmeegYKDESNn8Qmre4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9lUlqi+MRXd/Ysg9pZNesxCOKFEXu+LULd8OgP5Pt+U/E3tKorFCtEQBWOfJAPMa4gsNLbom8yrjIWOJsGc/KS8kYhpxjufx1EbxREzqvACsmVJ0ACmTAE+vHNNhEderLILyfg/JM8Tg0SSBHMi8apMGoN6z8j3C9M4sOZNemU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sylu1IPz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047094;
	bh=qCAbH5/K+Dtx0sCXtdtamZe11GmeegYKDESNn8Qmre4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sylu1IPzGajMo8Iqz67dcl0WknNLdG7VD0UXc5ms75zW/51uN+iveZJT8yjIM4dwz
	 Abldbt5ctmcvRFBBypyM52pNNL+MS3VNhL6KURKKeRnZKnAX2wSt3yEN/mxrrIag5V
	 JsqVbxl+V8jFKW30x1iEJ4h5uJ7+uWbNqu3juIlx+7DoQss+xyme4jDprdGMhmhGPu
	 0ikn5q8fHuwa4zvS+lQykUW4d/6jRPvSVq0aDVTzekeMo4porvaSwEnMt1ikym+Sxx
	 zBtzpX5QmdXCJx9gupxAkKxbpQDrBZht3ozywccqt3cxs862kMHKSIBjXHGgrkgBeS
	 Ic/6m0xAHfMnw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9EA817E0256;
	Fri,  1 Aug 2025 13:18:13 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:09 +0200
Subject: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow
 gpio-line-names
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
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

Add support for the 'gpio-line-names' property in the MT8183 pinctrl
binding.
This allows naming the GPIOs, which is already done in several
device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
mt8183-kukui-krane.dtsi), but was previously generating DT schema
warnings.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 464879274cae4c5389f1210ba65c316ce6c433f7..3db2438fadc78bb45ae7f137abfbab14e462d138 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -48,6 +48,8 @@ properties:
     description:
       GPIO valid number range.
 
+  gpio-line-names: true
+
   interrupt-controller: true
 
   interrupts:

-- 
2.50.1


