Return-Path: <linux-gpio+bounces-13658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62E9E95A0
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 121AB1888B4E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9587E238725;
	Mon,  9 Dec 2024 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="bxlWsBXZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB74234986;
	Mon,  9 Dec 2024 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749088; cv=none; b=LLqBadWf0xkKMwrsb/rVtyxDe66bhIQ9yAb3GcdnYTVZ8Cm0ip9YKPvRx2Bk0ccAzDxuaC/wpqdj+fgMSBaQ9bbQdyA50EEGw/4wiLKwmFHMXOdMcGbpWNYZO/QEV111hXVnw35dShN1xraXGeIMSl/jx2qkAOkDQQvexhJ2jIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749088; c=relaxed/simple;
	bh=DaHPd6SOKd8MfSu9ZfFUvr3WN62/OMs14KDuAXEquQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkCNi1d1SkmImJ/YopFi3fDyOOeUiHiTT67UuOvWDmqWL88Nivqb+62tSkPqwnBzoqn0yH8xJpwKv9x0BbC3fI7l+MB9fbXfzV+BCRAsZnO0vFhS0ePuiRA1C9vE1rLH6kCFCcd20xxHUHa7M9ktb+SVHcHthmoKiCeG7Zxj8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=bxlWsBXZ; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id B0ABF40452;
	Mon,  9 Dec 2024 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733749078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIpsPcGOjRyl5qUhr+7znCLWNsK6P7pZhuPfToLGzCI=;
	b=bxlWsBXZP8f/zUpFSWRBa3yFdPImbW3Huhv4a0u7byeYlMhpxpR2N2unKS8k4/oGr5Kj7i
	f4uW6Txj/ZeYY3N9Tcj7p1JVYISpZRXQAFNP71hvgl2iuGjjj/VAXDiNCp88eb82ZEJAAy
	y/WOH0i+7GPW/DDFPN4dZ/xfhfC+R7Y=
Received: from frank-u24.. (fttx-pool-80.245.75.28.bambit.de [80.245.75.28])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id F125180483;
	Mon,  9 Dec 2024 12:57:57 +0000 (UTC)
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
Subject: [PATCH v6 4/5] arm64: dts: mediatek: mt7988: Add pinctrl support
Date: Mon,  9 Dec 2024 13:57:38 +0100
Message-ID: <20241209125742.9307-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209125742.9307-1-linux@fw-web.de>
References: <20241209125742.9307-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2a1d0a53-6c11-438e-951a-535d710498e4

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7988a pinctrl node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


