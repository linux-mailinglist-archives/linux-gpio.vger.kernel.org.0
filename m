Return-Path: <linux-gpio+bounces-20756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338E7AC7F33
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5E51BC7E6C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFA1229B03;
	Thu, 29 May 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GVgRqDCI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6722D797
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526572; cv=none; b=I7+ZWb7OzXqULEootohVZ7tCx3BLWSbDu49RGIwiSYEUg8hDf0OgcY7Rn7Guzlch8HchYhUlFll1PtbEf3TLJTp8D/Z/uOI0OVwlCMs2LdPObcOsIPxymhON0ry6ey4ZzLqw6u+TEztBMVKvCqUsM/h8Ka4EvDxq2VN71n+ufqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526572; c=relaxed/simple;
	bh=QW7VTm572jmsB5I7p8SLx6Wb3evUoSSkHBGzBXDeejA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEgqTCmqTNovzP5sPUAP8x1emBVjpcs3+ofLN/TPmz7XQA3IzPr/pkcrt6mD2PUGbfCnShrOsA4m7eZ8wxl4UlFQah1s3JrreAxrE69+GZngTlk40eNzKM+QN+u5ccvNxj3G2baPU04JWl3c6t4FnHoBUuHCKQj0oNga1jgAJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GVgRqDCI; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acbb85ce788so170482766b.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526567; x=1749131367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=GVgRqDCIA9LWQz7/7PQy3ZR6x8csv8p8zlx1/MlvLBwPugxMyr3ghB11m+sjnCqkKy
         tC+V7CsLNFp/nwhBywL7CEM2Q6YuVmISmU+Oobzsl8iTiLv9FP3JIqO/5Lv2XIYue6wO
         m3vnmFtZ9qYMGJDZHSLNeRV5w6wM0hRuvN2RS/fDreO8bjrr8YxDKBsbvi506S1+sgG5
         MRIMACLc3mGEPGAeBzxhtDoHiNejk+NQYZRHOJDZf42gjBxEkzo0bgcDsrTRjZOXYbD8
         Kw4+T6DhZzIXMIiYIzS9DeM5sXK4zfpchoxa3GDQFnkBRVm0oi+vvzl+gwV96f3/fhLu
         4CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526567; x=1749131367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZ7xUfAXguvsPdu5QAJbu8MyCaxUyBGB0j1AZF9I7as=;
        b=VzVGQS2e9AiRejUc+4nY2nRojvrf9AaTRAct1vrpvjFnpoYf2QdY8XWj6E9f/RSUMN
         NCtyrJedh4nbNbGxiAsHeVZ/KuDfxK0B5ghhTRX1MP0YNtg3L6XgXztfEw1mQOERH097
         8/nKXbuVGiM91Np0Epay7v9CmyEfRxltyQn+KFHI3TSEpqqCNT9ot1g06VRXJkMo7pgN
         NZpccp1Y0rjvmJj/tJBK54XM09SLKLy/rWAYLPsA9mtTPNU86csMl7Q7B+SEleIMW+ln
         RJaGLX296pMYlU0YnFN6QBEAmsS1zpZ8pGw7qR2UdnhkFuy2QTfFywXNzgwEM1Rl0I82
         ibzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9r/zV5dA3PPIsYMqGG+J0hE8mUbMvFxrE7kUypdfXQomSXUibr+wg7s6HIzdDAetgrL7U4hLiSekE@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTfUUjaVO7uTnAXsn2JHkNqR52lWYmg8dJLOh1xjD+cYyFUNP
	7PYTiJaFduP7CD+jF3m2SJG5zAkpl8QSm0tXFdvf9eO6iBS3HtcP65dGbFNUMfQ5qb4=
X-Gm-Gg: ASbGncsSjeoSQfh2+N+gnbDGI82Obu6x+yjz2W0PfNx0agBU9Ypv8QhYl/F/6ddAdfa
	cgOtDba042qtkjoJ7BvYfa/uckLflOaxYpUCL7sBIXDRjUCtu2qj+8lLtmrOIbGdTUdrliZL5UC
	gUrjwtUd6GaSHjJ5DROhKe7pprL0/qEztcWUTBp1QIT/QP/ztfXmq/qIOCz7anbPdplbBKxOVT3
	b9LJZpTMjynso0SWiuTT/zlIG7o9CqcR7PPv6dxsYE6RazF8Nj49RlDlvqUBRYVksNZS3wC/iMT
	EprtT1HNRfbxhUBQqX5LCb6BB44UPC77VniTFZdOMaLdk1nYNqkYZwiuASsM1Zw5ivMPYMeKkib
	qhUmh035j4ehTrTxx4ihJHg==
X-Google-Smtp-Source: AGHT+IHD9ehMsGBOiU40iJ8kLNl1j0z4elPacZbIb41z7eRJ/6rHrtyfXPYNrk9T0jcdSMovqg/Xug==
X-Received: by 2002:a17:907:1c8c:b0:ad8:8b51:ddb4 with SMTP id a640c23a62f3a-adadee40376mr219268766b.25.1748526566468;
        Thu, 29 May 2025 06:49:26 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fee29sm148580866b.19.2025.05.29.06.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:26 -0700 (PDT)
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
Subject: [PATCH v12 09/13] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
Date: Thu, 29 May 2025 15:50:46 +0200
Message-ID: <20250529135052.28398-9-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fully populated DTS for RaspberryPi 5 which includes
the RP1 node definition. The inclusion tree is as follow (the
arrow points to the includer):

rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b-ovl-rp1.dts

This is designed to maximize the compatibility with downstream DT
while ensuring that a fully defined DT (one which includes the RP1
node as opposed to load it from overlay at runtime) is present
since early boot stage.

Since the preferred board DT is the fully populated one, name it
bcm2712-rpi-5-b.dts and move the previous one into
bcm2712-rpi-5-b-ovl-rp1.dts.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/Makefile         |   1 +
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 121 ++++++++++++++++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 118 ++---------------
 3 files changed, 133 insertions(+), 107 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 01ecfa304184..031875a277d7 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-rpi-5-b-ovl-rp1.dtb \
 			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-2-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
new file mode 100644
index 000000000000..6ea3c102e0d6
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "bcm2712.dtsi"
+
+/ {
+	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5";
+
+	aliases {
+		serial10 = &uart10;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial10:115200n8";
+	};
+
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
+	/* Will be filled by the bootloader */
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0 0 0x28000000>;
+	};
+
+	sd_io_1v8_reg: sd-io-1v8-reg {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-sd-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-settling-time-us = <5000>;
+		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>,
+			 <3300000 0>;
+	};
+
+	sd_vcc_reg: sd-vcc-reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
+ * labeled "UART", i.e. the interface with the system console.
+ */
+&uart10 {
+	status = "okay";
+};
+
+/* SDIO1 is used to drive the SD card */
+&sdio1 {
+	vqmmc-supply = <&sd_io_1v8_reg>;
+	vmmc-supply = <&sd_vcc_reg>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
+	sd-uhs-sdr104;
+};
+
+&soc {
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mboxes = <&mailbox>;
+		dma-ranges;
+
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
+		};
+
+		reset: reset {
+			compatible = "raspberrypi,firmware-reset";
+			#reset-cells = <1>;
+		};
+	};
+
+	power: power {
+		compatible = "raspberrypi,bcm2835-power";
+		firmware = <&firmware>;
+		#power-domain-cells = <1>;
+	};
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
+	clock-names = "core", "disp";
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 1850a575e708..adad85e68f1b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -1,113 +1,17 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/dts-v1/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include "bcm2712.dtsi"
-
-/ {
-	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
-	model = "Raspberry Pi 5";
-
-	aliases {
-		serial10 = &uart10;
-	};
-
-	chosen: chosen {
-		stdout-path = "serial10:115200n8";
-	};
-
-	clk_rp1_xosc: clock-50000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "rp1-xosc";
-		clock-frequency = <50000000>;
-	};
-
-	/* Will be filled by the bootloader */
-	memory@0 {
-		device_type = "memory";
-		reg = <0 0 0 0x28000000>;
-	};
-
-	sd_io_1v8_reg: sd-io-1v8-reg {
-		compatible = "regulator-gpio";
-		regulator-name = "vdd-sd-io";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-settling-time-us = <5000>;
-		gpios = <&gio_aon 3 GPIO_ACTIVE_HIGH>;
-		states = <1800000 1>,
-			 <3300000 0>;
-	};
-
-	sd_vcc_reg: sd-vcc-reg {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc-sd";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		enable-active-high;
-		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-/* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
- * labeled "UART", i.e. the interface with the system console.
+/*
+ * bcm2712-rpi-5-b-ovl-rp1.dts is the overlay-ready DT which will make
+ * the RP1 driver to load the RP1 dtb overlay at runtime, while
+ * bcm2712-rpi-5-b.dts (this file) is the fully defined one (i.e. it
+ * already contains RP1 node, so no overlay is loaded nor needed).
+ * This file is not intended to be modified, nodes should be added
+ * to the included bcm2712-rpi-5-b-ovl-rp1.dts.
  */
-&uart10 {
-	status = "okay";
-};
 
-/* SDIO1 is used to drive the SD card */
-&sdio1 {
-	vqmmc-supply = <&sd_io_1v8_reg>;
-	vmmc-supply = <&sd_vcc_reg>;
-	bus-width = <4>;
-	sd-uhs-sdr50;
-	sd-uhs-ddr50;
-	sd-uhs-sdr104;
-};
-
-&soc {
-	firmware: firmware {
-		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		mboxes = <&mailbox>;
-		dma-ranges;
-
-		firmware_clocks: clocks {
-			compatible = "raspberrypi,firmware-clocks";
-			#clock-cells = <1>;
-		};
-
-		reset: reset {
-			compatible = "raspberrypi,firmware-reset";
-			#reset-cells = <1>;
-		};
-	};
-
-	power: power {
-		compatible = "raspberrypi,bcm2835-power";
-		firmware = <&firmware>;
-		#power-domain-cells = <1>;
-	};
-};
-
-&hvs {
-	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
-	clock-names = "core", "disp";
-};
+/dts-v1/;
 
-&hdmi0 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-};
+#include "bcm2712-rpi-5-b-ovl-rp1.dts"
 
-&hdmi1 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
+&pcie2 {
+	#include "rp1-nexus.dtsi"
 };
-- 
2.35.3


