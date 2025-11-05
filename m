Return-Path: <linux-gpio+bounces-28142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84391C378C4
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 20:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53B991A20A19
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 19:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDDD34405D;
	Wed,  5 Nov 2025 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="xNila5jx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0A9343210;
	Wed,  5 Nov 2025 19:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372255; cv=none; b=KkomZbzQf0CwiISL5uGn4T8KEFl30WhEOcRhMZEW58bDPnVw01GSQwi+/XbLQ5WyhL7L9jSJYgETHW6GxaylhInOiLXzcoLb62Ihb+JiB0DlUhhbjgxNJjdgQxiVLO9Kgz2/+Yf47Z/7y87hxL33RkRpecmFA10c7md+xVKOciY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372255; c=relaxed/simple;
	bh=TPlpaIJb65fB+BJU7pTEfvol/YI5xQpeCf+LtY9C0Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3jHd5tmDj2+CYoto3kbrYGfA+d5wwuEGjmafby9bQyJVe0bsRMy9VrpmjTrC4t/rgtk+C1Dc8jhl5e39JSQQm+wZHZ/zhsvc9Axs0/9IYMVZBzbEcRPahLrJwb1DazxhWzwDuYgHaaOpDZCnLsh8OLslr7Qijkto0ko4De19e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=xNila5jx; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 4B8035FE53;
	Wed,  5 Nov 2025 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762372246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njGFNxEGsWT1HEaUNy2JR2tPCJQJ1ORiV4dMFFMKhvw=;
	b=xNila5jxsPhQRgGc0adMlYSqjdFDlS5wU672R3OawVM3l5GJ2eoSc6iyE88KRHNTiwfvD5
	EWiBkUB06nUg5fhMaPiv3oIF5ydXkcwFZrJ+ycmXhlNVHII5Wi6rqy1sNEa2qhDGm4huPW
	fRjWYaGSs8t0/a258QlophaK8ALSHWc=
Received: from frank-u24.. (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 11A4F1226DD;
	Wed,  5 Nov 2025 19:50:46 +0000 (UTC)
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
Subject: [PATCH v2 2/5] arm64: dts: mediatek: mt7988: Disable 2.5G phy and enable at board layer
Date: Wed,  5 Nov 2025 20:50:02 +0100
Message-ID: <20251105195007.199229-3-linux@fw-web.de>
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

The internal 2.5G phy of mt7988 is only used by some specific board
variants.
Disable it by default and enable it where needed.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
index 6f0c81e3fd94..0e41c07d3a5f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
@@ -19,4 +19,5 @@ &gmac1 {
 &int_2p5g_phy {
 	pinctrl-0 = <&i2p5gbe_led0_pins>;
 	pinctrl-names = "i2p5gbe-led";
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 366203a72d6d..ed4b592c9dd5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -995,6 +995,7 @@ mdio_bus: mdio-bus {
 				int_2p5g_phy: ethernet-phy@15 {
 					compatible = "ethernet-phy-ieee802.3-c45";
 					reg = <15>;
+					status = "disabled";
 				};
 			};
 		};
-- 
2.43.0


