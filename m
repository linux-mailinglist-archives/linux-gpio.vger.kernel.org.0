Return-Path: <linux-gpio+bounces-8479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7C9426B7
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 08:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4B381F25CE8
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 06:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D695E16D9C8;
	Wed, 31 Jul 2024 06:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LlEYe6Ko";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HVuj7JW3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LlEYe6Ko";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HVuj7JW3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2CF16D4F4;
	Wed, 31 Jul 2024 06:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407217; cv=none; b=cmLfVRRNyaKyeq/hBn/L5ESOwoUy3PWmrtmFPds/A58v4o2RAO/CGE9CGjRUaEV3k7rPHbf9s3C0Ekk22QxTzOvxB6F7wjkiQ3q7Z/Dnhr5+wlCeW51SlKwGy7IaOC8DGrzKp+a69au/bcG06mB7w9IEG9h1cgtj808D7Mw1XNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407217; c=relaxed/simple;
	bh=n953NNJkENY09MTnPx2Dyxh3iENd732CxVpQrrFbCTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjeH4B0iUGtvqh8v1xjJtkPlojyJ8vhMaoYupF4GekGoHC9fF0F1czVry8S5OYdjqVXFFKBWpPTRW6dhzRBEuw0Fd5npUdwUYmsyKyUjNgo3CUk2M7HL/8mNFPu/G/w3swFNaxoGr6rdvqV5/XbqnLvFVXYl8sNArRX20FNX9YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LlEYe6Ko; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HVuj7JW3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LlEYe6Ko; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HVuj7JW3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 329B51FD72;
	Wed, 31 Jul 2024 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKlUcGLYS8QgrOPG8/WYS4qRvBk/wl5oI6aT9Y6O9VI=;
	b=LlEYe6KoqtgUUTC9Q3DxPworQc3JKT98XBRXNAkaiVseSO2OlLRYZ5XdFuDg253S037SJP
	5iFT1905y7InirQ58Q6lQshshhkrMSTtguSSeV0ENkdrIP8KmYLFBDL2M3vDoXl1J4AkVy
	/hB7zBEArwh+h2Ucc0/o+MSssMZ5sac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKlUcGLYS8QgrOPG8/WYS4qRvBk/wl5oI6aT9Y6O9VI=;
	b=HVuj7JW3VWLnVDgiTQn6yO42mQpTn4yf5d/EPHfQ94FvhcdOE4NwCemjsmJmtvvj34N+H7
	GTd0wb7aT1lqviAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKlUcGLYS8QgrOPG8/WYS4qRvBk/wl5oI6aT9Y6O9VI=;
	b=LlEYe6KoqtgUUTC9Q3DxPworQc3JKT98XBRXNAkaiVseSO2OlLRYZ5XdFuDg253S037SJP
	5iFT1905y7InirQ58Q6lQshshhkrMSTtguSSeV0ENkdrIP8KmYLFBDL2M3vDoXl1J4AkVy
	/hB7zBEArwh+h2Ucc0/o+MSssMZ5sac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKlUcGLYS8QgrOPG8/WYS4qRvBk/wl5oI6aT9Y6O9VI=;
	b=HVuj7JW3VWLnVDgiTQn6yO42mQpTn4yf5d/EPHfQ94FvhcdOE4NwCemjsmJmtvvj34N+H7
	GTd0wb7aT1lqviAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50A4413AE0;
	Wed, 31 Jul 2024 06:26:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id INpHEyzZqWYkZgAAD6G6ig
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
Subject: [PATCH 5/7] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Date: Wed, 31 Jul 2024 09:28:12 +0300
Message-ID: <20240731062814.215833-6-iivanov@suse.de>
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
X-Spamd-Result: default: False [-5.10 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmx.net,suse.com,vger.kernel.org,lists.infradead.org,suse.de];
	R_RATELIMIT(0.00)[to_ip_from(RLj7gjeczi4zsfac5deuh19f3d)];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,7d504100:email,suse.de:email,7d510700:email];
	FREEMAIL_ENVRCPT(0.00)[gmx.net]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.10

Add GPIO and related interrupt controller nodes and wire one
of the lines to power button.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 21 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 21 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 8a0d20afebfe..06e926af16b7 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "bcm2712.dtsi"
 
 / {
@@ -44,6 +45,21 @@ sd_vcc_reg: sd-vcc-reg {
 		enable-active-high;
 		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
 	};
+
+	pwr-button {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwr_button_pins>;
+		status = "okay";
+
+		pwr_key: pwr {
+			label = "pwr_button";
+			linux,code = <KEY_POWER>;
+			gpios = <&gio 20 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
 };
 
 /* The system UART */
@@ -73,6 +89,11 @@ emmc_aon_cd_pins: emmc-aon-cd-pins {
 };
 
 &pinctrl {
+	pwr_button_pins: pwr-button-pins {
+		function = "gpio";
+		pins = "gpio20";
+		bias-pull-up;
+	};
 
 	emmc_sd_pulls: emmc-sd-pulls {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 1099171cd435..39d2419ffce2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -271,6 +271,27 @@ pinctrl: pinctrl@7d504100 {
 			reg = <0x7d504100 0x30>;
 		};
 
+		main_irq: intc@7d508400 {
+			compatible = "brcm,bcm7271-l2-intc";
+			reg = <0x7d508400 0x10>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		gio: gpio@7d508500 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x7d508500 0x40>;
+			interrupt-parent = <&main_irq>;
+			interrupts = <0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			brcm,gpio-bank-widths = <32 22>;
+			brcm,gpio-direct;
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.43.0


