Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC0011DE9A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 08:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfLMHYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 02:24:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:55660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbfLMHYk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Dec 2019 02:24:40 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C43E22527;
        Fri, 13 Dec 2019 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576221879;
        bh=UJOcuiK3ixX2rYyqQ3xVgxA+rehXX7Onup49ad9LIxM=;
        h=From:To:Cc:Subject:Date:From;
        b=xt9g7vzEgw+yoGRY2BQ+YyBfP3QnfE+sVGdJkgEOYOyG43Im4y5mFssgaG7yc4/35
         iHDZmCilf893Kyhe3EtfpV9GXYFS2A1Su65udSt6SnbT2C6tjb2Utt1HePM5CiYpOi
         jJu8s7vvzIrqSLWrRil25sDnu+xH7F7UQ9sdjEJc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Chen Zhou <chenzhou10@huawei.com>
Subject: [PATCH] pinctrl: samsung: Fix missing OF and GPIOLIB dependency on S3C24xx and S3C64xx
Date:   Fri, 13 Dec 2019 08:24:33 +0100
Message-Id: <1576221873-28738-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All Samsung pinctrl drivers select common part - PINCTRL_SAMSUNG which uses
both OF and GPIOLIB inside.  However only Exynos drivers depend on these,
therefore after enabling COMPILE_TEST, on x86_64 build of S3C64xx driver
failed:

    drivers/pinctrl/samsung/pinctrl-samsung.c: In function ‘samsung_gpiolib_register’:
    drivers/pinctrl/samsung/pinctrl-samsung.c:969:5: error: ‘struct gpio_chip’ has no member named ‘of_node’
       gc->of_node = bank->of_node;
         ^

Rework the dependencies so all Samsung drivers and common
PINCTRL_SAMSUNG part depend on OF_GPIO (which is default yes if GPIOLIB
and OF are enabled).

Reported-by: Chen Zhou <chenzhou10@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
index 779c0e9eca3f..dfd805e76862 100644
--- a/drivers/pinctrl/samsung/Kconfig
+++ b/drivers/pinctrl/samsung/Kconfig
@@ -4,12 +4,13 @@
 #
 config PINCTRL_SAMSUNG
 	bool
+	depends on OF_GPIO
 	select PINMUX
 	select PINCONF
 
 config PINCTRL_EXYNOS
 	bool "Pinctrl common driver part for Samsung Exynos SoCs"
-	depends on OF && GPIOLIB
+	depends on OF_GPIO
 	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
 	select PINCTRL_SAMSUNG
 	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
@@ -25,11 +26,12 @@ config PINCTRL_EXYNOS_ARM64
 
 config PINCTRL_S3C24XX
 	bool "Samsung S3C24XX SoC pinctrl driver"
-	depends on OF
+	depends on OF_GPIO
 	depends on ARCH_S3C24XX || COMPILE_TEST
 	select PINCTRL_SAMSUNG
 
 config PINCTRL_S3C64XX
 	bool "Samsung S3C64XX SoC pinctrl driver"
+	depends on OF_GPIO
 	depends on ARCH_S3C64XX || COMPILE_TEST
 	select PINCTRL_SAMSUNG
-- 
2.7.4

