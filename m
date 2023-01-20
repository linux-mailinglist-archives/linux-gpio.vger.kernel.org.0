Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D72D67539C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 12:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjATLrC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 06:47:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjATLq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 06:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD04EA95AA
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 03:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674215152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sTLhjxEJPJWY28ZRUjS8Iwvs8m+iveoiY2xNSYePPB8=;
        b=fSzZ9ZjmElCdactBj3NDnAVvk0LgvkC+YWJdDrPyp/d3nm66d2DwxC3OaSkix4cAAzNFCO
        KqRUDmz9H+tpL35rT1fiHEiHzilbnR7UyidcMLOLFz2g2MIBzWyiHpyVvrIn7/LpRLIfkd
        omMU2rrJME8DVtzNLYu1zU5jyWOzC2A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-CEFJphzmNX2-2meUaJgl7g-1; Fri, 20 Jan 2023 06:45:48 -0500
X-MC-Unique: CEFJphzmNX2-2meUaJgl7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5AF4185A794;
        Fri, 20 Jan 2023 11:45:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.101])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9DCCF140EBF6;
        Fri, 20 Jan 2023 11:45:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 03/11] leds: led-class: Add __devm_led_get() helper
Date:   Fri, 20 Jan 2023 12:45:16 +0100
Message-Id: <20230120114524.408368-4-hdegoede@redhat.com>
In-Reply-To: <20230120114524.408368-1-hdegoede@redhat.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a __devm_led_get() helper which registers a passed in led_classdev
with devm for unregistration.

This is a preparation patch for adding a generic (non devicetree specific)
devm_led_get() function.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 743d97b082dc..4904d140a560 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -274,6 +274,22 @@ static void devm_led_release(struct device *dev, void *res)
 	led_put(*p);
 }
 
+static struct led_classdev *__devm_led_get(struct device *dev, struct led_classdev *led)
+{
+	struct led_classdev **dr;
+
+	dr = devres_alloc(devm_led_release, sizeof(struct led_classdev *), GFP_KERNEL);
+	if (!dr) {
+		led_put(led);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	*dr = led;
+	devres_add(dev, dr);
+
+	return led;
+}
+
 /**
  * devm_of_led_get - Resource-managed request of a LED device
  * @dev:	LED consumer
@@ -289,7 +305,6 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 						  int index)
 {
 	struct led_classdev *led;
-	struct led_classdev **dr;
 
 	if (!dev)
 		return ERR_PTR(-EINVAL);
@@ -298,17 +313,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 	if (IS_ERR(led))
 		return led;
 
-	dr = devres_alloc(devm_led_release, sizeof(struct led_classdev *),
-			  GFP_KERNEL);
-	if (!dr) {
-		led_put(led);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	*dr = led;
-	devres_add(dev, dr);
-
-	return led;
+	return __devm_led_get(dev, led);
 }
 EXPORT_SYMBOL_GPL(devm_of_led_get);
 
-- 
2.39.0

