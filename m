Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6561B254DDC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgH0S7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:59:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727997AbgH0S7M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:59:12 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CBBD22BEA;
        Thu, 27 Aug 2020 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554752;
        bh=58yzE7nTwEaef/I5SNdV8roNQcWGPiVHAIvbkPbo/j0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i67ZNRM2AoaLxP8VlFRuuHzKyg+65pNt8UKjAlHGZoMCLxETTvb8IsY4L+96WgTPn
         hrILQ8U+vp+nGiyJt/w30ntBFZ0s+ESPpy8eu5OUGhIMRNAzjKBAczh34CJoZne+qm
         WXRfx0oJPPQdSEuFOoaQMa/9WsJdBdt+g7Xr2+bk=
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
Subject: [PATCH v3 09/27] Input: chipone_icn8318 - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:11 +0200
Message-Id: <20200827185829.30096-10-krzk@kernel.org>
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
 drivers/input/touchscreen/chipone_icn8318.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
index d91d2fd78649..5bee007184c4 100644
--- a/drivers/input/touchscreen/chipone_icn8318.c
+++ b/drivers/input/touchscreen/chipone_icn8318.c
@@ -194,12 +194,8 @@ static int icn8318_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	data->wake_gpio = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
-	if (IS_ERR(data->wake_gpio)) {
-		error = PTR_ERR(data->wake_gpio);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Error getting wake gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(data->wake_gpio))
+		return dev_err_probe(dev, PTR_ERR(data->wake_gpio), "Error getting wake gpio\n");
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-- 
2.17.1

