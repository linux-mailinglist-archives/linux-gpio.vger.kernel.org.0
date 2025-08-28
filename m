Return-Path: <linux-gpio+bounces-25058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321DBB39E7E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 15:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6FA43B9F4D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 13:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2F7311940;
	Thu, 28 Aug 2025 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X0agNB8g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA673126C7
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386936; cv=none; b=kqXnJq/74VvHKaDupdXQm+QiwfA/30eiqtfW3liHeXR4FzeejxY0oVK+APoB9YR8kBrjSS6K+TCbsbZv/TOSd1mq36alZuX7rvy62SlIlzF2tkMUZN2u4sf4EcSD6my0Oxg4yl5L7ZoyZmejccfUCU5sikCTXsp5pDgSw9GFWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386936; c=relaxed/simple;
	bh=jR61Jx/L34YpSRYWBi9qFXxWLcHX8m1CNNA0rxY9loI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuYaK66pSanrXKmycdE+I65Dak/XAcG/n/co3VzlV5G6O7Q8t51F7oH6b4fBVIl0ZZGKhSOAoIndveeR23C10+My6l6y1ybPgc7D35MovCKrH05F8ZIRRVskuWGX7YY3LuCHp8G9KXPILCCPb/12DM2kq4MpxI1IMfKOF3EyUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X0agNB8g; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf0dso1566322a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386932; x=1756991732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDbzDzint4NdSMjZoYKjKWKdFOvKafCGzOB2IyJMsjI=;
        b=X0agNB8g5Ohhj+Z2Z+0KH53Z/TcldlKIVLf9BVGE77h/511K8TD6CVUVBLSeqR3bTO
         QnP7kfJHeii49Lb+rOrtStHGc3wkiqlQ2dbIlJEHP922JJLr41PmAViSpJyspWb8lYAv
         CHF4pT/tTsiTAZ8r2bd7E47Rb4ObEbuLU0uBjhzHtpJI911VJx/RCx9NXZHgdVv4BKBu
         0rYhJ486SHa0F28Nv9yzyK9DyP8VrFu+VLWmQexiq8QMa2KPB54jZCxaati/JvuhfeJD
         VISCGEfNo7ucTWGAWScRYv9Ra58C/XrGndQXkqSMzISz7n0giRStpZjetuFnjJkOBjjY
         54yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386932; x=1756991732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDbzDzint4NdSMjZoYKjKWKdFOvKafCGzOB2IyJMsjI=;
        b=Q2NS8W9sYV7AKuYJPZgQpfBvoL2IGy/Z55FGduLkVdMo6vqiIxdAScusJHie6Y5WjN
         DhO1kKSHiHuUleQIAip2kMAQ2aJ6lmJchUtRNRMyuu/cX0cdl8ItP1bVZT8Z3VE7V/U9
         7Axw9hdJZQN94fVHKELFnj2EsKaxQmZ9qS35iO7U400Si9v22shbg0wlYzMSxbrVrdNx
         MOeDSiFziqovtv34ffzC8m+Lqvsj3lK9qZbKQI1vsUD2OXUnvtp/7U/+vjmIgvVUresS
         lFq+/yrdvuVKdukmr+LzDwzU32FfJN8v8kRSAufzVx4i30rBTKXfak/d9H/JzwhfQq87
         v8vA==
X-Forwarded-Encrypted: i=1; AJvYcCWvNy6pdBU6HOkGgfQlV9cy1i6gcN+XVrmFtVK5WrULN0WpsCORrqKSsmYTKgmEec1NuG3zgElXqP42@vger.kernel.org
X-Gm-Message-State: AOJu0YzkrD0OKovfqobWKUrZ3+Bgf+zzYNS58ysgbUVbbAVD4A5bctEN
	XiMnGVigAvRMrZmAjZX7g/V5Ww9m+MjrE7nVbxM+5kS1uUQwsvZVL87EbEHQYJe2vI0=
X-Gm-Gg: ASbGncv1++E3pqtFMXmDLWKdU1Nu7u5NezRUsbpekER9bCeAKm8corG1SIPiaCU14nE
	7qhuLLDlqgfqs27fgm3NJUm3FUQ3UR/ugZG0ng9ECz0raoKdM6r57IzHpgc3basR71aJpP3eihx
	AouYv45iaO+KYcTGrZ7Ikvr23bmyFhdbEcZC/nRhh/THPXsVxgND7jNNac7J3quRfk27XLTPP6J
	cKFPSblhPe04Oq+hY0A2oiYHzaby5F6vhf7qdeUfaeuXxY4lBGjmNwyi5f156e1HYe8slEPRJYW
	nn/snobLpBI598ovEkfMLn+zpw3gkya1GEZ7L4AsVB03PltyNhR+WHtj5k79m3byGldpoqcns9w
	lpLim/wv1e5xI6+7AEmJ5IUbzJpxp3irjGNTLFWqy6xx5jz98qeaKTQI39xR/IgKjsHWDhlrssL
	bx2PkMU9faEwUWDpQ1
X-Google-Smtp-Source: AGHT+IH9+QbGR9aSDPrFBVItl1A1m4Ivh6TYBQXMoc7xdFCVadOMpEbe4v00/Pyx674AUhPZjWsNLA==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id 4fb4d7f45d1cf-61c1b453182mr21153103a12.6.1756386931753;
        Thu, 28 Aug 2025 06:15:31 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cd8ce1cc9sm1302435a12.42.2025.08.28.06.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:31 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Thu, 28 Aug 2025 15:17:14 +0200
Message-ID: <35c0da6a741019efefc3c8e405e210a3a8156830.1756386531.git.andrea.porta@suse.com>
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

On RPi5 device Bluetooth chips is connected to UARTA
port. Add Bluetooth chips and related pin definitions.

With this and firmware already provided by distributions,
at least on openSUSE Tumbleweed, this is sufficient to make
Bluetooth operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 42 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 18 ++++++++
 2 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 411b58c1dddf..04738bf281eb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -81,6 +81,11 @@ wl_on_reg: wl-on-reg {
 };
 
 &pinctrl {
+	bt_shutdown_default: bt-shutdown-default-state {
+		function = "gpio";
+		pins = "gpio29";
+	};
+
 	emmc_sd_default: emmc-sd-default-state {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
@@ -110,6 +115,29 @@ dat-pins {
 		};
 	};
 
+	uarta_24_default: uarta-24-default-state {
+		rts-pins {
+			function = "uart0";
+			pins = "gpio24";
+			bias-disable;
+		};
+		cts-pins {
+			function = "uart0";
+			pins = "gpio25";
+			bias-pull-up;
+		};
+		txd-pins {
+			function = "uart0";
+			pins = "gpio26";
+			bias-disable;
+		};
+		rxd-pins {
+			function = "uart0";
+			pins = "gpio27";
+			bias-pull-up;
+		};
+	};
+
 	wl_on_default: wl-on-default-state {
 		function = "gpio";
 		pins = "gpio28";
@@ -188,6 +216,20 @@ power: power {
 	};
 };
 
+/* uarta communicates with the BT module */
+&uarta {
+	uart-has-rtscts;
+	pinctrl-0 = <&uarta_24_default &bt_shutdown_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gio 29 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 871537366e96..8ff254c35b0c 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_sw_baud: clk-sw-baud {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <96000000>;
+			clock-output-names = "sw-baud";
+		};
 	};
 
 	cpus: cpus {
@@ -260,6 +267,17 @@ gio: gpio@7d508500 {
 			brcm,gpio-bank-widths = <32 22>;
 		};
 
+		uarta: serial@7d50c000 {
+			compatible = "brcm,bcm7271-uart";
+			reg = <0x7d50c000 0x20>;
+			reg-names = "uart";
+			clocks = <&clk_sw_baud>;
+			clock-names = "sw_baud";
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart";
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


