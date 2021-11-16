Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B59D45352F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237804AbhKPPIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237864AbhKPPHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:07:17 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA0DC06122D;
        Tue, 16 Nov 2021 07:02:30 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id g14so25545778edb.8;
        Tue, 16 Nov 2021 07:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3D3isQYQoZt8oK+QagFyG/F4ee/acgQw48favSVe0E=;
        b=iHtjl/nfmPQHpfqvVe7OLbfIuLYEAbPeHSJuoW8MqzMXzXOag9XBTIRgw6kZ1h0PQ2
         7vV/sAo6B0TUNocYJ5r8MQdhv5ZeMi6dcttI06A77+9Tdl3eudJis97cTMjuLIlISOPb
         VC11VpvkRo8eZZlAY20con9fibd6R6nxz5dzDB243tc6nkwEWXG4awvk+fiHoavDQfoB
         CULxGMBfTjUXQT+jj0fP/Xk5EaRFrRHjZKfJ0JgSfLRfyDsd1Igh/iq4ViSujhhR91jy
         HYSCoe8ipljVHJwjhRsg7KjgyRwCe61hv3SFzN+es8VXpXmSIsHEp4OQk5+cXjGtVFoo
         Mjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=n3D3isQYQoZt8oK+QagFyG/F4ee/acgQw48favSVe0E=;
        b=emR4v1LpcizArF6jCapniwpwr64PWNiykGnDZpK8TEBrpmQpKYKFNY1SG/S0BC/OQY
         3iBeJqpg/IW4EbaE0LvzRdA9PRi3oDrFESq2x4OHqj4LlZPbLhEacZ9dtUkY3qeGWnCB
         J5oLkONNttTeP1N/cCsPS2bIebR3P5FUkVv1FDoAwQHBwQlPxKvlfDYXeQDx5k6sqUCM
         o/aiSNuGOyM1upRBZr+hQsmqd9fOI17x8V+sDY6utXYMp+mQFVExzDkL/MWO4a/EwgnY
         v58R3VLYRGtYLjwMEOnWAOefP9clx0QhpvvPckhEvt4E7ojVsxZSHL21G+ZkWu1UtKCy
         C79w==
X-Gm-Message-State: AOAM533avAajNM24wUPpNkZqsxmXxozfeJ0Wj6zkFL1cEIJ3FsQ3NqYL
        cWu9GXcY0Wy0T8CjsGyy7hU=
X-Google-Smtp-Source: ABdhPJzT/NUBHx0bHf0OxPsubbU8JaUF7vSGJZwT5jNIsSUak4miN+RnN3IM9rNPAph6p5SyUnHU5Q==
X-Received: by 2002:a17:907:97c3:: with SMTP id js3mr10922236ejc.240.1637074948242;
        Tue, 16 Nov 2021 07:02:28 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:02:27 -0800 (PST)
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
Subject: [PATCH v4 16/16] RISC-V: Add BeagleV Starlight Beta device tree
Date:   Tue, 16 Nov 2021 16:01:19 +0100
Message-Id: <20211116150119.2171-17-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
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
 .../dts/starfive/jh7100-beaglev-starlight.dts | 164 ++++++++++++++++++
 3 files changed, 167 insertions(+)
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
index 000000000000..c9af67f7a0d2
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2021 StarFive Technology Co., Ltd.
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
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
+		rx-pins {
+			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
+				  GPI_UART3_PAD_SIN)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+		tx-pins {
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

