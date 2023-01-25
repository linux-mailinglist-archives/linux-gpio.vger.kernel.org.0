Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70FB67B097
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbjAYLGr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235336AbjAYLGq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9827A3F2A6
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674644757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n5qm8P0JsQd5Owi7O2JfGZus7IqmfxLWRnRacW5aPkM=;
        b=fRvuIKP+53k5zYKD42fUzPbMguGnMFhhfKBmPQw+rlgTK+8PBFu2B46bLtc1R4TNcSbOjW
        8zklYCkbMuiRFjuqetivyWRyYvLfYPjBpyo2ljCO6sFP1ybxJZT35MmjLVmsrao0b2iLui
        Qswf7OH4WphvTRI09t3Qmk9h5uev3cg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Uz4rKV6aMSCwH8rViEOnzw-1; Wed, 25 Jan 2023 06:05:53 -0500
X-MC-Unique: Uz4rKV6aMSCwH8rViEOnzw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA0873C10EC3;
        Wed, 25 Jan 2023 11:05:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.104])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA93F492B02;
        Wed, 25 Jan 2023 11:05:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-gpio@vger.kernel.org
Subject: [PATCH v2 resend 2/2] gpio: tps68470: Make tps68470_gpio_output() always set the initial value
Date:   Wed, 25 Jan 2023 12:05:47 +0100
Message-Id: <20230125110547.18093-3-hdegoede@redhat.com>
In-Reply-To: <20230125110547.18093-1-hdegoede@redhat.com>
References: <20230125110547.18093-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make tps68470_gpio_output() call tps68470_gpio_set() for output-only pins
too, so that the initial value passed to gpiod_direction_output() is
honored for these pins too.

Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add Fixes tag
- Add Andy's Reviewed-by
---
 drivers/gpio/gpio-tps68470.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index 778a72cf800c..2ca86fbe1d84 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -91,13 +91,13 @@ static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
 
+	/* Set the initial value */
+	tps68470_gpio_set(gc, offset, value);
+
 	/* rest are always outputs */
 	if (offset >= TPS68470_N_REGULAR_GPIO)
 		return 0;
 
-	/* Set the initial value */
-	tps68470_gpio_set(gc, offset, value);
-
 	return regmap_update_bits(regmap, TPS68470_GPIO_CTL_REG_A(offset),
 				 TPS68470_GPIO_MODE_MASK,
 				 TPS68470_GPIO_MODE_OUT_CMOS);
-- 
2.39.0

