Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7DB264EA7E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 12:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbiLPLbX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 06:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbiLPLbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 06:31:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2AB5E08C
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 03:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MO916Kd53BVi7a2Hr4CS8MIPPbK1R7JvQnITuZtwEHE=;
        b=d7mYxxjUGroRKAE3biBOKkoSlLvIpIclYt+0Yc1QcN0POlwIYKvlgIFnuSyKznud+mdE5l
        vgu9v4H9S6xNccNeKYOO70Y05roddqsWdBiVArhKw9Ras6xPv4wC1xvh5reNyXpyd8s8Kh
        jFHwLlk+/JHlvSXLSxX5HzekZrqox5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-NohJpmphMoC8jFtl_luQIw-1; Fri, 16 Dec 2022 06:30:27 -0500
X-MC-Unique: NohJpmphMoC8jFtl_luQIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BC8A802C1B;
        Fri, 16 Dec 2022 11:30:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B19AB400F5A;
        Fri, 16 Dec 2022 11:30:22 +0000 (UTC)
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
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 02/11] leds: led-class: Add __led_get() helper function
Date:   Fri, 16 Dec 2022 12:30:04 +0100
Message-Id: <20221216113013.126881-3-hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-1-hdegoede@redhat.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
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

Split out part of of_led_get() into a generic __led_get() helper function.

This is a preparation patch for adding a generic (non devicetree specific)
led_get() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 7391d2cf1370..5f40110bd260 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -215,6 +215,23 @@ static int led_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
 
+static struct led_classdev *__led_get(struct device *led_dev)
+{
+	struct led_classdev *led_cdev;
+
+	if (!led_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	led_cdev = dev_get_drvdata(led_dev);
+
+	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
+		put_device(led_cdev->dev);
+		return ERR_PTR(-ENODEV);
+	}
+
+	return led_cdev;
+}
+
 /**
  * of_led_get() - request a LED device via the LED framework
  * @np: device node to get the LED device from
@@ -226,7 +243,6 @@ static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
 struct led_classdev *of_led_get(struct device_node *np, int index)
 {
 	struct device *led_dev;
-	struct led_classdev *led_cdev;
 	struct device_node *led_node;
 
 	led_node = of_parse_phandle(np, "leds", index);
@@ -236,17 +252,7 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
 	led_dev = class_find_device_by_of_node(leds_class, led_node);
 	of_node_put(led_node);
 
-	if (!led_dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	led_cdev = dev_get_drvdata(led_dev);
-
-	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
-		put_device(led_cdev->dev);
-		return ERR_PTR(-ENODEV);
-	}
-
-	return led_cdev;
+	return __led_get(led_dev);
 }
 EXPORT_SYMBOL_GPL(of_led_get);
 
-- 
2.38.1

