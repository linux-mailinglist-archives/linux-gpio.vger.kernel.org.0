Return-Path: <linux-gpio+bounces-10949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6C992BED
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FBA1F22FC3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402CC1D2F4F;
	Mon,  7 Oct 2024 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JuR2da2I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0181D270A
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304790; cv=none; b=sszER8UGr3Y2tBkwBQdkakGWAqMu/yD/1Ehpgpkxr7py+ZbdcBmhm4DoNB5skt0igKA3XDc9Az3BqS4FB+QGfHYa8/fu/7a7fmiWtZVX57SSx7xIg2QIbD58colGT4aL7iZiAZpqwo23gQj8mA2NaWelrTWU9/x1SWvYcwsMvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304790; c=relaxed/simple;
	bh=7UhSvQBmVVVFTx8acFF6PuDjpxUKtYsn2w3BfhfFDuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4ec9fRbdXWzrjDTnis1Fu/mDckpLwFrVfcEwHoHU2B6my3C7N7Y6d9N0v59smuk+qg2vM2wecHBD8FPyqynn6ppK3kja9waueEv3hCsQRm2m/hLQALIM38kkpdR/pPM/vasjQ+0tODo03ZEiMYDy2eoYuKy7Jpt4pqEMTVV5FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JuR2da2I; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso45553781fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728304787; x=1728909587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgrKN4eApCbFOs4N+EhAzDBdIZKuI46lB8d+c3tNOMA=;
        b=JuR2da2IUc7N0l5uBplNuBqaCp2RLdfIVzFNljP9fvbPtMuVG3mndVn6+/it92EA/S
         3qN2Ein0mO4eIwPX7SD7Q9Xc8u1zMdFCw96MQt3Milw3kFafEfA8slgYDJy9hsTSyEkI
         +QGDilkxNXj+TUa0wfdZN0mU/bMewoWcHVjFIpVpWypDfePZegQqVA34Q5Z4lHfUOMAM
         OzLRywRp9gjjJ7k9I4erkJ2GW2djxypD/PWD4vIYCOTHiGmzc0sPZTPW1VNMLILFt+N8
         uPeExEf1bI8ZDOYv8gAXF+meYBzzmQah+oUJl0Hsk7EpboV6lBinSdTSyMInZcQ5C26g
         WYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728304787; x=1728909587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgrKN4eApCbFOs4N+EhAzDBdIZKuI46lB8d+c3tNOMA=;
        b=etRGK9Ii7gveltd6greELFp4rxh9J4wOMLI6OxcVZ8Sgvpnz6ppKCQrHeugSyvAD2h
         H8tqK42T+BPWDoeP+tSdal3ZZFaKXEe4AIOTChWzM9UA/9Hwv+sfr0kdlO19PYH3mPJs
         Yqf7Tf3fVGzSOLvbs3MvUDlOhgvzWQaJ0gjDO3wPPV88/Vu6OVI48SgbCaPjpAGkPLbj
         WVge55vpoW0Vmtn/tULenrxtLaGIIeG4aesDep5BnoV3OuUwBoYg9J6Os578vQL9joCo
         /jJhjcnLJiMgQSPld5MMYMToQ0oP4kLPDD48fZ/z61HJ3xuXRpTJaWceC3MsdiuUFiEg
         xnBw==
X-Forwarded-Encrypted: i=1; AJvYcCUxOc63gw+EIOIdUfIDtTkkqpopkT82/WdcD/G4GMCrv8kR0SawtnlAEEAhUfoGK+6R+XXIEd0+rtEA@vger.kernel.org
X-Gm-Message-State: AOJu0YwlB21ubPlPZ1w4zkJMEHrEVR5eIjBztteGQIDjXFnhqu/3xypw
	9Pd2cV66jrf4kn3LgKcOCEHdzRDNR1k73mP0j4sdeAd2FT0JcKfyz353qdvt3qY=
X-Google-Smtp-Source: AGHT+IHDEGgQN5ZAuRiG2HqradKHEOIaOuc7C2a238QEWkbXsHMPYlNkPtg/LPod7W5QLOgBwmJ3dg==
X-Received: by 2002:a05:6512:3085:b0:539:8a9a:4e56 with SMTP id 2adb3069b0e04-539ab8c6fb8mr5863094e87.53.1728304786571;
        Mon, 07 Oct 2024 05:39:46 -0700 (PDT)
Received: from localhost (host-87-21-212-62.retail.telecomitalia.it. [87.21.212.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm189783166b.85.2024.10.07.05.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:39:46 -0700 (PDT)
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
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 01/14] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Mon,  7 Oct 2024 14:39:44 +0200
Message-ID: <74199551e7a9e43a9aa2e1ed1a678493e7a8fb2c.1728300189.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1728300189.git.andrea.porta@suse.com>
References: <cover.1728300189.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the clock generator found in RP1 multi
function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../clock/raspberrypi,rp1-clocks.yaml         | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 .../clock/raspberrypi,rp1-clocks.h            | 61 ++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..5e2e98051bf3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 clock generator
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
+  VIDEO), and each PLL output can be programmed though dividers to generate
+  the clocks to drive the sub-peripherals embedded inside the chipset.
+
+  Link to datasheet:
+  https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-clocks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    description:
+      The index in the assigned-clocks is mapped to the output clock as per
+      definitions in dt-bindings/clock/raspberrypi,rp1-clocks.h.
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: rp1-xosc
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rp1_clocks: clocks@c040018000 {
+            compatible = "raspberrypi,rp1-clocks";
+            reg = <0xc0 0x40018000 0x0 0x10038>;
+            #clock-cells = <1>;
+            clocks = <&clk_rp1_xosc>;
+            clock-names =  "rp1-xosc";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..75a66e3e34c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19380,6 +19380,12 @@ F:	Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
 F:	drivers/media/platform/raspberrypi/pisp_be/
 F:	include/uapi/linux/media/raspberrypi/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	include/dt-bindings/clock/rp1.h
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
new file mode 100644
index 000000000000..b7c1eaa74eae
--- /dev/null
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2021 Raspberry Pi Ltd.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+#define __DT_BINDINGS_CLOCK_RASPBERRYPI_RP1
+
+#define RP1_PLL_SYS_CORE		0
+#define RP1_PLL_AUDIO_CORE		1
+#define RP1_PLL_VIDEO_CORE		2
+
+#define RP1_PLL_SYS			3
+#define RP1_PLL_AUDIO			4
+#define RP1_PLL_VIDEO			5
+
+#define RP1_PLL_SYS_PRI_PH		6
+#define RP1_PLL_SYS_SEC_PH		7
+#define RP1_PLL_AUDIO_PRI_PH		8
+
+#define RP1_PLL_SYS_SEC			9
+#define RP1_PLL_AUDIO_SEC		10
+#define RP1_PLL_VIDEO_SEC		11
+
+#define RP1_CLK_SYS			12
+#define RP1_CLK_SLOW_SYS		13
+#define RP1_CLK_DMA			14
+#define RP1_CLK_UART			15
+#define RP1_CLK_ETH			16
+#define RP1_CLK_PWM0			17
+#define RP1_CLK_PWM1			18
+#define RP1_CLK_AUDIO_IN		19
+#define RP1_CLK_AUDIO_OUT		20
+#define RP1_CLK_I2S			21
+#define RP1_CLK_MIPI0_CFG		22
+#define RP1_CLK_MIPI1_CFG		23
+#define RP1_CLK_PCIE_AUX		24
+#define RP1_CLK_USBH0_MICROFRAME	25
+#define RP1_CLK_USBH1_MICROFRAME	26
+#define RP1_CLK_USBH0_SUSPEND		27
+#define RP1_CLK_USBH1_SUSPEND		28
+#define RP1_CLK_ETH_TSU			29
+#define RP1_CLK_ADC			30
+#define RP1_CLK_SDIO_TIMER		31
+#define RP1_CLK_SDIO_ALT_SRC		32
+#define RP1_CLK_GP0			33
+#define RP1_CLK_GP1			34
+#define RP1_CLK_GP2			35
+#define RP1_CLK_GP3			36
+#define RP1_CLK_GP4			37
+#define RP1_CLK_GP5			38
+#define RP1_CLK_VEC			39
+#define RP1_CLK_DPI			40
+#define RP1_CLK_MIPI0_DPI		41
+#define RP1_CLK_MIPI1_DPI		42
+
+/* Extra PLL output channels - RP1B0 only */
+#define RP1_PLL_VIDEO_PRI_PH		43
+#define RP1_PLL_AUDIO_TERN		44
+
+#endif
-- 
2.35.3


