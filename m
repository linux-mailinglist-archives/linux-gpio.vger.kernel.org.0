Return-Path: <linux-gpio+bounces-13385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374409DFFC6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B8E128138F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0921FDE04;
	Mon,  2 Dec 2024 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="r+6h+N5r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761971FCFE5;
	Mon,  2 Dec 2024 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137766; cv=none; b=o0oA+mO0LwU/N3w19HfurEXBPS+fdbZcqlhwLItOhIe4kgz11Wslpqz6ArPQR+7N3JzFIpuR8jBSrvNZa0FjP7Xeqb9ZUd9D8Q0JkiKYMH3ho3E3dvUJeWCnbGJMMrDOaJDD3xDYOamTDf7a7nopWB8bhM8vFeJlOEiAarMkH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137766; c=relaxed/simple;
	bh=nKIOvACDjZbYLF5A13BN/MXLxJFoaSYXBJ/h7DMJFUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mO+0kkjo7HzEr4ZuoXDpUNT87cxTW8Bb38PEK5lVjOM0sIZScSWr8fWbtTredSzafFcNhC0ZwEzgxgw9zsLdMivaPccBIQUeRWRNmEAbxvRHy5ZWa/bE/kCCLKj3AIJ15W+pMck7nU3aTS5+Ilh/CbDhFbhF0LwVZGu5zkdqquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=r+6h+N5r; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 881D460541;
	Mon,  2 Dec 2024 11:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733137260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGRPUZ9kGRSH0yrHCfBP4DTy7j1XcDCUoTjvyvLyygs=;
	b=r+6h+N5rBNxnR56CAZTjS0Wu/sES7ii7nJZICW+jTOd5D0H+uFNc/eiN2eR49JnRTnp5uf
	eOP+0NVohXPoi2WFmspOYyJVd0qB/dmVfLns7ZNIxIDct/15b3JgpCHrWPtoivHXmxhpS7
	c3jTwWb5TC4LYkeUxKueodLEQUEcmSw=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id C99B01002C7;
	Mon,  2 Dec 2024 11:00:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 4/5] arm64: dts: mediatek: mt7988: add pinctrl support
Date: Mon,  2 Dec 2024 12:00:38 +0100
Message-ID: <20241202110045.22084-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202110045.22084-1-linux@fw-web.de>
References: <20241202110045.22084-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b6c2da87-776d-4203-9b42-ec97471af7c7

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7988a pinctrl node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v5:
- drop pins with second function

v2:
- fix wrong alignment of reg values
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index c9649b815276..46969577c87a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/clock/mediatek,mt7988-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -105,6 +106,59 @@ clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pio: pinctrl@1001f000 {
+			compatible = "mediatek,mt7988-pinctrl";
+			reg = <0 0x1001f000 0 0x1000>,
+			      <0 0x11c10000 0 0x1000>,
+			      <0 0x11d00000 0 0x1000>,
+			      <0 0x11d20000 0 0x1000>,
+			      <0 0x11e00000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_tr",
+				    "iocfg_br", "iocfg_rb",
+				    "iocfg_lb", "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 84>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+
+			pcie0_pins: pcie0-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
+						 "pcie_wake_n0_0";
+				};
+			};
+
+			pcie1_pins: pcie1-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
+						 "pcie_wake_n1_0";
+				};
+			};
+
+			pcie2_pins: pcie2-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
+						 "pcie_wake_n2_0";
+				};
+			};
+
+			pcie3_pins: pcie3-pins {
+				mux {
+					function = "pcie";
+					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
+						 "pcie_wake_n3_0";
+				};
+			};
+		};
+
 		pwm@10048000 {
 			compatible = "mediatek,mt7988-pwm";
 			reg = <0 0x10048000 0 0x1000>;
-- 
2.43.0


