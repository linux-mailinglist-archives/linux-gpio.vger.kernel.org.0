Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84E345352B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbhKPPIo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237862AbhKPPHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:07:17 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3786BC06122B;
        Tue, 16 Nov 2021 07:02:28 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z5so29285776edd.3;
        Tue, 16 Nov 2021 07:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ok82EnVbms3xaCc+k3GgiPbyL+Vn/MOKDOz/sHkYac=;
        b=djz63seyeiFbZoCuM77SVikQcV9Xf8ED3RlhDKjVZCv6zmgCOeFXD5LwQxrwQqUY39
         Zhr2kiz+yGQAMKP9H1AjF5+2vSdo3rBdShqJH1QdPx7Ff7FSfaeDfF4IF2mopVyIITVc
         YAX1yYhJz+QQj0Fgtv6pvUIPL5+YQdpxyQA/aPFDd/ruLGvJunNgSbY2eMwYg8ppI5e2
         Oeu7M66uc0iK84UbltAH2vC8V/ORKPCUyTXpc1f0UVo9Ov5+GS8TE1vARX6hFyraBAwD
         FFtQRa4D40dgO7l4J+5oC5PVC/ka0Yc/iQyjGoNZhqANB8QviTOUI0e0tUnsWVajxwK0
         WmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=0Ok82EnVbms3xaCc+k3GgiPbyL+Vn/MOKDOz/sHkYac=;
        b=oUZ0vA0+3/xDLaatSpH/6YvgAzgNK4BB6Dlsuf4piHTe58i2L2VO2xrDSlDbiV1zZZ
         Q8jNSaFAzT6DYooyVTJ1TYDGcJ1qmhao6aVDBiS4rKhgrVDFfrzDmDJHSB50obx+R83c
         ydJVHvNMfRYpUQe4i8gFu5RzPI88Nijo3tHBMM5rw6AIUYafkKdMYSA9A5jKhjKL/Es0
         wstMYbG51NB+Rq5QBpCTf233TuagZmMIYYWKCIjdbrlCx+FfmLrYzXGDONkdxFI/3wnV
         kQQwgtmp+7WXnk1X/0181g+auBGnLKUWs+IeCHuKFvb97bUCRLId+Egv8tIo3lFQGbba
         K3oQ==
X-Gm-Message-State: AOAM530cHxNX22mHDRlGk9XZ1Q+RW2uzA+iFqIOVrprA3TfPHtz7MOyD
        6KQCZ762DgBOu0SX33eKD/8=
X-Google-Smtp-Source: ABdhPJwpFQy0dCnXV44yeL5pWTfSQoyIAzTD4a2n3RnQrp6x2A3mipn3ciq7c3KWN2d9ffwt8ZD8Jw==
X-Received: by 2002:a17:907:e86:: with SMTP id ho6mr10959486ejc.209.1637074945322;
        Tue, 16 Nov 2021 07:02:25 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:02:24 -0800 (PST)
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/16] RISC-V: Add initial StarFive JH7100 device tree
Date:   Tue, 16 Nov 2021 16:01:18 +0100
Message-Id: <20211116150119.2171-16-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial device tree for the JH7100 RISC-V SoC by StarFive Ltd. This
is a test chip for their upcoming JH7110 SoC.

The CPU and cache data is based on the device tree in the vendor u-boot
port.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 230 +++++++++++++++++++++++
 1 file changed, 230 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
new file mode 100644
index 000000000000..69f22f9aad9d
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2021 StarFive Technology Co., Ltd.
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
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
+		rstgen: reset-controller@11840000 {
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
2.33.1

