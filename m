Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C31470525
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 17:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238165AbhLJQGC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 11:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238225AbhLJQGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 11:06:02 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF419C061746;
        Fri, 10 Dec 2021 08:02:26 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v11so15655395wrw.10;
        Fri, 10 Dec 2021 08:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BjXW6fm0PtmxnDuZ5f1C1GLdB8wT64MP92DyErb42Vo=;
        b=AHPTEPEkmkZBW/y95HtVx67utNlKCNQCCPEUZCPZIUcAJ82n5XUTzyGyBjzwmYr3QQ
         sUhZOtD6fDyEkTGeFAV8SPSDgT4ySzhiaEsEmoWUYkLhJFd4NCkYm5Re3HDrKDxYPetZ
         NMlDdZsdm6mCDZi+zsefMQRbNa9r1JVd9F2jxJc8K4hJmItHAKteefYfwpuIzEKPT90g
         +tMyi41dNSxpFKlm639o1JJmJ0F7UFy+jrFnk1+G1w73Arzyc2bfahRyg74C/vIGulSP
         teIkhAftKUUszZ3k0mROLjCh+qr+7QtRMkUg1u1OhlFB/2ArDEUHHoj1ISnkLABHIc3f
         9opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BjXW6fm0PtmxnDuZ5f1C1GLdB8wT64MP92DyErb42Vo=;
        b=EuMeCRfxaiVquoomUvUB5efI5W6qPcLf5okuHoaBSiUMFvYO3JrO1YQzcinLDFtdsZ
         Q1v/bJMtJSUjXF6h38bcLcmteJ6Kj5Dr7laaU+/QalXnmY4fWJdvR6T9FbnP1NbooCSf
         7U8bd6KFv9q/qX20zS7d8HokvwlB6DyjcADpMNmnzIsgSymOoDFWeKuudlxMxJdm5u+C
         cwoyx9mYG+YcWh+hzYD3HcY0kiVbaZp6PD8XuZbc9cWdHtqbtY6FOGvTe2kZnZqEtHQM
         xuB1caomVSlphBgLXs1LQP9SXbKClVUTmu9+AxtO8eSXiQFGOK/1bvumscpm0e92pVTt
         FQJA==
X-Gm-Message-State: AOAM531BiM6jkxOmrTyi1b7NtyEc2xlsUGHhU0z2zJGnPEDbQoL/QVe9
        MKtkwpY6UJYn/gtjU4iz/w8=
X-Google-Smtp-Source: ABdhPJx7s5fHaG4DshNEy4UGX63HmLh4wX5XY4VXIO2k6ftnMSJq6QFDpn6k4ktnPk7ZDmb+3Ziayw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr14598425wrm.412.1639152144848;
        Fri, 10 Dec 2021 08:02:24 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id k13sm2871809wri.6.2021.12.10.08.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:02:23 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: tegra: Enable gpio-keys on Jetson AGX Orin Developer Kit
Date:   Fri, 10 Dec 2021 17:02:06 +0100
Message-Id: <20211210160206.872998-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210160206.872998-1-thierry.reding@gmail.com>
References: <20211210160206.872998-1-thierry.reding@gmail.com>
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

