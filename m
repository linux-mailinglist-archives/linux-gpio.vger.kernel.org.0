Return-Path: <linux-gpio+bounces-8473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FC9426AC
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 08:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A46C1C2421D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 06:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CF416D4FC;
	Wed, 31 Jul 2024 06:26:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA44D16D4F0;
	Wed, 31 Jul 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407216; cv=none; b=brGUlhC+YASl8+IeqbTh0thuCJJVPv7WuU2C8Y5JK/+bkBewZOV8cPPLGEWlSr8VjXBDjQJKtWu4h2wQTtNGmsmtvTPrSLmjJ6R8eFsXebMBwI3DDSb+GzygaedKnit3XWRmEVA3I4AsWVTKcLXwfZCytIMsxiCXoqbGyAY/bNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407216; c=relaxed/simple;
	bh=BMsR2K+cliRP8uXc5J40bCvkNjYbTpnWKyomArpp+/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icDcmN/TpyU4BMe6RzQ8BOor2IYZHE9+fZ68O8BEjAZIZunTXf0ev27EG/JvmtZwgvekM03B+9/guYxgxNcKBI28BzVHasaCtBLCR95pRWnI/HoHkuTAFCAOdjOEJ+jdGHnpAvAonnt7ZIZBf9vjhWdVTxvSHpjlw/XV733i/D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 413B81FD73;
	Wed, 31 Jul 2024 06:26:53 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8823513AEA;
	Wed, 31 Jul 2024 06:26:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YL/TICzZqWYkZgAAD6G6ig
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
Subject: [PATCH 7/7] arm64: dts: broadcom: bcm2712: Add UARTA controller node.
Date: Wed, 31 Jul 2024 09:28:14 +0300
Message-ID: <20240731062814.215833-8-iivanov@suse.de>
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
X-Rspamd-Queue-Id: 413B81FD73
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt]
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated

On RPi5 device Bluetooth chips is connected to UARTA
port. Add Bluetooth chips and related pin definitions.
With this and firmware already provided by distributions,
at least on openSUSE Tumbleweed, this is sufficient to make
Bluetooth operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 45 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index b6bfe0abb774..a557cbd8ba17 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -133,11 +133,39 @@ wl_on_pins: wl-on-pins {
 		pins = "gpio28";
 	};
 
+	bt_shutdown_pins: bt-shutdown-pins {
+		function = "gpio";
+		pins = "gpio29";
+	};
+
 	emmc_sd_pulls: emmc-sd-pulls {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
 	};
 
+	uarta_24_pins: uarta-24-pins {
+		pin-rts {
+			function = "uart0";
+			pins = "gpio24";
+			bias-disable;
+		};
+		pin-cts {
+			function = "uart0";
+			pins = "gpio25";
+			bias-pull-up;
+		};
+		pin-txd {
+			function = "uart0";
+			pins = "gpio26";
+			bias-disable;
+		};
+		pin-rxd {
+			function = "uart0";
+			pins = "gpio27";
+			bias-pull-up;
+		};
+	};
+
 	sdio2_30_pins: sdio2-30-pins {
 		pin-clk {
 			function = "sd2";
@@ -156,3 +184,20 @@ pins-dat {
 		};
 	};
 };
+
+/* uarta communicates with the BT module */
+&uarta {
+	uart-has-rtscts;
+	auto-flow-control;
+	status = "okay";
+	clock-frequency = <96000000>;
+	pinctrl-0 = <&uarta_24_pins &bt_shutdown_pins>;
+	pinctrl-names = "default";
+
+	bluetooth: bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gio 29 GPIO_ACTIVE_HIGH>;
+		local-bd-address = [ 00 00 00 00 00 00 ];
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 3c0663dc6712..e972f94d6828 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -305,6 +305,17 @@ gio: gpio@7d508500 {
 			brcm,gpio-direct;
 		};
 
+		uarta: serial@7d50c000 {
+			compatible = "brcm,bcm7271-uart";
+			reg = <0x7d50c000 0x20>;
+			reg-names = "uart";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+			skip-init;
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.43.0


