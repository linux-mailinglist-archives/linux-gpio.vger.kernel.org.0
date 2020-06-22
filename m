Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660AC20403E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 21:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgFVT02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 15:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgFVT01 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 15:26:27 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05178C061573;
        Mon, 22 Jun 2020 12:26:26 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a1so5137360ejg.12;
        Mon, 22 Jun 2020 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqSMFWcdWVCw//G/C2z9EbyVXETb7cowxz1a1LHcUTw=;
        b=WJDTL38w2YjaaJDeJelj9fWpY3bcUxbggJ5zdHtzB0FWCi0XK/BNQxEoMeumgwriuZ
         FvFkVzoJ469ZTXoJeYvqY+TNGtzn0+mFJM4xVCDXiYlZX9er9QUZv1bT5YMAsIQsxJWY
         0/rhCDTnggY0gQNaW0nq7A5VuehOrDnp3elRm/qTF64pg4D5xPTPNSP7makp3rtiVjok
         sJxTp+AcP67OMitdfMpj9cpqhVAXuZU5KHcJpLqtk/OEbLI24CrvmhC29i4OlMgWcTLU
         Sz8Ven1FUNBi5Tm23SRs0/ai43U+859fTgHf2XFS1hrFzKDOZdYClLEkL2vXxnRj7Kpt
         z0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqSMFWcdWVCw//G/C2z9EbyVXETb7cowxz1a1LHcUTw=;
        b=HylLd7Ifl3RZIXhU2zgG6emk28qkQ8fNTirg2wuVxclmTWgIKnpo1X6wrievvdRvna
         ccb8uF4L3/kemDh8huL0kD5AUEgROe58U4hXszXUz3/B0rxKhdghDcl32oJX6nD5Re28
         KnmMGmm73V2vjxu/tenrrAhvdNM8DJaOjIH4ZSGqjVnKvTEPRcwAWBWpRgVxighPWUm+
         zo2gE0KP1k9qfMVwqPowkn2c/pZ90M7gtD/rkYvxvXsJXqTRZZhMMCq3iKjjrmrn7AqT
         9XLkVMKBS05cM0znRcAU5PHXjwu09rWWTyae3g80hvZJV2w2xpledoswNioS7RdZHgTW
         ozWQ==
X-Gm-Message-State: AOAM531n+Lo6u/jAzPDTXU06QuSjmL4+GSpL4ImLSFGlUydEb0XHu/cr
        2KCXjxagY/LV4yYq+3OqwN3NtAYJOzI=
X-Google-Smtp-Source: ABdhPJzobv4ey9CwANiwYpgcQb03bFyQOe/qKKIbJ3jc6K3hWfj3GDuZnN5mCzVRpNwl9fcDTT2T+w==
X-Received: by 2002:a17:906:3407:: with SMTP id c7mr3869931ejb.284.1592853984635;
        Mon, 22 Jun 2020 12:26:24 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id d16sm4043336ejo.31.2020.06.22.12.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:26:24 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>
Subject: [PATCH v3 5/7] arm64: dts: qcom: Add support for Sony Xperia XA2/Plus/Ultra (Nile platform)
Date:   Mon, 22 Jun 2020 21:25:55 +0200
Message-Id: <20200622192558.152828-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622192558.152828-1-konradybcio@gmail.com>
References: <20200622192558.152828-1-konradybcio@gmail.com>
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
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 136 ++++++++++++++++++
 5 files changed, 185 insertions(+)
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
index 000000000000..8fca0b69fa01
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
+	model = "Sony Xperia XA2 Ultra";
+	compatible = "sony,discovery-row", "qcom,sdm630";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
new file mode 100644
index 000000000000..90dcd4ebaaed
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
+	model = "Sony Xperia XA2";
+	compatible = "sony,pioneer-row", "qcom,sdm630";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
new file mode 100644
index 000000000000..fae5f1bb6834
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
+	model = "Sony Xperia XA2 Plus";
+	compatible = "sony,voyager-row", "qcom,sdm630";
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
index 000000000000..9ba359c848d0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -0,0 +1,136 @@
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
+			compatible = "simple-framebuffer";
+			reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
+			width = <1080>;
+			height = <1920>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			status= "okay";
+		};
+	};
+
+	gpio_keys {
+		status = "okay";
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+
+		camera_focus {
+			label = "Camera Focus";
+			gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			debounce-interval = <15>;
+		};
+
+		camera_snapshot {
+			label = "Camera Snapshot";
+			gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA>;
+			debounce-interval = <15>;
+		};
+
+		vol_down {
+			label = "Volume Down";
+			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpio-key,wakeup;
+			debounce-interval = <15>;
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
+		sdhci@c0c4000 {
+			status = "okay";
+
+			mmc-ddr-1_8v;
+			/* SoMC Nile platform's eMMC doesn't support HS200 mode */
+			mmc-hs400-1_8v;
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
+		serial@c1af000 {
+			status = "okay";
+		};
+
+		/* I2C3, 4, 5, 7 and 8 are disabled on this board. */
+
+		i2c@c1b6000 {
+			status = "okay";
+
+			/* NXP NFC */
+		};
+	};
+};
-- 
2.27.0

