Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFB17254DD0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgH0S67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:58:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:49014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbgH0S67 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:58:59 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC8A322BF3;
        Thu, 27 Aug 2020 18:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554738;
        bh=lTP4eUtATnmEnI0HqNZwmrnqoYep1G5LOirB6UKLfcQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iGQrB7o+DQa7HKDbYBD5iqkM+vGnWt1nyGK8SB27tPLOd4u8CNu0vxDZgAGsiTo6q
         aCz1Qu5ZrCiI95OA4ysL+qHlnkb3TQLH5mraFpVAqiYNDt3YTfZnjWTd2oC9O//RtZ
         CRj0ExTo/FleloV5trX1FTw5OzA+3HBelFryAbTo=
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
Subject: [PATCH v3 05/27] Input: rotary_encoder - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:07 +0200
Message-Id: <20200827185829.30096-6-krzk@kernel.org>
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
 drivers/input/misc/rotary_encoder.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
index 6d613f2a017c..ea56c9f4975a 100644
--- a/drivers/input/misc/rotary_encoder.c
+++ b/drivers/input/misc/rotary_encoder.c
@@ -236,12 +236,8 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 		device_property_read_bool(dev, "rotary-encoder,relative-axis");
 
 	encoder->gpios = devm_gpiod_get_array(dev, NULL, GPIOD_IN);
-	if (IS_ERR(encoder->gpios)) {
-		err = PTR_ERR(encoder->gpios);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "unable to get gpios: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(encoder->gpios))
+		return dev_err_probe(dev, PTR_ERR(encoder->gpios), "unable to get gpios\n");
 	if (encoder->gpios->ndescs < 2) {
 		dev_err(dev, "not enough gpios found\n");
 		return -EINVAL;
-- 
2.17.1

