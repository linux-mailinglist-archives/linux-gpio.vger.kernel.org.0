Return-Path: <linux-gpio+bounces-23323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B401EB0660E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F0FB505117
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BBD2BE64E;
	Tue, 15 Jul 2025 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fnJNNirx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF152BE631
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604212; cv=none; b=DuuZ+aibD4DuyasVA1m2/5QxpVyN2yYsicEJv2EZLeMc7aq/Im880H6BXZogYnMjZRzkukltJtRq1Zep2LHHH3EBhInMrA1v1T2KYwplVFocp9j1lWEmqpDu6e+m6+Z7420Uk0GGMvN3aW+NfStSYdq3g5G/0T5zYgkDIf/eEiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604212; c=relaxed/simple;
	bh=FzNWUGZftbrMuwHzuM+w0xcycT2JYIJVMEBEM83DEvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEUY9g65i99sqA0QodRTbqrgoa1fuCD9AS5dC5MWplfVESJQTy0C5K2DFRx82M4BxUpg6fIyOzkRoSrkNdCpg24h8spr2Bin+fVkkIIWj/iBlE8xhqlG5Ys53gHj5mwpjNnoDDfLY5pSHYtON/4B8yr5bDPiuQ2TtUAh90xhypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fnJNNirx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso11194581a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604209; x=1753209009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=618tBsP8+IuJgTKE3mRpRskhn0ekdTiWo3PqXAUnzZg=;
        b=fnJNNirxXZrtjZgEbF5TG8Fc7B+AWv3RghW98IpmGQ0+0v6CKpTEFaZpGL/Nc3SYYU
         2YrLvIQ6DYT5ru8EFgxCYzufW/Pr3R+X+bBGjX6c8A22o3ik4ekAs+JNIR2Zmf9UDd7y
         UD5uA/0zCXNUWQZmRMuhUPhnD8kDj0v3sVuDlNI9dRzgemR9UXCiIwMPnIevQCHpjFQC
         b8m6OdwvyqY/Lwz9sTJhY4cJ5rMqSWZWp4ownqrrHn+c3KsLudO3irCJgLUObV14wVhQ
         LCx8nbwjDrhj6zPnJ6QETDXl5QCm01pIB9gd7driuit34U1+mcWid68z1qilSJfMLLLb
         pcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604209; x=1753209009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=618tBsP8+IuJgTKE3mRpRskhn0ekdTiWo3PqXAUnzZg=;
        b=KZW1Hhm+vNcwIdBAlG8BKnszazLfICQqOxhAXHHQeAPlBtuofS3GhAyBmriROtVQyn
         4iBOF/sY0dQp0VkRPRyRQxkCKLTnMqt2xFfr+l328QblkEAWsUcR+NVGEHi/qUC80zAF
         uN6TsrR7TEuvOafr/rRNqiMue3miTMSdTUaHXCYgoDN3RS0E3qFR8esI8Rhz+As9RWpk
         Ham44zNoQQgjdCRBE1YxjWDX/llcF/wFI61hbs1/TpVwOXytbQ8x/Gbt9nFxgx/kEjCk
         a+739f+5/s4gpqxCZu/0Bz6FHqaARxsUMnm4j2cjZoT3ZitT4JTp5ME5QVKs6cuvkCle
         23VA==
X-Forwarded-Encrypted: i=1; AJvYcCXnF3X63xnzmbSgkCZlGWfOSCNPFxmhEH4seGjjpGN3EcfYlJ0KIDQ1mo9VWbZWZ8GdDmHvNcVGhMy+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7b+MhPKwGd7U6rwgUy9vz+X+oLoMIcsdtn2f2RNvn+EfuwuxM
	LuxBPUBD+iwQQB3tue5YuiufpzaPGsGX/MxaFuyGrQH1XLK+mMyHwhuTYF1pyckurHo=
X-Gm-Gg: ASbGncu5sbZOPxt67VGA8eU68k4NqgZGrhZFA/ydmiIaqr6NdqxviEw8q9Uh93x4ROo
	kMk0nXAv2BjTPBlGNq2QrzA/E42P/JykHCl8wjaXRZuRmLL0agWK/5ZnW6ZWP3aHnh3EreoNq0N
	88hz0EOS45uXY9BxZoT3d3BSDqwBA4rGgSxcymDw1V5nnSMQJpMiEsaIu4ezPq9N99v2qFCRn1/
	FHvZldhmIN043Z8GzmR5EbkM01qwsWix4D4tqhue/eKeqf/Do0O5zv5fe5TARDZ8sTqBy4O76PR
	jLfGnhGqdAk/xYvKdC8RPME8qf2BRwH64PIKiImITSMaOBcbeClt4mN49dnXdtiwsd66QvXX5iD
	xfLO+1vcwt0ZNKHI3B/a8zn7LS0B76RwLXwmWu72L9IJN3slgMPX37AZXyRk1iQdSvUTr
X-Google-Smtp-Source: AGHT+IHRNkalwwVztrQaJho64YzctIwHuAGK/cCl6dKnZ8rFmjfc9HeuD+awU1Jzf7RXVNYqFjgJlg==
X-Received: by 2002:a17:907:8e8e:b0:ae0:da2d:1a53 with SMTP id a640c23a62f3a-ae9c9b23338mr48885466b.42.1752604208948;
        Tue, 15 Jul 2025 11:30:08 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82669b5sm1052376566b.77.2025.07.15.11.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:08 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 5/7] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Tue, 15 Jul 2025 20:31:42 +0200
Message-ID: <5eab612fa761a5c936918b64263f2455c4bc91bc.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
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
This patch is based on linux-next/master

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


