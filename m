Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF2E46D9BF
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 18:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237917AbhLHReg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 12:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhLHReg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 12:34:36 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D87C061746;
        Wed,  8 Dec 2021 09:31:04 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id t9so5347558wrx.7;
        Wed, 08 Dec 2021 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BjXW6fm0PtmxnDuZ5f1C1GLdB8wT64MP92DyErb42Vo=;
        b=WlFVVdUIfqyXRXOcCdM0AydkNvx+YbClnYT6pE4oYGlxgXXO2P6KTvU8f38aLV5s/6
         l1AWXIfAM9cRjYyBKd08bwVE+RJ8f0bIUblhYVxA+5um4fNq0+/G5J4rDKb2mWNi4lO5
         6bZYmFBEWWMSj+Rfs8nb+uJg1dmjqKEGguEJXMtmcMkizFRL8hfVADMyNKqi0HP3r5Ua
         p9IN0e1RzqEHiGTwnCV8oLv6ght6nxIyJVFJVd/zqKB1yWm2nKz0eSXxg6WHG03rso4D
         xrifbONIU8Gpi3fBrYxefWQBTOf7ek8oUJe/eu8d7CLrt164F8TNWF5Ts9IoluRyiC3k
         A9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BjXW6fm0PtmxnDuZ5f1C1GLdB8wT64MP92DyErb42Vo=;
        b=WxvJm7E9c+PxpKVTcn65nnwAKlr/rL6SBae0rPTKl3B8UyYnknjaVHrYoRSRbxalpS
         dkjrxLk+JoBURrMeZY5YuGLwnakadeGcERtwwSeuEC0L121wiM4UCvEo2jIHDEVd+9GQ
         s8ZoBz7xNK/lpV+fZ/pOlTSlQLza7j8/cfUzHWHURzVhaQ0/xYXaXl/cyWg4m213wJVR
         dhHyMu7Q7uQ/jQauzmgwleOC2FWBEYauV53XSdmkBEylPZjQYZvP8L6h7cs5+DzmQIgQ
         Bddcqpk/NFUrlAWonFqAWRQdmXaANZR1wtH6DE2UvjXwTO8LTn2ErubPkk0Xe2CsgCnd
         Yq2w==
X-Gm-Message-State: AOAM532eVLzVvsXvU1KIoyUYGKz5WIl54wzJDFqGwJwfNpKFQEPncmH6
        K/TJv8No316QN9WASDg4Vd4=
X-Google-Smtp-Source: ABdhPJwuOzBuc5WJldmDKmbfbe1VnbwGzgQLXHq0uGorbibjyTvXAGz+Zpu6//9ZBigPVJAy6CuSVw==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr98081wrs.272.1638984662762;
        Wed, 08 Dec 2021 09:31:02 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id a198sm6557389wme.1.2021.12.08.09.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:31:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: tegra: Enable gpio-keys on Jetson AGX Orin Developer Kit
Date:   Wed,  8 Dec 2021 18:30:47 +0100
Message-Id: <20211208173047.558108-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211208173047.558108-1-thierry.reding@gmail.com>
References: <20211208173047.558108-1-thierry.reding@gmail.com>
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
index f715671f0333..f8061b452046 100644
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
2.34.1

