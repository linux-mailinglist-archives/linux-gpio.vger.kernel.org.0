Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 517551171F1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 17:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfLIQjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 11:39:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:38644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfLIQjx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 11:39:53 -0500
Received: from localhost.localdomain (unknown [194.230.155.234])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D54AB2073D;
        Mon,  9 Dec 2019 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575909592;
        bh=w9Sb/6dMUCxgREqcD9P7iVvBO/1GQPO5B5saW6CSudQ=;
        h=From:To:Subject:Date:From;
        b=NKxKUezgv1sFsiYSyLQjY3QWOVYz488cmYuzAKiODsQBA+c+JK+i57r1sNqjj4h18
         rl/GlFZJFCv0GP7uL0mXvlM5Xu1PYFBofTgplAfk/GKhRC0VE7x9LSi/o0l2/cI2DI
         lGQcUxYGGcEALq/j3LeQwJLpzOUYZN/P9chYc0PM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: samsung: Enable compile test for build coverage
Date:   Mon,  9 Dec 2019 17:39:36 +0100
Message-Id: <20191209163937.8156-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Samsung pinctrl drivers require only GPIOLIB and OF for building.
The should be buildable on all architectures so enable COMPILE_TEST.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
index 425fadd6c346..cbf1ce48fddb 100644
--- a/drivers/pinctrl/samsung/Kconfig
+++ b/drivers/pinctrl/samsung/Kconfig
@@ -9,7 +9,8 @@ config PINCTRL_SAMSUNG
 
 config PINCTRL_EXYNOS
 	bool "Pinctrl driver data for Samsung EXYNOS SoCs"
-	depends on OF && GPIOLIB && (ARCH_EXYNOS || ARCH_S5PV210)
+	depends on OF && GPIOLIB
+	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
 	select PINCTRL_SAMSUNG
 	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
 	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
@@ -24,10 +25,11 @@ config PINCTRL_EXYNOS_ARM64
 
 config PINCTRL_S3C24XX
 	bool "Samsung S3C24XX SoC pinctrl driver"
-	depends on ARCH_S3C24XX && OF
+	depends on OF
+	depends on ARCH_S3C24XX || COMPILE_TEST
 	select PINCTRL_SAMSUNG
 
 config PINCTRL_S3C64XX
 	bool "Samsung S3C64XX SoC pinctrl driver"
-	depends on ARCH_S3C64XX
+	depends on ARCH_S3C64XX || COMPILE_TEST
 	select PINCTRL_SAMSUNG
-- 
2.17.1

