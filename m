Return-Path: <linux-gpio+bounces-24630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4CB2DE37
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42460624010
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A9312DDA1;
	Wed, 20 Aug 2025 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H+lEeV9z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65531321F30;
	Wed, 20 Aug 2025 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697509; cv=none; b=TRw0fP65nUfibvcVeJ7UUiAOHGL9BDcENrKfGQLxVmUZ3VMTJAZ/w0OZlNXYXr56cSl1rGEkUFtz05ngSByReZ/Nku/7C8Nr1uWLBzF5dS7WorClN9FVXQgdny3xQHT4BGtqX9Ljg+6ncmPXMyPeVUclHX2+BuwBGdXJUO3EGdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697509; c=relaxed/simple;
	bh=keqQ2xZ0sdAS0oPaKqt6wskG0D4xPK4UxWY6DKh4MoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2/uSOAtUWyv0OT+2OBllnLDN2J6US6s8wXhL84r2/mduFnVEmIPMRC3ygdRO9W4R/+aQZFx+r/jhUMk0fY2rJh9hpYyjPuyHRkPYqDJ7fuKvSDqKYEDbHOFgG/svOOtKcm1giwmqpwF4hPcbVnVL7ua4067Zq5rO6YBxRbeQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H+lEeV9z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697505;
	bh=keqQ2xZ0sdAS0oPaKqt6wskG0D4xPK4UxWY6DKh4MoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H+lEeV9zRj7xTisUsvLdFrpFRDjymLKHDWi/TLUgplPYytcqIOkfwcrlmXK96cgvV
	 hVBRrPS/XBrOToFpF7HCQl2xPfxaBYkyuWJGyANZ8KLdspNvOsoDuyi7dYFw0doNLh
	 ksaJb71aRt54f8Ma1uZsL+HDMnqdP7eXQxf6/6lEpiQeubaF1tgJIIHoDQmH5D//fK
	 BmgutZnTmSuv6aSBv2mA1ZOLAFqEQ+3YUqNM4RqqEirKk/jiWnrYFU2sLKyEcL0Fvv
	 K5ERELC/Zui0nLSeWZ9ljHXb2O06U9jnTkBT1WjUYouRxJKzGyHqAmkgep4klnNZUw
	 VstIEovzY6EDg==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A0EDD17E1324;
	Wed, 20 Aug 2025 15:45:04 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 20 Aug 2025 15:44:55 +0200
Subject: [PATCH v2 4/6] arm64: dts: mt8183: Rename nodes to match audiosys
 binding schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-mtk-dtb-warnings-v2-4-cf4721e58f4e@collabora.com>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
In-Reply-To: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
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

The binding for "mediatek,mt8183-audiosys" expects an audio-controller
node inside the audiosys block. Rename the nested AFE node from
"mt8183-afe-pcm" to "audio-controller" accordingly.

Also rename the audiosys node itself from "audio-controller" to
"clock-controller" to better reflect its function.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3c1fe80e64b9c5e32703f1e8663942a24543cf23..e2500e3c3f66d12a6fd19f29fa9fd63a6f04821f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1445,11 +1445,11 @@ usb_host: usb@11200000 {
 			};
 		};
 
-		audiosys: audio-controller@11220000 {
+		audiosys: clock-controller@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
 			#clock-cells = <1>;
-			afe: mt8183-afe-pcm {
+			afe: audio-controller {
 				compatible = "mediatek,mt8183-audio";
 				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
 				resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;

-- 
2.50.1


