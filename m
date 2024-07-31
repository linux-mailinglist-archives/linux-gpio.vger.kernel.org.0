Return-Path: <linux-gpio+bounces-8477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F219426B4
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 08:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E6122826BA
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 06:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A1B16D9BA;
	Wed, 31 Jul 2024 06:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OUomolCH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rmgCSSdB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FBE16D4F3;
	Wed, 31 Jul 2024 06:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407217; cv=none; b=VsHoe/T2WG+MhghtEfpa4JDfDBDNCKCw3SlrMbvXSnLT/kI6Zyd5pF7uRNALow5oPreKdonSl6qDEzqxrKWRYBODASi3mLgMSotjyuMGZavTLPmtkSEz201JdFrsJVrwv5j9HonH1OAiDwb3jc7GpDZnfnNqMk8z1012ox0cuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407217; c=relaxed/simple;
	bh=arMO0+tz1uNS0eutycIcncpI2D+T5TfWOMLz/zywxJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6ASx5FymBHUG1/yCXGFb4q6x1J4SDj9rP0GTCrVHbM0L8IkYqxU0OGIrQUlYS1y25hxuZep1Lguvkrx6wyj91pE47oLaQxfx4vHqIh5I+G3oMPHbqssi3aA721Fwsn9pK0tFINMXNZmiV9sTzhoAvrs0TgAMI1ForV0oS90mY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OUomolCH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rmgCSSdB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 541B31FD71;
	Wed, 31 Jul 2024 06:26:52 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WWvRSJX47zknj+MxizOHPzJaXBMgNqBSfrVctZW2cg=;
	b=OUomolCHzxTjK2Pu22Tr62MDklMrLeA2w/MoqEau60csE+LTpyt027qM+JOCZxtGGUsi1e
	/Iuvr3/ggiPSeWLJ+tgs5sCrU0rnNxsZ0Br4Wocn5a0XpWO/Fc4j1dm1OLLLP/Ly+z2wRJ
	sCtZorv0si4BOiqBaejyVD6ajz5g08E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WWvRSJX47zknj+MxizOHPzJaXBMgNqBSfrVctZW2cg=;
	b=rmgCSSdB7rpL++owZmcaVTktXDifS2u7Kd4hz8Jh9fOxQTNH7+369qL24e7Up4CYQPVtTo
	k/+aldUxG/WrlRAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 348B213ADE;
	Wed, 31 Jul 2024 06:26:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kIxtDCzZqWYkZgAAD6G6ig
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
Subject: [PATCH 4/7] arm64: dts: broadcom: bcm2712: Add pin controller nodes
Date: Wed, 31 Jul 2024 09:28:11 +0300
Message-ID: <20240731062814.215833-5-iivanov@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt]
X-Rspamd-Queue-Id: 541B31FD71
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

Add pin-control devicetree nodes and used them to
explicitly define uSD card interface pin configuration.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 20 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 10 ++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index b5921437e09f..8a0d20afebfe 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -53,10 +53,30 @@ &uart0 {
 
 /* SDIO1 is used to drive the SD card */
 &sdio1 {
+	pinctrl-0 = <&emmc_sd_pulls>, <&emmc_aon_cd_pins>;
+	pinctrl-names = "default";
 	vqmmc-supply = <&sd_io_1v8_reg>;
 	vmmc-supply = <&sd_vcc_reg>;
 	bus-width = <4>;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
 	sd-uhs-sdr104;
+	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl_aon {
+	emmc_aon_cd_pins: emmc-aon-cd-pins {
+		function = "sd_card_g";
+		pins = "aon_gpio5";
+		bias-pull-up;
+	};
+};
+
+&pinctrl {
+
+	emmc_sd_pulls: emmc-sd-pulls {
+		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
+		bias-pull-up;
+	};
+
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 398df13148bd..1099171cd435 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -266,6 +266,16 @@ uart0: serial@7d001000 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@7d504100 {
+			compatible = "brcm,bcm2712-pinctrl";
+			reg = <0x7d504100 0x30>;
+		};
+
+		pinctrl_aon: pinctrl@7d510700 {
+			compatible = "brcm,bcm2712-aon-pinctrl";
+			reg = <0x7d510700 0x20>;
+		};
+
 		interrupt-controller@7d517000 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d517000 0x10>;
-- 
2.43.0


