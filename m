Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EE542A64C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237196AbhJLNo7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237203AbhJLNod (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:44:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26561C061769;
        Tue, 12 Oct 2021 06:42:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c16so32923283lfb.3;
        Tue, 12 Oct 2021 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwyVPVCHNC8gJFT1L/qVr02UZu7yesrWH8qSgR+OOjo=;
        b=IY091bkumOyDt23nhz9Hd3RBeIDALYD3Ja5GpzeTXZr4CKIfmIL7ReXi5XDL31mdWZ
         IPUFQbTiWdCIwC3laWB9G/cq5oiEvlC4Ezd+WKCxz0g0YoBDBdopDrAuI0xb/qA0PPRq
         p+aR9sBa6NMeBWVXZbgMMFCCK62tlsvAfNX/4+JN4T092MJyhrsxoOG8AjeCUKGnggCF
         0Vy+8R3+gaFrphM9ML9/0cZ4ODk6Novx9d9AMFz3X8AetYwFLtJDrmAjY68rtIe/EJq1
         +HsW5SSkegjexlXstCE2L21miv0dGhZmOPZlJwMG6YLI7RD1awccTPzI8tq/Eezam5kt
         /HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=JwyVPVCHNC8gJFT1L/qVr02UZu7yesrWH8qSgR+OOjo=;
        b=Y3yxau6ffJJg2SGFqZHq5xwqkiCX1rS/OB31rpn8UlTATEyRIGH93q5VsJsIp6LTBh
         /XyHu8iI36nekzNdebgCNrox2zp6OPHsvM82fJvkQnad1ImksyMIkkJb2vVR+HaYXAZe
         EM3+g3+LRzN2B8qQxsuxI5DB+3tc273rza68QRRK6Z/rj74tC8a8WukFNxbycDvpTPav
         qjkmdosdqsbShYlQAYCZKGBKRkDowGAtYXgM7b/LOBie2fJDzlj9mt+6ATx6usVh52d6
         11fuLIhHzMRxrIal1ouXRHglIMLJ1kbVTVfGZQFA7ux3h0HmI4IvfiQ/7YancBWXDmhs
         vbvA==
X-Gm-Message-State: AOAM531S4gtlm9E8aTVS0k+/bx8Pz4PBZT7AyVn9x4KHtXXCkxI2oHhh
        7a+xJwLKAyqzvCIvx+cLp40=
X-Google-Smtp-Source: ABdhPJwJX1q8Aviy5ViMLXw1sBMyM8XeSjEXfknEmczXO4a2X4frd6FFNsI8p+pU9k8BZXdNX2V1fg==
X-Received: by 2002:a2e:3007:: with SMTP id w7mr18583399ljw.152.1634046140222;
        Tue, 12 Oct 2021 06:42:20 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:42:19 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 15/16] RISC-V: Add initial StarFive JH7100 device tree
Date:   Tue, 12 Oct 2021 15:40:26 +0200
Message-Id: <20211012134027.684712-16-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial device tree for the StarFive JH7100 SoC.

The CPU and cache data is based on the device tree in the vendor u-boot
port.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 228 +++++++++++++++++++++++
 1 file changed, 228 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
new file mode 100644
index 000000000000..ee3d23ef0fe8
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2021 StarFive Technology Co., Ltd. */
+/* Copyright (c) 2021 Emil Renner Berthing <kernel@esmil.dk> */
+
+/dts-v1/;
+#include <dt-bindings/clock/starfive-jh7100.h>
+#include <dt-bindings/reset/starfive-jh7100.h>
+
+/ {
+	compatible = "starfive,jh7100";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "sifive,u74-mc", "riscv";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu@1 {
+			compatible = "sifive,u74-mc", "riscv";
+			reg = <1>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	osc_sys: osc_sys {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	osc_aud: osc_aud {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	gmac_rmii_ref: gmac_rmii_ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* Should be overridden by the board when needed */
+		clock-frequency = <0>;
+	};
+
+	gmac_gr_mii_rxclk: gmac_gr_mii_rxclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* Should be overridden by the board when needed */
+		clock-frequency = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clint: clint@2000000 {
+			compatible = "starfive,jh7100-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0x10000>;
+			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
+					       &cpu1_intc 3 &cpu1_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			compatible = "starfive,jh7100-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9
+					       &cpu1_intc 11 &cpu1_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			riscv,ndev = <127>;
+		};
+
+		clkgen: clock-controller@11800000 {
+			compatible = "starfive,jh7100-clkgen";
+			reg = <0x0 0x11800000 0x0 0x10000>;
+			clocks = <&osc_sys>, <&osc_aud>, <&gmac_rmii_ref>, <&gmac_gr_mii_rxclk>;
+			clock-names = "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk";
+			#clock-cells = <1>;
+		};
+
+		rstgen: reset@11840000 {
+			compatible = "starfive,jh7100-reset";
+			reg = <0x0 0x11840000 0x0 0x10000>;
+			#reset-cells = <1>;
+		};
+
+		i2c0: i2c@118b0000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x118b0000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C0_CORE>,
+				 <&clkgen JH7100_CLK_I2C0_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C0_APB>;
+			interrupts = <96>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@118c0000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x118c0000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C1_CORE>,
+				 <&clkgen JH7100_CLK_I2C1_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C1_APB>;
+			interrupts = <97>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		gpio: pinctrl@11910000 {
+			compatible = "starfive,jh7100-pinctrl";
+			reg = <0x0 0x11910000 0x0 0x10000>,
+			      <0x0 0x11858000 0x0 0x1000>;
+			reg-names = "gpio", "padctl";
+			clocks = <&clkgen JH7100_CLK_GPIO_APB>;
+			resets = <&rstgen JH7100_RSTN_GPIO_APB>;
+			interrupts = <32>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		uart2: serial@12430000 {
+			compatible = "starfive,jh7100-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x12430000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_UART2_CORE>,
+				 <&clkgen JH7100_CLK_UART2_APB>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&rstgen JH7100_RSTN_UART2_APB>;
+			interrupts = <72>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart3: serial@12440000 {
+			compatible = "starfive,jh7100-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x12440000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_UART3_CORE>,
+				 <&clkgen JH7100_CLK_UART3_APB>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&rstgen JH7100_RSTN_UART3_APB>;
+			interrupts = <73>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@12450000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x12450000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C2_CORE>,
+				 <&clkgen JH7100_CLK_I2C2_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C2_APB>;
+			interrupts = <74>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@12460000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x12460000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C3_CORE>,
+				 <&clkgen JH7100_CLK_I2C3_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C3_APB>;
+			interrupts = <75>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.33.0

