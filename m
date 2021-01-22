Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A61300C63
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 20:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbhAVTV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 14:21:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729793AbhAVTAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 14:00:18 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA88EC06178B;
        Fri, 22 Jan 2021 10:59:34 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id p21so3883147lfu.11;
        Fri, 22 Jan 2021 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u3CYZFWIIVoc+sab3Op1z3bOzUb/PUEECmie3K9ZzSk=;
        b=RLUGT7Zoibn2u8raSnozG0BSCz4i9QFJnaA0PyOGDRMsjoJ840FPl0P/B1eIoipYSN
         LNdZlImvpkWogUxUkevteMzPuLiIQfbXNYyjpU69hVAyCwoX2QZ0kwsb3HctJj02HjwF
         i3G/HKtBuO+w8iVfFrV1zh4XFLpu4zfq89lGJLe9cRkX8sE6o8KmRYGNI387UKZelF6Q
         B3+ZzWy1eqtborSUZ1jMCXDyoMZ4KiSJIzw+KhN+Cdr5UnJDTAICt9OijGkpeJVnPOtt
         MqeSwAPCR7YKQwHyKIs8XEwgNSg/HyI8rfPN/ANnzdEfMKVFmhM7hScuPVMMjJRFiDHy
         PTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3CYZFWIIVoc+sab3Op1z3bOzUb/PUEECmie3K9ZzSk=;
        b=gbJLNrEn4RaZaTJdoNrvtDKmb2xb8LZOMflHHzh8dl6+ydLeFcjOtS2dv+SqrB4e/7
         n9qdT0qVwwcTM0jtSczwJaBW6Aj/ffe7GVKxPQ/QC/yXyUKHNn9YKGrpjDxPDWUCl9BN
         f8M9Ofk6waIZqvP7gOxO173ebNqBblcEeme4g7Nm96ri63C8OnPsV3RUE/Jlk2akUSuy
         bY75lZgdoVxcQgrV9mTV0Gl6e7NMD1SiTv2SkU6YbAtFExrhK5J2Te67F3CELGtbxmCo
         DWBj9g6XC7epKryCGtxvsexfDEM5ZOLmX0ThDeOF3sdcjSgqL+malRYRBUBJj2dQR+Ek
         vP6g==
X-Gm-Message-State: AOAM530TfKFfQHx1W67Zub1Mo1LGAVg3dSgmUwCYRsr+vhVyHTpWbMZU
        QtpNK4eHhv3cMnrvL2S+BvY=
X-Google-Smtp-Source: ABdhPJxFkNKy4yi2Qt1rvPsw2hHJWSugx22z28bje4WJTmCrNS1KO3DqRl7easuwx0Z3p+NpkgyhOw==
X-Received: by 2002:a05:6512:a90:: with SMTP id m16mr365856lfu.577.1611341972757;
        Fri, 22 Jan 2021 10:59:32 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 19sm994783lft.90.2021.01.22.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 10:59:32 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] gpio: tegra: Clean up whitespaces in tegra_gpio_driver
Date:   Fri, 22 Jan 2021 21:55:42 +0300
Message-Id: <20210122185543.16554-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122185543.16554-1-digetx@gmail.com>
References: <20210122185543.16554-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Clean up inconsistent whitespaces and tabs in the definition of
tegra_gpio_driver to make code look better a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 06f033375e40..1efd6fb642c7 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -800,12 +800,12 @@ static const struct of_device_id tegra_gpio_of_match[] = {
 };
 
 static struct platform_driver tegra_gpio_driver = {
-	.driver		= {
-		.name	= "tegra-gpio",
-		.pm	= &tegra_gpio_pm_ops,
+	.driver = {
+		.name = "tegra-gpio",
+		.pm = &tegra_gpio_pm_ops,
 		.of_match_table = tegra_gpio_of_match,
 	},
-	.probe		= tegra_gpio_probe,
+	.probe = tegra_gpio_probe,
 };
 
 static int __init tegra_gpio_init(void)
-- 
2.29.2

