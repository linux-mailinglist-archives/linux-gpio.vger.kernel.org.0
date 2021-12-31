Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26344824D6
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Dec 2021 17:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhLaQU0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Dec 2021 11:20:26 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46660
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231297AbhLaQUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 Dec 2021 11:20:24 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E3B283F044
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967622;
        bh=zzMyOeYd4lATlu6SXmtUhZks+PFFAFcrD95at+LMCx4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=cXpzWsr6gZiSKovFVYwJ7osumqpGk79btXthAXWrnp9NqxtGjhv4AcP9PNff2dF6J
         hrosteNAa8yV+oBSrV4WNVufge0BlFiSqC9z9Jf84RQvj7c5WqVePoBqEiq6rE2FA2
         Av1XVsVVyr8HoIAjXGB7azEgRmysG8iAOSxuarETTOnKrjky8JJNYTL/MVh16HOvBT
         F22kviWPTx8RmkUrhxzulOs4E9aq8av5VM1NGb8sJLFY/9pLve1irlyfbkJklWeAUy
         upsfXlHkCVuR8vDCUZX+1vhHc6fRG9ZOHJ7SZamZHmG9pA83hvP5xhguEZWy2y573K
         i7YQ/mVelQJ4g==
Received: by mail-lj1-f200.google.com with SMTP id p2-20020a2e9a82000000b0022e01240c1bso3112118lji.20
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 08:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzMyOeYd4lATlu6SXmtUhZks+PFFAFcrD95at+LMCx4=;
        b=TaRFTgjRkMS5Z8/HzZycYa8UcCM/a5pABUJeveNCGBnWySHN4UpfPCeiBJdyvI9n+y
         ztNcI7WclEUbtwZ4awUJ/cXrQ3JEraQc6rPqPXzBVajEFcefX+8hffIWMcFos7juVQTs
         ylijII5jyRncTWzb8uainNr3MByElxbT3/YOnehSyBCdeW4bHlFflkKJhgU+K9eiUB2j
         HR3h8NKrlV9avU7YDQBGjy00jC1vbQ0S4Nnv6UyB+zCzBZrbwxylo+h5DJ3YhilJJ2TE
         +W0joejogV192mCM9720CFoocEtzty0V/yAOyZ9n4nGM+EtiXUjgH0TE7kaHgDqgNU4w
         bquw==
X-Gm-Message-State: AOAM530CjmkeT3krerug/pdld1P/L5wVrlzEpBrH9NOUW8B05tTUQmT8
        OQnvXGf31Xq7ty8haw3ndBQC9GS9heifK58gJrQogo97Drc7g5TnRBqtrWbFQcMWFaEYGnenIWM
        pmSOv/nlgjjwJy6Y0Nmfc4XGkRSbMBCBOaCy5yVs=
X-Received: by 2002:a05:651c:160a:: with SMTP id f10mr7148766ljq.212.1640967621418;
        Fri, 31 Dec 2021 08:20:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC2D5vkNTcMFTSCOPSDggWUC6MqsDk41XLjuzA/XDwAuE2biajEVb5529Uv3BnT9+pNaMXqw==
X-Received: by 2002:a05:651c:160a:: with SMTP id f10mr7148760ljq.212.1640967621254;
        Fri, 31 Dec 2021 08:20:21 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bx10sm2817607ljb.3.2021.12.31.08.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:20:20 -0800 (PST)
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
Subject: [PATCH 06/24] ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pit
Date:   Fri, 31 Dec 2021 17:19:12 +0100
Message-Id: <20211231161930.256733-7-krzysztof.kozlowski@canonical.com>
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
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 1ae5528e9ebf..e8819659081a 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -212,7 +212,7 @@ max77802: pmic@9 {
 		interrupts = <1 IRQ_TYPE_NONE>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max77802_irq>, <&pmic_selb>,
-			    <&pmic_dvs_1>, <&pmic_dvs_2>, <&pmic_dvs_3>;
+			    <&pmic_dvs_1>, <&pmic_dvs_2>;
 		wakeup-source;
 		reg = <0x9>;
 		#clock-cells = <1>;
@@ -892,14 +892,7 @@ &sd1_cmd {
 
 &pinctrl_2 {
 	pmic_dvs_2: pmic-dvs-2 {
-		samsung,pins = "gpj4-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-	};
-
-	pmic_dvs_3: pmic-dvs-3 {
-		samsung,pins = "gpj4-3";
+		samsung,pins = "gpj4-2", "gpj4-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-- 
2.32.0

