Return-Path: <linux-gpio+bounces-20736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC1AC7DF0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 14:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0FE0A25F05
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 12:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DD622B8A2;
	Thu, 29 May 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D+ny0eos"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E8B227EB9
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522564; cv=none; b=pROQLxsv8FZtKj1AaP8WzYcHnWgz8PYRSpp2UxMl6R2XODaXUyQlQz+j5pHGRRngR/lZ5F3ciAfUwAGUhMB9rMmoArf66gyArS8DxSb6IerXoHBaIq2dSDRatSQoC0YC89EjPbAoJQ6EQ8W1i+qVUgndZh77zytMOmilpdO1B0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522564; c=relaxed/simple;
	bh=eMe4mQgSX9Szv7WKunt7QkqAZDsYcLcx7lYQqW43qQk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvXPxDWIIIbbPCL7X7eHKZPi4NOnZZrXjzsINq+9X/fSmGuhAw01sgbRN61x7K30UUwYWHy6I/qsLJKR3ROSwIfb5nsUv0evXye6GaNoJPr/UD2NOGVNYlecAud26P5ZynyH+Nnjtvkfdr23/rIeka7R7gRUpvGf0VIanQ8KtYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D+ny0eos; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so122490366b.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522557; x=1749127357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=D+ny0eosbGBnBvBOKSpvVhvT8hkI1A8v6qZuzGklvx/q8Ou6evy+XodecM8LxwpfPL
         8gCu9ftFHpXrZVSrlEr5guMQ47LaJcOA83pYuy8nOm/91mHafm1rKdtXTMdO/DzAAWzw
         qPffTvqhRWVZcajzH4WAPymjUnj9fGUWNfymiRQwW0mJdX2o+qpu/Uie/AjrOrtj4vsB
         FE49hzwZhRJ+iHisUONB0oUN+fw7cXeQ34qq5aesidmmufvtHsxFdgmc0ehZ8xizCV36
         FeJU6Hoxd0dYEfXL6CBc5hlaVbQXRZQZZDABc1HqjJepd5+MU2+HfSvUuMRbifTUNInl
         S44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522557; x=1749127357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZmKSMbzA96hgjOUpKAldzAt0+MepqVPTK1rf+kG3Dk=;
        b=RR/l6060aqihzAp7qcozJEBpzFRatv1WbG6YXZ5lV+FBtA6JUWN7SxA6Evc9u9zxk9
         J8w81z7JbUL8oEWvMlLxW+i367/9HnDojOVP5LlwLD/cg2RmOuNnQwY8OlFGICjKaknn
         NglnqxZxb08GCxaPEBhUNW6xAsjGa5KUSWWG2c+5J1SW2STMiDhOA0A7zfMAomKpX1Y8
         Uohnw4CVniYm4ccTfPbc/ZvxFq/ykgmvdRgjcHBzJ/FtKqvefrBPxM06t3gJDQAHNSKK
         ttgit9pgImrXOVdXzruKp36uX4o/7wBJcpdkGw/ij3qg/tc8MA/XTC1ND9oFQO2HIRIk
         bReg==
X-Forwarded-Encrypted: i=1; AJvYcCUCzA6eM40u3OZouOVug3VFMKQSIz7923EJk1vv1zrLvmjB9R7NeMhjxIZA602oRX8CNnb0lHAuyRFH@vger.kernel.org
X-Gm-Message-State: AOJu0YyEptnXa4OvdqEY/5e8RC6QBMCDwv1qVhK3G8pr19bD7MelWqQe
	geDL5rWTZZsH+pqd5WKA/R0EdHeuRBkn4wmYGBFr1DX4qhoEp+2ShNN/qluANaHVYTc=
X-Gm-Gg: ASbGncu0HKMWr5AC2Lpti4e1LjZdeAE4S7qJ229+9UmiTX18EhxkSteA9WSrp6Pm6Dg
	MyxMGX1NM4v5f8eaNzk+aC6oqoZCSp75KIq/b4uqKhRf62fgbSR21z7ILL9rgjiPARu5lkgj6c6
	9V5c5vFwHHE5Gt0Pa3yqlX1yeFGAnRSGdNszqE59t+pcZsxw5OhSJQoHGWp/lBndSEoUXtjP7ca
	rHKPRC5zLgewzHPy+2bKoxAHxdhrpTw+XcrdN2/jiJX4ACjLDfCS5g6Lzplw2rw0Ku9iLghhRYl
	EOS2ZOYPIoBNH7gdOdQbZasIZZqdypAvkltLqjF4WOKbGZ0A28FyOeQRYelhi/j6DeXedOr0xVd
	2k2+hvAE4NXp6Uaa11dUvLQ==
X-Google-Smtp-Source: AGHT+IFgiCpfokGYPqFfNbRAwtykuDbZ9l9nPVNQ028I3fcbAmrbjnUjF4hg+nzReyJrKKzdPC5Qhw==
X-Received: by 2002:a17:907:3f1b:b0:ad8:9d41:371e with SMTP id a640c23a62f3a-adadee36a88mr195092466b.36.1748522557299;
        Thu, 29 May 2025 05:42:37 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3952esm136308766b.126.2025.05.29.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:36 -0700 (PDT)
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
Subject: [PATCH v11 06/13] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Thu, 29 May 2025 14:43:55 +0200
Message-ID: <20250529124412.26311-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
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


