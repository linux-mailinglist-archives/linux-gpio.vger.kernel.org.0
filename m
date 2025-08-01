Return-Path: <linux-gpio+bounces-23941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B2B180DA
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 13:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3BFAA84EA7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8326024887E;
	Fri,  1 Aug 2025 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pIKXTBca"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC42459CD;
	Fri,  1 Aug 2025 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047093; cv=none; b=MZ1KQmqG0IS8fKBIpxQLrv5+ACWa+NVjOyJATpW0aIl/iCr5N8cHLsmtYAs6JzqJpeGhxzelEing1/Tp6I9VXHt4UK3WHaDmVwXYzxcRGuARtV4wRjBA+zVLlJFNTiz3PWBahT464r7ygWqA/M4EsOSitBu5FnD/6Tb66YfmX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047093; c=relaxed/simple;
	bh=bRr2a7sQwiBwtC+x6Fs6orMifRMyL8n9C/3E/xqqXrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8eR0DZIKtCmlBfz/CDx4MfYF3IkfyufBnyy+DEyxjMmHvWa2D0w0Wmbz7mnRfmAw7/JDWa90EWv6OPFRlxwriQRdGQ3wCAr4+Ogh63CP4LwFM6hHTCdJP2yByEaAyEKNEJmgWxdasICNVF7HkC/L42+b/5oR6bsxJExCBGt9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pIKXTBca; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047089;
	bh=bRr2a7sQwiBwtC+x6Fs6orMifRMyL8n9C/3E/xqqXrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pIKXTBcaxkzxthd0ZuRtQp9ig009lWy+s+JJ+kNxAXOyivD+ioEISgiS+R/syfHO3
	 q95Wxl1sUA/8UCp/3GgB+trml2qgeMb5d1/j0UMmr52tZ3xFKZuf+lt/NDyArqP4+X
	 rajAewKMS79OmMgS1j1GZ4N8SiYBE3jFPHRWME7jLWlxnzqEoiNzzsNs/uuxt2heFh
	 P/xX9dYm9mu7bBIOhpRHGe2NGgcY9KocKopEbzNHfbLeQW6BUz1yEbKLNd3PJN2K+D
	 1XjB85xrC3BNkDavyH6M1+84odGjv2/RI390KuWtLZExHIoYPA/QrZuG8rbxnRYF/k
	 oLXrZHp3ONXzg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E90E17E0F3C;
	Fri,  1 Aug 2025 13:18:08 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:05 +0200
Subject: [PATCH 3/9] arm64: dts: mt8183: Rename nodes to match audiosys
 binding schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-3-6ba4e432427b@collabora.com>
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

The binding for "mediatek,mt8183-audiosys" expects an audio-controller
node inside the audiosys block. Rename the nested AFE node from
"mt8183-afe-pcm" to "audio-controller" accordingly.

Also rename the audiosys node itself from "audio-controller" to
"clock-controller" to better reflect its function.

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


