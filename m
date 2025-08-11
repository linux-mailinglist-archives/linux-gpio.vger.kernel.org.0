Return-Path: <linux-gpio+bounces-24203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A6B20D61
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEE541907A50
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BED2E0B68;
	Mon, 11 Aug 2025 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TOq0xFfe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB482E093F
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925493; cv=none; b=JfDuiCSz2a7zlBW8el10i3P+Hp7bRHNrnuEqfu8xyBGpFTLqh+Ps4KzNyWhfQjnXbWJOWhlgMeySSB1nLCmNGe8mEeMbHjxI+S9Z1Qbk+oQPaxIksINgr5hutOAvl4DrEEYi4GrgImbvnln2d/1UwlxmJKThapId84wo57CdQ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925493; c=relaxed/simple;
	bh=1keMc57+QR2CICrcPlWaiGj5bDJ4SG5s8RArDpJq+tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrhDrj+OCtPXaxmt6t1oB097jzWbajTe7iW/2KYAJVtYWMuw5RFbdN3k5ojQ+aXL2yDS/enIrE1GH+KX/Bzu/5w2mszYEGTaQPFEtj8BYralm2li1ufqB8iaZqTwJ9biIauCQZwQr9IXjCdlYx+Vo+q3whmAqDo3YXjeqhXvBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TOq0xFfe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-615622ed677so5376821a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925490; x=1755530290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=TOq0xFfeTfXMRiBhrQ5Ff14ya6b6UsgD+FMCq5YosDGLCmMUYGyxo5C6De3Jg6H99y
         X8WbzZEne//Ow/aqJ80JN/yNtrS7Tdx2ghHefFmpbHpdmK+FxMrYGE2TIwiBiRnL2PgD
         nfbCKtql5pcIi6BbI/q/WfGH0Kz8UEeWcRofMWOirbZtgrzQTapZZ5vbzoMaZGM9cACF
         UJXm7LObpEH2PsT1ELkSxYoJCbzWWz14bo1ECXfdd6ZZDLbShDd52uc/JCVdMfoGcoJa
         A2oXi+qrX4FyR+OzBkJUWiH5GM2SGN8QxW/OAPIfUy+VS+lHRImCQvQrud2OjwsKceZH
         fUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925490; x=1755530290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukdxjc5DrhlQ7eBdrlN9f+Y4/ViYX/zBdRo4k+wcLt4=;
        b=NAMQociky0YdzRG9W1Dgjq/1vbL88ToyKetscRZTbm+3aG2ZQZJuHbfZAJuQbM0GYK
         y5GHuPUXHoGnxVhlQXDdUjHz+Uo1A814F5ExJ7M6mljRJDuZZuRdYXqzDGiAZWyfq8TJ
         FyE4NsIH5xNx4QcEVQ1s6c/TnhJcfZeYhQFOwIR0jaIgbkVuyS6ux53cpsMr64S4e6lf
         KQ87twA9FLjOZ1m3RovhbhiEivMxYyp5nA+WHQDhO254FIj845obUKGs8MznrwKSRJJf
         FIz0H5YoumO2/wJ2tyIuTpt3+q8AQuIR0iR480fyxo6EBHRSCf8Xp8GbttNm5Fd6beqR
         hUmw==
X-Forwarded-Encrypted: i=1; AJvYcCWLCtiNHHhk9BdHOhn9HoJEZ3Es4oyvTrQs5YVJSzNZwjS9DPSkbntRaaxz9jMV+uEwXEHViv4lNBnV@vger.kernel.org
X-Gm-Message-State: AOJu0YyzGHa6SF/g+M6W44/qEZkLI+PRejHAL5nXEuJmOs4Q315iEbTn
	NJeU61pY4LpzMj0za2FK2JuH7n6T/JTLKxypZc+3yJSmHU/bdrTPNqMWZ6GL4ezMayY=
X-Gm-Gg: ASbGncsR6s1kuVxFZxIE97V0qGi6inTxbVIiqLLW09ROIT+e/N8eUUfKiPZ7l2d8p73
	pAngrDkR+raO0gt4BJCjdv+9HSNefIiD1MFNSb2K8VdDH2fc9QQU7iGucshxRZMxg6T1dDE5OWw
	6uMUC4guTowrpq4a1QeOlCABcS+9UuH5NZPTUfTklO3RsuDd/gZafHo6a7whPGZ5oI3uOEgzsnk
	PR8jsWtOTfOVq761bwLEKSadfC8gJHjWs9yj5cXx3cm2e4W7JpjchTymy1HIOlwWp8z5iufNivz
	4PEtdGlqCJb8KjHgyEpfL/4cLhtnwX4LvPt7+g5HVBdoQA5PSK2+o2n7hqhMN5g1jyrOMx/CHf1
	4ySuxs8f8LfsHyPBeiQUFM9NhZRblCuRpk447F799q0Fv0ymKnH9DrQ4uZYelik6WWN/wyMAAnl
	2x
X-Google-Smtp-Source: AGHT+IGLYy3TQkH/3UhAMhNCt2Tp94AsM9dBQJ1xNBWsLvENOx4hXDkAR8wy7Smqj1yqAlol91Adqw==
X-Received: by 2002:a17:907:9705:b0:ad8:9c97:c2e5 with SMTP id a640c23a62f3a-af9c606d956mr1287835366b.0.1754925490087;
        Mon, 11 Aug 2025 08:18:10 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c039sm2046620266b.110.2025.08.11.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:09 -0700 (PDT)
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
Subject: [PATCH 5/6] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Mon, 11 Aug 2025 17:19:49 +0200
Message-ID: <79b48fbeb009460fd2c03b910a0412b8facab9a8.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
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


