Return-Path: <linux-gpio+bounces-13381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5199DFF8D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97C63B23239
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9931FBC9E;
	Mon,  2 Dec 2024 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="jWnQmxgk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243381FBCAF;
	Mon,  2 Dec 2024 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137270; cv=none; b=VD3ZKaqx5el3O88RmDa80Hm9v30ihTVxOkrr2y3u0IQKpLfl/eiMXFNneIqml3netn6/H01j7CyegfWsSnih/kn/WTOQ4iZcWdg04ndaZh7D8Ln8uJ4A4Y3k6lGI/BErWTYKLUApNL+3Zzaxym1MIdr4JXTANUwYlnukkgOpl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137270; c=relaxed/simple;
	bh=IvpqhaV/xulVv5zlmJNnCYugVm2DCsNChR4uZU0CDlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUaszpeln95dsmoLi79+axXop5uMc3UudPbDW3aj71wwv8qzO+UW/RLnlRfcTaTHFKjT1oZhxdizEUkzA2/oNrpz64pVhKXbOkF6fzJWJyzGeqVLNqPUx2qLJz6oMEFHeZf5IIoV9ziskX0qp/a6g1+H9JL0cTJA/1r9cSPt5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=jWnQmxgk; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 4B8D860FA4;
	Mon,  2 Dec 2024 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733137261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyqoNi8b0e4G/mNuoNqWCCyWIXNgFap4NSrKlakizDk=;
	b=jWnQmxgku532SImzVOvuu35tPoZrB/MDuyEJomKh6H1lDaNVZ+xwvX/O6+lYX5iX3P+t7c
	tPX/tWNT24o3cMsOhIIdd3StsGWECMmAP4KjPz1lo25GVXZgNaW8gl33kUrJha3pCI5XHp
	mumQciykHwsn04y3CqEYGBaJT6/SfZ0=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 818A4100475;
	Mon,  2 Dec 2024 11:01:00 +0000 (UTC)
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
Subject: [PATCH v5 5/5] arm64: dts: mediatek: mt7988: add pinctrl subnodes for bpi-r4
Date: Mon,  2 Dec 2024 12:00:39 +0100
Message-ID: <20241202110045.22084-6-linux@fw-web.de>
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
X-Mail-ID: c495ca34-053a-4cad-a31c-eb515f8c7e92

From: Frank Wunderlich <frank-w@public-files.de>

Add board specidic pinctrl configurations on Bananapi R4.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index efc4ad0b08b8..aa2dabc041fd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -9,3 +9,192 @@ / {
 	model = "Banana Pi BPI-R4";
 	chassis-type = "embedded";
 };
+
+&pio {
+	mdio0_pins: mdio0-pins {
+		mux {
+			function = "eth";
+			groups = "mdc_mdio0";
+		};
+
+		conf {
+			pins = "SMI_0_MDC", "SMI_0_MDIO";
+			drive-strength = <8>;
+		};
+	};
+
+	i2c0_pins: i2c0-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c0_1";
+		};
+	};
+
+	i2c1_pins: i2c1-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_0";
+		};
+	};
+
+	i2c1_sfp_pins: i2c1-sfp-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_sfp";
+		};
+	};
+
+	i2c2_0_pins: i2c2-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_0";
+		};
+	};
+
+	i2c2_1_pins: i2c2-g1-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_1";
+		};
+	};
+
+	gbe0_led0_pins: gbe0-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led0";
+		};
+	};
+
+	gbe1_led0_pins: gbe1-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led0";
+		};
+	};
+
+	gbe2_led0_pins: gbe2-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led0";
+		};
+	};
+
+	gbe3_led0_pins: gbe3-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led0";
+		};
+	};
+
+	gbe0_led1_pins: gbe0-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led1";
+		};
+	};
+
+	gbe1_led1_pins: gbe1-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led1";
+		};
+	};
+
+	gbe2_led1_pins: gbe2-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led1";
+		};
+	};
+
+	gbe3_led1_pins: gbe3-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led1";
+		};
+	};
+
+	i2p5gbe_led0_pins: 2p5gbe-led0-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led0";
+		};
+	};
+
+	i2p5gbe_led1_pins: 2p5gbe-led1-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led1";
+		};
+	};
+
+	mmc0_pins_emmc_45: mmc0-emmc-45-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_45";
+		};
+	};
+
+	mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_51";
+		};
+	};
+
+	mmc0_pins_sdcard: mmc0-sdcard-pins {
+		mux {
+			function = "flash";
+			groups = "sdcard";
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		mux {
+			function = "uart";
+			groups =  "uart0";
+		};
+	};
+
+	snfi_pins: snfi-pins {
+		mux {
+			function = "flash";
+			groups = "snfi";
+		};
+	};
+
+	spi0_pins: spi0-pins {
+		mux {
+			function = "spi";
+			groups = "spi0";
+		};
+	};
+
+	spi0_flash_pins: spi0-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+
+	spi1_pins: spi1-pins {
+		mux {
+			function = "spi";
+			groups = "spi1";
+		};
+	};
+
+	spi2_pins: spi2-pins {
+		mux {
+			function = "spi";
+			groups = "spi2";
+		};
+	};
+
+	spi2_flash_pins: spi2-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi2", "spi2_wp_hold";
+		};
+	};
+};
-- 
2.43.0


