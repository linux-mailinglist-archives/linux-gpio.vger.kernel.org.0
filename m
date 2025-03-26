Return-Path: <linux-gpio+bounces-18020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CADA7192E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC04F1896C63
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620D61FDA82;
	Wed, 26 Mar 2025 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlfbrqVh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097ED1F8691;
	Wed, 26 Mar 2025 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000019; cv=none; b=cart78fDpDWYtJzxASrdCWQZ4/e/B9EWQRtDdef9WxVJGZSGnSlMyhYVwnMrC0QcZUbWgodWJWzMj23icoUKJQL2mF5QHYyfYRn1k2pAdPVXss0O2i+jktvTXR1tLZc+yespy+nV4AHB5jDEDfDC3Qxlg95xM8fbOcUZUh0NMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000019; c=relaxed/simple;
	bh=yj4XgRWZOKauWmIoJXTfEovmOX248fvaF8O5Xtl9w6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcQ0ghwF/dE1FaIKTGz2Ct5WE5EJRCweGKk31/i6WC6Us9tqrZKEJr0TaLHIZ6x25QwwE9G52p5A3ReUDw7V1Q0CxGMhl0RAOvNPQBKwew3CfNJ0Ul3DrdfadsX7WHIuF9a7lxhVEhqTRRd7ZtQpXN5AYe0QdMwXb/xeRzLIWqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlfbrqVh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948021a45so61938805e9.1;
        Wed, 26 Mar 2025 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000015; x=1743604815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5rclYPCoX+9XsQVXAGD6Zpg/jR52MIrAxSZcU/YUac=;
        b=AlfbrqVhCJRTmdXh85FNiymaefQ/KzCMctxqSMdI9yBARlXYWyqgqdJ8aISg3TwXHd
         cWiWDvL5e1la/Uy4qgzbj3OqUCTKLE6gG4UKpdr+a2Phy3D2QYUFnv/SNi1UqYlw6lMY
         qVV8Aw0UrUEI6NPFJ1JuCj9LLNO+IySDVnlkeVS3u5nHV4zaQr+ii+qv9ONFIMBZx902
         x2hVPNdJCh8HlFth3/QlWAYvK/Cbz/MlTj/OUGpaSAQr5PK8Y6faDfav32jlEgJJ0qYo
         1Z5ZAGvrczhDaWWE0DIODOFS74jwMWNrhpE3y+t66ENQ1oLMoAxDtdZA9aoJxqYmQ0ld
         667Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000015; x=1743604815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5rclYPCoX+9XsQVXAGD6Zpg/jR52MIrAxSZcU/YUac=;
        b=Em8fHeCwH+wxcNnUgwpZLP1rLOyNIROkETxNQvbLNUYA9Cq/gzfcH2DsX2Nw6f9xmQ
         zW+Jja3FlmFxu3jY/pyveuBLCalX/+W9O8PMRN+N2gdaRxceQn3EtvHhUXfZYRIJpgdK
         jfiGgJ73DwbcKuABR47JZRn7sbVLfcwzcKeLVTlE/shTjKlDKt5lCflNdKgc1R9R1pf7
         MM+KPyduooI7uKflCbpyBU9mgQ2hhXTZLzpZI5kqRzlXv0w2QZwe05OqwJsjbPpwV5qk
         U8/OJ3WLNrv/jiRz80c4lYeaxF8mCW1tZOKy+FKFgQizUZZ81VeYGTHQMfsQlIkpStdY
         HGfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoYWFIsisDfP3SHek0qcOXslIWYYosfmjsHlDUsHh2C7MLlO+deYJVWPBd/h8v7Ay87CkEJcaUmE5M@vger.kernel.org, AJvYcCVBljg52AwKAyvs/qYw9IkqN/mGNQJ96H6sgSqffd37eqiY7HLL9knBjvbcY6Ut4ut3yWP/jXVrnVK+H5Av@vger.kernel.org, AJvYcCVMGJ2obCCWrygjHVYQe35nGVteC7IlH8m+JRpjFqeYl4lG8lOmYh7yhLgAB4WmjzvZ9erA8Q0Ucr2A0OOg@vger.kernel.org, AJvYcCWj0XmcyYi3s3i0+I7F7yqKpvRfJBmWG+Tv0VhP4vqPYx8Dk3Jx30xHYB70byg/k2tqdGFBF21pf7AEaA==@vger.kernel.org, AJvYcCX1QRbGgYKIrcO3d7v2AzE4abToy1uH62SoM0XAQARA9F6xywHzWjGBTOVB9Tav/EHbBnndRextEcq+@vger.kernel.org, AJvYcCXlHPh64PVfiy2lbHqFsrInKKNurXPo5HgbUuyVYtM9MmXDPg+pZCuQJWLYCEnveHJC7w26oIdjAhOX@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUyjvslrdPdSrnX0GrfWMcSx2WGmFelOqLgyzq9pxwVYJJIQl
	32Hp1Zn/82uQJtfr+wMMpX6GAR4/lQAnsUiXh0MIFupqxEV7WEj3
X-Gm-Gg: ASbGncsp/k5RMkmpYT7m7x/AJE5EjteeA0tl3mg1JK0TGCWJ9HjWURi3W1r25j1exPa
	9cMaqwcVOHKvYbcYgX6vHu8fol90jh62k7lMTLdadF/YEZqznoPNl8KSehDupTp/tMDldBWkQzx
	MA8Vt9cal3Om4wUBxK2C5yCbObNUzNmQ53HtIVJnEZ0EBXRzj4PoLhN8CDfGGxV58mXzFrm+quF
	kY4/EzNBi8Jt7UL09L+fYsgLGX2WvpNuepV0mJOHD/YSJ3/dwWMOQEVFhuXUeTef/goZo+GSnX6
	N45IEutkOk6XyZhfj1TDg8bHCd1nKfszL83Y5xTrgHtd2k2fK5+Kgdd2ZY3IDsgsFcQS
X-Google-Smtp-Source: AGHT+IGRAy9yfwG6d2+eXVQeNxaGO7gg1l8K/+riQ2OdyGmO/wZrf70Io0vAaYCnsynf3rjsoKhCJg==
X-Received: by 2002:a05:600c:5742:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43d510fff60mr149245365e9.19.1743000015128;
        Wed, 26 Mar 2025 07:40:15 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 14/15] arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
Date: Wed, 26 Mar 2025 14:39:44 +0000
Message-ID: <20250326143945.82142-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the initial device tree for the Renesas RZ/V2N EVK board, based on
the R9A09G056N48 SoC. Enable basic board functionality, including:

- Memory mapping (reserve the first 128MB for the secure area)
- Clock inputs (QEXTAL, RTXIN, AUDIO_EXTAL)
- PINCTRL configurations for peripherals
- Serial console (SCIF)
- SDHI1 with power control and UHS modes

Update the Makefile to include the new DTB.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 115 ++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d25e665ee4bf..d8a8d7ca4c58 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -152,6 +152,8 @@ dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
+
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
new file mode 100644
index 000000000000..aee4748a7618
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2N EVK board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "r9a09g056.dtsi"
+
+/ {
+	model = "Renesas RZ/V2N EVK Board based on r9a09g056n48";
+	compatible = "renesas,rzv2n-evk", "renesas,r9a09g056n48", "renesas,r9a09g056";
+
+	aliases {
+		mmc1 = &sdhi1;
+		serial0 = &scif;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x1 0xf8000000>;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vqmmc_sdhi1: regulator-vqmmc-sdhi1 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VqmmC";
+		gpios = <&pinctrl RZV2N_GPIO(A, 2) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
+};
+
+&audio_extal_clk {
+	clock-frequency = <22579200>;
+};
+
+&pinctrl {
+	scif_pins: scif {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		renesas,output-impedance = <1>;
+	};
+
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZV2N_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1_dat_cmd {
+			pins = "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3", "SD1CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd1_clk {
+			pins = "SD1CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd1_cd {
+			pinmux = <RZV2N_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
+		};
+	};
+};
+
+&qextal_clk {
+	clock-frequency = <24000000>;
+};
+
+&rtxin_clk {
+	clock-frequency = <32768>;
+};
+
+&scif {
+	pinctrl-0 = <&scif_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.49.0


