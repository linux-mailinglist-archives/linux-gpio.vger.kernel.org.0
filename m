Return-Path: <linux-gpio+bounces-25055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E621B39E6C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 15:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5F6189A1CC
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 13:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5741311955;
	Thu, 28 Aug 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PSjJ/pY2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584B311940
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386931; cv=none; b=QF7f3GIsuljthXd5sRlUrtRFiYG0JUc4teoBDWvxZltzDmGoFb/UqtqWcqOt6YkVVZ5lPuKtLq8OTcVTeokY2TWlleXVf3zUPqqV79/7tdhiPWrTUAcXCR3M+awSZBQLXPlW5xXtlOgeXHNl00YplyVDFqLMfRUbriu4EuZYd0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386931; c=relaxed/simple;
	bh=vBnN8DLO1IyK/FF3eoScaAnrczZfW9FMOyK50IcOfdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+Vy+1frDN7bNeQOmZznz7LwQmtKLSyO88HydNf7mfWKlxLNJVTcXo6DUcjHwasg8/xySCgKsCC6tJrIAU2jLcNQXvwaiCroLUTJGygxpLAu13oa1cawHgYLmJHYth7j7Fb3sJFRBa6ypJXqqB5oOuwucf2wQknycZSa7M2fBNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PSjJ/pY2; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78fb04cso146332866b.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386927; x=1756991727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=;
        b=PSjJ/pY2eHJ30+7hqCkAT+PHfREf9R7gSZnFgsbOLtQ3Ksp2ZYbkB7ci3TTY4g9nP5
         GTSFJGWBm/JEO6uqUy+DOu8NnmV35AcoTcitSVcZl5VL3i4x50HMPexRSiFjW40zTvc4
         5gIFRZj61ptGRICNfYAr3ryxZNrGw4drY5wCQzjCMhoaQ4cwon04ShzHrMO7KFy4zWTY
         8tnoeq2akV3EUT3JekutlEbHIe5AykAGjVCGWExXYwhItL7Fw7ob/fLvVGkmcPrhGins
         E0O7cGbuHPZW+lUp+avaHrTMc6qYusbieVvyq9vPrORB4qXSPTOdcJbK1f46SjvTWOoc
         x4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386927; x=1756991727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QaxZi5zsPReb4K2terbRmDrkKgIzfIFAXUsOtzdqtc=;
        b=gFRH3CJg6j+cJkZQuWRQv90pvMjNTc/3slMa+nh5o5r6JrSrD7DIKyTsEcNj59nU8j
         PcwahANuq+shhRzJIqGJQh4L8LINjAmp4X4Ia65EkwX9dUgFooQ4x1XWxMa/Ww99so6t
         dCpWqbTecHvx9HtkCz5D7PEX3yRVnUp/VTRNscb6fn8GC3FeZEDQazEnGVgVnHIUzUUx
         evFJ5eN1ehASkmHM1CedVCWJs8R9W8ql1lDf+T9y0nJtQnDZ1PzD7g0sUi++zn5PhEng
         7Y7EZrr+gSrviv19p3spewMkA7mPu/HvdyAOx0pmMcbuqm+t3RJTNVDuobOVCpAQyAWW
         tVOg==
X-Forwarded-Encrypted: i=1; AJvYcCU8eMyQYsZkYCeCq/L0kSLw0fdQJQk9iVTsdnVMHvCjfpXQYp1tD0QdAfty2eQqvJ8mhtdYxiAaqbbn@vger.kernel.org
X-Gm-Message-State: AOJu0YwgC3JLiSvJAcEBF/2kYeJbKMFvAtJSycwaizJ2x48DPNBYj7BE
	NZmx09Y+6oyS2LtGiLOntQzG6bydCQS4Tjk52VfJyAdF9PCG42azkfIoYllLZb9Pv2U=
X-Gm-Gg: ASbGncvPtclUB6mS2O9zuRZpmB/eHKe7Wg3ZMJwBm2YLAekSa81AipJNPmX51mtrgvW
	eMjwan/VR5UTmqLeE7U3xrUf4Eha63o3FqRQtWSniA7hbH2hHNjrxrJYakxZhnbY2nx4mHIMxR0
	zU8fw16ujqBJsxnZpz/tkh60ETSy/myxaNptXuOjzvbu5eXC5GjE1w5v4RPxbWT2aXpFAL/cVpx
	nK5TFFh0aXoigMpuShn6bD+aey0TJrbzLGR7reAUxP/pWnk8akKuKJkdDp6/uzlpGhM2wG7u8j2
	h6vzLnoNSFuSYBH+Exd6Jr91kHX7oI7Xfa4MPAc243HTFh7O/WitsU8LrhjOTMGB7ft0Yab9bzD
	Ehuk05XLDB11C+qWdLU7Ejijp5bdgIEhK1bjk7Tvby3XyDYCjMgyTowiiZoFXEqZcvGiMLPEtFV
	e+Ohy/iG9wGT51CTpuCeSriUAiAyo=
X-Google-Smtp-Source: AGHT+IFASTcYU1kmiPw/dIyGBabTtHK5TXjK29v0S8XCQMxwAXDktvkvQ4lV7/Zr24KakzZQ7bRZwg==
X-Received: by 2002:a17:907:3f82:b0:afe:d1cb:632a with SMTP id a640c23a62f3a-afed1cb6ea9mr444267566b.37.1756386926851;
        Thu, 28 Aug 2025 06:15:26 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe9c908414sm641942066b.97.2025.08.28.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:26 -0700 (PDT)
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
Subject: [PATCH v2 2/5] arm64: dts: broadcom: bcm2712: Add pin controller nodes
Date: Thu, 28 Aug 2025 15:17:11 +0200
Message-ID: <5ceba8558e0007a9685f19b51d681d0ce79e7634.1756386531.git.andrea.porta@suse.com>
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

Add pin-control devicetree nodes and used them to
explicitly define uSD card interface pin configuration.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
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


