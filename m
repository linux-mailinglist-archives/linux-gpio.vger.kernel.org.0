Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0126254DE2
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgH0S6y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:58:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:48832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727877AbgH0S6x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:58:53 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D86D22BF3;
        Thu, 27 Aug 2020 18:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554732;
        bh=r5Xm7hCPTgUxCPDwRqkBbYLBFo+wmkUoqPhKAWH0uTM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x8XnVCSwAskwG29dNxeSfmoMTP3/55x3xAH6Z2r24xOzmgU7ncFlhgjK9teOemAM2
         gloX1ekbbkj9zllC5jy9hsqEfIlIWMbwY/o6o9bb12HY/e5heOrYfLSnnwajy5H/1Y
         3ypd+6+M82lldUwO3fVKxuhv5W0m+bOLv8aZ05y8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        clang-built-linux@googlegroups.com
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 03/27] Input: pwm-beeper - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:05 +0200
Message-Id: <20200827185829.30096-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/misc/pwm-beeper.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
index d6b12477748a..8c0085e8c552 100644
--- a/drivers/input/misc/pwm-beeper.c
+++ b/drivers/input/misc/pwm-beeper.c
@@ -132,13 +132,8 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	beeper->pwm = devm_pwm_get(dev, NULL);
-	if (IS_ERR(beeper->pwm)) {
-		error = PTR_ERR(beeper->pwm);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to request PWM device: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(beeper->pwm))
+		return dev_err_probe(dev, PTR_ERR(beeper->pwm), "Failed to request PWM device\n");
 
 	/* Sync up PWM state and ensure it is off. */
 	pwm_init_state(beeper->pwm, &state);
@@ -151,13 +146,9 @@ static int pwm_beeper_probe(struct platform_device *pdev)
 	}
 
 	beeper->amplifier = devm_regulator_get(dev, "amp");
-	if (IS_ERR(beeper->amplifier)) {
-		error = PTR_ERR(beeper->amplifier);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'amp' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(beeper->amplifier))
+		return dev_err_probe(dev, PTR_ERR(beeper->amplifier),
+				     "Failed to get 'amp' regulator\n");
 
 	INIT_WORK(&beeper->work, pwm_beeper_work);
 
-- 
2.17.1

