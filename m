Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12ED844336F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234869AbhKBQqw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234707AbhKBQqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:46:48 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF54AC06118D;
        Tue,  2 Nov 2021 09:12:12 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id m14so24530823edd.0;
        Tue, 02 Nov 2021 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3D3isQYQoZt8oK+QagFyG/F4ee/acgQw48favSVe0E=;
        b=dljsXv3wZeh8L5SZBGkLn6Pt+w3Saj23K1mjCSrTEgOWc/68atJmLq05wJs6FL7xxh
         SIS7v5MG7pbqSgcnyDOEp8PWErMj0F0ctDDlM4lF1BoMVkXW5Y3Sp+vjaxrC8lkiUSli
         gcVGHCDHjCodm5u8tBjp8LjIuCwdSpJMJkTK6eP+mma8bk87BDhtiJztT21OggOqurCj
         /0hNVRrz2WnFye6g+9vcUnvedC8aRQDW+x+24ww6klSRKCDKx1e7jHOLB54Jwdtm0ulm
         mR/UX3HgKvY9vGFAAXvhTIghvJIXQ5+jDAI7s2v109xY1YroDwwpXFHg/XFilnXvucy2
         Tt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=n3D3isQYQoZt8oK+QagFyG/F4ee/acgQw48favSVe0E=;
        b=5jnXYkJxRphCx9ZcXiEvHjc8CSgnUaLWX0qObC7BmGri8bf2EjtJTfqEGQ4Ar/t3mC
         +rV6F/GQt8OfRgSIcS5OFYzCv1CPnHBotMw8l3JrvsHGS+ioLYfCwc/GovZS31Nr+yta
         wIocGJD76z+upEv4pkM3xP1rpm70LbNC4HpP99fBOwd9xWgnPRj41is6a35ec2GlfaUH
         KoOMl3QUk1TYugaSuR71HE8oZWqNjN+28+dxMQm2dnH6/oQtHogAWRSenP6myUe4pHH+
         y0MYK67FzcPaJN4dqd0hH9FTxXcNLHHcix8Nn1cuk4DPtXyq+/YIrqZnKN/eZEcjJuO1
         Rj4A==
X-Gm-Message-State: AOAM533z7+r/HMGwJuqYATrMyU9pe46sYm+qpvwhXgzKs87+6p9VOVT4
        zN9Zj532K09eopSgqI/a9eA=
X-Google-Smtp-Source: ABdhPJwqsnQ8XwkGvDCTh7wJhlcnFGeqD1H43P++XZjui4DqdM1Mm5nlAPqbxstxZhhXo8If7vSMyA==
X-Received: by 2002:a17:907:961a:: with SMTP id gb26mr45903415ejc.527.1635869529075;
        Tue, 02 Nov 2021 09:12:09 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:12:08 -0700 (PDT)
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
Subject: [PATCH v3 16/16] RISC-V: Add BeagleV Starlight Beta device tree
Date:   Tue,  2 Nov 2021 17:11:25 +0100
Message-Id: <20211102161125.1144023-17-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
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

