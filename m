Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A7A254D73
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 20:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgH0S7K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:59:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727997AbgH0S7J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:59:09 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CAA622BEB;
        Thu, 27 Aug 2020 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554749;
        bh=XU3wsdKRcEmN6C4Xh+CGzTTUh29BQR9tNEBC5r7uu9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v38Y1XLeq8lhwiBRivr+rekc24A5cyWtWLIZMdKNuHCUX6FV3QThu+KAiZDwXwOPz
         EfW2axpQYoEqSbo1vEE/jqc55WY80DI8VKhogl3tln0gRiZPw34TOYy177UqQ5VD+r
         5mmOMcYzz6oknzIazW3zSexgD4IJl89Z+rcNFMj0=
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
Subject: [PATCH v3 08/27] Input: bu21029_ts - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:10 +0200
Message-Id: <20200827185829.30096-9-krzk@kernel.org>
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
 drivers/input/touchscreen/bu21029_ts.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 49a8d4bbca3a..96c178b606dc 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -360,23 +360,15 @@ static int bu21029_probe(struct i2c_client *client,
 	}
 
 	bu21029->vdd = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(bu21029->vdd)) {
-		error = PTR_ERR(bu21029->vdd);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to acquire 'vdd' supply: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(bu21029->vdd))
+		return dev_err_probe(&client->dev, PTR_ERR(bu21029->vdd),
+				     "failed to acquire 'vdd' supply\n");
 
 	bu21029->reset_gpios = devm_gpiod_get_optional(&client->dev,
 						       "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(bu21029->reset_gpios)) {
-		error = PTR_ERR(bu21029->reset_gpios);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to acquire 'reset' gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(bu21029->reset_gpios))
+		return dev_err_probe(&client->dev, PTR_ERR(bu21029->reset_gpios),
+				     "failed to acquire 'reset' gpio\n");
 
 	in_dev = devm_input_allocate_device(&client->dev);
 	if (!in_dev) {
-- 
2.17.1

