Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBE844E6F5
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 14:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbhKLNFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 08:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234998AbhKLNFG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 08:05:06 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E48C061766;
        Fri, 12 Nov 2021 05:02:15 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id v127so7630938wme.5;
        Fri, 12 Nov 2021 05:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mZKtwqreQjIFFGIVCaqNbBHLsMC83WDXTYa/9FKmow=;
        b=gq4MlO43nd3Q+MWjpz0Sh60rjqH7AvG+WB2UYBs/fZgL4ctv3veRW/M/a7/zwHZT0V
         8PRu6LlkRlvSAZZdn2Dcek/TjAWZpUZHCr5MfyAD/yyFY/8ketUXKFAfCBVJjm77QZCx
         R/fGve0Y61O0hZSlrn/QRV2M73XoihjfK4o+ruDZyLjT7yeseMRyfVVkIXNNiEkzc5z0
         rklI5NoTQjkt6nF0LuVrGIs9SZD2Gr1ew2ZANoJup6BbLP9MDza1ZXJu246h0VR1werU
         0k/LmX9luOYI7u9EYsV2i7jqjjZo+x96jIzzDNq5CPtm+ZqoZVj/0XhArSdBhXRmET3K
         orKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mZKtwqreQjIFFGIVCaqNbBHLsMC83WDXTYa/9FKmow=;
        b=jl9hq8pZOoMgFFU31qbPXmJETI6X01Um7QpV9jHR5V6S01PkLr6ff5HtTkc8olU9Hk
         vA1K9JSPuML3UGgaJvDOJsuu3MBaGZDlR3AKXG0dsrLm6gFQZVwa9g3dAFOTAt0IMQbJ
         yYvKT3Uj3Gz6uLhs5wlxamVwcDGhqDlQwNHXYU6Kxaxd/b99Xc6wPm1aK4DOLDava8V/
         J4zwbiISBgzmjpWdBA7OpR11O5t45JZ+r8u2BIyA9/4lZmSEFxfkC58u30chm+QLRocF
         MmIV/9mj5GnUto472d6d++q8mHu9SQprF3pHBiaq+L0ikbu8JgcsOm8qWtOIdjeijFao
         16Wg==
X-Gm-Message-State: AOAM532/4ER2754sj7wXUArc44jcCvLCVpHIkTC+8iO9oPvPebZVCiIR
        8KGvOdauUrjFhxwVXqYcZAk=
X-Google-Smtp-Source: ABdhPJwUN+673vHEsqQImvV9PWFbdV917AXNP4LKKIiovuQuBkS/uZKE6FT9pzZch/niKIYDZDLXTg==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr16431254wml.85.1636722134490;
        Fri, 12 Nov 2021 05:02:14 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id k187sm8532784wme.0.2021.11.12.05.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:02:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: tegra: Enable gpio-keys on Jetson AGX Orin Developer Kit
Date:   Fri, 12 Nov 2021 14:01:52 +0100
Message-Id: <20211112130152.3682556-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130152.3682556-1-thierry.reding@gmail.com>
References: <20211112130152.3682556-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Expose power, force-recovery and sleep buttons via a gpio-keys device so
that userspace can receive events from them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 31 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  1 +
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index e3bb874869df..699eaa66824d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
 #include "tegra234-p3701-0000.dtsi"
 #include "tegra234-p3737-0000.dtsi"
 
@@ -18,6 +21,34 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		status = "okay";
+
+		force-recovery {
+			label = "Force Recovery";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 0) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <BTN_1>;
+		};
+
+		power-key {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA234_AON_GPIO(EE, 4) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+
+		suspend {
+			label = "Suspend";
+			gpios = <&gpio TEGRA234_MAIN_GPIO(G, 2) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_SLEEP>;
+		};
+	};
+
 	tcu {
 		status = "okay";
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 33523f7a9aaa..ad6978ca7162 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <dt-bindings/clock/tegra234-clock.h>
+#include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 #include <dt-bindings/reset/tegra234-reset.h>
-- 
2.33.1

