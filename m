Return-Path: <linux-gpio+bounces-25057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C22B39E71
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 15:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B260188E8F9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 13:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB3D31194F;
	Thu, 28 Aug 2025 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N80ITG+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE1311940
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386935; cv=none; b=r4uJknj7tisspK0IFZ/AbIdL9OHTuUYxWBa5CpG8UkZ9FYj2U2tifu152r7Dbv3zwyLkDIvEDClzDDt+4i10+6vtDjlB3B+MbLLHj0G95Rs5QDSr5l7LCcbVQDxydyd+A8gayWfwnuTdrjn1/YmWovMvE1MrtHpW/OqfuXKpWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386935; c=relaxed/simple;
	bh=1keMc57+QR2CICrcPlWaiGj5bDJ4SG5s8RArDpJq+tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYvq3fs6Euz2tr2WVklKLxNFvsJXl0KksALnkXyULrSZyVhpko7d2XvZNErn0Ag+nLwsJUMKeG/0iMdiSap1lGhog/kyrrH2Tu0z/ezBSaV5Ul+6sGTFiWUmU26qUfNeeSF0LJ9Q6sH9D6k/748vQSaERUjfAp0QTCwbCbnprjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N80ITG+6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afedbb49c26so144633166b.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386930; x=1756991730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=N80ITG+6x2Tn5bfvb81vUxELGuDHJx4Ucooqu8aTY6Fp4idr3Yifp7Fl+Tg2gPLWcV
         yu37Pf7EqDy3c6z1b07B3EgWf6ZCAO6JG8DtYTtK68SLVK14NlfrWwHrQ7+tYcbRP7oT
         6pPWhYNrDAh4Px9nbvn/rZDfR465Pzezpr/Td0O9Ipby+tP6r9ixNU8h7g+eLWjjxr+D
         rzCIifCF+WWRCZqkB7RE42cMGNGR5w+QOgykTL0txSFpIlnRkMJZu8qO0uINIg3p8vg/
         TecaQGRqE3efQ/jZ1/pqow/nkc+lpwwkgfENq7b4DEg+1ZmLMfnDYnR8Bs2h+0r1NfgE
         zt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386930; x=1756991730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=OKfYzixim5Fso+aZJM/LL/alRHkIUdEgyKaH1fkC6xwodDN5x31H04XSOBie7cHKhW
         7U+Xrp1tL1xgheSWbHu99nOeVInd3sQ7HrJboGgmCWZGMT1OWQF8SkUZTtlZIEOxXw8A
         5hNQNMgx8sQ247mf1ZEA/+S0vPUP+VApw8dWvgG3hq4rZOHNL2TyE2jNzpZZOy8g6CYy
         dHNHHlTdr0VNTK9FBJ/LQEhohdVA38Z6zN8uixi46SrZkNq9Adotq3e6mET90E6IhPeA
         M+siHp6QdxhNvvCbld98bLw1lNuQ+rHbpVMLLAwREPBrVV62pPJWDYuC63pHaNs4ORU1
         LvOg==
X-Forwarded-Encrypted: i=1; AJvYcCWiezACltEVUMdBDU/TI2EDVVLc6klMoq602IO2/xXGqArwDl/HVn4VTCTaB/Ync/k7wTwinh4LldS2@vger.kernel.org
X-Gm-Message-State: AOJu0YzbOaTH1W2QO/1B1US+S/amTY0ZykBS52IcnYMaeGr+vpwb7af6
	j7GYlOOFu/vxsfhuCIvtOFKP6c+B+rJeraScn040zA6/IxKmQzxMYzWLjWbrFz9ercY=
X-Gm-Gg: ASbGncs+p2Enh7oJUCEjVb9ehhjt+1Czx6vOxmxsWBH1vjA3SZXe0nSjqtx5oFkMopp
	TqlR+NrV4vJ0DoXOBYzaPN1jLbDe1YHiqzhYRrC3lg2LxUixKRZ8WNUFTjC/X0bkQxq/7B0i/O8
	Gd8+qmFTs0IYzwQ0aph4uJvqGqoiMTN+01RZSOZvQhM+LxeqI9jP0IhFsvQ9UZCnXXp5sO1zFGd
	HFA88zncvHYtC71212PIiwH+GBTSefw9CTPdqcsy/or785LHMIZXpK/Qo4cq+gjmakABnqDM24/
	qH2i2TH+9WxRNIHoSIKcswVP2IbF0xOoOeBdaANYxs2l0FG1MPVrPMY2WO+jeW8RSuo/Hr14kWp
	tW66xTVk3N04iZF/3tCxfN/lWNJ9sISSD3BIxlCskKnhugizDr1J32i7hRCuespMMa0kmX6EQ0C
	SkEZY+426e3u/hPMfTG31i4tMAqaE=
X-Google-Smtp-Source: AGHT+IFH1vLiPwLLOjWdncMu9CzzMSagWLiPnUFX55dhZYQCF06QAZ/tGnpnN+tm8vZ99g4CY7S5og==
X-Received: by 2002:a17:907:a47:b0:afe:ec74:2e2a with SMTP id a640c23a62f3a-afeec747f62mr156302566b.5.1756386930209;
        Thu, 28 Aug 2025 06:15:30 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe48fae316sm1222206166b.28.2025.08.28.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 4/5] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Thu, 28 Aug 2025 15:17:13 +0200
Message-ID: <4ff3a58e98d90a43deb2448b23754808afc7153b.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add SDIO2 node. On RPi5 it is connected to WiFi chip.
Add related pin, gpio and regulator definitions and
add WiFi node. With this and firmware already provided by
distributions, at least on openSUSE Tumbleweed, this is
sufficient to make WiFi operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 52 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 15 ++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index f0883c903527..411b58c1dddf 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -66,6 +66,18 @@ sd_vcc_reg: sd-vcc-reg {
 		enable-active-high;
 		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
 	};
+
+	wl_on_reg: wl-on-reg {
+		compatible = "regulator-fixed";
+		regulator-name = "wl-on-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-0 = <&wl_on_default>;
+		pinctrl-names = "default";
+		gpio = <&gio 28 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <150000>;
+		enable-active-high;
+	};
 };
 
 &pinctrl {
@@ -79,6 +91,29 @@ pwr_button_default: pwr-button-default-state {
 		pins = "gpio20";
 		bias-pull-up;
 	};
+
+	sdio2_30_default: sdio2-30-default-state {
+		clk-pins {
+			function = "sd2";
+			pins = "gpio30";
+			bias-disable;
+		};
+		cmd-pins {
+			function = "sd2";
+			pins = "gpio31";
+			bias-pull-up;
+		};
+		dat-pins {
+			function = "sd2";
+			pins = "gpio32", "gpio33", "gpio34", "gpio35";
+			bias-pull-up;
+		};
+	};
+
+	wl_on_default: wl-on-default-state {
+		function = "gpio";
+		pins = "gpio28";
+	};
 };
 
 &pinctrl_aon {
@@ -109,6 +144,23 @@ &sdio1 {
 	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
 };
 
+&sdio2 {
+	pinctrl-0 = <&sdio2_30_default>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	vmmc-supply = <&wl_on_reg>;
+	sd-uhs-ddr50;
+	non-removable;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
 &soc {
 	firmware: firmware {
 		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f70ec8d3dc4d..871537366e96 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -285,6 +285,21 @@ gio_aon: gpio@7d517c00 {
 			 */
 		};
 
+		sdio2: mmc@1100000 {
+			compatible = "brcm,bcm2712-sdhci",
+				     "brcm,sdhci-brcmstb";
+			reg = <0x01100000  0x260>,
+			      <0x01100400  0x200>;
+			reg-names = "host", "cfg";
+			interrupts = <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_emmc2>;
+			clock-names = "sw_sdio";
+			sdhci-caps-mask = <0x0000C000 0x0>;
+			sdhci-caps = <0x0 0x0>;
+			mmc-ddr-3_3v;
+			status = "disabled";
+		};
+
 		gicv2: interrupt-controller@7fff9000 {
 			compatible = "arm,gic-400";
 			reg = <0x7fff9000 0x1000>,
-- 
2.35.3


