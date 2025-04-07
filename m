Return-Path: <linux-gpio+bounces-18396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A823A7ED55
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35DA11889127
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA46258CC3;
	Mon,  7 Apr 2025 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mga0pkUz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA1F258CF3;
	Mon,  7 Apr 2025 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053419; cv=none; b=A/XXD0XMC5R3VNXuaEv5pYrdj/ocjgVoG1B7SZwQH0W0RWtFIIt00J/DP0kk8WXYpNRCBGn8f/TZDe+DjHdLqo0JENr4yuUMhdaJ4I7PSyPDcenDWvTHbzkn/5m6z6kb7VVq3h25c2qLoddJISUvxkIx1WHdkIPeFqOfVt8msMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053419; c=relaxed/simple;
	bh=naUjUisOyjlWOOpdHq+axpmjXsW6FuxI9hzLn5+iEpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6RR6NSfGfN3nqXiFdF7Dqosy9ctGLC0uda64R0uON+p8ltH/K6wdCcYDq9d8QXXkrmAb/FcxkUuF/XFiSLyUz1bcwi0Y6GgKVpKLvs3efZAxmY61GLAGpmCzUGxep+ajbawu4hLqkT9ycpgSU0d/SRJmLe6eawwA8U74C4iumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mga0pkUz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so32620095e9.1;
        Mon, 07 Apr 2025 12:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053415; x=1744658215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slVHo0owJS6MAx4PpzF19Vk9iA82FPjThq35k4/DBek=;
        b=Mga0pkUzBkL4epgjjGdw0a8GI7v3SqYlv8m6SGnujbJ06uQ/Uil30TQRdCpldm/yCh
         Y4VKsmL1VwPEXGRQxmE7gwzRYR1NpKEdo1vmEgopc16pDIA4kLJjerNESOp+ZjVBsRKj
         iBYyvvu1Y9L5eyUCZBsmL8+pD83yHJGe0/vvSAmPmdK2It9RqSfohoa/n+KKicX09k2S
         mVjZ5Lm04cJ1ZsyeKZovUFaGo0yac8/+McIH0PhNtyevQjbU30BaldDqEWS9QCGHfTCf
         KMQ1DQe6h6zGmtS5o4olce0qG0XBFNtrDkMkK/yN9El2zIwmIs9uWyq/oWpiEI1xLqrj
         ah4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053415; x=1744658215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slVHo0owJS6MAx4PpzF19Vk9iA82FPjThq35k4/DBek=;
        b=V+oO8XlKZR23lEOSPXYSgakP2wuMcJDJARDQZhT4tWWRLhk306jGcvEE7iiMxlsjx7
         ExqqyqM3u/aISde3UtxkCq3aTvENJL1ggC2brIguVB2NBdzSH2NB9zcHBWfzI58dRYMS
         H2dmJmdVckAo2xJbCz74TZMsLZx0Fj0+9wnYyIRM/j6GU3trVBReGNEJQ/2g//ZiaTeF
         tmXHjIxx8NGU6wRxJ/xqjswOzPZpsAeY5wr9EU9tYSzRqGFlUL0+Ugut9Hp9daD9tfRw
         lgf1YoAyzdghChJVmDKHQ8Bsbhzs26ULOuvgRV6EM5kNQlmr32WiqEdvDEbGJn9SJsk8
         0nKw==
X-Forwarded-Encrypted: i=1; AJvYcCUL8HVmFBFZ9zuhmYGyh/AU5TXixObokxnXukUxRPpZe/Ct75rBBtA7KSgcSn4o2Lb5IsbCJzm1/sNNeF45@vger.kernel.org, AJvYcCWBiuWMIg0sP5UFJ0VUbsRU1QAQAsZcSbtgcjwBbDl5LXJhT1CGY4hQJdIVhMirBwC7duZpd0MLe+OF@vger.kernel.org, AJvYcCWKsPZ7A5mG4Xh+4AfuVVTXj32sSdwIQZbqCyGs6EIP+CL9EOTiLgH2ZGvUwCHD1CJoLtfhAFMMvUeKfw==@vger.kernel.org, AJvYcCWpYWecdP7+7OTU37mdRhwwsxWoGYFk/A/r5LJu8tklxs7ffZAWDTkaspFwFIxylRPktrLd5cepRNHa@vger.kernel.org, AJvYcCXffxzjHUpdylwFOHkwbtkI9GQk9FzLGHaT5/N85XsCWtaCkVh927dWLKYfFN93DjEGQSLVS6EHAamSWLYb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6DUocqvWpbWDlx6McZpnpWvk6KFnfqNX3OL8QRfPMyfKCLM4Q
	vgww7UopwSH/tvVnQJDrE2lJep5hYQzOEZpzbdpqioLRFttdmO04
X-Gm-Gg: ASbGncuaf17PxtwvaDHHUC89nHVMXpYMLN8EF1COxnDgj4hOHTYqf/Ipp3JhOP0J39/
	ByCYSZam3PKfbXw0ToyINFd0wvGKeScEpU402xu6df9F39Q4l4XSlj6pL0HZ+Vn0TcKBzGkMG5S
	8KiioZiUC/DTDR4zaS8jxZJa6mChbyAL7Wzg0VaffWM3AiurAJaT2WIQdj0NIiYxtAaoWR1reg3
	yidZQAzGfew6mqcBGOMYn2LmNdxLLNTT31XdzFaj0OTSa8D+YEzUwmgfsmf9GW5xbe5wpcjqTum
	2XNgEz8hWCRvOvwL/OiwAeLxeIHMJKyZvwTO/uGg8XWhM02hy+kC431rgjBV1YCtBjTIe2fH6Fi
	xuB4c
X-Google-Smtp-Source: AGHT+IEL42x7uF/NnsyHco9mxLN/kOyCWb/fw3/RZjhZSxcdSaQMTmnkfH2XrV/JBAeMjiDzVqMyiw==
X-Received: by 2002:a05:6000:18af:b0:391:2ab1:d4c2 with SMTP id ffacd0b85a97d-39d0de62221mr9684236f8f.37.1744053415480;
        Mon, 07 Apr 2025 12:16:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 12/12] arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
Date: Mon,  7 Apr 2025 20:16:28 +0100
Message-ID: <20250407191628.323613-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Followed DTS coding style guidelines
---
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 114 ++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 5b99c337763a..ea7f93b7d2b3 100644
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
index 000000000000..f379871c39cc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2N EVK board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
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
+		sd1-dat-cmd {
+			pins = "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3", "SD1CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd1-clk {
+			pins = "SD1CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd1-cd {
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


