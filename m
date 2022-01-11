Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B4C48B80F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243070AbiAKUPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:15:24 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37756
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242547AbiAKUPX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:23 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 570FD40043
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932122;
        bh=Yb4exiilZ6fWGtkNHAgUE2yCKFhigxo195C0Xf7w5qk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=lA65r8lZygBC2ZZ17Ms2WsbS/E4mZsTi8eogQdJJzbalN27YSgH870bF/OStFruk5
         CuEUTvP43K+JCi0qG03fYijb39dbBgOx3Y4ritl9CESr44cp+GJK8wKQtCyDVZrXwi
         i6bZ9HCHWD/xxEBKayhRaWo8H1EvucRY/UJp4XHOV0NSS1GOLcpJwuLdd9GQDeh4e9
         PxXPmXtZa3OnSre1hpA3nyuyNpGfS2LOe+jul5yUf3L2CdaS+FIxIoDyRBPsbMQJrP
         Uej8ZLmfH2yJiuA3XA1zRXSZK9vZBAF0KCiwOF9/EKgGivFEntLWUjoAQdRjv4+PEZ
         w9pyJkuc4xfMg==
Received: by mail-ed1-f71.google.com with SMTP id m8-20020a056402510800b003f9d22c4d48so144475edd.21
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yb4exiilZ6fWGtkNHAgUE2yCKFhigxo195C0Xf7w5qk=;
        b=hr4toNCkHVHdIX00Uv3ZO06eNbxv5+4N2u2IxihgFAtv1ZbHW7R8719dymFUAiIvWw
         mHA1EuB9dTCIOPYOzlcu1IoATzH/KDO5qfy0JVKIY+GcyumaGZMlf/gNTL6oXmAHnkc1
         7wDTQ/YcTCsFK1Er8ANVZPQ6kq9vrHkCEb9zoLroQcf0YyhWJPu4uuUDSh3mkmstFxmo
         Tg4kFEPrWZB5+LgSceJM0ZZiQCB/yaU6AsDB05Ix9U49yferQ6TcpJXHTcYeDlyxleXy
         AMuUQoZAerHkOeOjfFuf3bPYR+rIugbjp05Bi8wTPCHskBNY47YnlnTk8NxPOw9+Q/z/
         gNLA==
X-Gm-Message-State: AOAM530PCindDq2Lx2JkGLN9HXTC2lTkbGh9v6idI7Wz6sr8zCHOfwVl
        11DrLr8I6QR/yEgjtVfuF6YXLvq8JVdAD9ZOyK+TSwpARtXtb+jtyzNkn9iRudlm2uyvrIWmzub
        2wNtwXgV1yRSSRvPHNNqNdEMyMMtUYmO/haJzxOc=
X-Received: by 2002:a05:6402:4249:: with SMTP id g9mr3571705edb.321.1641932121424;
        Tue, 11 Jan 2022 12:15:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKM89NfIORT3ha11SDkyVnHYgokbq+oykjhh4MT8WCGODxHOOwQN7VsX2r9dpD4YcqNBYMyw==
X-Received: by 2002:a05:6402:4249:: with SMTP id g9mr3571696edb.321.1641932121287;
        Tue, 11 Jan 2022 12:15:21 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:20 -0800 (PST)
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
Subject: [PATCH v2 04/28] ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
Date:   Tue, 11 Jan 2022 21:14:02 +0100
Message-Id: <20220111201426.326777-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pin configuration for PMIC DVS (pmic-dvs-2 and pmic-dvs-3) are
exactly the same, so merge them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 884fef55836c..9f2200dd5b43 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -188,8 +188,7 @@ max77802: pmic@9 {
 		interrupt-parent = <&gpx0>;
 		interrupts = <4 IRQ_TYPE_NONE>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&max77802_irq>, <&pmic_dvs_1>, <&pmic_dvs_2>,
-			    <&pmic_dvs_3>;
+		pinctrl-0 = <&max77802_irq>, <&pmic_dvs_1>, <&pmic_dvs_2>;
 		wakeup-source;
 		#clock-cells = <1>;
 
@@ -563,15 +562,8 @@ sd2_wp: sd2-wp {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
 	};
 
-	pmic_dvs_3: pmic-dvs-3 {
-		samsung,pins = "gpx0-0";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-	};
-
 	pmic_dvs_2: pmic-dvs-2 {
-		samsung,pins = "gpx0-1";
+		samsung,pins = "gpx0-0", "gpx0-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-- 
2.32.0

