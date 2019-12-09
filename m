Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 050D51171F4
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 17:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfLIQkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 11:40:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:38756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfLIQkA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 11:40:00 -0500
Received: from localhost.localdomain (unknown [194.230.155.234])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3360E207FD;
        Mon,  9 Dec 2019 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575909600;
        bh=uv1fy3aSeIQ7rJzpy5V/DLW82MMG9uYITIIpJ5h5OTs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Nna6OCN+pK1kLg9sei8otb/FlJesosiNwrTYRa1BlxpiqW3VWnf5E8R25yHTNimQv
         +JIPxqXtk+Ojj5EtH7un+sj/OeEeYvXLWoTLYV/5X6nr0MqwSbd5N06s0Q6WrdohXP
         GCoiWOwaopKKqAit1lgrxtQ8AJJLymisBt7U1UBc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: samsung: Clarify the option titles/names
Date:   Mon,  9 Dec 2019 17:39:37 +0100
Message-Id: <20191209163937.8156-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209163937.8156-1-krzk@kernel.org>
References: <20191209163937.8156-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The config options toggle Samsung Exynos SoCs pinctrl drivers, not the
driver data.  Clarify this in the option title/name and also make it
consistent with other Samsung entries.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
index cbf1ce48fddb..779c0e9eca3f 100644
--- a/drivers/pinctrl/samsung/Kconfig
+++ b/drivers/pinctrl/samsung/Kconfig
@@ -8,7 +8,7 @@ config PINCTRL_SAMSUNG
 	select PINCONF
 
 config PINCTRL_EXYNOS
-	bool "Pinctrl driver data for Samsung EXYNOS SoCs"
+	bool "Pinctrl common driver part for Samsung Exynos SoCs"
 	depends on OF && GPIOLIB
 	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
 	select PINCTRL_SAMSUNG
@@ -16,11 +16,11 @@ config PINCTRL_EXYNOS
 	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
 
 config PINCTRL_EXYNOS_ARM
-	bool "ARMv7-specific pinctrl driver data for Exynos" if COMPILE_TEST
+	bool "ARMv7-specific pinctrl driver for Samsung Exynos SoCs" if COMPILE_TEST
 	depends on PINCTRL_EXYNOS
 
 config PINCTRL_EXYNOS_ARM64
-	bool "ARMv8-specific pinctrl driver data for Exynos" if COMPILE_TEST
+	bool "ARMv8-specific pinctrl driver for Samsung Exynos SoCs" if COMPILE_TEST
 	depends on PINCTRL_EXYNOS
 
 config PINCTRL_S3C24XX
-- 
2.17.1

