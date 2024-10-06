Return-Path: <linux-gpio+bounces-10893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D755B991DB1
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 12:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622712830CA
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 10:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9540175D44;
	Sun,  6 Oct 2024 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="t7OO4vOD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153B171E43;
	Sun,  6 Oct 2024 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728209342; cv=none; b=JanZRjnuUn/1d1/JCIg7Y+docAGDFQrb+2AzNVKAA7IspZayMD+mp5TGbhUzcvMWRlPECjWwBR6zu6DrLhT9NROptyDNCy7DhOAsXUAGbNHow8fZIN6Cyw+ilqDGcichLVc/+9c9bHXsLi2lOq3Kvz5wX8DRi8yjJ2P7a2MU26Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728209342; c=relaxed/simple;
	bh=X2AYz492IGwzeV/lL9o4hdoM82zMb6McD+iCKqSflNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oV2lvBBNR/lGdPR4/KYznzcvtr2iATnOJHXK2lNgWf2Ma2ktaU8XA8UW0xeyajfeA+JQjV/WnHpRX+pwqhEJiPbMrIjM/v7pY1p6d2DX5BaNQF7D/DdW/YBauErIY3uAEvSzff5hU5J5rzHP20So8rucClwgsAE+Diy8LhFP7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=t7OO4vOD; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id DFD3140027;
	Sun,  6 Oct 2024 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728209332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNCopJmZccHmcVKLfF7eeviRLCI1O70ul3xqsxNplgQ=;
	b=t7OO4vODXLrsb3F1RD58364u6L1eKEEMSfKVYEcPxnDLFERakiTan7mMpFmPoVxTVCxDg0
	CBrar6/jz8pJ+27uI/lBHSWHXlR32dnLPb+Yssbph2dpvm7/ILDRoxWwWReHaXXD/cWfEr
	wtSRmafE10a2uA5hdGeJEQ7ZtgE6qnI=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 3CBD0360250;
	Sun,  6 Oct 2024 10:08:52 +0000 (UTC)
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
	linux-mediatek@lists.infradead.org,
	daniel@makrotopia.org,
	john@phrozen.org,
	ansuelsmth@gmail.com,
	eladwf@gmail.com
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt7988: add pinctrl support
Date: Sun,  6 Oct 2024 12:08:40 +0200
Message-ID: <20241006100843.13280-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241006100843.13280-1-linux@fw-web.de>
References: <20241006100843.13280-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9fc0ef96-f68e-47a4-aa4b-763482a8fe5b

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7988a pinctrl node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- fix wrong alignment of reg values
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 241 ++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index c9649b815276..7e15934efe0b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/clock/mediatek,mt7988-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -105,6 +106,246 @@ clock-controller@1001e000 {
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
+			mdio0_pins: mdio0-pins {
+				mux {
+					function = "eth";
+					groups = "mdc_mdio0";
+				};
+
+				conf {
+					pins = "SMI_0_MDC", "SMI_0_MDIO";
+					drive-strength = <MTK_DRIVE_8mA>;
+				};
+			};
+
+			i2c0_pins: i2c0-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c0_1";
+				};
+			};
+
+			i2c1_pins: i2c1-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c1_0";
+				};
+			};
+
+			i2c1_sfp_pins: i2c1-sfp-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c1_sfp";
+				};
+			};
+
+			i2c2_0_pins: i2c2-g0-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c2_0";
+				};
+			};
+
+			i2c2_1_pins: i2c2-g1-pins {
+				mux {
+					function = "i2c";
+					groups = "i2c2_1";
+				};
+			};
+
+			gbe0_led0_pins: gbe0-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe0_led0";
+				};
+			};
+
+			gbe1_led0_pins: gbe1-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe1_led0";
+				};
+			};
+
+			gbe2_led0_pins: gbe2-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe2_led0";
+				};
+			};
+
+			gbe3_led0_pins: gbe3-led0-pins {
+				mux {
+					function = "led";
+					groups = "gbe3_led0";
+				};
+			};
+
+			gbe0_led1_pins: gbe0-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe0_led1";
+				};
+			};
+
+			gbe1_led1_pins: gbe1-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe1_led1";
+				};
+			};
+
+			gbe2_led1_pins: gbe2-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe2_led1";
+				};
+			};
+
+			gbe3_led1_pins: gbe3-led1-pins {
+				mux {
+					function = "led";
+					groups = "gbe3_led1";
+				};
+			};
+
+			i2p5gbe_led0_pins: 2p5gbe-led0-pins {
+				mux {
+					function = "led";
+					groups = "2p5gbe_led0";
+				};
+			};
+
+			i2p5gbe_led1_pins: 2p5gbe-led1-pins {
+				mux {
+					function = "led";
+					groups = "2p5gbe_led1";
+				};
+			};
+
+			mmc0_pins_emmc_45: mmc0-emmc-45-pins {
+				mux {
+					function = "flash";
+					groups = "emmc_45";
+				};
+			};
+
+			mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+				mux {
+					function = "flash";
+					groups = "emmc_51";
+				};
+			};
+
+			mmc0_pins_sdcard: mmc0-sdcard-pins {
+				mux {
+					function = "flash";
+					groups = "sdcard";
+				};
+			};
+
+			uart0_pins: uart0-pins {
+				mux {
+					function = "uart";
+					groups =  "uart0";
+				};
+			};
+
+			snfi_pins: snfi-pins {
+				mux {
+					function = "flash";
+					groups = "snfi";
+				};
+			};
+
+			spi0_pins: spi0-pins {
+				mux {
+					function = "spi";
+					groups = "spi0";
+				};
+			};
+
+			spi0_flash_pins: spi0-flash-pins {
+				mux {
+					function = "spi";
+					groups = "spi0", "spi0_wp_hold";
+				};
+			};
+
+			spi1_pins: spi1-pins {
+				mux {
+					function = "spi";
+					groups = "spi1";
+				};
+			};
+
+			spi2_pins: spi2-pins {
+				mux {
+					function = "spi";
+					groups = "spi2";
+				};
+			};
+
+			spi2_flash_pins: spi2-flash-pins {
+				mux {
+					function = "spi";
+					groups = "spi2", "spi2_wp_hold";
+				};
+			};
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


