Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29AF48B86C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346504AbiAKUTH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:19:07 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60476
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242670AbiAKUSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:34 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9717B40AA0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932312;
        bh=JHHUBFr6OMR8zM8/i6cAvf5NoFmGRGJHrNiT4tfy3rM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GnqFbPrNgaw1VMLR1yRa7ozMMz0YvR87CSUd0jJsr9Zt8o8z4DCxCA0x3fgAZG7I4
         Rtm5LdA5TXmKvXS8E+Ww/0nicp3e/AUeb7bfcNqfF9oeG+gW60eDU9Zi+Qs8lVYfol
         qrW/w+s/vRQsolN20xrDC0VZwPOmtZzHeY5GxEHGrwT4MTX8M3ESTGAENjeC3JrlOS
         7d/jafLZq4y0+wT7HOGg8UQakADwLFVUbKjsvUIb5kaSr7faeiXW3B5fWaq94uy6bS
         F2HZgHIakqezi5pwYIxO2a2tPqTPNAg20dP5NwN1gZ8j8WA1tJ99VNsPNmzDkmQZxG
         ibNLSKd6EyT9Q==
Received: by mail-ed1-f70.google.com with SMTP id b8-20020a056402350800b003f8f42a883dso171652edd.16
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHHUBFr6OMR8zM8/i6cAvf5NoFmGRGJHrNiT4tfy3rM=;
        b=o5m2CQR1cP5A9L/BTMgp0SRvZ0DNiLoAix6D0wcT1NQn69BLISHxUXalKbm/8tBfue
         jvGPj6K/38cy1glr9oqA8utenPKM0w6/bTJSFlsXzIgCR5gdKNZr/zf4VAkyCIdvHEb0
         q7fSOR4b70koxTzXLxuVPf7hk4uTwb+oxV/kPXYQJ/wrZNxUV1DexmQYMvHAGNQ1f13g
         5Bni/dKhU73tNStECHFmHzOQzLo9aUY/DochS+S3T+3ihWhPYH9lqRADMIw7HxFfsBoG
         ARx5tp6wCYlJZXxjGPk+svbTjZeQEAIm4KRLe3D6/YHmLL4QgmNGxMrDkdkN/RdsKXHz
         4MCA==
X-Gm-Message-State: AOAM533Fnm992dSXQzf1U/DGzPGHAdy8JyLs2f4HrCGxHDWRuvSaNemX
        zyKBzuDfB6BYBaz8btRh77hpJYUS1HladgNY6OoK2KR+mZYeMaPw/U6Yl5Tz9vQzBMWCeGhVIdU
        stmJ3EDnzfqlvmAe4PGJHYzFXHqN/j3T9hza1M4o=
X-Received: by 2002:a17:907:9712:: with SMTP id jg18mr5265432ejc.328.1641932310995;
        Tue, 11 Jan 2022 12:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy9/rcIjTsKZFScympQBOQBEOBe9i4BBbC40lJsXnfYnnYR9RgCbIQ5WcOvNKS259ya4jL8g==
X-Received: by 2002:a17:907:9712:: with SMTP id jg18mr5265420ejc.328.1641932310844;
        Tue, 11 Jan 2022 12:18:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:30 -0800 (PST)
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
Subject: [PATCH v2 27/28] arm64: dts: exynos: use dedicated wake-up pinctrl compatible in Exynos850
Date:   Tue, 11 Jan 2022 21:17:21 +0100
Message-Id: <20220111201722.327219-21-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Older Samsung Exynos SoC pin controller nodes (Exynos3250, Exynos4,
Exynos5, Exynos5433) with external wake-up interrupts, expected to have
one interrupt for multiplexing these wake-up interrupts.  Also they
expected to have exactly one pin controller capable of external wake-up
interrupts.

It seems however that newer ARMv8 Exynos SoC like Exynos850 and
ExynosAutov9 have differences:
1. No multiplexed external wake-up interrupt, only direct,
2. More than one pin controller capable of external wake-up interrupts.

Use dedicated Exynos850 compatible for its external wake-up interrupts
controller to indicate the differences.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 4f0a40de5e67..bcae772e8d91 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -346,7 +346,7 @@ pinctrl_alive: pinctrl@11850000 {
 			reg = <0x11850000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint";
 			};
 		};
 
@@ -355,7 +355,7 @@ pinctrl_cmgp: pinctrl@11c30000 {
 			reg = <0x11c30000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint";
 			};
 		};
 
-- 
2.32.0

