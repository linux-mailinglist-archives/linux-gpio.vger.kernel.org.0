Return-Path: <linux-gpio+bounces-10999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758999384B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 22:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0042828475D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 20:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D611DED6E;
	Mon,  7 Oct 2024 20:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="fkmvTWw0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6791DE8B6;
	Mon,  7 Oct 2024 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333075; cv=none; b=pjL1flkoaaK6gagtU9ba9ApsZsHrxaJpFCIuJ9j5n2gy0BzgtdPalNE4LRmvCv7bMKLJ3THJo85QmrVlB6ttAXt8E6J6vqXFLXcfTieN0K6xKPD/lVu2TLBqMbdNnG9UKJvGtQc1tpKO50TpSYiSd+QnHP1wpKlsmsfxBOKkZ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333075; c=relaxed/simple;
	bh=X2AYz492IGwzeV/lL9o4hdoM82zMb6McD+iCKqSflNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYFDGKo6Dn84PVOLahE8OZGHXu9DffU6UH1ZLYg/JBYdYKX3ZlLKTKOdIXWWhpHCplU8rJX1bp5C6LYVBbi/uEV5/EmFEB3YygInF0Ff5N3raX5EEHXjdcZeY6mYlcnS63duU4+aOoJ1nVwxJW0qONlV1+tUz4Dyx94NU6qKqLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=fkmvTWw0; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id C31891008F1;
	Mon,  7 Oct 2024 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728333064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNCopJmZccHmcVKLfF7eeviRLCI1O70ul3xqsxNplgQ=;
	b=fkmvTWw0Tqml9jlFCBPs/tt7W0mJhH858GsaqFU5up4VSyClxVciW3SAJWvf2WgHVyvKXb
	MNx2v2m5V4NwucLZCsC612FVZjp8zcXDwvr7s/HwjTBqVYSAOie3rs+WB4LSRxgTJuk+p6
	V26xcWup+zJxeAiB8Qx/Iac/0iW5laM=
Received: from frank-u24.. (fttx-pool-157.180.226.56.bambit.de [157.180.226.56])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id A14A3360200;
	Mon,  7 Oct 2024 20:31:03 +0000 (UTC)
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
Subject: [PATCH v3 4/4] arm64: dts: mediatek: mt7988: add pinctrl support
Date: Mon,  7 Oct 2024 22:30:45 +0200
Message-ID: <20241007203053.72862-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007203053.72862-1-linux@fw-web.de>
References: <20241007203053.72862-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e8a13637-5923-4367-a551-4a61df33c51d

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


