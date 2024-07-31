Return-Path: <linux-gpio+bounces-8476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2EC9426B1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 08:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EFF71C24241
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 06:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AFC16D9B2;
	Wed, 31 Jul 2024 06:26:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AEA16D4ED;
	Wed, 31 Jul 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407217; cv=none; b=akFZ8RkNEJllYxtSszkXlKVvoahxPq3SR5qZFkyITICTi+VaH0Ek0wvD0XYECXGWT+Jilsvvt36aXs0rIQUAK4yLhb5UPHPRDq8ne1vBKK2ZEKNAE7LD4jFSIcLG607YVMDJrtW2Uxl+8TvWT/Y+0gG0j3r5lw6mRDKcsykpGMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407217; c=relaxed/simple;
	bh=eS2Hth6sN34EcC7Z+787La+1GFLLMdexsBP2bjiUfKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltkBDLm0aKJ/daLjMrVXBjhs5v82TnfpNscd1U4mk8Nz12lCSfMKhmgtBBd+TF+kf8mQq8e6CMfwbIb3vgc9ubnEz2X8+6vEUqPk/bYqUV5n3Z2nT/bgxydi6b4OdklpLAbBIXSBkNmJciVnrI+HFkKch6PqYINrfe5TG563alc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 32EBD21F2D;
	Wed, 31 Jul 2024 06:26:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B38113AE5;
	Wed, 31 Jul 2024 06:26:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8IzDGSzZqWYkZgAAD6G6ig
	(envelope-from <iivanov@suse.de>); Wed, 31 Jul 2024 06:26:52 +0000
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	andrea.porta@suse.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: [PATCH 6/7] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Wed, 31 Jul 2024 09:28:13 +0300
Message-ID: <20240731062814.215833-7-iivanov@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731062814.215833-1-iivanov@suse.de>
References: <20240731062814.215833-1-iivanov@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 32EBD21F2D
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt]
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated

Add SDIO2 node. On RPi5 it is connected to WiFi chip.
Add related pin, gpio and regulator definitions and
add WiFi node. With this and firmware already provided by
distributions, at least on openSUSE Tumbleweed, this is
sufficient to make WiFi operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 55 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 13 +++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 06e926af16b7..b6bfe0abb774 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -46,6 +46,20 @@ sd_vcc_reg: sd-vcc-reg {
 		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
 	};
 
+	wl_on_reg: wl-on-reg {
+		compatible = "regulator-fixed";
+		regulator-name = "wl-on-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-0 = <&wl_on_pins>;
+		pinctrl-names = "default";
+
+		gpio = <&gio 28 GPIO_ACTIVE_HIGH>;
+
+		startup-delay-us = <150000>;
+		enable-active-high;
+	};
+
 	pwr-button {
 		compatible = "gpio-keys";
 
@@ -80,6 +94,25 @@ &sdio1 {
 	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
 };
 
+/* SDIO2 drives the WLAN interface */
+&sdio2 {
+	pinctrl-0 = <&sdio2_30_pins>;
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
+		local-mac-address = [00 00 00 00 00 00];
+	};
+};
+
 &pinctrl_aon {
 	emmc_aon_cd_pins: emmc-aon-cd-pins {
 		function = "sd_card_g";
@@ -95,9 +128,31 @@ pwr_button_pins: pwr-button-pins {
 		bias-pull-up;
 	};
 
+	wl_on_pins: wl-on-pins {
+		function = "gpio";
+		pins = "gpio28";
+	};
+
 	emmc_sd_pulls: emmc-sd-pulls {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
 	};
 
+	sdio2_30_pins: sdio2-30-pins {
+		pin-clk {
+			function = "sd2";
+			pins = "gpio30";
+			bias-disable;
+		};
+		pin-cmd {
+			function = "sd2";
+			pins = "gpio31";
+			bias-pull-up;
+		};
+		pins-dat {
+			function = "sd2";
+			pins = "gpio32", "gpio33", "gpio34", "gpio35";
+			bias-pull-up;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 39d2419ffce2..3c0663dc6712 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -27,6 +27,19 @@ sdio1: mmc@1000fff000 {
 			mmc-ddr-3_3v;
 		};
 
+		sdio2: mmc@1001100000 {
+			compatible = "brcm,bcm2712-sdhci";
+			reg = <0x10 0x01100000  0x260>,
+			      <0x10 0x01100400  0x200>;
+			reg-names = "host", "cfg";
+			interrupts = <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_emmc2>;
+			sdhci-caps-mask = <0x0000C000 0x0>;
+			sdhci-caps = <0x0 0x0>;
+			mmc-ddr-3_3v;
+			status = "disabled";
+		};
+
 		gicv2: interrupt-controller@107fff9000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
-- 
2.43.0


