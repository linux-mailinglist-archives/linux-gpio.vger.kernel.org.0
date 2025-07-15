Return-Path: <linux-gpio+bounces-23324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25EB0660F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE0AF50515F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A012A2BE7D9;
	Tue, 15 Jul 2025 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sc4ZkkWs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E5B289E1E
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604213; cv=none; b=mE55R3uZvColJV2B/nMu22rtXbQzrMcojmp0Sez8NQ9rhdeOnx3DFRPN3oMkogvdWq/rbzJAtzMRkZzgbHG62yO8fSL7+r9IPQq7w2gg0YLSQpDx0tA+zgMNoxKteQ//M8gzOh2STNbsqjh85MvcGZ1sC+D3GwSd3j//sB3TDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604213; c=relaxed/simple;
	bh=p3HBeHBoiugp02rTg0t0QV1sY9yaLHHpE/q9U8nTsWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwOyDx6CeeLYfoA5bZOKtcvSC6Hb4zW97xA8Llxft0jPPCNHw3nv4o6kDqj+XeBE4snX/XgFurYDoJKX5m+XiNgWF0as95/1aL6qE9AZH48EArjHB07pXNybQw1zvUfxEoNJse/TniWIjf8bi91Bprtk3Ku9zGeacUT4jWMDut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sc4ZkkWs; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so10529531a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604210; x=1753209010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+h9xdmVtN8apGvD2fwppBr/rzlO/iwPyapASKqAoIo=;
        b=Sc4ZkkWsV9edfTeQvWSkufdnN1Oz3XSIiebd8VMCcIhds0C4xrgmRKPdJE+g70M7Mj
         M2a3twhArULF/FRX0mVn/zJBJbsKCl9WFqcFnIhcFN5sywy/CL2hVQ9uYkTIS2+XO7yq
         8BPkke860jRJwJNyZpl8w71RvgISjURMcufL8spthapmg6jZDz3Jlp+dnw8gVPthsBIM
         p8gPLJ+kGfMuc7u4l5oEiIEoKqHiDNEIIG+ETNpE3VHIbor1ntxF5g7EC07XFNwHb1RJ
         yTbRiblwRAtf33jmTXkWRQn0BcGZWt8x9uylZKAYs2nSSWTbRRcLXoKgL8qJiKJNPZmh
         44OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604210; x=1753209010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+h9xdmVtN8apGvD2fwppBr/rzlO/iwPyapASKqAoIo=;
        b=aWG26DC5VWyYBaS4IpcbbHTfz8nVdN8eO5k5rADHYXNBrJWjXCj1AXcGdWKV4+DBfm
         V66rPcuMQw7eAECHtlHkdbuv4mlcuQVK3TKoUTVYQb2B+uuNEwR8XgCoUrgr8ooRu7L+
         VNlVaFiuKmpDn5b49tZpy1Don6HsESOVukdGnflIqS5AoeCz5ScGybejXg2USRkEcz53
         gl5viTKt3tgzAJPDd6q9O2CEKzb0LfOj90KPyo5BCrI1d8tcPtWOGeRfmbXxzgJ4xAuw
         XLldV5YUVwNYPX7Yti0P4zIuyzm5rTZhOI+BYsH6k/Di6hVxhRYBw1Kx6aQ6Vyvahjrr
         zn2A==
X-Forwarded-Encrypted: i=1; AJvYcCVg5amtj0x8J3pgyUYtWR/UrOWuG2C3kWJPXxrpJvk7xu7IQkhl9dMkaV0mN5nTcVZGS4jPXh/D7AP/@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNjtRQPaW1epRr66c/GMQlZpZlWfBR4d+OJhMoQUyPTCZkj2M
	fFiIQ0jIUdho29OkZio70YAkWVEFLkiNR6jKONl4TU8X3Ksff+h7AG0JLNzrOTLUmdIZXy4ZiH4
	mwIVAn3E=
X-Gm-Gg: ASbGncvJu/Q4uhKgPOeBz9Wwq3QLWNGCxFaSG92aDd6AIrpF8seHFWWwGjyHW5JZxiC
	b+o+qhXJYNi6p4SLiFdSMFBYOuwp5DrOgWzxfiHnMJG2lZYrN5FZ1kC8LQQQvLpFm+H+bKwKqCZ
	hJNWwlQaIqQQbLbcFBWV/snnvcn3DM0xBRkWlpOM+2p1a5zpuM4IuoJYrhnkHk5IDefutDdGG2Y
	hozogCioyynliWJTcNeh21MxRkeY94R8CmC7xWMW600IThix96lABNcrqTCk2Tmxq0iNHgSp7sx
	wIc0/XP7rkYQyI9sYUEX9bzA0q1oXerT6A5rB31Z04L0jCTK+AJwd2lSo8JLHHh/Nvd3NKjOvza
	IInMhlo2RK0NiNqKjJZO8pdGS5CWnGxaDzYoJATpC1n5l5Lgm28kojzA6Ls6PJxUr60+H
X-Google-Smtp-Source: AGHT+IFCdfj/N/QSmKoz1idrwHiCdXZBpEWZQgqG6diApksw+uigpgY7MjvOB4GYk5GKnJVs8sBmFw==
X-Received: by 2002:a05:6402:2710:b0:608:6734:7744 with SMTP id 4fb4d7f45d1cf-61281ea3216mr374571a12.7.1752604209875;
        Tue, 15 Jul 2025 11:30:09 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61253b999b7sm2257990a12.2.2025.07.15.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:09 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Tue, 15 Jul 2025 20:31:43 +0200
Message-ID: <afd4b7c31aa11471e8f79f5fa6edcd2c93dbc8e5.1752584387.git.andrea.porta@suse.com>
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

On RPi5 device Bluetooth chips is connected to UARTA
port. Add Bluetooth chips and related pin definitions.

With this and firmware already provided by distributions,
at least on openSUSE Tumbleweed, this is sufficient to make
Bluetooth operational on RPi5 \o/.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 43 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 411b58c1dddf..f869554fd8e9 100644
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
@@ -188,6 +216,21 @@ power: power {
 	};
 };
 
+/* uarta communicates with the BT module */
+&uarta {
+	uart-has-rtscts;
+	auto-flow-control;
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
index 871537366e96..43cc4ee2a363 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -260,6 +260,17 @@ gio: gpio@7d508500 {
 			brcm,gpio-bank-widths = <32 22>;
 		};
 
+		uarta: serial@7d50c000 {
+			compatible = "brcm,bcm7271-uart";
+			reg = <0x7d50c000 0x20>;
+			reg-names = "uart";
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <96000000>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


