Return-Path: <linux-gpio+bounces-13394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD599E006A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 811E6282920
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159AD204F8A;
	Mon,  2 Dec 2024 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TRmYp10F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3F12036FF
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138359; cv=none; b=L5F0rQ/JXQK1tr9poLhaYz+gvrpz8qEKTwd+WPbBVBTQvd43q9pdE9q0hrLspQV+sf6RuQAOONH91YWlBp+7iPKbvqhFprZYlW6t9cW9uRtOZ++ch3l4QMPbDYKRJM74JXkqw3CZEOmQHf9TjZVcBC0qTb/FIl8BvXfIOYeck5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138359; c=relaxed/simple;
	bh=xl9jgN0f90FUrA/KDiyqXHeMDT+mtE+Yn3dqXiiornA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2G8euNMYU1Tpz4VEqc93yRa5Ow+bAb4HPe55vb9Q3ipnorjS6TdeZWxV/Q+tai+BvZF9jaqPdnpmqHM59j1NOR7AVx93j+CuHSj4fG7yM2izGdKx7KAh7U4D0g4llHlI3Ax9Aj4huLM6Vi87wFPGdMhzNR4CcNhVfo5gLhxbKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TRmYp10F; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so4896102a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138351; x=1733743151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3TAPa2qTQeKR3X5ueCWjbdd0qc3DpZTBSBDGsza/zs=;
        b=TRmYp10F6kTthUvuhgKL9fG2nLgUINicQGo1JR2MQ7oTf1kUHtH+XXQpFEdFYj8Ygd
         APpsl2UqprkUNCjPq2CxaXoyL7jNY7EDhZ5L5iXFqBBYqwjq9yuuyAbjg7wO2Pr94tVw
         OhZpRR/Ybxh5zEIUXLSPNZXQKBFZdLU4d2FCW1c9SF10UyU7deebH8Io+Eow6NYByejs
         AcRDYpmjrdoO1Fopb1xeKGCp1YaJmOuKEX2UsYUasg8wcueXXxNaTANh6LE+hXuLeAV3
         pfwSx0j9pcjz8QJs7FzCk6ZHv9rILqjmD4q0MXpasSvs8Rp/mQuk8Ae42rYmErLkSKvY
         6A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138351; x=1733743151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3TAPa2qTQeKR3X5ueCWjbdd0qc3DpZTBSBDGsza/zs=;
        b=AT+NVjAJT/vxmxzmxwqcskzJ09c/doV5FswfdhcSSwrk1Oh4iECQ9aYixWXlLgu2z9
         K/HMUkGCPBse+a285ORNnMDiCc07wtqWqYN4bHn2FBC1vVsTdouTAV98Fuz/iY7LOfwC
         ova6V1ucf4Ap2O+DGJzQ0yRhj6nV7O8Un69XdOzD0LeR7PL9/VBxgayAq7Au6XbLJNcN
         1KEgZGJbXb/SdVM+IoJ88siESzzrHCl2o5IDkU+vokv4CkETNC4UP79ctNXfnsK/9as6
         EufxlgzrGbK+tmo1mbAni8r1l19vv3zCEI1voUZpec22mIBJxLj9rLdV+/wZQjgixf3k
         sxJA==
X-Forwarded-Encrypted: i=1; AJvYcCXcRVFC3B4RZUzrkk/PI+3cvpSY0DWbm0IAMiAdJ6Vds/l+jAZopQA+stmD/CoE18pqI++P1JKrBAOT@vger.kernel.org
X-Gm-Message-State: AOJu0YymuMeN3SgKvcpE+IGwdiJaUvveknPUm0X0uHNlXOxbOlK3ap/E
	uSJYVKC7TnxjgoBIVbdq1L4oI54VzGyPbVDNgdUNvARQTcKVEC1E5vyg98VZVpA=
X-Gm-Gg: ASbGncuuFhCtLMklX/5f9GeHkNm48X0SHkdyFcucEdyii/Cf2Dg3B28e/QTAjSMByGm
	WgpKxppkdbv+ZUwXRmJpmBSvWQHkvlMBdP78siGeX1cJFMhLiG4oveUpqymPPQawZ44D5Pzy1Vi
	OSCp0p2SysrWRPvyjXhAEH/VT5YOeJGXxlhMUgyt2Hvmg3+/nexi0uFTHI2eV+tTsnTSlCVGU9K
	jLTEeN+mIksGkPbdCBVc3glIPZZ9ftGAS7vWwIA0+g+Aj6yMUUIpgQlopAiCul+KwsNvjG57Pqn
	WpVTS3AGnFn5tDA/34cy
X-Google-Smtp-Source: AGHT+IGpo1hGC/A3F5dzmOrzAqyeXj4ZAm5ybaRV+4f0G+E7PZCxFeFzZvglWvAs4l5HpTFaKxoVbQ==
X-Received: by 2002:a05:6402:35c9:b0:5d0:cfad:f6b with SMTP id 4fb4d7f45d1cf-5d0cfad11bcmr9068517a12.11.1733138351544;
        Mon, 02 Dec 2024 03:19:11 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996dbf54sm499668266b.44.2024.12.02.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:10 -0800 (PST)
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
Subject: [PATCH v5 07/10] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Mon,  2 Dec 2024 12:19:31 +0100
Message-ID: <dab4c549cc243e80022c64ca522729f3408a7077.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
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
---
NOTE: this patch should be taken by the same maintainer that will take
"[PATCH v4 08/10] misc: rp1: RaspberryPi RP1 misc driver", since they
are closely related in terms of compiling.

 MAINTAINERS                           |  1 +
 arch/arm64/boot/dts/broadcom/rp1.dtso | 58 +++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b8e87b8d6de..fbdd8594aa7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19577,6 +19577,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1.dtso
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..cdff061e2750
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path="";
+		__overlay__ {
+			compatible = "pci1de4,1";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			pci_ep_bus: pci-ep-bus@1 {
+				compatible = "simple-bus";
+				ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+				dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+
+				rp1_clocks: clocks@40018000 {
+					compatible = "raspberrypi,rp1-clocks";
+					reg = <0x00 0x40018000 0x0 0x10038>;
+					#clock-cells = <1>;
+					clocks = <&clk_rp1_xosc>;
+					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+							  <&rp1_clocks RP1_PLL_SYS>,
+							  <&rp1_clocks RP1_PLL_SYS_SEC>,
+							  <&rp1_clocks RP1_CLK_SYS>;
+					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+							       <200000000>,  // RP1_PLL_SYS
+							       <125000000>,  // RP1_PLL_SYS_SEC
+							       <200000000>;  // RP1_CLK_SYS
+				};
+
+				rp1_gpio: pinctrl@400d0000 {
+					compatible = "raspberrypi,rp1-gpio";
+					reg = <0x00 0x400d0000  0x0 0xc000>,
+					      <0x00 0x400e0000  0x0 0xc000>,
+					      <0x00 0x400f0000  0x0 0xc000>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+						     <1 IRQ_TYPE_LEVEL_HIGH>,
+						     <2 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+		};
+	};
+};
-- 
2.35.3


