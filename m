Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4092843698A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhJURqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhJURpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:45:38 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DCEC061234;
        Thu, 21 Oct 2021 10:42:53 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z20so4103678edc.13;
        Thu, 21 Oct 2021 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stGtZhMNNjsTnJEAAUH1rqxyUJt4TeYcp5DMUPqNnSg=;
        b=GmqamCdeXwxAgDFdNi9xOwBaeCqXZe9QJHhiAhJUsDuv6Elmm8HGOdbn8SjF9yvvov
         PNgiTNRSeEsxU+m/Ml30IWsG17vR61f7B+ZzWJNxU9k0jXJE2YIuztKUOL8c5HDbdi6n
         c8Dx9FJbGxVdCcWbiltqQaK5emJMNeLZsy/sToV/DZHd1MGn3XZbH63D4aGW6R6PPhiN
         63WjUEGTmO7cnW08NJjPPt6cyhiqM4bj+Rf3UPDyn8j/98d3GTe1u3CJWe3T6iB6jAnF
         OVQDlZJpQuX1Pw1o40XLyz2B9QTsO3AofbXejYnvsC+U4FwWhF2iQzimdZdy2tVHkQqh
         RxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=stGtZhMNNjsTnJEAAUH1rqxyUJt4TeYcp5DMUPqNnSg=;
        b=L6Avuo4INFcXW7kEHcvVmK8l5AhdV3V8cJLZJauwXaJcbnzs0ZbjFDcjhgbyxcdiTC
         ZtTYgG3ZiO+g9HyGQVBuN5ECdu7J0MnD8Ev0pY9AD43BT9fOjswDDZ9wt3AV22P9lJ8e
         8+bN8CGzXw/kYol+zlUjB4WAWQ2wAqvcAAjmzzYiAJRsNneATyzEC3PiXpiJhMtQryaF
         O/h4Qlgew6zyKj7KMJ1FAFIEAe8bfGbGOL/xE1ouSukHU/V0vbhnvEaIothHpa6znQC3
         zplBP1o3duBoTbxdHIqx5wRsuXmKXpiZf3px+b2DyLOYJiXhrrlrD5MmBjlqeC9D1W4P
         0+qA==
X-Gm-Message-State: AOAM5305gDdv85QSk9DCHxJ8ne5zwp7CeZb+REyWWXhyGvSd+heBlFbR
        i8LyUgogWzzodNzMvdse7mI=
X-Google-Smtp-Source: ABdhPJy8CM7gZK/Sbwdv8XxapbHI5h02NxmiEGUosTOvDWBV+DCwYobF0QfTq0By6HOZZollMspbVg==
X-Received: by 2002:a17:906:f6cd:: with SMTP id jo13mr8735041ejb.563.1634838172359;
        Thu, 21 Oct 2021 10:42:52 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:52 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/16] RISC-V: Add initial StarFive JH7100 device tree
Date:   Thu, 21 Oct 2021 19:42:22 +0200
Message-Id: <20211021174223.43310-16-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
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
index 000000000000..90ee1e7b1c24
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

