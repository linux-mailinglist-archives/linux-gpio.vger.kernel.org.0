Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8BC203113
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgFVH62 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbgFVH6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:58:20 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B5EC061795;
        Mon, 22 Jun 2020 00:58:19 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id m21so12831887eds.13;
        Mon, 22 Jun 2020 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dmx5+PM1K/5lxm0AgMbX1KNeUymmqik8gyqWBBLElnA=;
        b=CUHC8Q2Jkg0GOviutIXExhCi05jWxbOmiRenHTLCNcDmwKfVksOFQJ8GaizrfKh9l/
         UsSh/rjFAxAyU441iNMkO1wbkAdKlEqZ0YxGKh1n0X1jjoEiuK6hu0huN/RG6O58J87u
         WLgPeLufnHz1YEB143HeDfRNx1koIfRx4P3JMTr7/PIWVdOPo3ZPHS5Ro8lJ+1XpNrkt
         iYOlRYdc8HF3QzqP4wWkFKnDZNwX2T58hwPUQj8HKoYvAg6h5qaWzlYq1yGdz1luI35p
         6/xDDEBN1MEpEeeAnlAwmgup3U9end7xLmd5pDiU1O8oA5wWtwgvGIIHhvWelgpQxp4p
         e94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dmx5+PM1K/5lxm0AgMbX1KNeUymmqik8gyqWBBLElnA=;
        b=Mgwpm84VzI2qzKsnz3tss34DqX6cW+t1pCXnR3dPWlQlE8fPLlcCFf/10HCr7UOEBK
         xzzeSLMQqPOpF6n7xByek6uFQpX1Yz37StVkh23ts7iHYRuhaJjzyyTYRhgHARDRh3zQ
         a2Kya4OQDkdlYJeWKycN9BmlXQ+MUmAXnX39IJhT92PaOQonIz79Bmuo52zwcZlG+bMK
         QChTkR1mS90D2qetdu0yJ0Bi6kd9L+/Wkg+4UkDTjl4NiWQK/B/dYGZPRDi0yLdDlcGA
         kCXkdOvE8AQ2fjugUIGng1FZUld+oe+YPqYd5MTzAtrRn9U1DZZh5dauk5EWzvO9vW/s
         JhvQ==
X-Gm-Message-State: AOAM531Z7w8q4a7bs4Qry9MaVEj1k4MnAhv61+/tbJ118J9B3zrJMHcp
        9aL6XY/mp/FE6zH2uy3vgHU=
X-Google-Smtp-Source: ABdhPJxAaBjZs/NLzrsnd0Ru5pgSNCKpG8vAggElJQHx909DFc0kWahikFLSTaog5OX6gYZZxyPO5Q==
X-Received: by 2002:aa7:cb52:: with SMTP id w18mr15951223edt.1.1592812698183;
        Mon, 22 Jun 2020 00:58:18 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:58:17 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>
Subject: [PATCH v2 7/8] arm64: dts: qcom: Add support for Sony Xperia XA2/Plus/Ultra (Nile platform)
Date:   Mon, 22 Jun 2020 09:57:45 +0200
Message-Id: <20200622075749.21925-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622075749.21925-1-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree support for the Sony Xperia XA2, XA2 Plus and
XA2 Ultra smartphones. They are all based on the Sony Nile
platform (sdm630) and share a lot of common code. The
differences are really minor, so a Nile-common DTSI
has been created to reduce clutter.

XA2 - Pioneer
XA2 Plus - Voyager
XA2 Ultra - Discovery

The boards currently support:
* Screen console
* SDHCI
* I2C
* pstore log dump
* GPIO keys
* PSCI idle states

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Tested-by: Łukasz Patron <priv.luk@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 .../sdm630-sony-xperia-nile-discovery.dts     |  13 ++
 .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |  13 ++
 .../qcom/sdm630-sony-xperia-nile-voyager.dts  |  20 +++
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 135 ++++++++++++++++++
 5 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0f2c33d611df..1cad7cb07574 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-voyager.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
new file mode 100644
index 000000000000..1312eebe76a1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "sdm630-sony-xperia-nile.dtsi"
+
+/ {
+	model = "SoMC Discovery-RoW";
+	compatible = "sony,discovery-row", "qcom,sdm630", "qcom,sdm630-mtp";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
new file mode 100644
index 000000000000..76f20ad5273f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "sdm630-sony-xperia-nile.dtsi"
+
+/ {
+	model = "SoMC Pioneer-RoW";
+	compatible = "sony,pioneer-row", "qcom,sdm630", "qcom,sdm630-mtp";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
new file mode 100644
index 000000000000..82e54a73d172
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "sdm630-sony-xperia-nile.dtsi"
+
+/ {
+	model = "SoMC Voyager-RoW";
+	compatible = "sony,voyager-row", "qcom,sdm630", "qcom,sdm630-mtp";
+
+	chosen {
+		framebuffer@9d400000 {
+			reg = <0 0x9d400000 0 (2160 * 1080 * 4)>;
+			height = <2160>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
new file mode 100644
index 000000000000..af75ab211b5f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "sdm630.dtsi"
+#include "pm660.dtsi"
+#include "pm660l.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <318 0>;
+	qcom,board-id = <8 1>;
+	qcom,pmic-id = <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00 0x00>;
+
+	/* This part enables graphical output via bootloader-enabled display */
+	chosen {
+		bootargs = "earlycon=tty0 console=tty0";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "framebuffer0";
+
+		framebuffer0: framebuffer@9d400000 {
+		compatible = "simple-framebuffer";
+		reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
+		width = <1080>;
+		height = <1920>;
+		stride = <(1080 * 4)>;
+		format = "a8r8g8b8";
+		status= "okay";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@ffc00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xffc00000 0x0 0x100000>;
+			record-size = <0x10000>;
+			console-size = <0x60000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x20000>;
+			ecc-size = <16>;
+			status = "okay";
+		};
+
+		debug_region@ffb00000 {
+			reg = <0x00 0xffb00000 0x00 0x100000>;
+			no-map;
+		};
+
+		removed_region@85800000 {
+			reg = <0x00 0x85800000 0x00 0x3700000>;
+			no-map;
+		};
+	};
+
+	soc {
+		gpio_keys {
+			status = "okay";
+			compatible = "gpio-keys";
+			input-name = "gpio-keys";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			autorepeat;
+
+			camera_focus {
+				label = "Camera Focus";
+				gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+				linux,input-type = <1>;
+				linux,code = <KEY_CAMERA_FOCUS>;
+				debounce-interval = <15>;
+			};
+
+			camera_snapshot {
+				label = "Camera Snapshot";
+				gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
+				linux,input-type = <1>;
+				linux,code = <KEY_CAMERA>;
+				debounce-interval = <15>;
+			};
+
+			vol_down {
+				label = "Volume Down";
+				gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
+				linux,input-type = <1>;
+				linux,code = <KEY_VOLUMEDOWN>;
+				gpio-key,wakeup;
+				debounce-interval = <15>;
+			};
+		};
+
+		sdhci@c0c4000 {
+			status = "okay";
+
+			/* SoMC Nile platform's eMMC doesn't support HS200 mode */
+			/delete-property/ mmc-hs200-1_8v;
+		};
+
+		i2c@c175000 {
+			status = "okay";
+
+			/* Synaptics touchscreen */
+		};
+
+		i2c@c176000 {
+			status = "okay";
+
+			/* SMB1351 charger */
+		};
+
+		/* I2C3, 4, 5, 7 and 8 are disabled on this board. */
+
+		i2c@c1b6000 {
+			status = "okay";
+
+			/* NXP NFC */
+		};
+
+		serial@c1af000 {
+			status = "okay";
+		};
+	};
+};
-- 
2.27.0

