Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85196436991
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbhJURrL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbhJURqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:46:14 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007E6C079784;
        Thu, 21 Oct 2021 10:42:55 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g8so3985720edb.12;
        Thu, 21 Oct 2021 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R35nc05KE6+1WFId6qi9a7ieUbx1Ss6n06FPdnrwpSc=;
        b=k+ce37DuO6wEM9lmfLt6WNZj98aoHJXEZi/nb5SaxrWYk3QmMbOIdXdoxiU6SXdYKS
         KdQpnzUenXckUBX0sWQiTTDtp71mbi0iMhxhVo8kKtiZlWeY9HNCNkar0V4xkuuc0aDd
         dqJCOObsEVxqlcA9D3fnxQqE8eIAF2buk0TCO9Hp8lNvbB6cwuhEcKGcBWMLOmHpztkJ
         W/86ovZQYnh+Q8wGUpIaVmfDBvrcBtqUx4GI5mMcRfyJCz7m9xFWGurZ0KPzkmBM4YQ4
         oVrM+Nrc9i6vUIcQzh+JyaaES902vvCW8h6gOdwXqnUwAz4YcjQB9nfVzkQ7uI0C52A3
         lglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=R35nc05KE6+1WFId6qi9a7ieUbx1Ss6n06FPdnrwpSc=;
        b=iYSpsPGUVhSN+ihHtB73P5q6FRC0WxP3Kh0TCu6z2YyiaDgGezLVpTe9JFJsKiFuZ7
         v0wGXvu+O98PAwZvQRGGXwHJZhpuN9rcvgJdt0IsH0iwQc2To2tJLIaSYVSdZOMcJrjh
         u6EvH8go3cLy98gW9+M1Kuq2Xr++kfcgcSeMG1rhmLuyCdU/N/GGYleTKpK4bahC88ok
         3kkxuqLi3KnrleOiWEza7ubd0ewgdZPLrhPemY62OCZKVkKJGxNcMTa1IKGWilEZgtSn
         JxOD1seKw5Go+vKZmcRJZglcE8Zu4jeSulQAGaUrmL4Hp0zlOpwCV25L7AQ1Bggtks8B
         d7vA==
X-Gm-Message-State: AOAM532esFfsXW8MQjfs78eQJqEQjCRHpXE+BvaM9BmWn4KEy0nO3cZl
        eIciGELC67I1UeDlJph/vyE=
X-Google-Smtp-Source: ABdhPJxeTl88avKtZsoRYj7p+c/vQkD7LKOTlC0O5VQ5aRtKkGM6cFvu3lKtT50+TRmuTmJsWPtTZg==
X-Received: by 2002:a17:906:7304:: with SMTP id di4mr9020499ejc.179.1634838173599;
        Thu, 21 Oct 2021 10:42:53 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:53 -0700 (PDT)
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
Subject: [PATCH v2 16/16] RISC-V: Add BeagleV Starlight Beta device tree
Date:   Thu, 21 Oct 2021 19:42:23 +0200
Message-Id: <20211021174223.43310-17-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial device tree for the BeagleV Starlight Beta board. About 300
of these boards were sent out as part of a now cancelled BeagleBoard.org
project.

I2C timing data is based on the device tree in the vendor u-boot port.
Heartbeat LED added by Geert.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 .../dts/starfive/jh7100-beaglev-starlight.dts | 162 ++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/Makefile
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fe996b88319e..ff174996cdfd 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
+subdir-y += starfive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 subdir-y += microchip
 
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
new file mode 100644
index 000000000000..0ea1bc15ab30
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
new file mode 100644
index 000000000000..d30d42d299c6
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (C) 2021 StarFive Technology Co., Ltd. */
+/* Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk> */
+
+/dts-v1/;
+#include "jh7100.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/pinctrl-starfive.h>
+
+/ {
+	model = "BeagleV Starlight Beta";
+	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
+
+	aliases {
+		serial0 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <6250000>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-ack {
+			gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			linux,default-trigger = "heartbeat";
+			label = "ack";
+		};
+	};
+};
+
+&gpio {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(62, GPO_LOW,
+				  GPO_I2C0_PAD_SCK_OEN,
+				  GPI_I2C0_PAD_SCK_IN)>,
+				 <GPIOMUX(61, GPO_LOW,
+				  GPO_I2C0_PAD_SDA_OEN,
+				  GPI_I2C0_PAD_SDA_IN)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c1_pins: i2c1-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(47, GPO_LOW,
+				  GPO_I2C1_PAD_SCK_OEN,
+				  GPI_I2C1_PAD_SCK_IN)>,
+				 <GPIOMUX(48, GPO_LOW,
+				  GPO_I2C1_PAD_SDA_OEN,
+				  GPI_I2C1_PAD_SDA_IN)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(60, GPO_LOW,
+				  GPO_I2C2_PAD_SCK_OEN,
+				  GPI_I2C2_PAD_SCK_IN)>,
+				 <GPIOMUX(59, GPO_LOW,
+				  GPO_I2C2_PAD_SDA_OEN,
+				  GPI_I2C2_PAD_SDA_IN)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	uart3_pins: uart3-0 {
+		rx-pin {
+			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
+				  GPI_UART3_PAD_SIN)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+		tx-pin {
+			pinmux = <GPIOMUX(14, GPO_UART3_PAD_SOUT,
+				  GPO_ENABLE, GPI_NONE)>;
+			bias-disable;
+			drive-strength = <35>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <500>;
+	i2c-scl-falling-time-ns = <500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	pmic@5e {
+		compatible = "ti,tps65086";
+		reg = <0x5e>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		regulators {
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <100>;
+	i2c-scl-falling-time-ns = <100>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <500>;
+	i2c-scl-falling-time-ns = <500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&osc_sys {
+	clock-frequency = <25000000>;
+};
+
+&osc_aud {
+	clock-frequency = <27000000>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	status = "okay";
+};
-- 
2.33.1

