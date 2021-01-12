Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966B42F31C3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 14:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbhALNbD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 08:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbhALNbC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2021 08:31:02 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B6BC061786;
        Tue, 12 Jan 2021 05:30:22 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f11so2821296ljm.8;
        Tue, 12 Jan 2021 05:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WkBi8cOfZJevANkTdRqj8Ub33blmw4LwonV+ywbCBD4=;
        b=VPUjr2+c+aN/sO0xt17qQm/yoYDf4HILMa/C6SU7PP04xVsUTwlnBuyUzA/dRY0knq
         X7z4igyL3kW+TdjFWUbRqziOR1T+TpoAKPp4SAhKXJFfGFUqGv9+L/ZN6/zm9szGW+XH
         KoQayPNLvEfU0hMykKnvgE0su6/VChiC9zFNlD2v5KOW7vKA+ORjkNNeYAJ/vEtM3O+P
         w8L91gGTBYnQvpL4GYVC8PgqzL1lOklOyJyPi7/gmc8dg1BlYu3mCFgxcKkR6Pzv7VeP
         ET9xWTexpp3k22gghMeQZXQ05b6/4ssBBoYQxPJP8Ckhxx3MWkrDFOV211W0jVombvYv
         yWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WkBi8cOfZJevANkTdRqj8Ub33blmw4LwonV+ywbCBD4=;
        b=mfWTT0cxh/90TGfpE8RMjr6eQT5wEl1m0V4ODOIBu9jDPN0EtTNb1xpczmCoR62aD5
         Pa5Jd/rSGH4Wlnjp8xNQacfBoJJWkH5fFart++FoxzSrCLQZI2xH1mTP6xKeYhsz2ryR
         U63QWlsqbDyXaGrhxISFTXmE7JePWsb2+dnHoXpPh9mwnl+02NUW3ewk1ksvwE5IRYsm
         NT5p+K/j4xJxE2atm8uGQf3U8FAaREWgvRHzDqTBrHlIgyYLUievUcFt7CXXFetYzIE6
         Z5IXeTicdaIKe+uBnloYoxXVnQ+bqrpq1Y85le0n/jq9QAzovxwpe/FXhyvlItmKUv0T
         UBEw==
X-Gm-Message-State: AOAM532ke7IYQ2iTnjUk90+2+T7s5QAGcFRAt2gu0CS7j7pcAzqAToGR
        KpeSMG3isPxLRcSLrjXaHpU=
X-Google-Smtp-Source: ABdhPJwOTt8krhzfLzRMUPS6kcJGfq1RYandMhb74Bc5pqMIZzs5jbU504/XB06qBd8TD54m+TMn1A==
X-Received: by 2002:a2e:a364:: with SMTP id i4mr2055546ljn.426.1610458220149;
        Tue, 12 Jan 2021 05:30:20 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u30sm394042lfc.238.2021.01.12.05.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:30:19 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] gpio: tegra: Add dependency on GPIOLIB_IRQCHIP
Date:   Tue, 12 Jan 2021 16:30:10 +0300
Message-Id: <20210112133010.21397-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112133010.21397-1-digetx@gmail.com>
References: <20210112133010.21397-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add dependency on GPIOLIB_IRQCHIP in order to fix driver compilation.

Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
Reported-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 75f6c37620ea..0cd1f91e4a19 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -597,6 +597,7 @@ config GPIO_TEGRA
 	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support GPIO pins on NVIDIA Tegra SoCs.
 
-- 
2.29.2

