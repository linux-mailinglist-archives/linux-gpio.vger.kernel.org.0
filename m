Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA4C63B468
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 22:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbiK1VrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 16:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbiK1VrE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 16:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F083D2FFF9
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 13:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669671866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ijZvrHfxzqLtf9v5WhrCliu1xtsXettjChSs9tCIBZo=;
        b=ao0V4dA/GiKuky9D6YcmTq+gR3buqqSCJcXlGymGhrYvIBgxNafzil/A93KccW/bGjvShl
        m5d5sSSXYq0Ny1PQB8iLbL+NIQWXbvIf0TcN94Xp99ZY33CCIVc/1v0oqCz11Y/+clzz6Y
        ZaJkPAE7Y6s/avlSbiMcc09vAEnwHNc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-wfWKXQ0gMViXqONqWAwVAA-1; Mon, 28 Nov 2022 16:44:20 -0500
X-MC-Unique: wfWKXQ0gMViXqONqWAwVAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 142E3886463;
        Mon, 28 Nov 2022 21:44:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7911F40C6EC2;
        Mon, 28 Nov 2022 21:44:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 4/5] media: ov8865: Add support for a privacy-led GPIO
Date:   Mon, 28 Nov 2022 22:44:07 +0100
Message-Id: <20221128214408.165726-5-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-1-hdegoede@redhat.com>
References: <20221128214408.165726-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for a privacy-led GPIO.

Making the privacy LED to controlable from userspace, as using the LED
class subsystem would do, would make it too easy for spy-ware to disable
the LED.

To avoid this have the sensor driver directly control the LED.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note an additional advantage of directly controlling the GPIO is that
GPIOs are tied directly to consumer devices. Where as with a LED class
device, there would need to be some mechanism to tie the right LED
(e.g front or back) to the right sensor.
---
 drivers/media/i2c/ov8865.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index cae1866134a0..fe86b166b28b 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -688,6 +688,7 @@ struct ov8865_sensor {
 	struct i2c_client *i2c_client;
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
+	struct gpio_desc *privacy_led;
 	struct regulator *avdd;
 	struct regulator *dvdd;
 	struct regulator *dovdd;
@@ -2432,10 +2433,12 @@ static int ov8865_sensor_power(struct ov8865_sensor *sensor, bool on)
 
 		gpiod_set_value_cansleep(sensor->reset, 0);
 		gpiod_set_value_cansleep(sensor->powerdown, 0);
+		gpiod_set_value_cansleep(sensor->privacy_led, 1);
 
 		/* Time to enter streaming mode according to power timings. */
 		usleep_range(10000, 12000);
 	} else {
+		gpiod_set_value_cansleep(sensor->privacy_led, 0);
 		gpiod_set_value_cansleep(sensor->powerdown, 1);
 		gpiod_set_value_cansleep(sensor->reset, 1);
 
@@ -3009,6 +3012,12 @@ static int ov8865_probe(struct i2c_client *client)
 		goto error_endpoint;
 	}
 
+	sensor->privacy_led = devm_gpiod_get_optional(dev, "privacy-led", GPIOD_OUT_LOW);
+	if (IS_ERR(sensor->privacy_led)) {
+		ret = PTR_ERR(sensor->privacy_led);
+		goto error_endpoint;
+	}
+
 	/* External Clock */
 
 	sensor->extclk = devm_clk_get(dev, NULL);
-- 
2.38.1

