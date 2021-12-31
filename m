Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C314824D4
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Dec 2021 17:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhLaQUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Dec 2021 11:20:24 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46608
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229687AbhLaQUV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 Dec 2021 11:20:21 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 453823FFD5
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967620;
        bh=Yb4exiilZ6fWGtkNHAgUE2yCKFhigxo195C0Xf7w5qk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QFhcYTi2clt15G/iITyr7g13HfYWkG25GhrWU3Llzk5qldAJHsIc3K8UQ1MOcFxVK
         GOd46EiF6nejT6dINeLUVIOp/knoyPhk7hSfYYHC2GSQIlKR3jDoJ6AS83LjoQ+gkV
         fPeQH0zVNKpE0Foj/Ea1cZtkujV7r9eKFjTU2AMK/9Mndfm7iB5d9t+yGElKOGAX3e
         ufKdrLMspyqKdhMWUEO3ZPRfVvj8GUgFsRN7YwS3bmzoeMMoP9AFWlDGe3wf2QRF7R
         sI/ar5grIcHjPefvAwpqbZfkRli1c4pZdh6dByyQBkDkduGxGvK6QBb1S40e7WCV5h
         nAup8qDc7ANyQ==
Received: by mail-lj1-f199.google.com with SMTP id k11-20020a05651c0a0b00b0022dc4d55f14so6494175ljq.22
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 08:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yb4exiilZ6fWGtkNHAgUE2yCKFhigxo195C0Xf7w5qk=;
        b=XqPrZJLo6k09gh79FRDVRxpL2Znw55SYO1Qm6h+AgC2yMGTXpJmDja8t5Dw79HuYYJ
         +TzXj6kjqB89c4jU+45BGiFYSpXFsSWBThvSyWxEuakJfvI5JUSGPOrHIJ8CHW98xZ8f
         txP/E/y/mDwFuHmzPUcM2YB29nnGSyoCZ+gYA+8LOEA6+3vYEq8S9ecggHL3jUH1s806
         x6dtRbdVBxzR3JU+aKRQ3b/hoP4G554ns4HPIRoAB9DB02klvmZb4Fvg/y+QqhYiwCA7
         WM9+DF2DNRKD3v6MjaWAWazvnSbT8pqUaQfZBt/7w0O2huBlqu4p+fQ0CaYvfgFUiD9b
         LVrA==
X-Gm-Message-State: AOAM531r0NbLgk1xduXyBHVY1wRBtE9e50S3g2pCulSv2At28lVx8AWc
        JNUqr4h0lNGBKfvKDiFRm8A/ESHuTr9pkS3a2tZypVGx+ZFnMtdIPesUF8dwoN/yK7G1CFtn4tD
        ZU5lXK1MZpliVRIOoYKXrq/3/tQZ5t7FffLta4L0=
X-Received: by 2002:a19:501a:: with SMTP id e26mr9203894lfb.15.1640967618989;
        Fri, 31 Dec 2021 08:20:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNK4ScMYqUV+4nUybzcAVSBTksErcc62T2piTtEwBST7YOjkfvU2IG+Tb5jsClafIDsjA4mg==
X-Received: by 2002:a19:501a:: with SMTP id e26mr9203878lfb.15.1640967618848;
        Fri, 31 Dec 2021 08:20:18 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bx10sm2817607ljb.3.2021.12.31.08.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:20:18 -0800 (PST)
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
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 04/24] ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
Date:   Fri, 31 Dec 2021 17:19:10 +0100
Message-Id: <20211231161930.256733-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
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

