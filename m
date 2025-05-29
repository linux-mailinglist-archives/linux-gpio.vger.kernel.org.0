Return-Path: <linux-gpio+bounces-20715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DDAC7CA6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1EB0163C4E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 11:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AD428EA65;
	Thu, 29 May 2025 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CpIgCFDW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B6528E5EC
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517741; cv=none; b=lVhoRR4oqtv/b4sjTpFrXyL/TIyb5MEpUvC68/pTzNHYMmubpmb2TbKjY84deFIOb0e/eW982BLJi09XkPu6E3IXAqcuSqbqKFZaHqCYWWdtgG6Di9Y/ZLyAQmaGhnfDSTZBNRucyNaueHf94wgK1WDnx6RiQcybapO65bdfvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517741; c=relaxed/simple;
	bh=J4if3MPmbylWo1ZVh61aotFj5BEvXmzuoQeC/6MOGrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0QKfO490LGduNp4nJWGHxEA8IRlMemgfMHDLwa/tQf26r5MfKoadIt5oawi0YHrqOSWyqvS3ls7zdZSf/ZgOjd5TGfC6a1gCh2QFEiskHICMaMTDCgm8xZy39rDInDMBrRgqFi4MFbh42uEIk2IEzXpWWodbLYH/FvN9RSBUeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CpIgCFDW; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so138477366b.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517736; x=1749122536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcu3jY9KMaHOfphKfi7ZmlunMsnQwTpMnv18LDk4Xi8=;
        b=CpIgCFDWpEHcE3osUn0MzH1NcYCYPnGX2DwUj69sO0s4TbZH+6hf6q/4Eh5L/5h4Je
         4UoHZHYhLSitu4JKU3u+u4cFvuRgi2pYmtgPUM1YKqUw64XVRmVZEkLo2n4lnx86Q/eK
         atPKvWxmC3MQIrcYdKsVuxAym/jZRdnQXXsrCTNQ5mphQkpfczOUuQQS0pTgoumsWRUN
         ELPhSNU2R42RM6abbIxrLrJohM8FiXTqusUK/rMUDP4Tnzzikq3IA7C58Bsd0LWnOIVG
         6w3NstK97GwnHTndEpEchcIoskCS8Xj8ulcuWwR55GEPQO6UqGrTcVybluCifg3RosbV
         F0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517736; x=1749122536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcu3jY9KMaHOfphKfi7ZmlunMsnQwTpMnv18LDk4Xi8=;
        b=FXiei23ndnsAhFdUmuvQA+i933PCz0VCundLOFTddQn/pYq4jnpEfH+NBMrGBKS5a7
         3XpO+GDi1env8/2I4eW9A1W1oNxWH/wKnm7DWzjKKfsokeq2h1p7DsiFfiJeWvJNPlI0
         CjOJeLm6edbCZMzbWI6BKGaxODuPpWeI6MhSy0Cmfpw58ZQHVFc+lGCe+ZJ84TUzsAJv
         v7bLS48Le3MlTN2bNN38m4dU7IRTzKP92IFjtvR9Qly69YDqdKTXB9DXr9SQ3XLbBHad
         tvTrYdR2MIT0x4NJ6dkZ4ypfNj/2z49K6RpfMIkcNJmxOdHVjoLWRROWv2Xjf2nTgYla
         G4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFVUJSElkpeTQxDfaR8Z491CPhNVH3cbq7NYPpBqTKrecNCEDNwcCmJ63tkhE7HzpmWuIL7k6ZTO6f@vger.kernel.org
X-Gm-Message-State: AOJu0YxyKMijdh9H+L1CDQUcvU6aH3kgCYVGK+xbjG2/tt2uARGYdBZA
	w1kFPCNZaCXGnqajhO5ikxjI4Oe6J0NsBxPmFYjGA7rFs4qEFF0PAXoO8qblwf8iZBI=
X-Gm-Gg: ASbGncsNroJW4utZaIJtdybg8FuRcsm4fYI4UBm5fuFbE+6O8r3Y1PZ+LyQh+bm6ASn
	TqwHBSmR2FIXhN4C+JlWSXVVEbP0SmvzAvv7X22f+QfBmgd5bRfdSJNWCQgYORetVZZ1Y+UxMfZ
	IqgQkvT6m6uGnoMNoiwiTX70monkcdxukpzXaxhP14UxqPxDwCaJh1jW1nsYNJyeaPGkn5t9+XP
	h9BwIisaIdOz78I0DBnvTndaKmp9qLm265cCvMcFP43O1ZU/PsjQyYZtcKEn35pCgQhzGrsqPKk
	WNNMbIAYne87OnAzxQ3om9zpW6KvH9vbDnCvKGOyXEGyLHS+OaqS6k+07cInlA3TLV/vBUc9ItS
	QgWkkTcWRsiEz21FlHJvmjA==
X-Google-Smtp-Source: AGHT+IFdUYKEXxoxeC507jg6sjOVhSRncEEfE0ROVN1mSLDQ2qMmf7ZYEFermE1lFqLcJs4UttHYCA==
X-Received: by 2002:a17:906:f587:b0:ad8:8e56:3c5c with SMTP id a640c23a62f3a-ad8a1ef86femr526700266b.11.1748517736229;
        Thu, 29 May 2025 04:22:16 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d94dsm124276666b.43.2025.05.29.04.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:15 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 01/13] dt-bindings: clock: Add RaspberryPi RP1 clock bindings
Date: Thu, 29 May 2025 13:23:36 +0200
Message-ID: <2fef6763499e2014f7df952162098357826e1f4a.1748514765.git.andrea.porta@suse.com>
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

Add device tree bindings for the clock generator found in RP1 multi
function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../clock/raspberrypi,rp1-clocks.yaml         | 58 ++++++++++++++++++
 .../clock/raspberrypi,rp1-clocks.h            | 61 +++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
new file mode 100644
index 000000000000..cc4491f7ee5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 clock generator
+
+maintainers:
+  - A. della Porta <andrea.porta@suse.com>
+
+description: |
+  The RP1 contains a clock generator designed as three PLLs (CORE, AUDIO,
+  VIDEO), and each PLL output can be programmed through dividers to generate
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
+    const: 1
+    description:
+      The available clocks are defined in
+      include/dt-bindings/clock/raspberrypi,rp1-clocks.h.
+
+  clocks:
+    maxItems: 1
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
+        clocks@c040018000 {
+            compatible = "raspberrypi,rp1-clocks";
+            reg = <0xc0 0x40018000 0x0 0x10038>;
+            #clock-cells = <1>;
+            clocks = <&clk_rp1_xosc>;
+        };
+    };
diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
new file mode 100644
index 000000000000..248efb895f35
--- /dev/null
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
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


