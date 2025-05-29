Return-Path: <linux-gpio+bounces-20719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58CAC7CBC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4E64E507E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 11:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97B528E607;
	Thu, 29 May 2025 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Twu3Bw3q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208C28ECE9
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517748; cv=none; b=tZBSSOEWVVMQelJzhBvhyGHeDnwv1um25e/nIFKiJvHiBBdHZgiQhuTWJ+GpovKFV2I33i4CLCSiPsspiQVS3HwsUTNAqcLrKiFH/cOLhbsdpBiqKF2+XiOaxSKNR7a1ufKT4QcSy2jecYKYSD/PoBgnXs11xrF+NuJ+cN/hZAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517748; c=relaxed/simple;
	bh=eMe4mQgSX9Szv7WKunt7QkqAZDsYcLcx7lYQqW43qQk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDlTCPJAl5QajtS7c+1PUku5GtcGnOr9c7EgZiicbK8zoBlVTCZUIrF0nOVkSz1Nhti/fBLWnID5m4XcbXTVVy7HYmohMdNYCddY9DDPTeYNNxajENDN3XUXVchZOFz2j4X2dYWUOL/Qt2iCJQ/GXuH++wHAiUyZIV5zwu5AV1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Twu3Bw3q; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604bde84d0fso1113865a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 04:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517743; x=1749122543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=Twu3Bw3q0lfpthWMk/GvBUNvTXq6HvKhSEp9sGSupDVD/tWXa8XbbJ/VVzs8MgvFiT
         pdIfVqRAkaZkNIP8IjCyctncLnDX2L/16qrAKp/VujQWxqAAdYhdBeXLc0+IjvGvD6dW
         k8UDvV5H6jXv9BY3xW6D3N0+84EV6rHKxCrvkW5jHoFiygBawuQXNJXcRG3GF830Qmbw
         THNRzGB5PGs4J2PONRVpOg3O4iQXY0SBOSynAbk4FOoauDZUGWvQQd/8OlweIcWEup5f
         yQac1hh9hgcz8UroonZVe1eCg0Qq5fDn+g6a71JvrVF/Drg+XOvhFjkMDnIIHb8C197w
         IYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517743; x=1749122543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=hf3nQqxTfiznMKMDG3dcxxffYB/qeq+8iYjeKl9lg7iXIyZqtix/DLRocI6YR3+ifO
         pbkwYH0bPYu1eaent6xYXg1emi2FGVtdYkoBtHLWZ8sZNBOBYWf9LFr03o0EYno1JzRX
         TYeyPa7uhf8PmIjCJBRUnRFYD0oEz4ODPfHpS3U90d0dU6gttb5qxRwB6ALFCs7Dndu2
         1YfmetXFiBMD9L0LNnVEPEdrnr1Sld4vCeujmjb0t8uvn9Ev7kGahOS0J3/WmDQERv78
         d+ZTeYyIYKtRHujx9eOCKvOwXPW0zdajevuVfHW8Af4hqwPFjX9pAVwArG9tbNu8LIFG
         TdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXTMaN32j3DONDhGH8sF35tbMXjb8CDgjBabEX+DzmnIQ81GyOgdJaAHzizBkBBYmYElDjJMMXqj33@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sNwZUw5oOJB/sf6DQFJHJsfTLPD5/cJho0eY7dFvyIxkt6SN
	5Y6w3ikHgtUB70IHJa+qO1pFjgC/nJyJW3HoL5i8+8csNVaG3zsxUDZqd613Tb1adzs=
X-Gm-Gg: ASbGncuA864rINscMUHbguylLBgo4M82xrAHSnaIJ/wow5tF8t31eqsegT/yC94Ut2y
	JsR3kvle5Kh0rwHUKt5ABnzX0xtv26Wsbvztw7OqmxmM1LWIIyg7ZjsAJlYgTqFZwLGhFx/ja/X
	4DgqtMngOmY8x/WbG4xQ1PofTUmfZaW1djPLEw5kRQYGx1+H4oSpj+szTWQD09/ygJT3EQC4jgs
	SUafd5+6AaLb6oo5Cvs4A+v0JNiJDGeEybOVfeqD8MNAqpR4bm2nqADQZcL/Gn4YnRBAW7TFC4y
	7hjskdFTBemh33+cjmy17G4K92AWIlJz2QI8+GhukLM1YBZPLIw5nouOsYGQRbpqPsFaF++0muc
	zK7uXAFn9TuDeB/pdz6CJrg==
X-Google-Smtp-Source: AGHT+IFCN6hRr/RrR+RIMXcb3Tq7I7fRbENqTmEG0i8BEd7W5tpHwCuHSDbIDfo8Fje/1qMDW9uKSA==
X-Received: by 2002:a17:907:d90:b0:ad8:9428:6a2e with SMTP id a640c23a62f3a-adacda5d03bmr182833966b.4.1748517742521;
        Thu, 29 May 2025 04:22:22 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf05csm122528066b.113.2025.05.29.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:22 -0700 (PDT)
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
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 06/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Thu, 29 May 2025 13:23:41 +0200
Message-ID: <20250529112357.24182-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
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
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi  | 14 +++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi

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


