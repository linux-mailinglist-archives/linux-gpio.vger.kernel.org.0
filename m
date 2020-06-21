Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9083E202D27
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbgFUViy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730887AbgFUViv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:51 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84748C061794;
        Sun, 21 Jun 2020 14:38:51 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id z17so126242edr.9;
        Sun, 21 Jun 2020 14:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3F3R6YmNtbbFk0ssi3W86FxjPHJfS6dcu4yy7CdcWmY=;
        b=PYGDtEvZyorWebhRdsHsQkU2J7ZNsFPir1ycq7b3B9rdYgLqp0Af6acXt/jh6SPiBa
         vY2w8uWuwU1ORRfbiQhcFAHMiB7bxXxTQ6kj7l/ZoFDOhmZAvd/lS1cUM0GJwuZwfzJ5
         ocuEV+oXTLWGra4O/Tu6i6frpVbA1VSm+FU9cMbx5k9fnjbuvPqkTsCVhQVuDGq+fX6J
         P8Pb1hOTUgYh6hau+d2a7DvX4VhlJdbVt09Ih9ecn9F+yn1PemAvDQg6RpqYyEbSHF5z
         IbxLChXgscKJQECwrrD5strKKsn9eZ8X9G1K7U77Z5AhYLUxLJhktT3dzwKyl3O2Y5OS
         q1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3F3R6YmNtbbFk0ssi3W86FxjPHJfS6dcu4yy7CdcWmY=;
        b=Q+Mfo3ZQi+1HjuPkAxLg6J0fl/vfcDyVLZEmHxLv3wfPHXFaAfa9Y3Gvybnh8/ok7q
         wyeSgtvNvDTbJrDyQ3xoARlA98nfDzOGbyKZqEzZBKR/VPYkC0TiIp9o6avKawbsTaYU
         o1FS5oBB1w5hu6z///72+N5RpIH6Ozjw3Wq0+6Q3c8Mwi2eQqfRyKyNS0IWe25JHVmjp
         8oeSQ0HiCclmB2WF8pzb/gbQk5kjRE0lYJAMU3QnqodmlnqC6VFL3KCR5RJtV2HKPdi+
         5ZR4YZMLQs3RAgDXnLw+eYeKV78bxZWQvmilxjwgv9TIeisXWlMS48YnRTjRwz2Q0SHF
         xUzA==
X-Gm-Message-State: AOAM533R5DFacs8tDUlhmECT1zaKfq+bEi+q58p4V8VVV+4U9qWgnnaH
        LwerX5adJHOa7CCVu4ZCuaY=
X-Google-Smtp-Source: ABdhPJwecEU7xydxSUuGvvle3QyCw1ka+L9+4PqF5P0SfURNWNBlcYDAhDadF4c7cljowttX7uTvEQ==
X-Received: by 2002:a50:aacc:: with SMTP id r12mr14027623edc.219.1592775530254;
        Sun, 21 Jun 2020 14:38:50 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:49 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 7/8] arm64: dts: qcom: Add support for Sony Xperia XA2/Plus/Ultra (Nile platform)
Date:   Sun, 21 Jun 2020 23:38:03 +0200
Message-Id: <20200621213806.551879-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621213806.551879-1-konradybcio@gmail.com>
References: <20200621213806.551879-1-konradybcio@gmail.com>
MIME-Version: 1.0
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
index 000000000000..2d7f0ceca4aa
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
+    model = "SoMC Discovery-RoW";
+    compatible = "sony,discovery-row", "qcom,sdm630", "qcom,sdm630-mtp";
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
new file mode 100644
index 000000000000..45f794440d19
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
+    model = "SoMC Pioneer-RoW";
+    compatible = "sony,pioneer-row", "qcom,sdm630", "qcom,sdm630-mtp";
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
new file mode 100644
index 000000000000..4c2b7fa9d0a4
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
+    model = "SoMC Voyager-RoW";
+    compatible = "sony,voyager-row", "qcom,sdm630", "qcom,sdm630-mtp";
+
+    chosen {
+        framebuffer@9d400000 {
+            reg = <0 0x9d400000 0 (2160 * 1080 * 4)>;
+            height = <2160>;
+        };
+    };
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
new file mode 100644
index 000000000000..39f1cffe9853
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
+    /* required for bootloader to select correct board */
+    qcom,msm-id = <318 0>;
+    qcom,board-id = <8 1>;
+    qcom,pmic-id = <0x1001b 0x101011a 0x00 0x00 0x1001b 0x201011a 0x00 0x00>;
+
+    /* This part enables graphical output via bootloader-enabled display */
+	chosen {
+        bootargs = "earlycon=tty0 console=tty0";
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        stdout-path = "framebuffer0";
+
+        framebuffer0: framebuffer@9d400000 {
+            compatible = "simple-framebuffer";
+            reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
+            width = <1080>;
+            height = <1920>;
+            stride = <(1080 * 4)>;
+            format = "a8r8g8b8";
+            status= "okay";
+        };
+	};
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        ramoops@ffc00000 {
+            compatible = "ramoops";
+            reg = <0x0 0xffc00000 0x0 0x100000>;
+            record-size = <0x10000>;
+            console-size = <0x60000>;
+            ftrace-size = <0x10000>;
+            pmsg-size = <0x20000>;
+            ecc-size = <16>;
+            status = "okay";
+        };
+
+        debug_region@ffb00000 {
+            reg = <0x00 0xffb00000 0x00 0x100000>;
+            no-map;
+        };
+
+        removed_region@85800000 {
+            reg = <0x00 0x85800000 0x00 0x3700000>;
+            no-map;
+        };
+    };
+
+    soc {
+        gpio_keys {
+            status = "okay";
+            compatible = "gpio-keys";
+            input-name = "gpio-keys";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            autorepeat;
+
+            camera_focus {
+                label = "Camera Focus";
+                gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+                linux,input-type = <1>;
+                linux,code = <KEY_CAMERA_FOCUS>;
+                debounce-interval = <15>;
+            };
+
+            camera_snapshot {
+                label = "Camera Snapshot";
+                gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
+                linux,input-type = <1>;
+                linux,code = <KEY_CAMERA>;
+                debounce-interval = <15>;
+            };
+
+            vol_down {
+                label = "Volume Down";
+                gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
+                linux,input-type = <1>;
+                linux,code = <KEY_VOLUMEDOWN>;
+                gpio-key,wakeup;
+                debounce-interval = <15>;
+            };
+        };
+
+        sdhci@c0c4000 {
+            status = "okay";
+
+            /* SoMC Nile platform's eMMC doesn't support HS200 mode */
+            /delete-property/ mmc-hs200-1_8v;
+        };
+
+        i2c@c175000 {
+            status = "okay";
+
+            /* Synaptics touchscreen */
+        };
+
+        i2c@c176000 {
+            status = "okay";
+
+            /* SMB1351 charger */
+        };
+
+        /* I2C3, 4, 5, 7 and 8 are disabled on this board. */
+
+        i2c@c1b6000 {
+            status = "okay";
+
+            /* NXP NFC */
+        };
+
+        serial@c1af000 {
+            status = "okay";
+        };
+    };
+
+};
\ No newline at end of file
-- 
2.27.0

