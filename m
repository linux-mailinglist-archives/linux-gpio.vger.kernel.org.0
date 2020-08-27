Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D1D253DB9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 08:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgH0G2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 02:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgH0G2Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 02:28:16 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DDEF22B49;
        Thu, 27 Aug 2020 06:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598509695;
        bh=uTlyu4Ggbom6cpomUXJKQ1GKWCdyLuFd3Pick+7iBao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nO8NuCnVpOQBELP+v/O22dxuv09RFbjRFq/uuriGLAgYqTIEZrsSmItlVXgtxwd7v
         t1/0qQ87dP254Xh9i2+lbDYE5U0jXlgQi1fC7bWJznJbyPfh1rVCxOf+GAITgh+pxM
         kjhL+WjNZJro0xiZqk1xVGhmCcNfZ5xUO6W4RLRs=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, clang-built-linux@googlegroups.com
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 2/2] Input: gpio_keys - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 08:28:04 +0200
Message-Id: <20200827062804.16730-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827062804.16730-1-krzk@kernel.org>
References: <20200827062804.16730-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe() and devm_fwnode_gpiod_get_optional().   Less code and
the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

---

Changes since v2:
1. Preserve comment,
2. Include <device.h> to fix warning on clang (reported by kbuild),
3. Fix use of uninitialized "error" variable.

Changes since v1:
1. Use devm_fwnode_gpiod_get_optional
---
 drivers/input/keyboard/gpio_keys.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f2d4e4daa818..160d94b1c2c0 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -18,6 +18,7 @@
 #include <linux/sysctl.h>
 #include <linux/proc_fs.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
@@ -494,23 +495,13 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	spin_lock_init(&bdata->lock);
 
 	if (child) {
-		bdata->gpiod = devm_fwnode_gpiod_get(dev, child,
-						     NULL, GPIOD_IN, desc);
-		if (IS_ERR(bdata->gpiod)) {
-			error = PTR_ERR(bdata->gpiod);
-			if (error == -ENOENT) {
-				/*
-				 * GPIO is optional, we may be dealing with
-				 * purely interrupt-driven setup.
-				 */
-				bdata->gpiod = NULL;
-			} else {
-				if (error != -EPROBE_DEFER)
-					dev_err(dev, "failed to get gpio: %d\n",
-						error);
-				return error;
-			}
-		}
+		/*
+		 * GPIO is optional, we may be dealing with purely
+		 * interrupt-driven setup.
+		 */
+		bdata->gpiod = devm_fwnode_gpiod_get_optional(dev, child, NULL, GPIOD_IN, desc);
+		if (IS_ERR(bdata->gpiod))
+			return dev_err_probe(dev, PTR_ERR(bdata->gpiod), "failed to get gpio\n");
 	} else if (gpio_is_valid(button->gpio)) {
 		/*
 		 * Legacy GPIO number, so request the GPIO here and
-- 
2.17.1

