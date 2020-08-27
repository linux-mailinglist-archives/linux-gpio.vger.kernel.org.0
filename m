Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEA2254D98
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 20:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgH0S7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:59:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728184AbgH0S7m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:59:42 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65D8022BEB;
        Thu, 27 Aug 2020 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554782;
        bh=mhzjeNt2Pr/YS+s9dAme3pQs5JrjYzFjpcgQ00RtFAM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D+xiDIZjnFhBHvG5TvPrMQV8EVlJ2n1bixQfrQX5amEM3jgHlmSe0FlQOZ/pX9HCM
         sd+w23D+hDANe/3ZIqpcm6csk0Z50O9jj5wDAWc2UNOMss9MzIJh6d41wfvhqVvpym
         ZqixYj8oXufIb8SIPneJQM+WH176VXiWEVBs670o=
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
Subject: [PATCH v3 18/27] Input: resistive-adc-touch - Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:20 +0200
Message-Id: <20200827185829.30096-19-krzk@kernel.org>
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
 drivers/input/touchscreen/resistive-adc-touch.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index cfc8bb4553f7..46b5a6caef84 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -108,12 +108,8 @@ static int grts_probe(struct platform_device *pdev)
 
 	/* get the channels from IIO device */
 	st->iio_chans = devm_iio_channel_get_all(dev);
-	if (IS_ERR(st->iio_chans)) {
-		error = PTR_ERR(st->iio_chans);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "can't get iio channels.\n");
-		return error;
-	}
+	if (IS_ERR(st->iio_chans))
+		return dev_err_probe(dev, PTR_ERR(st->iio_chans), "can't get iio channels\n");
 
 	chan = &st->iio_chans[0];
 	st->pressure = false;
-- 
2.17.1

