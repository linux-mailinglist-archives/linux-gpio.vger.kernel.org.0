Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E74148B851
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346533AbiAKUSa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:18:30 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38194
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344637AbiAKUST (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:19 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8CFF140044
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932298;
        bh=qfYilsFRDVZLJ+BbKtg6m7PgGSNQvBvx1O93UtvvKSg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=L0HUWcXtEX0ukGVNR0ccNhCcLKptxpRkyecLDzBROuukKVP2y1VE1EjPyZGW6WI/L
         7r0Zt4sa/6jP5MusyZo1rW3mOyfrr36zqfXJcYxQhFNGZKTZfQwV9aqfukSsGQXeDj
         eLb0UDfNZMs71UJwXSoqIsSvQqa7vw6zqYlmNXIH+RV9l/viNNGJYYElsSbOhafmYx
         lbHXdg+Dd1dXmV3VrK+rS0kMWoymSjVCMsTKvZMYti2MiWNgHkvhsFRADdJv0Gmd3X
         oZA+jIj6JlqYH2BGaFTc4Grk6qSBKMf3P8ASjQrhiElNoYb3lqv9UAHXOfb0c/efhQ
         DKFD18E5MXSew==
Received: by mail-ed1-f70.google.com with SMTP id s7-20020a056402520700b003f841380832so209052edd.5
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qfYilsFRDVZLJ+BbKtg6m7PgGSNQvBvx1O93UtvvKSg=;
        b=cOIGSN0HgT3yTDF8hECdJW5DjDI+KRPfrJHfcEKdxVDTImnH+BSMZ7eYHf+vdu7XkL
         a+ksE+DvA/4Eq5VWPatEIB2eFeJvN7qdJkzIygxAz79B6kSmNU6cv2orjhfDHJGboltX
         R381OJEB8VRyOvArjixJ4FjX1emN2lL0QvHORNAjUEEG/7n51JH9kLm8BE59Hb2bJulT
         1TL5ALP0ilM+ug7WWiAZZYdXNb06yLsGReZQInFX0bi9INg8a0psYsq1LT6WlPnfL27b
         9AMisLJ/o6Mk0/Kaun8jFN/FpCKuU73V5h84D1UnwNTax79c0bnjwlO/Y88Haq12y1eM
         vBTQ==
X-Gm-Message-State: AOAM5314CSEOBDi9GN4vAVpQRjx9ZAYVJUGgWUKeFI4dxMA1Bh48yT04
        37oVWTYzhc0Ckuq9UwKpCRSKug0fJJw/Ell3oqDmRHriIZZ8MtpI0Xvq7BPOkxfoF/DdnCJQVwz
        F8Ir4OEASWSjudc8bqDJirfCiw4ITqOdcM7rquWs=
X-Received: by 2002:a05:6402:7d0:: with SMTP id u16mr5821293edy.367.1641932298242;
        Tue, 11 Jan 2022 12:18:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzg5koFjhI9MsPoxsO7ulSUXZUs4wFKjp0TGusoYrl4j+1hRugCavSi2yYKwgoqzZkVrlAF1Q==
X-Received: by 2002:a05:6402:7d0:: with SMTP id u16mr5821285edy.367.1641932298101;
        Tue, 11 Jan 2022 12:18:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 19/28] arm64: dts: exynos: align pinctrl with dtschema in Exynos850
Date:   Tue, 11 Jan 2022 21:17:13 +0100
Message-Id: <20220111201722.327219-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Align the pin controller related nodes with dtschema.  No functional
change expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 52 +++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
index f576b29c9b16..a71acf358d2d 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
@@ -13,7 +13,7 @@
 #include <dt-bindings/pinctrl/samsung.h>
 
 &pinctrl_alive {
-	gpa0: gpa0 {
+	gpa0: gpa0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -30,7 +30,7 @@ gpa0: gpa0 {
 			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa1: gpa1 {
+	gpa1: gpa1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -47,7 +47,7 @@ gpa1: gpa1 {
 			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa2: gpa2 {
+	gpa2: gpa2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -64,7 +64,7 @@ gpa2: gpa2 {
 			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa3: gpa3 {
+	gpa3: gpa3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -81,7 +81,7 @@ gpa3: gpa3 {
 			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa4: gpa4 {
+	gpa4: gpa4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -94,7 +94,7 @@ gpa4: gpa4 {
 			     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpq0: gpq0 {
+	gpq0: gpq0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -134,7 +134,7 @@ uart1_pins: uart1-pins {
 };
 
 &pinctrl_cmgp {
-	gpm0: gpm0 {
+	gpm0: gpm0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -144,7 +144,7 @@ gpm0: gpm0 {
 		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm1: gpm1 {
+	gpm1: gpm1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -154,7 +154,7 @@ gpm1: gpm1 {
 		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm2: gpm2 {
+	gpm2: gpm2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -164,7 +164,7 @@ gpm2: gpm2 {
 		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm3: gpm3 {
+	gpm3: gpm3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -174,7 +174,7 @@ gpm3: gpm3 {
 		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm4: gpm4 {
+	gpm4: gpm4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -184,7 +184,7 @@ gpm4: gpm4 {
 		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm5: gpm5 {
+	gpm5: gpm5-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -256,7 +256,7 @@ spi2_pins: spi2-pins {
 };
 
 &pinctrl_aud {
-	gpb0: gpb0 {
+	gpb0: gpb0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -264,7 +264,7 @@ gpb0: gpb0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpb1: gpb1 {
+	gpb1: gpb1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -322,7 +322,7 @@ aud_fm_idle_pins: aud-fm-idle-pins {
 };
 
 &pinctrl_hsi {
-	gpf2: gpf2 {
+	gpf2: gpf2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -367,7 +367,7 @@ sd2_pdn_pins: sd2-pdn-pins {
 };
 
 &pinctrl_core {
-	gpf0: gpf0 {
+	gpf0: gpf0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -375,7 +375,7 @@ gpf0: gpf0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpf1: gpf1 {
+	gpf1: gpf1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -434,7 +434,7 @@ sd0_bus8_pins: sd0-bus8-pins {
 };
 
 &pinctrl_peri {
-	gpc0: gpc0 {
+	gpc0: gpc0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -442,7 +442,7 @@ gpc0: gpc0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpc1: gpc1 {
+	gpc1: gpc1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -450,7 +450,7 @@ gpc1: gpc1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg0: gpg0 {
+	gpg0: gpg0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -458,7 +458,7 @@ gpg0: gpg0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg1: gpg1 {
+	gpg1: gpg1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -466,7 +466,7 @@ gpg1: gpg1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg2: gpg2 {
+	gpg2: gpg2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -474,7 +474,7 @@ gpg2: gpg2 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg3: gpg3 {
+	gpg3: gpg3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -482,14 +482,14 @@ gpg3: gpg3 {
 		#interrupt-cells = <2>;
 	};
 
-	gpp0: gpp0 {
+	gpp0: gpp0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
-	gpp1: gpp1 {
+	gpp1: gpp1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -497,7 +497,7 @@ gpp1: gpp1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpp2: gpp2 {
+	gpp2: gpp2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-- 
2.32.0

