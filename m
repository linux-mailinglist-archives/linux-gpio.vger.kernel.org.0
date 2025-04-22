Return-Path: <linux-gpio+bounces-19146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F241BA974D5
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 20:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C188178B08
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18BD29B22A;
	Tue, 22 Apr 2025 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BKzKzsmO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823B2980D6
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347937; cv=none; b=GX/MKatB+aeGvOj/vpkWAyTM81RyvldINCHy26Mn6pdwn7pN1obugYSUW2tk7Ds7ErY2CKYdIYsPog7CazhGmAn3iSGKI/W0bClDqq0Q/nC9wh/Sk1ZsunB1YfjFthkCQZjLwcp/cBHPh2P/yHMD7fq8sfnBUVnr6YiEuxxdKrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347937; c=relaxed/simple;
	bh=UTPvffIABUNhlGZVcA2XJgtcHh9OQXOBaQFZpX3Y43E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOd5uuj8ii2D4x1tC78//WM70iZ1E404+lYjyAsF6lNOzhkK0eUWc9YJ+8UuRSmdG+9/UPjUTPiHdVOFuXSO5IZh3G2sRtxcC4Z2D5OEHL8TeqiQC+DghUWqKGP/GqPz6lpfPXLATDnKcRyZqFYVs8eTSIRAYkYfpxVsdmNPddk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BKzKzsmO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso38940905e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347929; x=1745952729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZnx4j541acJM3Wm8RPUZeJrdc2b8jCDkdy37pgO734=;
        b=BKzKzsmOuR2dIqSK5PmlTIZ6IXxJ3awhQZcXmyEMueIwjXLUH+RjEdugd3JEpGN1MT
         87GoXrs/5ymXtmvpeqcgpfobtjNYMRgj6ETS3sl+NmqEP2ZGvPKrdcqDcNKls35tQfc7
         PhpWs5Zyrdjkl8JWoLyJMON4MrpIvSED+BpfgQAYhIREqz736DUQv4kCXUu3T4tz+/0+
         ZhB6USV+NCU08IqdNBWrQp2Aw8UXQa8JTrQQsHdyW2RRgPKWnoNcal9ewO9r96SbJ0Ki
         HSHqiXNxVcKvu4SMiuMwzLn15Zw/7xoVhRuPUzFr+pk3/bnHvPqA5es9WyBnMx50s7u1
         SahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347929; x=1745952729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZnx4j541acJM3Wm8RPUZeJrdc2b8jCDkdy37pgO734=;
        b=YXJWo/MUJ4ItjqJgojqTGp4ICdStAHQEXTw8ytKKwMqkQmpYB/AcELRY/MzZTTNOTN
         rD3UbrdvIvLZRMZ6ZFyFP04row0bZL4qdKf7B0CfTAAFIVL4yx9sY50yaVwPqruSQyOY
         NBarNUa5MLHr3MI6kkiQPiRyUI1iJTuEfDm+cv1ILsGivmlynpLgZ08V3e/7FB1rdxdB
         Rpru6rC8Bqchci+LrEmyck2z+gutX1+T86rTaqgaM8L/TtdYLOdTLL5TGWx0JgqijTrj
         j4vbh/78aXIPJIwiM4N/mQaNnK2TD4qT3NJXhsWiSQqxNHV/E6Y9B0RxtmiehU518GFg
         DGmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG4pJhpyQ4Q56vTtuVCKbYm2zmsdR8ruQjR9yM2DR37KUj+URiPLoP1X2DSEKwtHu0CVUbD3VY7rDc@vger.kernel.org
X-Gm-Message-State: AOJu0YxSS/DAgtOCt767c0ciWPlBJ86uVYlQBcjcchx8+8X1CFo5lb6n
	yXho4wDfxFLYz8RIoa4dd/4/o1cWVM8P131/yW9BGdGkZ756dw2MlLCpTBCvO00=
X-Gm-Gg: ASbGncvZiGkLD3a4ZMpIcfHfqhcSYShxO7lu/5tAPE6clPohVX0/BDtvb8q1EnI/Itl
	zqlpgthxqJn0V7MsePKZqjAjH4ifOoOfpw6ls6OtkrRdN4CzDR7OY6tunQYC+96wFlatCunwJsv
	J5UmtylhvNpsNYdKVqyTQKIsD4HFrkAJODsWbbPXgH4Z4/YaR0eArr2WkajJ2lt3/efEdAisP5j
	AQwHlAvTYyhw/El27hRPZNisJHAMD46bb6J49tKOgZAc+fSkcmJZoRIlY+QieDjAfGUvA7e4mFZ
	mBvW7/ZQLeqY3sTnzoiu7wo8Fur1RjTt+ChdVAsDcYKATBh9YZkSyxClwYOR5ZOSbT/zEho=
X-Google-Smtp-Source: AGHT+IFg8Fki1LRM4fnnmh1iosi+KfKR/CqRtapkeYhOgAsRPRKq+DWMpLJJFhy6jDly7HRKgEDVxA==
X-Received: by 2002:a05:600c:a016:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-4406ac0a324mr132480095e9.21.1745347928949;
        Tue, 22 Apr 2025 11:52:08 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf2csm16237796f8f.51.2025.04.22.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:08 -0700 (PDT)
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
Subject: [PATCH v9 -next 06/12] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Tue, 22 Apr 2025 20:53:15 +0200
Message-ID: <5d47f8e7eaad76032e1b5f433516dec7640384c3.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
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
index 92b959b4d372..a941e1cfb22e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20364,6 +20364,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
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


