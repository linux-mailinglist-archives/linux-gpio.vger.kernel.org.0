Return-Path: <linux-gpio+bounces-17796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF6A69B57
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 22:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8954C4681A5
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 21:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F3E2147F2;
	Wed, 19 Mar 2025 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IM6eFRHj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902921CA1C
	for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2025 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421098; cv=none; b=qF6N9h9lOr3d9AkacJMkysIv4Yab+7tpapUqkhRrrIfFdZPCigdtztGHN14X99lJADMXjagk8cr0WeTJIuj0VwVWutk0qdjlCoUjF6iV+Hd89Ewvu+PZs+AlbEs1UhxZLjeOM1Hq46Jx5N6ZrkMmuuRVRZubAE+mcj6b1/cZdxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421098; c=relaxed/simple;
	bh=Lhy7CEokE9Gijs+wEZ0284UNzyprowstDvOGnqo+duQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReUONG4nI6oxdotSwVy+JCn0HoYX8KM5pvke9HTlaL5SDxLxQkAkzEGtboDcyALAv63fSWmGxfJqVBRIn7f9UhGMeZS5mlRBd2xNFMo8eDDFPVzzzCy65a7aWjbtEnDoVLH7ShJq2bIMMBDa64ob2bJ8VqQTqrTXi5K5Zbg9Ovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IM6eFRHj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaecf50578eso30325966b.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2025 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421093; x=1743025893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2zy4FeXIXTtYjjpoH71JN1fhoa8L/cfW4fCg6XzYKI=;
        b=IM6eFRHja71MgTnpPW93Xsz2c42RXxF/xScgjf1LbKTxopDYTW2aksK5Z40ZdKSzEb
         tnH5PZyrDRYJGjbinmixiT9rc9aDKcNbdlVUIYajaFKOJqAE5g4oXhsFyxalnRvHADHb
         Izcp6klqJxF2JKQIklP5IqxnXGM14V308rigU5ijCKwWR2FqD7oI3YcdUTYOJ+AsUSeb
         7uY7F58cX3DX5RU+0OOipp7qKwbJmiLcQrqn6yC2VStyq9V5fuXEWcenO5e/smlFxcB0
         KsD/z2CosSbdtfUyz92k5zXEdo5vjdKXKclbvr+j1UEKe3kYLF1YoapzYxv/0gZcanBS
         O0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421093; x=1743025893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2zy4FeXIXTtYjjpoH71JN1fhoa8L/cfW4fCg6XzYKI=;
        b=Acr8FOIM5PzF5Gp3Fno1D3a/2hjk7QHCOZtf8eCzc7HP0Qe0584CCFC9dx1zn5T6hK
         YArsVe4vyjl7onhbZcav9FwuoI1i3CbJEXq2dQ5dHoWt+xdpRGlcveXCbkhTvGF+cel2
         4tr1K33/+aAwdniIbIfwNlcvd1BNX+LERVBh5zRQOvfUG5rLSlwD19viSEkb8dIXqryi
         BOse1LMZy+AjPWBXAhccSndognK3lI45v/G9uTMlpdYHmeOFEUyEajmVmLHL1dJOSeO9
         EmppIkMVLzdFzTdhO/GjkbfRPQ+DVSLS17I8KxLICu5jyYAT9gsFr3kR0fSgU0f3yslF
         umrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRFBJbaqWbtn5ErYSZC0JFpiLwv9J1Ugumm7wBfM7iL1N5iqFK9HWJezQ0EmIVQE5aMFuVSW6Z81j7@vger.kernel.org
X-Gm-Message-State: AOJu0YwThpkmYA4hYCwmcZvUFFRXPwbwPa/rGxIaugHTCg0391jTThQm
	IvPx8FPuYvfVAvQbwS6eZSH21GE8qxESMmR6tKz4DFby+7wIRWIAkhdYagGJM/g=
X-Gm-Gg: ASbGnctEl/b5atRHJ4Gs0EqYxzRllHYpvbCiL8EdTvEDrWtdSA2cPALjy2vg+PGNa8A
	/vN98nomFBlUNo+HV/vfLHF9mVjICOAY8N/L8WHnvlGY1QVu668lhSEUSYIz4a6GXZqONDRQSCf
	BXTaJyL1JPyD6KVb8zsE4dRCCPwrfJJsWdP8fWJnzfRNrB7sTUQDLZAaeNVKPlGpkfdlrFJLyM0
	bqh7Kew4PnUOAQbq4lqMR2BhHdSvc9JQunbTxhG1UlsnD6sheHKV+wllrnxaf4NO0LZtKyZX1e3
	HcYWpC98q/xd+jwXlfc0lwyqt01O5t2gFIgPkb3jGXDZnSjU7jmBA28vDgQz6vMMVn28NyN2zNw
	yH3eRvWzClg==
X-Google-Smtp-Source: AGHT+IGNlsQE3/+ip7HiTTOlJRqlxotWKEGD3QpH9WcC3PxLd3+7MT5s4pAz5vww6yDtWBF8s6KPiQ==
X-Received: by 2002:a17:907:3d9e:b0:ac2:7cd1:3aa0 with SMTP id a640c23a62f3a-ac3b7fcca8bmr538543566b.57.1742421093063;
        Wed, 19 Mar 2025 14:51:33 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa5208sm1073774366b.177.2025.03.19.14.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:32 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: [PATCH v8 07/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Wed, 19 Mar 2025 22:52:28 +0100
Message-ID: <99269f7762ec0124315e0e8977d9ca4f469f89ce.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RaspberryPi RP1 is a multi function PCI endpoint device that
exposes several subperipherals via PCI BAR.
Add a dtb overlay that will be compiled into a binary blob
and linked in the RP1 driver.
This overlay offers just minimal support to represent the
RP1 device itself, the sub-peripherals will be added by
future patches.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS                                  |  1 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi  | 14 +++++++
 3 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index c2749c588809..6e07b4fb1924 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19751,6 +19751,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
 F:	drivers/clk/clk-rp1.c
 F:	drivers/pinctrl/pinctrl-rp1.c
 
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
new file mode 100644
index 000000000000..5002a375eb0b
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+pci_ep_bus: pci-ep-bus@1 {
+	compatible = "simple-bus";
+	ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+	dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	rp1_clocks: clocks@40018000 {
+		compatible = "raspberrypi,rp1-clocks";
+		reg = <0x00 0x40018000 0x0 0x10038>;
+		#clock-cells = <1>;
+		clocks = <&clk_rp1_xosc>;
+		assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+				  <&rp1_clocks RP1_PLL_SYS>,
+				  <&rp1_clocks RP1_PLL_SYS_SEC>,
+				  <&rp1_clocks RP1_CLK_SYS>;
+		assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+				       <200000000>,  // RP1_PLL_SYS
+				       <125000000>,  // RP1_PLL_SYS_SEC
+				       <200000000>;  // RP1_CLK_SYS
+	};
+
+	rp1_gpio: pinctrl@400d0000 {
+		compatible = "raspberrypi,rp1-gpio";
+		reg = <0x00 0x400d0000  0x0 0xc000>,
+		      <0x00 0x400e0000  0x0 0xc000>,
+		      <0x00 0x400f0000  0x0 0xc000>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+			     <1 IRQ_TYPE_LEVEL_HIGH>,
+			     <2 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
new file mode 100644
index 000000000000..0ef30d7f1c35
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+rp1_nexus {
+	compatible = "pci1de4,1";
+	#address-cells = <3>;
+	#size-cells = <2>;
+	ranges = <0x01 0x00 0x00000000
+		  0x02000000 0x00 0x00000000
+		  0x0 0x400000>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+
+	#include "rp1-common.dtsi"
+};
-- 
2.35.3


