Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FAF48B873
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350747AbiAKUTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:19:09 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38546
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346587AbiAKUSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:35 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1D9E14001D
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932314;
        bh=XwytGlpNwAoffYK7XTO0vqmQRh/r4dCBFpHoBh3s1F0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=DcYFEOjuEXNKf16XaFaixFi0MwNqz5Pd2SaTc+DQN31QVseYAhvL/tul8+x3BsCC5
         x+BkoOknyXq87E/tp1ibqbvAEXKQ32X7dvQbX8n/A+z78qPHYOBWEJCvmP0dNjBAQe
         FmrPAeLa8+LRrrjX5g0bnf4z+boF9suHGi5ROX4zG1MscSXZGwTb/UqNR/vT69fVht
         h1hvLpV7cd/9ADhnT0CPCxC8ucYs1bXwg4BiUB0vHTuAm8E0nVc1DViSInnDckVMJi
         mHkOlypKfOGlYHamUwSSGDX+jJ7681teQ1GdPnMcBXCJ1i8GAeHu6oiDdgmybmvPTe
         nT7w/uuD3XBuw==
Received: by mail-ed1-f72.google.com with SMTP id g2-20020a056402424200b003f8ee03207eso204386edb.7
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XwytGlpNwAoffYK7XTO0vqmQRh/r4dCBFpHoBh3s1F0=;
        b=8D5pvzH5Bav1OjM/EEp3rragcpDST8H3RoIZdXx6cqlyfrMWLszRDszjUXiGF+/k3+
         UeDDArn4kKrjcFCMx7PvfymT6dBE5wMwZv6VXGPDcL/yO0H/KMjRGJUAUhGVBvs3ZnOX
         7vrVqF+7BQyySETtu7P/cnWg2zM+anZi7jWXiMi0ojWz1dJCtQnKnrF3BrRcGfZIDHSG
         b1PbgyilWrew+v0NFcSQg6GbnpyQiDJve1k8xTVsHxvMXvx8STHtoFPPu1bNIGE60yr8
         y85kHXTC9drUfW+N5qbO3WPhW7ODqLwmpG1qFtRT1z0z8cBz0+VDm4ClL2lIx+8BwacX
         EY9Q==
X-Gm-Message-State: AOAM532T60iNzsQTzII3MMh84r9FNR3aWk22DWbs2uvUNoj6yGdJFe/h
        5pn+rHcg4Xj/5HxNTiVv9UCWNOofOQoSRS9rXNkBzDl4AUzGvw67XoJUcFnXckU605S8Q38ixLO
        ovEeGuJFgB/noGcKzW+7RqqRwj57u9/18sCQ8Cgk=
X-Received: by 2002:a50:d710:: with SMTP id t16mr5950663edi.50.1641932309591;
        Tue, 11 Jan 2022 12:18:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQMEe2rdc+p0osbS3bSYRErMsf6bgYHS+lbWQrndlXIAAbjx5a0Ndcs/anYHU7KQMKJQOuDg==
X-Received: by 2002:a50:d710:: with SMTP id t16mr5950638edi.50.1641932309393;
        Tue, 11 Jan 2022 12:18:29 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:28 -0800 (PST)
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
Subject: [PATCH v2 26/28] pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups
Date:   Tue, 11 Jan 2022 21:17:20 +0100
Message-Id: <20220111201722.327219-20-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It seems that newer ARMv8 Exynos SoC like Exynos850 and
ExynosAutov9 have differences of their pin controller node capable of
external wake-up interrupts:
1. No multiplexed external wake-up interrupt, only direct,
2. More than one pin controller capable of external wake-up interrupts.

Add support for dedicated Exynos850 and ExynosAutov9 compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 0489c899b401..a158d587814e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -465,6 +465,10 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
 			.data = &exynos4210_wkup_irq_chip },
 	{ .compatible = "samsung,exynos7-wakeup-eint",
 			.data = &exynos7_wkup_irq_chip },
+	{ .compatible = "samsung,exynos850-wakeup-eint",
+			.data = &exynos7_wkup_irq_chip },
+	{ .compatible = "samsung,exynosautov9-wakeup-eint",
+			.data = &exynos7_wkup_irq_chip },
 	{ }
 };
 
-- 
2.32.0

