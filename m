Return-Path: <linux-gpio+bounces-23320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 718A8B0660D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E078F1885AA4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F3E1E5018;
	Tue, 15 Jul 2025 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gO61JIsH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41E289E1E
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604211; cv=none; b=eDSxwUdx7q5k0wIdOcxAZKuzMj7EXIUxsX8XlDKL2lWYbIvAYVN53Io3NR01vgKaWpy2Dc9H8PFnT3fpaepLGHQXGjOZXXtojo1ubwwEHTZIIS4oSk9coIb9RQ26kaqlW4qaaYGicjWZbufl2kP9nJfRLUUxxExeLpvqkyHf1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604211; c=relaxed/simple;
	bh=oSX6eaZxnreVCGzoGWW6OPDzOqE1Lsryc6osd6keKGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5b5dudOSfzcUwZ9xOXHuZWpwRdpOr03yPC4rzn6Hq+ABYJ3CjLdxM6P0WC4lSQymNxkBrZQS9BUswX6ogEyzBEKsUYLFsAl/PVyP5EfAY/GVg5Ct7IEPqkk/sLQXv+d5FWieL/XeJhL+aQgmrVFoBtOtwaDbkNveOvsbQxtVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gO61JIsH; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso10566898a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604207; x=1753209007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyE00LRDSnopmAT6DbY1MVSXV6x2jM07IWJn7TK+m7w=;
        b=gO61JIsHT+9Rsv6IYHKWpPm/tICm8qLGNZzwNEt1sdS5mM/SgZQR284fzkv+TPgBd1
         TPDhHtoj169Z1mWxpHn2OAuTxLI508Qwtz5qUwdBpxYnn57eAa8LmYs4oR4dRX/xHFAt
         AdDTgyKTIdAd6cPRg/9FbZ0pPSmZl/5lTbSCvzbCxGgzJU8N6NjP2rzTQjFxZrMNqEq7
         dJDLPIIhzWm/NbVT0bY7x5RXpEMION8tdUZe+utaTqZWceRuZnVl+QRoVYJ1zFl43VRn
         dhHl7Gtj9TOcVh9nWiUaLrsB0nil9XjoABaOxf04lvE3Le0um7oxssF4R51aUe0hgKEV
         W8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604207; x=1753209007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyE00LRDSnopmAT6DbY1MVSXV6x2jM07IWJn7TK+m7w=;
        b=VyfO7zOyDZpKCmRCj1p3B8kqLsNJJgkPOtVJdwoeLvdpZy4TI7rpQYU4PrTvKRD45Y
         PolU+WSFDMMPC/Euq7lt6Xq+5PXsj42MDitinaE2tDMWVnLOFYYmVnuG0vZHRqjdGsO6
         AKXMiQLCkckokzWaejtSv/DR95jGurebTN92EDkojSy8NjLbPRrD+4qXWWF3HuhU2/Aw
         A669Rtu+8dM71MupuwY6U2NEfH/THCBiIb07uuzfkJZlJiaMEx++T0BpRzxdQ+tidHYk
         2rC0VJqkYHwBM9xnNNUspqIrfOvAw+8gMIj4Adspu5urten2uEn4if1hPWfbxKOii5T1
         FdtA==
X-Forwarded-Encrypted: i=1; AJvYcCXy7rVSyBzItXqFiLqHNMrWVnjVKNnfOezC4RvU/pwuuNjIGmmxrB4WQw+oXUmPGtDOpWICsr4bkQBy@vger.kernel.org
X-Gm-Message-State: AOJu0YxpkkasqXpPy/jLrJikbphUcE4Bn86VnFkBc8Qfn4c14ThSCtPJ
	BHhXQbUhlK5v41cwY0LzuSmTxqyMtjuzjl6MVr8bPhr7XtHRyLMJ++cHt3pkQnE04Vs=
X-Gm-Gg: ASbGncvm08GYlQqwXDgktKDSrAqZmLgYC24rlF+fXHPqnsuEWE+zsTJz5ErPX7Z2kDo
	JA/yEpGMF7Xvq8GEwhULL+IB6lAnILBTMvU5AgEfCfXfVwtYcfO9NVUpWOo4ejnZkdvSl6caRhD
	jHViUstFamBZ+mDI1jQ2Ai7gJFUAh7WYeVOvDO70pm8+cdH8DKvG8NXLy3sHvEZm+fHCS7gacaD
	ry4K6ksWyHJTCMy39a5MYnFUzFl/EcSCgwIV9d4RK4B00vAvwuI703foFQQdXz73JMNPJ7q0l1t
	SiPNzVu+9dufUd3a4ZWSrc9caN8ylzqGxX4kIsialcfy9ofr2ty999AKAz6GiWpYsDTyW/7pYly
	5jwTny6xkRwG8CKD6iDnFCUGJYZKnHGgMnp8PHcgqOsrDIcZQWNeKaMl98+9+5Bq32V33
X-Google-Smtp-Source: AGHT+IH8BPAZmSQAnB8HIlW3wviHuh+xRMGS1WzWK9BWVWaZHe7UESQucjX6BWQ4H+a002ZhuVk51g==
X-Received: by 2002:a17:907:3d06:b0:ae3:74e1:81a3 with SMTP id a640c23a62f3a-ae9c9987317mr44237766b.8.1752604206906;
        Tue, 15 Jul 2025 11:30:06 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82e9341sm1044733566b.177.2025.07.15.11.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:06 -0700 (PDT)
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
Subject: [PATCH 3/7] arm64: dts: broadcom: bcm2712: Add pin controller nodes
Date: Tue, 15 Jul 2025 20:31:40 +0200
Message-ID: <9ecd874aa455db1f33a0c05f5e81c0c38baf2107.1752584387.git.andrea.porta@suse.com>
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

Add pin-control devicetree nodes and used them to
explicitly define uSD card interface pin configuration.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts   | 18 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi      | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6ea3c102e0d6..6091a1ff365c 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -53,6 +53,21 @@ sd_vcc_reg: sd-vcc-reg {
 	};
 };
 
+&pinctrl {
+	emmc_sd_default: emmc-sd-default-state {
+		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
+		bias-pull-up;
+	};
+};
+
+&pinctrl_aon {
+	emmc_aon_cd_default: emmc-aon-cd-default-state {
+		function = "sd_card_g";
+		pins = "aon_gpio5";
+		bias-pull-up;
+	};
+};
+
 /* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
  * labeled "UART", i.e. the interface with the system console.
  */
@@ -62,12 +77,15 @@ &uart10 {
 
 /* SDIO1 is used to drive the SD card */
 &sdio1 {
+	pinctrl-0 = <&emmc_sd_default>, <&emmc_aon_cd_default>;
+	pinctrl-names = "default";
 	vqmmc-supply = <&sd_io_1v8_reg>;
 	vmmc-supply = <&sd_vcc_reg>;
 	bus-width = <4>;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
 	sd-uhs-sdr104;
+	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
 };
 
 &soc {
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 0a9212d3106f..8a517261841d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -243,6 +243,16 @@ uart10: serial@7d001000 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@7d504100 {
+			compatible = "brcm,bcm2712c0-pinctrl";
+			reg = <0x7d504100 0x30>;
+		};
+
+		pinctrl_aon: pinctrl@7d510700 {
+			compatible = "brcm,bcm2712c0-aon-pinctrl";
+			reg = <0x7d510700 0x20>;
+		};
+
 		interrupt-controller@7d517000 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d517000 0x10>;
-- 
2.35.3


