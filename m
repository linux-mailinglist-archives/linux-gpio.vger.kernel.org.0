Return-Path: <linux-gpio+bounces-24958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEDB355D4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6DD189704C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 07:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA3E2F9992;
	Tue, 26 Aug 2025 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MCOQI31a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622782F83B7;
	Tue, 26 Aug 2025 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193986; cv=none; b=UotZQ+bS8pb/Pk8KlPqEhP+HMIzXw4QpGqUd99ol6JtssW5YGB13yfZeqlnmZ/ViBPK95dWZieup567DC1j5ceT6JJwNVnqw1+/rMDhbTV2Pky+WtFXjKq8qV0C/c9uKX6Yr/k+4OudubS/kzVwglkrWvsAgpSvEPlJUdOIkUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193986; c=relaxed/simple;
	bh=aW2Q9+sI0CAe2IAr9z7+jpyyzFSeije16F6y8ecrSBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMBbAG/Md0ccyWClQc4NKrLkZXx9tO5hGL6yzekGsv9bcRLxvA1j4aOFAx/+50frOeADHx118zk9l83AtctfdGFctIg7bxcSeqDFle41x5uIHedfysmvcd5KIe/l2yRzatnfxTa2v1GRkYHvjY1DUGS02zxFjC+7z5fSf62AtHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MCOQI31a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193982;
	bh=aW2Q9+sI0CAe2IAr9z7+jpyyzFSeije16F6y8ecrSBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MCOQI31aHnYL1kWXXYH1S2LxAqoPu7z5m1jKAvJ/7TFFEy/ImpMNu7K+Vip5eh9CE
	 AtvrXDqVbtp8JCySUL0fuIBUAS5HsFs/3kJMwT9Ic503tsTpsNu4M8CW+5E2ZHAeaj
	 YSuXp1HL7f00L6UPAgqAuWYI46GnA78lPnirMfUvmm+97tJzpFqlUePvGb+vooPAOB
	 Rowz55kq60fLuVDAXe/2HQeYBhTe6FcwZ7usnfSTAzAQd9eIp9Lq8dmCXA2RWhFFIr
	 qtmGlliXRXsl0W8cST1XwKCZo88VaoVh4845u52ip8t28nHhxn/ivOZN+mtYl29cXy
	 kTDFyuxJrpfpg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DA9117E0AC3;
	Tue, 26 Aug 2025 09:39:41 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 09:39:37 +0200
Subject: [PATCH v3 4/6] arm64: dts: mt8183: Rename nodes to match audiosys
 DT schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mtk-dtb-warnings-v3-4-20e89886a20e@collabora.com>
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

The DT schema for "mediatek,mt8183-audiosys" expects an
audio-controller node inside the audiosys block. Rename
the nested AFE node from "mt8183-afe-pcm" to
"audio-controller" accordingly.

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


