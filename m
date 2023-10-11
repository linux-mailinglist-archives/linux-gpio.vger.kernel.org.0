Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9D37C5C11
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 20:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347030AbjJKSuV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 14:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235213AbjJKStn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 14:49:43 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC99184
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:39 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-327be5fe4beso140446f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050178; x=1697654978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rNU+0f0F/gCIdCl4EDMR0lz8ypWbVXVkLyBL+/rq2Y=;
        b=suRfFTZ2iH1ni4+ZKbJo4l0fb4CSIU3bK43gbMaKaziCRvzhxKonlf3HPV1v4vmOOS
         g7ksgbn33AX9PeB8r7wwkGT5Id49tMbiUO1MB9/UfLVcPYw47605FEr5CXWI24eTlv92
         B1/5FOAk0cDJ3vC4HdXQFY2NAbLzjaYxGRgZMESiP+9Ip4K+bumeNTZRaLNWpcJU+SXU
         TwZ4GdLIx03l/iZdmT98so1X+53ePtmTlHY79UqB2gMvV1S0ClE3AKlm3cjNr5/d7O9m
         +E3+MYy+1i57Gjo7TICDlBv6zPNt+1qyeKJwc+u4cZ8vz1cDoI+xF/AU5+0hFXBySl4s
         pgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050178; x=1697654978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rNU+0f0F/gCIdCl4EDMR0lz8ypWbVXVkLyBL+/rq2Y=;
        b=DiLySPnzxQGM0U+N1Yn/q47vt4lPyDAEQJg/azaY4X0HtYtbPHTTwGEXOD+f9MrNOL
         TXybIC3bjh2vJC4ZH4oj62amXxIvNcCkhy2sKsb/48tHgSTjCWnIB4XNiLuesMjYEJeu
         +3R2bFbfGPGMY8r9ddRGGCio8zf33xh264iCGEV4BMpaRbwtGBl1F0r3hBS9OjxnYVIL
         n7oYJ7G8V21JSRcax7glsGQ97ATz/yTwGp5egmvdVuP0P9R8Z9Wgy8FX8pOH0tuxgZra
         26BkpQsh/pv39WJvbSmtSucVjrFMdO93JejKaFNc8ZUPS4T/OQAnKqePhwQi5EkC6NdD
         wckA==
X-Gm-Message-State: AOJu0YxWaEAiBJgtMAzdF85tUPXntgWGUSIYTgaMWQJbkuazjpJsOYOZ
        I+5sUK+DSAgLOdstVvfA5Iuveg==
X-Google-Smtp-Source: AGHT+IEXY6IgUpxATADs7gdTp/nE358200LJllCLW1NYxTFfkeuTs8hbWxUH4HOsMjkOlZWfpAW9JQ==
X-Received: by 2002:a5d:6483:0:b0:32d:8830:edb with SMTP id o3-20020a5d6483000000b0032d88300edbmr2386947wri.38.1697050178243;
        Wed, 11 Oct 2023 11:49:38 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:37 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 18/20] arm64: dts: google: Add initial Oriole/pixel 6 board support
Date:   Wed, 11 Oct 2023 19:48:21 +0100
Message-ID: <20231011184823.443959-19-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add initial board support for the Pixel 6 phone code named Oriole. This
has been tested with a minimal busybox initramfs and boots to a shell.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/google/Makefile         |  4 ++
 arch/arm64/boot/dts/google/gs101-oriole.dts | 79 +++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts

diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..5cea8ff27141
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
+	gs101-oriole.dtb \
diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dts b/arch/arm64/boot/dts/google/gs101-oriole.dts
new file mode 100644
index 000000000000..3bebca989d34
--- /dev/null
+++ b/arch/arm64/boot/dts/google/gs101-oriole.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "gs101-pinctrl.h"
+#include "gs101.dtsi"
+
+/ {
+	model = "Oriole";
+	compatible = "google,gs101-oriole", "google,gs101";
+
+	chosen {
+		bootargs = "earlycon=exynos4210,mmio32,0x10A00000 console=ttySAC0";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown &key_volup &key_power>;
+
+		button-vol-down {
+			label = "KEY_VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-vol-up {
+			label = "KEY_VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "KEY_POWER";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+};
+
+&pinctrl_1 {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_0 {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+};
-- 
2.42.0.655.g421f12c284-goog

